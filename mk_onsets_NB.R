#!/usr/bin/env Rscript
# Changing the path didn't make a difference:!/corral-repl/utexas/ldrc/MODULES/R/bin/R Rscript

##################################
# Example of command to run script from server and from TACC:
#   Rscript --vanilla mk_nback_onsets.R '/Volumes/psy-church/Church_Lab/Church_Lab/Twin_Brains_server/MRI processing/Onsets/' 'Nback_235121_run1_2015_Jul_19_1029.csv'
#   Rscript --vanilla mk_nback_onsets.R '/corral-repl/utexas/ldrc/TWINS/B100922/behav/Nback/Run1/' 'Nback_B100922_run1_2015_Jul_02_1518.csv'
# arg[1] is the path to the Onset or behav folder, arg[2] is the csv file name
##################################

args = commandArgs(trailingOnly=TRUE)
# to test the arguments out of terminal, type:
# Mac  args=c('/Volumes/psy-church-1/Church_Lab/Church_Lab/Twin_Brains_server/MRI processing/Onsets/', 'Nback_235121_run1_2015_Jul_19_1029.csv')
# PC   args=c('Y:/Church_Lab/Church_Lab/Twin_Brains_server/MRI processing/Onsets/', 'Nback_235121_run2_2015_Jul_19_1050.csv')
#TACC args=c('/corral-repl/utexas/ldrc/TWINS/279722/behav/Nback/Run1/', 'Nback_279722_run1_2015_Aug_19_1128.csv')

### Read in data
dat = read.table(sprintf('%s%s', args[1], args[2]), header = TRUE, sep = ',', stringsAsFactors = FALSE)

dat$key_resp.rt[dat$key_resp.rt==''] = NA

# The trial_onset clock begins when python opens, showing the 'waiting for trigger or s' screen. Because this screen is
# presented for a variable duration (e.g. due to differences in time it takes to record shim number), we cannot use it
# as the actual onset. We will adjust all trial onsets relative to the reported onset of the first stimulus: instruct1_shape.
# This onset, however, is delayed due to transitioning from the trigger to the first stimulus. (This also explains delays
# between trials, i.e., when a new stimulus is prepared.) To account for that delay, we will also adjust the onset times
# according to the expected duration of instruct1_shape, which we will approximate with the actual duration of instruct2_shape.

# SUMMARY: actual_onset will be computed for each trial by subtracting trial_onset of the first trial from trial_onset
#   of the trial in question, then adding the difference in trial_duration bt the two instruction stimuli.

dat$actual_onset = dat$trial_onset - dat$trial_onset[dat$stim1=="instruct1_shape"] +
	dat$trial_duration[dat$stim1=="instruct2_shape"] - dat$trial_duration[dat$stim1=="instruct1_shape"]
dat$actual_onset[dat$stim1=="instruct1_shape"]=0  # set onset of first trial to 0s
dat$trial_duration[1] = dat$trial_duration[dat$events==3][2] # make the first instruction as long as the second

for (i in 1:dim(dat)[1]){
  if(dat$stim1[i]=="fixation"){      # signifies fixation cross after each block
    dat$discard[i]=1}
  else if (dat$stim1[i]=="Blank"){   # signifies blank screen between instructions and first shape
    dat$discard[i]=1}
  else if (dat$stim1[i]=="blank"){   # "
    dat$discard[i]=1}
  else {dat$discard[i]=0}
}

# keep only rows in which a real stimulus or instructions were presented
dat=dat[c(dat$discard==0),]
#names(dat)
names(dat)[13]="hit"  # change "key_resp.corr" to "hit"

# Code all responses (including left button presses and multiple presses) as [4]
dat$key_resp.keys[dat$key_resp.keys!="None"]="[4]"

# For multiple button presses, take the first press >0.2s
dat$rt = NA
dat$key_resp.rt = as.character(dat$key_resp.rt)
for (i in 1:dim(dat)[1]){
  split = unlist(strsplit(dat$key_resp.rt[i], ","))
  
  if (length(split) > 1){
    for (a in 1:length(split)){
      if (as.numeric(split[a]) > .2){
        dat$rt[i] = split[a]
        break
      }
    }
  } else {
    dat$rt[i] = dat$key_resp.rt[i]
  }
}

# The buttons at the scanner don't correspond to the corrAns key, so we must say what was a hit
dat$hit=ifelse(dat$corrAns=="[j]" & dat$key_resp.keys=="[4]",1,0)

# count as false_alarm any button press during a non-target stimulus trial
dat$false_alarm=ifelse((dat$corrAns=="None" | dat$corrAns=="[]") & dat$key_resp.keys=="[4]",1,0)

# count as miss any failure to press button on a target trial
dat$miss=ifelse(dat$corrAns=="[j]" & dat$key_resp.keys!="[4]",1,0)

dat$hitRT=ifelse(dat$hit==1,dat$rt,"")  # grab RTs for correct trials
dat$hitRT=as.numeric(dat$hitRT)

#names(dat)
dat = dat[, c("stim1", "block", "events", "trial_onset", "actual_onset", "trial_duration", "trial_offset", "hit", "hitRT")]

# extract partic ID and run number from args[2]
library(stringr)
partic = strsplit(args[2], '_')[[1]][2]
run = strsplit(args[2], '_')[[1]][3]

write.table(dat, file=(sprintf('%s%s_Nback_%s_events.txt', args[1], partic, run)), append=FALSE, quote=FALSE, sep=" ", na="NA", dec=".", 
  row.names=FALSE, col.names=TRUE)


##################### create onset/duration files for instructions, 1-back block, and 2-back block
instructions = dat[dat$events==3, c("actual_onset","trial_duration")]
instructions$PM = 1
write.table(instructions, file=(sprintf('%sinstruct.txt', args[1])), append=FALSE, quote=FALSE, sep=" ", na="NA", dec=".", 
   row.names=FALSE, col.names=FALSE)

# To compute block duration, we must consider the "dropped" time between stimulus presentations...set duration to 80s.
block1back = as.data.frame(dat[dat$block=="shapes1", "actual_onset"][1])
colnames(block1back) = "actual_onset"
block1back$duration = 80
block1back$PM = 1
write.table(block1back, file=(sprintf('%sblock1back.txt', args[1])), append=FALSE, quote=FALSE, sep=" ", na="NA", dec=".", 
  row.names=FALSE, col.names=FALSE)

block2back = as.data.frame(dat[dat$block=="shapes2", "actual_onset"][1])
colnames(block2back) = "actual_onset"
block2back$duration = 80
block2back$PM = 1
write.table(block2back, file=(sprintf('%sblock2back.txt', args[1])), append=FALSE, quote=FALSE, sep=" ", na="NA", dec=".", 
    row.names=FALSE, col.names=FALSE)

# old code that didn't account for dropped time bt stimuli
#trials2back = dat[dat$block=="shapes2", c("actual_onset","trial_duration")]
#block_duration = sum(trials2back$trial_duration)
#block2back = t(c(trials2back$actual_onset[1], block_duration))
#block2back$PM = 1
