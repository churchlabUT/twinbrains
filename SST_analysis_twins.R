# Authors: Leo Olmedo (First); Mary Abbe Roe (Dec.2013 - Feb. 2014)
# This script reads in SST behavioral data and calculates RT and ACC for all groups
# Graphs are located in SST_r_graphs.R


#### LIBRARIES, FUNCTIONS, READING IN DATA ####


# LIBRARIES

  library(gtools)
  library(ggplot2)
  library(plyr)
  library(miscTools)
  library(nlme)
  library(reshape)
  library(multcomp)
  library(grid)

  wd=getwd()


# FUNCTIONS

  # function for extracting end of string
    substrRight=function(x, n){
      substr(x, nchar(x)-n+1, nchar(x))
    }

  # function for extracting start of string
    substrLeft=function(x, n){
      substr(x, 1, n)
    }


# READING IN DATA AND CREATING DATA FRAMES FOR EACH GROUP

  group=c("2*", "B*")
  chars=c(6,7)

  # GROUP
  for (i in 1:length(group)){ 
    subdirs=c(Sys.glob(sprintf("/corral-repl/utexas/ldrc/TWINS/%s" ,group[i])))
    rm("dat_all")
    print(group[i])

    # SUB
    for (sub in subdirs){
    #  behav_dirs=c(Sys.glob(sprintf("%s/behav/SST/SST_R*", sub)))#, Sys.glob(sprintf("%s/behav/SST/m_SST_R*", sub))) 
      subnum=substrRight(sub, chars[i])

       # RUN
       #for (run in behav_dirs){
       #  run_num=substrRight(run,1)
         Rfile=Sys.glob(sprintf("%s/*R.txt", sub))

         if (length(Rfile)==0){
           warning(sprintf("cannot find R.txt file for %s", sub))
           next
         }
         
         # READ IN RUN RFILE, ADD SUBIND AND RUNNUM COLUMNS
         dat_loop=read.table(Rfile, header=TRUE, sep="\t", na.strings="NaN")
         dat_loop$subind=rep(subnum, dim(dat_loop)[1])
        # dat_loop$runnum=rep(run_num, dim(dat_loop)[1])
       
         # CREATE DAT_ALL IF DOESN'T ALREADY EXIST
         if (exists("dat_all")==FALSE){
           dat_all=dat_loop 
         }  else { 
           dat_all=rbind(dat_all, dat_loop)
         } 
    
       } # END RUN LOOP
    }  # END SUB LOOP


    # creates vector of 0's and 1's from TrialNum, that does not include repeated correct responses 
    # (whether or not there was a response to each trial)
    # indicator=c(dat_all$TrialNum,0)-c(0, dat_all$TrialNum)						  # ADDS 0 TO BEGINNING AND END OF TrialNum AND SUBTRACTS, SO IF REPEAT IT SUBTRACTS ITSELF AND BECOMES 0
   # indicator[indicator!=0]=1  										  # SETS EVERYTHING NOT = 0 TO 1, to get rid of -31's
    #dat_all$first=indicator[1:(length(indicator)-1)]							  # SUBTRACT EXTRA NUMBER ON END

    # ADD GROUP IDENTIFIER
    dat_all$group_num=i

    # CREATE SEPARATE DATA FRAME FOR EACH GROUP
    assign(paste("dat_all",i,sep="_"),dat_all)

  } # END GROUP LOOP




# DF OF ALL GROUPS
#    dat_all_1$group = "A_first"
#    dat_all_2$group = "A_second"


  dat = rbind(dat_all_1,dat_all_2)
  write.csv(dat, file="/corral-repl/utexas/ldrc/TWINS/sst_behav_data.csv")

# to see variables in the data frame:  	names(dat_all)
# to see all variables created: 	ls()
# to see subjects: 			table(dat_all$subind)


# CODES:
  # dat_all$cond: 	0= arrow points left, 1= arrow points right, 2= arrow points left and stop , 3= arrow points right and stop
  # dat_all$Stim: 	0= left arrow, 1= right arrow
  # dat_all$Resp: 	0=no button press , 1=left button , 4=right button
  # dat_all$correct: 	0=go_incorrect, 1=go_correct, 2=stop_fail_incorrect, 3=stop_fail_correct, 4=stop_correct, 5=go_omission (4 and 5 are trials that have no response)



#### RT and ACC ANALYSES ####

sessions = length(group)


# GO LOOP

for (k in 1:sessions){

	if (k==1){
	dat_all=dat_all_1
	group="TADS"

	} else {

	if (k==2){
	dat_all=dat_all_2
	group="TB"
	} 
        }	
  

  # GO CORRECT RT and ACC

    # EACH RUN FOR EACH SUB (# lines are cutoffs)
 
      go_run=ddply(dat_all, .(subind, runnum, group), summarise, N=length(subind), go_rt_med=median(RT[correct==1], na.rm=TRUE), go_rt_sd=sd(RT[correct==1], na.rm=TRUE), go_acc=length(correct[correct==1])/length(cond[cond==1|cond==0]), go_error=length(correct[correct==0])/length(cond[cond==1|cond==0]))
      #go_run$go_rt_med[go_run$go_acc < .60 | go_run$go_error > .1] = NA
      #go_run$go_acc[go_run$go_acc < .60 | go_run$go_error > .1] = NA 
      assign(paste("go_run",k,sep="_"),go_run)

} # END GO LOOP





