#### Pull each out_confound.txt file from participants' 'scrub_files' directories within each usable
#### BOLD folder (i.e., not those labeled 'bad').
#### Uniquely label the text files, then copy not-yet-pulled files to TACC > TWINS > scrubbing.
#### Concatenate and organize the text files.
#### Scripted by Laura Engelhardt, January 2016


########################### Pull out_confound.txt files from TACC for Twin Brains and TADS Scans ###########################
library(gtools)
library(plyr)

#### DEFINE FUNCTION
pull_mvmt = function(rootdir, partic, task){
fd = Sys.glob(sprintf("%s/%s*/BOLD/%s*/scrub_files/out_confound.txt", rootdir, partic, task))
#print(fd)
#num.fd = length(fd)

for (i in 1:length(fd)){
  run = strsplit(fd[i], "/")[[1]][8]
  id = strsplit(fd[i], "/")[[1]][6]
  newname=sprintf("%s/scrubbing/%s_%s_out_confound.txt", rootdir, id, run)

  #### if file "newname" does not already exist, copy it into movement folder
  if (file.exists(newname)){
      print("cool")
  } else {
      file.copy(fd[i], newname, copy.mode=TRUE)}
  }
      } 
      
      
#### DEFINE GROUPS AND RUN FUNCTION
# TADS, capital R in Run
rootdir = "/corral-repl/utexas/ldrc/TWINS"
partic = "2"
task = "Run"
pull_mvmt(rootdir, partic, task)

# Twin Brains, capital R in Run
partic = "B"
pull_mvmt(rootdir, partic, task) 


##############################################################################
############## COMPILE AND ORGANIZE FRAME DISPLACEMENT DATA ##################
library(stringr)
dir = '/corral-repl/utexas/ldrc/TWINS/scrubbing/'
#dir = '/Volumes/psy-church/Church_Lab/Church_Lab/Twin_Brains_server/Scanner_data_analyze/Movement/' # Lab Mac server
filenames=Sys.glob(sprintf("%s/*out_confound.txt", dir)) # create a list of all files that start with the specified path and end with .csv
numfiles = length(filenames) 
numfiles 

# filename example: "Y:/Church_Lab/ ... /Movement//235121_Run01_10_REST_1_fd.txt"
#                    "/corral-repl/utexas/ldrc/TWINS/scrubbing//235121_Run06_24_NB_2_out_confound.txt"
names = sapply(filenames, function (s) strsplit(strsplit(s, '//')[[1]][2], '_')[[1]][1]) # pick participant ID out of filenames
length(unique(names)) # number of uniquely identified participants for whom we have FD data
task = sapply(filenames, function (s) strsplit(strsplit(s, '//')[[1]][2], '_')[[1]][4]) # pick out task name
run = sapply(filenames, function (s) strsplit(strsplit(s, '//')[[1]][2], '_')[[1]][5]) # pick out task repetition number

# Read in and combine data
dat = read.table(filenames[1], header = FALSE, sep = '\n', stringsAsFactors = FALSE) # create dataframe file with 1 partic's data
dat = as.data.frame(dat[7, ])  # extract row 7, which contains the # of outliers over the designated threshold
colnames(dat) = c("fd_outlier")
dat$Participant = names[1]
dat$task = task[1]
dat$task.run = run[1]


#Loops through all the files and smartbinds them together into a giant data frame
for(i in 2:numfiles){
  dat.loop=read.table(filenames[i], header = FALSE, sep = '\n', stringsAsFactors = FALSE)
  dat.loop = as.data.frame(dat.loop[7, ]) 
  colnames(dat.loop) = c("fd_outlier")
  dat.loop$Participant = names[i]
  dat.loop$task = task[i]
  dat.loop$task.run = run[i]

  dat=smartbind(dat,dat.loop)
}

dat$fd_outlier = sapply(as.character(dat$fd_outlier), function (s) strsplit(s, ' ')[[1]][2])
dat$task.run = paste(dat$task, dat$task.run, sep="_")
dat$task = NULL
dat = dat[, c("Participant", "task.run", "fd_outlier")]
dat_wide = reshape(dat, idvar='Participant', timevar='task.run', direction='wide')

table(dat$Participant) 

date=format(Sys.time(), "%m.%d.%Y")
write.csv(dat, sprintf("%sfd_outliers_compiled_%s.csv",dir,date),row.names=FALSE)
write.csv(dat_wide, sprintf("%sfd_outliers_compiled_wide_%s.csv",dir,date),row.names=FALSE)

