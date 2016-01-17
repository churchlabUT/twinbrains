#### Pull fd.txt files from each participant's BOLD folders (one per task run), rename them to
# include participant ID, run number, and run name, then copy into TWINS/movement folder.

#### Mary Abbe Roe, September/October 2014. MAR & LEE October 2015.

#### LIBRARIES
library(gtools)
library(plyr)
library(gtools)

#### DEFINE FUNCTION
pull_mvmt = function(rootdir, partic, task){
fd = Sys.glob(sprintf("%s/%s*/BOLD/%s*/QA/fd.txt", rootdir, partic, task))
#print(fd)
#num.fd = length(fd)

for (i in 1:length(fd)){
  run = strsplit(fd[i], "/")[[1]][8]
  id = strsplit(fd[i], "/")[[1]][6]
  newname=sprintf("%s/movement/%s_%s_fd.txt", rootdir, id, run)

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

# TADS, lowercase r in run
partic = "2"
task = "run"
pull_mvmt(rootdir, partic, task)

# Twin Brains, lowercase r in run
partic = "B"
pull_mvmt(rootdir, partic, task) 


  
