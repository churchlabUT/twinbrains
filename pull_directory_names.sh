#!/bin/sh


####  This script creates a text file containing the directory labels within each person's BOLD folder, as of 2/19/16.

rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/bold_directory_names.txt
basedir='/corral-repl/utexas/ldrc/TWINS'

###################
subnums=`ls -d ${basedir}/B*`

for sub in $subnums

do
  just_sub=`basename ${subnums}`
  run_labels=`ls -d ${sub}/BOLD/*Run*`
  
  for run in ${run_labels}
  
  do
  
  runname=`basename ${run_labels}`  
  echo \'${just_sub} ${runname}\' >> bold_directory_names.txt

done

done

####################
#subnums=`ls -d ${basedir}/2*`
#for sub in $subnums

#do
#  run_labels=`ls -d ${sub}/BOLD/*Run*`
#  echo ${run_labels} >> bold_directory_names.txt
#done
