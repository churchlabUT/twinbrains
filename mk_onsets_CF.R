#!/usr/bin/env Rscript

##################################
# Example of command to run script:
#     Rscript --vanilla mk_cogflex_onsets.R '/Volumes/psy-church/Church_Lab/Church_Lab/Twin_Brains_server/MRI processing/Onsets/' 'CogFlex_B114521_run1_2015_Nov_08_1307.csv'
# arg[1] is the path to the Onset folder, arg[2] is the csv file name
##################################

args = commandArgs(trailingOnly=TRUE)
# to test the arguments out of terminal:
# mac  args=c('/Volumes/psy-church-1/Church_Lab/Church_Lab/Twin_Brains_server/MRI processing/Onsets/', 'CogFlex_B114521_run1_2015_Nov_08_1307.csv')
# PC   args=c('Y:/Church_Lab/Church_Lab/Twin_Brains_server/MRI processing/Onsets/', 'CogFlex_B114521_run2_2015_Nov_08_1327.csv')

### Read in data
dat = read.table(sprintf('%s%s', args[1], args[2]), header = TRUE, sep = ',', stringsAsFactors = FALSE)
dat$key_trials.rt[dat$key_trials.rt==''] = NA

# The trial_onset clock begins when python opens, showing the 'waiting for trigger or s' screen. We need to adjust all 
# trial onsets relative to the reported onset of the first stimulus: a shape rule trial for Run1 and a blank trial for
# Run 2. This onset, however, is delayed due to transitioning from the trigger to the first stimulus. (This also explains
# delays between trials, i.e., when a new stimulus is prepared.) To account for that delay, we will also adjust the onset
# times. according to the delay between the trigger onset (key_instr.rt) and the first stim's trial onset.

# SUMMARY: actual_onset will be computed for each trial by subtracting trial_onset of the first trial from trial_onset
#   of the trial in question, then adding the difference in between the trigger onset (key_instr.rt) & trial_onset for
#   the first trial.

# NOTE: THIS WILL ONLY WORK ON DATA FILES COLLECTED 7/08/15 AND LATER.
dat$actual_onset = dat$trial_onset - dat$key_instr.rt[1]
# ^^^ equivalent to    dat$trial_onset - dat$trial_onset[2] + dat$trial_onset[2] - dat$key_instr.rt[1]
dat$actual_onset[2] = 0  # set onset of the first trial to 0s

# Make duration of first trial consistent with other trials of this type.Based on averages of ~60 participants' cogflex data.
dat$trial_duration[2] = ifelse(dat$events[2]==0, 4.982, 1.982) 
dat = dat[-1,] # remove trigger information, i.e. the first row
	
dat$corrAns[dat$corrAns=="[4]" | dat$corrAns=="[4, 4]" | dat$corrAns=="[4, 4, 4]"]="4"
dat$corrAns[dat$corrAns=="[1]" | dat$corrAns=="[1, 1]" | dat$corrAns=="[1, 1, 1]"]= "1"
dat$corrAns[dat$corrAns=="[]"]= 'None'  # Change from NA to 'None' so failures to respond aren't ignored as NAs
# Because we model RTs and duration for incorrect trials, we won't yet remove bad RTs or 
#   code responses as correct

#names(dat)
dat = dat[ , c("events","rule_rep","cond","corrAns","actual_onset","trial_duration","key_trials.keys","key_trials.rt")]


############################################# create event files ####################################################
#### RT for all trials, regardless of correctness
RT = dat[!is.na(dat$key_trials.rt), c("actual_onset","key_trials.rt")]
RT$mean.rt = mean(RT$key_trials.rt)
RT$mean.center.rt = RT$key_trials.rt - RT$mean.rt
RT$actual_onset = RT$actual_onset + 2  # bc the response period starts 2s into the trial
write.table(RT[,c(1,3,4)], file=(sprintf('%srt_all.txt', args[1])), append=FALSE, quote=FALSE, sep=" ", 
   na="NA", dec=".", row.names=FALSE, col.names=FALSE)


#### clean the RTs up before splitting responses into correct and incorrect
#jitter = dat[dat$events==2,] # subset jitter trials into own dataframe. Not modeling this.
dat = dat[dat$events!=2,] # retain non-jitter trials

# Mark as NA/incorrect any responses with RTs less than .02s or greater than 2s
dat$key_trials.rt[dat$key_trials.rt < '0.02'] = NA
dat$key_trials.rt[dat$key_trials.rt > '2'] = NA
dat$key_trials.corr = ifelse(dat$corrAns==dat$key_trials.keys,1,0)
dat$key_trials.corr[dat$key_trials.rt < '0.02'] = 0
dat$key_trials.corr[dat$key_trials.rt > '2'] = 0
dat$corr.rt = ifelse(dat$key_trials.corr==1,dat$key_trials.rt,NA)  # populate RTs for correct trials only
#names(dat)
#dat[1:25,c(4,7,8,10)]

library(stringr)
partic = strsplit(args[2], '_')[[1]][2]
run = strsplit(args[2], '_')[[1]][3]
write.table(dat, file=(sprintf('%s%s_CogFlex_%s_events.txt', args[1], partic, run)), append=FALSE, quote=FALSE, sep=" ", na="NA", dec=".", 
  row.names=FALSE, col.names=TRUE)


####################### First trial, neither switch nor repeat ####################
trial1 = data.frame(dat[is.na(dat$rule_rep), "actual_onset"])
trial1$duration = 4
trial1$PM = 1
write.table(trial1, file=(sprintf('%sfirst_trial.txt', args[1])), append=FALSE, quote=FALSE, 
   sep=" ", na="NA", dec=".", row.names=FALSE, col.names=FALSE)