# STOP LOOP
group=c("2*","B*")
sessions = length(group)

for (k in 1:sessions){

	if (k==1){
	dat_all=dat_all_1
	group="TADS"

	} else {

	if (k==2){
	dat_all=dat_all_2
	group="TB"
	} 
        }	
	

  # EACH RUN FOR EACH SUB

    # DF calculates stop_acc and SSD
      stop_run=ddply(dat_all, .(subind, runnum, group), summarise, N=length(subind), stop_acc=length(correct[correct==4])/length(cond[cond==2|cond==3]), stop_error=length(correct[correct==2|correct==3])/length(cond[cond==2|cond==3]), 
                     stop_fail_cor=length(correct[correct==3])/length(cond[cond==2|cond==3]), stop_fail_incor=length(correct[correct==2])/length(cond[cond==2|cond==3]), ssd_med=median(SSD[cond==2|cond==3], na.rm=TRUE), 
                     ssd_mean=mean(SSD[cond==2|cond==3], na.rm=TRUE))
      assign(paste("stop_run",k,sep="_"),stop_run)

    # calculate quantile RT and SSRT per run 
      # create separate DF for stop_error's
        stop_error_run=data.frame(subind=stop_run$subind, runnum=stop_run$runnum, stop_error=stop_run$stop_error)

      # create DF with go_correct's in ascending order and stop_error
        RT_asc_run=data.frame(subind=dat_all$subind[dat_all$correct==1], runnum=dat_all$runnum[dat_all$correct==1], TrialNum=dat_all$TrialNum[dat_all$correct==1], correct=dat_all$correct[dat_all$correct==1], 
                              RT=dat_all$RT[dat_all$correct==1])
        RT_asc_run=RT_asc_run[order(RT_asc_run[,1], RT_asc_run[,2], RT_asc_run[,5], decreasing=FALSE), ]
        RT_asc_stop_error_run=merge(RT_asc_run, stop_error_run)

      # caculate quantileRT, add to stop_run DF, calculate SSRT
        quantile_RT=ddply(RT_asc_stop_error_run, .(subind, runnum, group), summarise, N=length(subind), quantileRT=quantile(RT, mean(stop_error)))

        stop_run$quantileRT=quantile_RT$quantileRT
        stop_run$SSRT=stop_run$quantileRT-stop_run$ssd_mean
        stop_run=stop_run[c("subind", "runnum", "N", "stop_acc", "stop_error", "stop_fail_cor", "stop_fail_incor", "ssd_med", "ssd_mean", "quantileRT", "SSRT", "group")]
        assign(paste("stop_run",k,sep="_"),stop_run)


} # END STOP LOOP



# DFs TO CHECK (where * is 1-7)

  # go_run* 	       # stop_run				
  # go_sub*            # stop_sub
  # all_go_run*        # all_stop_run
  # all_go_sub*        # all_stop_sub



# ALL GROUP DFs *** ONLY RUN ON FULL DATA SET, DO NOT RUN ON DATA THAT EXCLUDES SUBS FOR BEHAV PERFORMANCE ***

  # GO

    all_go_run=rbind(go_run_1, go_run_2)
    write.csv(all_go_run, file=sprintf("/corral-repl/utexas/ldrc/TWINS/go_all_partic.csv"), na="NA", row.names=FALSE)

  #  all_go_sub=rbind(go_sub_1, go_sub_2, go_sub_3, go_sub_4, go_sub_5, go_sub_6, go_sub_7, go_sub_8, go_sub_9, go_sub_10, go_sub_11,go_sub_12)
  #  write.csv(all_go_sub, file=sprintf("%s/data_frames/SST/GO/go_all_subs_groups_by_sub_TIMES.csv", wd), na="NA", row.names=FALSE)

  #  go_run_allsub=rbind(go_run_all_1, go_run_all_2, go_run_all_3, go_run_all_4, go_run_all_5, go_run_all_6, go_run_all_7, go_run_all_8, go_run_all_9, go_run_all_10, go_run_all_11, go_run_all_12)
  #  write.csv(go_run_allsub, file=sprintf("%s/data_frames/SST/GO/go_runnum_across_groups.csv", wd), na="NA", row.names=FALSE)

  # STOP

    all_stop_run=rbind(stop_run_1, stop_run_2)
    write.csv(all_stop_run, file=sprintf("/corral-repl/utexas/ldrc/TWINS/stop_all_partic.csv"), na="NA", row.names=FALSE)

  #  all_stop_sub=rbind(stop_sub_1, stop_sub_2, stop_sub_3, stop_sub_4, stop_sub_5, stop_sub_6, stop_sub_7, stop_sub_8, stop_sub_9, stop_sub_10, stop_sub_11, stop_sub_12)
  #  write.csv(all_stop_sub, file=sprintf("%s/data_frames/SST/STOP/stop_all_subs_groups_by_sub_TIMES.csv", wd), na="NA", row.names=FALSE)

  #  stop_run_allsub=rbind(stop_run_all_1, stop_run_all_2, stop_run_all_3, stop_run_all_4, stop_run_all_5, stop_run_all_6, stop_run_all_7, stop_run_all_8, stop_run_all_9, stop_run_all_10, stop_run_all_11, stop_run_all_12)
  #  write.csv(stop_run_allsub, file=sprintf("%s/data_frames/SST/STOP/stop_runnum_across_groups.csv", wd), na="NA", row.names=FALSE)



