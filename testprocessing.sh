#!/bin/sh

#Before running this script, you must download the scanner images from Osirix and upload the zip file to TACC/STUDYNAME.

PARTICID='test270322'
STUDYNAME='ldrc/TWINS'

# Set up folders.
cd /corral-repl/utexas/${STUDYNAME}
mkdir $PARTICID
cd  $PARTICID
mkdir anatomy
mkdir behav
mkdir BOLD
mkdir fieldmap
mkdir logs
mkdir model
mkdir raw
cd raw
mkdir $PARTICID
cd  ../..

# Move participant's zip file into folder particID/raw/particID, then unzip.
mv  $PARTICID*.zip  ${PARTICID}/raw/${PARTICID}
cd ${PARTICID}/raw/${PARTICID}
unzip $PARTICID*
mv $PARTICID* ..

# Rename the raw dicom files as XNAT did.
matlab -nodisplay -nosplash -r "nameLikeXnat('/corral-repl/utexas/${STUDYNAME}/${PARTICID}/raw/${PARTICID}');exit"

# Split the renamed files by scan.
matlab -nodisplay -nosplash -r "splitSiemensScans_churchlab('/corral-repl/utexas/${STUDYNAME}/${PARTICID}/raw/${PARTICID}');exit"