########################### Incorrect trials, regardless of rule ###########################
incor = dat[dat$key_trials.corr==0, c("rule_rep","actual_onset")]

# If there are no incorrect trials, create a dataframe with 1 row of 3 zeros. 
# Otherwise, create a dataframe containing trial onsets, durations of 4, and PMs of 1.
if (nrow(incor)==0){
  incor = data.frame(actual_onset=0, duration=0, PM=0)
} else {
  incor = data.frame(incor[,"actual_onset"])
  incor$duration = 4
  incor$PM = 1
}
write.table(incor, file=(sprintf('%sincor.txt', args[1])), append=FALSE, quote=FALSE, 
   sep=" ", na="NA", dec=".", row.names=FALSE, col.names=FALSE)

#### Incorrect switch
# If there are no incorrect switch trials, create a dataframe with 1 row of 3 zeros. 
# Otherwise, create a dataframe containing trial onsets, durations of 4, and PMs of 1.
#if (nrow(incor[incor$rule_rep=="S",])==0){
#  incor.sw = data.frame(actual_onset=0, duration=0, PM=0)
#} else {
#  incor.sw = data.frame(incor[incor$rule_rep=="S", "actual_onset"])
#  incor.sw$duration = 4
#  incor.sw$PM = 1
#}
#write.table(incor.sw, file=(sprintf('%sincor_sw.txt', args[1])), append=FALSE, quote=FALSE, 
#   sep=" ", na="NA", dec=".", row.names=FALSE, col.names=FALSE)

#### Incorrect repeat
#if (nrow(incor[incor$rule_rep=="R",])==0){
#  incor.rpt = data.frame(actual_onset=0, duration=0, PM=0)
#} else {
#  incor.rpt = data.frame(incor[incor$rule_rep=="R", "actual_onset"])
#  incor.rpt$duration = 4
#  incor.rpt$PM = 1
#}
#write.table(incor.rpt, file=(sprintf('%sincor_rpt.txt', args[1])), append=FALSE, quote=FALSE, 
#   sep=" ", na="NA", dec=".", row.names=FALSE, col.names=FALSE)


########################### Correct trials, split by cue vs target, then by rule ###########################
cor = dat[dat$key_trials.corr==1, c("events","rule_rep","actual_onset")]

#### Correct switch, cue period 
if (nrow(cor[cor$rule_rep=="S" & !is.na(cor$rule_rep),])==0){
  cor.cue.sw = data.frame(actual_onset=0, duration=0, PM=0)
} else {
  cor.cue.sw = data.frame(cor[cor$rule_rep=="S" & !is.na(cor$rule_rep), "actual_onset"])
  cor.cue.sw$duration = 2  # 2s duration for cue and ISI
  cor.cue.sw$PM = 1
}
write.table(cor.cue.sw, file=(sprintf('%scor_cue_sw.txt', args[1])), append=FALSE, quote=FALSE, 
   sep=" ", na="NA", dec=".", row.names=FALSE, col.names=FALSE)

#### Correct repeat, cue period
if (nrow(cor[cor$rule_rep=="R" & !is.na(cor$rule_rep),])==0){
  cor.cue.rpt = data.frame(actual_onset=0, duration=0, PM=0)
} else {
  cor.cue.rpt = data.frame(cor[cor$rule_rep=="R" & !is.na(cor$rule_rep), "actual_onset"])
  cor.cue.rpt$duration = 2  # 2s duration for cue and ISI
  cor.cue.rpt$PM = 1
}
write.table(cor.cue.rpt, file=(sprintf('%scor_cue_rpt.txt', args[1])), append=FALSE, quote=FALSE, 
   sep=" ", na="NA", dec=".", row.names=FALSE, col.names=FALSE)


#### Correct switch, target (decision) period
if (nrow(cor[cor$events==0 & cor$rule_rep=="S" & !is.na(cor$rule_rep),])==0){
  cor.tar.sw = data.frame(actual_onset=0, duration=0, PM=0)
} else {
  cor.tar.sw = data.frame(cor[cor$events==0 & cor$rule_rep=="S" & !is.na(cor$rule_rep), "actual_onset"])
  colnames(cor.tar.sw) = "trial_onset"
  cor.tar.sw$tar.onset = cor.tar.sw$trial_onset + 2 # because target period starts 2s into trial
  cor.tar.sw$duration = 2 # 2s duration for target
  cor.tar.sw$PM = 1
}
write.table(cor.tar.sw[,2:4], file=(sprintf('%scor_tar_sw.txt', args[1])), append=FALSE, quote=FALSE, 
   sep=" ", na="NA", dec=".", row.names=FALSE, col.names=FALSE)

#### Correct repeat, target (decision) period
if (nrow(cor[cor$events==0 & cor$rule_rep=="R" & !is.na(cor$rule_rep),])==0){
  cor.tar.rpt = data.frame(actual_onset=0, duration=0, PM=0)
} else {
  cor.tar.rpt = data.frame(cor[cor$events==0 & cor$rule_rep=="R" & !is.na(cor$rule_rep), "actual_onset"])
  colnames(cor.tar.rpt) = "trial_onset"
  cor.tar.rpt$tar.onset = cor.tar.rpt$trial_onset + 2
  cor.tar.rpt$duration = 2 #
  cor.tar.rpt$PM = 1
}
write.table(cor.tar.rpt[,2:4], file=(sprintf('%scor_tar_rpt.txt', args[1])), append=FALSE, quote=FALSE, 
   sep=" ", na="NA", dec=".", row.names=FALSE, col.names=FALSE)

