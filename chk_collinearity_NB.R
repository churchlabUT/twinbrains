# check the collinearity of SST using VIF (variance inflation factor)
# created by Jeanette & Mary Abbe, April 2014
# edited for Twin Brains by Laura, May 2016

# library with VIF function
library(HH)  # not installed on TACC, saved to local library >> did not install

# function for extracting end of string
  substrRight=function(x, n){
    substr(x, nchar(x)-n+1, nchar(x))
  }
  
# function for extracting start of string
  substrLeft=function(x, n){
    substr(x, 1, n)
  }
  
  
# READ IN DATA AND CREATE DATAFRAMES FOR EACH GROUP
group=c("2*", "B*")
chars=c(6,7)

# GROUP
for (i in 1:length(group)){ 
  subdirs=c(Sys.glob(sprintf("/corral-repl/utexas/ldrc/TWINS/%s", group[i])))
  rm("dat.all")
  
  # SUB
  for (sub in subdirs){
    model.dirs = Sys.glob(sprintf("%s/model/NB/Run?.feat", sub))
    subnum = substrRight(sub, chars[i])
    
    # RUN
    for (run in model.dirs){
      des.file = Sys.glob(sprintf("%s/design.mat", run))
      runnum1 = substrRight(run, 9)
      runnum = substrLeft(runnum1, 4)
      print(des.file)
      
      if (length(des.file)==0){
        warning(sprintf("cannot find design.mat file for %s", run))
        next
      }
      
      # read in design matrix
      des.mat = as.matrix(read.table(des.file, skip = 5))
      dim.desmat = dim(des.mat)
      
      # create fake data and save VIF in loop
      y.fake = c(1:dim(des.mat)[1])
      mod = lm(y.fake ~ des.mat )
      dat = vif(mod)  # cannot access this function
      dat.loop = as.data.frame(as.table(dat))
      
      # add subnum and runnum
      dat.loop = cbind(dat.loop, subnum, runnum)
      colnames(dat.loop) = c("vif", "value", "subnum", "runnum")
      dat.loop = dat.loop[c(3,4,1,2)]
      dat.loop = dat.loop[c(1:12),]
      
      if (exists("dat.all")==FALSE){
        dat.all = dat.loop 
      } else{ 
        dat.all = rbind(dat.all, dat.loop)
      }   
      
    } # END RUN
    
  } # END SUB
  
  assign(paste("dat.all",i,sep="_"),dat.all)
  
} # END GROUP
  
  
# set directory to save dfs to
  setwd('/corral-repl/utexas/ldrc/TWINS/SCRIPTS/QC_lev1')

# create one large df
  all.subs = rbind(dat.all_1, dat.all_2)
  write.csv(x=all.subs, file='NB_all_desmat.csv')
  vif.subs = all.subs[(all.subs$value > 10 & is.na(all.subs$value)==FALSE),]
  write.csv(x=vif.subs, file='NB_VIFgreaterthan10.csv')

# dfs with missing VIF values; junk includes omissions and fast responses; incor includes mismatch and incorrect
#  all.empty = all.subs[all.subs$value=="NaN", ]
#  write.csv(x=all.empty, file='NB_empty_ev_subs.csv')
#  go.incor.empty = all.subs[all.subs$value=="NaN" & (all.subs$vif=="des.matV3" | all.subs$vif=="des.matV4"), ]
#  write.csv(x=go.incor.empty, file='empty_go_incor_ev_subs.csv')
#  junk.empty = all.subs[all.subs$value=="NaN" & (all.subs$vif=="des.matV11" | all.subs$vif=="des.matV12"), ]
#  write.csv(x=junk.empty, file='empty_junk_ev_subs.csv')


------------------------------------------------
# Jeanette's notes on how to create script above

# use Sys.glob() to help create loop; create matrix where numrows=(#subs)(#runs) and numcols=28
  des.mat = as.matrix(read.table('design.mat', skip = 5))

# create fake data
  y.fake = c(1:dim(des.mat)[1])
  mod = lm(y.fake ~ des.mat )
  vif(mod)

  mod_rt_left = lm(desmat[,15]~desmat[,-c(15)]-1)
  summary(mod_rt_left)

  mod_rt_left = lm(desmat[,15]~desmat[,c(1:8)]-1)
  summary(mod_rt_left)
