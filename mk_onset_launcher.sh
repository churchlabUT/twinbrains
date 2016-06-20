#!/bin/sh

###################
# This script creates text files that are needed to generate commands for onset/event files.
# Specifically, the script identifies paths to participants' behavioral files on TACC and
# adds them to a text file containing launch commands (launch_[task]_onsets.txt). When this
# text file is launched, it executes mk_[task]_onsets.py/R for each person's behav files.
# Edited by Laura Engelhardt, February 2016.
###################

#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_onsets_SST.txt
#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_onsets_CF.txt
#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_onsets_NB.txt

basedir='/corral-repl/utexas/ldrc/TWINS'

subnums=`ls -d ${basedir}/2*`
#subnums=`ls -d ${basedir}/B*`

############# SST
for sub in $subnums

do
  
  run_labels=`ls -d ${sub}/BOLD/Run*SST*` 
  for run in ${run_labels}
  do
    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `
    
    numfiles=`ls  ${sub}/behav/SST/Run${runnum}/  | wc -l`

    if [ "$numfiles" -ge 1 ]  && [ "$numfiles" -le 4 ] ; then
	echo python /corral-repl/utexas/ldrc/TWINS/SCRIPTS/mk_onsets_SST.py ${sub}/behav/SST/Run${runnum}/*subdata*pkl ${sub}/behav/SST/Run${runnum} >> launch_onsets_SST.txt
      else
	echo ${sub}" Too few or too many files in run folder"
    fi
 
  done
  
done


############# N-Back
#for sub in $subnums

#do
#  run_labels=`ls -d ${sub}/BOLD/Run*NB*`
 
#  for run in ${run_labels}

#  do
#    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `
#    numfiles=`ls  ${sub}/behav/Nback/Run${runnum}/  | wc -l`
#    filename=`basename ${sub}/behav/Nback/Run${runnum}/*csv`
#    if [ "$numfiles" -ge 1 ]  && [ "$numfiles" -le 4 ] ; then
#	echo Rscript --vanilla mk_onsets_NB.R \'${sub}/behav/Nback/Run${runnum}/\' \'${filename}\' >> launch_onsets_NB.txt
#      else
#	echo ${sub} "Run"${runnum}": Too few or too many files in run folder"
#    fi
  
#  done
  
#done

# What we want the contents of launch_NB_onsets.txt to look like:
#      Rscript --vanilla mk_onsets_NB.R '/corral-repl/utexas/ldrc/TWINS/279722/behav/Nback/Run1/' 'Nback_279722_run1_2015_Aug_19_1128.csv'


############# Cognitive Flexibility
#for sub in $subnums

#do
#  run_labels=`ls -d ${sub}/BOLD/Run*CF*`
 
#  for run in ${run_labels}

#  do
#    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `
#    numfiles=`ls  ${sub}/behav/CogFlex/Run${runnum}/  | wc -l`
#    filename=`basename ${sub}/behav/CogFlex/Run${runnum}/*csv`
#    if [ "$numfiles" -ge 1 ]  && [ "$numfiles" -le 4 ] ; then
#	echo Rscript --vanilla mk_onsets_CF.R \'${sub}/behav/CogFlex/Run${runnum}/\' \'${filename}\' >> launch_onsets_CF.txt
#      else
#	echo ${sub} "Run"${runnum}": Too few or too many files in run folder"
#    fi
  
#  done
  
#done
