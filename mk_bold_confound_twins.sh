#!/bin/sh

#This will create a txt file that can be launched on tacc to make all the files needed to scrub BOLD runs.
#The mk_confound.sh script does not carry out actual scrubbing, it only creates the files to input into FEAT.
#Created by Mary Abbe Roe, June 2014. Altered by Laura Engelhardt, January 2016.

# DON'T FORGET TO RERUN WITH SECOND GROUP!

#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_CF_confound_twins.txt
#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_NB_confound_twins.txt
#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_SST_confound_twins.txt 
#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_rest_confound_twins.txt 

basedir='/corral-repl/utexas/ldrc/TWINS'

#subnums=`ls -d ${basedir}/B*`
subnums=`ls -d ${basedir}/2*`

# COGFLEX

for sub in $subnums

do
  
  run_labels=`ls -d ${sub}/BOLD/*Run*CF*`
  for run in ${run_labels}
  do
    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `

    echo /corral-repl/utexas/ldrc/TWINS/SCRIPTS/mk_confound_twins.sh ${run}/bold.nii.gz 0.9 >> launch_CF_confound_twins.txt
  
  done
  
done


# NBACK

for sub in $subnums

do
  
  run_labels=`ls -d ${sub}/BOLD/*Run*NB*`
  for run in ${run_labels}
  do
    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `

    echo /corral-repl/utexas/ldrc/TWINS/SCRIPTS/mk_confound_twins.sh ${run}/bold.nii.gz 0.9 >> launch_NB_confound_twins.txt
  
  done
  
done


# SST

for sub in $subnums

do
  
  run_labels=`ls -d ${sub}/BOLD/*Run*SST*`
  for run in ${run_labels}
  do
    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `

    echo /corral-repl/utexas/ldrc/TWINS/SCRIPTS/mk_confound_twins.sh ${run}/bold.nii.gz 0.9 >> launch_SST_confound_twins.txt

  done
  
done



# REST

for sub in $subnums

do
  
  run_labels=`ls -d ${sub}/BOLD/*Run*REST*`
  for run in ${run_labels}
  do
    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `

    echo /corral-repl/utexas/ldrc/TWINS/SCRIPTS/mk_confound_twins.sh ${run}/bold.nii.gz 0.2 >> launch_rest_confound_twins.txt
  
  done
  
done
