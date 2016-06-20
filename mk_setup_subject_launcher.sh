#!/bin/sh

rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_setup_redo1.txt
rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_setup_redo2.txt

basedir='/corral-repl/utexas/ldrc/TWINS'


###################### Create launch commands to apply setup_subject_new.py to each participant's filder
subnums=`ls -d ${basedir}/B*`

for sub in $subnums

do
SUBCODE=`basename ${sub}`
STUDYNAME='ldrc/TWINS'
#cd /corral-repl/utexas/${STUDYNAME}
SETUP_SUBJECT='/corral-repl/utexas/ldrc/SCRIPTS/setup_subject.py'
echo "$SETUP_SUBJECT -o --dcm2nii --motcorr --qa --betfunc --fm --fsrecon --fs-subdir /corral-repl/utexas/ldrc/FREESURFER/TWINS/ --keepdata -b /corral-repl/utexas/ldrc --studyname TWINS -s $SUBCODE" >> launch_setup_redo1.txt

done

#######################
subnums=`ls -d ${basedir}/2*`

for sub in $subnums

do
SUBCODE=`basename ${sub}`
STUDYNAME='ldrc/TWINS'
#cd /corral-repl/utexas/${STUDYNAME}
SETUP_SUBJECT='/corral-repl/utexas/ldrc/SCRIPTS/setup_subject.py'
echo "$SETUP_SUBJECT -o --dcm2nii --motcorr --qa --betfunc --fm --fsrecon --fs-subdir /corral-repl/utexas/ldrc/FREESURFER/TWINS/ --keepdata -b /corral-repl/utexas/ldrc --studyname TWINS -s $SUBCODE" >> launch_setup_redo2.txt

done
