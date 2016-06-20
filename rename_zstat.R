# Rename thresholded and unthresholded zstat files to feed into Caret
# Mary Abbe Roe, September/October 2014
# Edited for Twin Brains by Laura, May 2016

library(gtools)

# DEFINE THE FUNCTIONS
# RENAME THRESH ZSTATS
  runThresh = function(rootdir, task){
    gfeats = Sys.glob(sprintf("%s/*.gfeat", rootdir))
    #print(gfeats)
    num.gfeats = length(gfeats)
      if (num.gfeats == 0) {
       print(sprintf("%s is empty", task))
    } 
      for (stat in 1:num.gfeats){
      split = strsplit(gfeats[stat], "/")
      split2 = strsplit(split[[1]][8], "[.]")
      contrast = split2[[1]][1]

      t.zstat1 = Sys.glob(sprintf("%s/cope1.feat/thresh_zstat1.nii.gz", gfeats[stat]))
      t.zstat2 = Sys.glob(sprintf("%s/cope1.feat/thresh_zstat2.nii.gz", gfeats[stat]))

      new.t.zstat1 = sprintf("%s/cope1.feat/%s_%s_thresh_zstat1.nii.gz", gfeats[stat], task, contrast)
      new.t.zstat2 = sprintf("%s/cope1.feat/%s_%s_thresh_zstat2.nii.gz", gfeats[stat], task, contrast)

      # set zstat directory
      zstat.dir = sprintf("/corral-repl/utexas/ldrc/TWINS/GROUP/allpartic_zstats/thresh/%s", task)

      # copy and rename into same directory
      stat1.cop1 = file.copy(t.zstat1,new.t.zstat1, copy.mode = TRUE)
      stat2.cop1 = file.copy(t.zstat2,new.t.zstat2, copy.mode = TRUE)

        if (stat1.cop1 == TRUE){
          print(sprintf("%s %s zstat1 was copied into the %s directory", task, contrast, rootdir))
        } else if (file.exists(new.t.zstat1) == TRUE) {
            print(sprintf("%s %s zstat1 exists in the %s directory", task, contrast, rootdir))
        } else {
            print(sprintf("%s %s zstat1 does not exist in the %s directory", task, contrast, rootdir))
        }

        if (stat2.cop1 == TRUE){
          print(sprintf("%s %s zstat2 was copied into the %s directory", task, contrast, rootdir))
        } else if (file.exists(new.t.zstat2) == TRUE) {
            print(sprintf("%s %s zstat2 exists in the %s directory", task, contrast, rootdir))
        } else {
            print(sprintf("%s %s zstat2 does not exist in the %s directory", task, contrast, rootdir))
        }

      # copy into zstats directory
      stat1.cop2 = file.copy(new.t.zstat1, zstat.dir, copy.mode = TRUE) 
      stat2.cop2 = file.copy(new.t.zstat2, zstat.dir, copy.mode = TRUE)

      }
  }


  # RENAME UNTHRESH ZSTATS
  runUnthresh = function(rootdir, task){
    gfeats = Sys.glob(sprintf("%s/*.gfeat", rootdir))
    print(gfeats)
    num.gfeats = length(gfeats)

    if (num.gfeats == 0) {
       print(sprintf("%s is empty", task))
    } 

    for (stat in 1:num.gfeats){
      split = strsplit(gfeats[stat], "/")
      split2 = strsplit(split[[1]][8], "[.]")
      contrast = split2[[1]][1]

      u.zstat1 = Sys.glob(sprintf("%s/cope1.feat/stats/zstat1.nii.gz", gfeats[stat]))
      u.zstat2 = Sys.glob(sprintf("%s/cope1.feat/stats/zstat2.nii.gz", gfeats[stat]))
 
      new.u.zstat1 = sprintf("%s/cope1.feat/stats/%s_%s_zstat1.nii.gz", gfeats[stat], task, contrast)
      new.u.zstat2 = sprintf("%s/cope1.feat/stats/%s_%s_zstat2.nii.gz", gfeats[stat], task, contrast)

      # set zstat directory
      zstat.dir = sprintf("/corral-repl/utexas/ldrc/TWINS/GROUP/allpartic_zstats/unthresh/%s", task)

      # copy and rename into same directory
      stat1.cop1 = file.copy(u.zstat1,new.u.zstat1, copy.mode = TRUE)
      stat2.cop1 = file.copy(u.zstat2,new.u.zstat2, copy.mode = TRUE)
 
        if (stat1.cop1 == TRUE){
          print(sprintf("%s %s zstat1 was copied into the %s directory", task, contrast, rootdir))
        } else if (file.exists(new.u.zstat1) == TRUE) {
            print(sprintf("%s %s zstat1 exists in the %s directory", task, contrast, rootdir))
        } else {
            print(sprintf("%s %s zstat1 does not exist in the %s directory", task, contrast, rootdir))
        }

        if (stat2.cop1 == TRUE){
          print(sprintf("%s %s zstat2 was copied into the %s directory", task, contrast, rootdir))
        } else if (file.exists(new.u.zstat2) == TRUE) {
            print(sprintf("%s %s zstat2 exists in the %s directory", task, contrast, rootdir))
        } else {
            print(sprintf("%s %s zstat2 does not exist in the %s directory", task, contrast, rootdir))
        }

      # copy into zstats directory
      stat1.cop2 = file.copy(new.u.zstat1, zstat.dir, copy.mode = TRUE) 
      stat2.cop2 = file.copy(new.u.zstat2, zstat.dir, copy.mode = TRUE)

    }
  }

#### DEFINE TASKS AND RUN FUNCTION
# SST
rootdir = "/corral-repl/utexas/ldrc/TWINS/GROUP/SST"
task = "SST"

runThresh(rootdir, task)
runUnthresh(rootdir, task)

# CF
rootdir = "/corral-repl/utexas/ldrc/TWINS/GROUP/CF"
task = "CF"
  
runThresh(rootdir, task)
runUnthresh(rootdir, task)
  
# NB
rootdir = "/corral-repl/utexas/ldrc/TWINS/GROUP/NB"
task = "NB"
  
runThresh(rootdir, task)
runUnthresh(rootdir, task)
