#!/bin/sh

#Before running this script, you must download the scanner images from Osirix and upload the zip file to TACC/STUDYNAME.

PARTICID='279731'
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
mkdir Converted
cd  ../..

# Move participant's zip file into folder particID/raw/particID, then unzip.
mv  $PARTICID*.zip  ${PARTICID}/raw/${PARTICID}
cd ${PARTICID}/raw/${PARTICID}
unzip $PARTICID*
mv $PARTICID* ..

# !!!!No longer doing decompressing!!!!
# Decompress the dicoms within the raw/particID folder. The decompressed images are saved in raw/Converted, which is created by the matlab script.
# matlab -nodisplay -nosplash -r "decompressdcm('/corral-repl/utexas/${STUDYNAME}/${PARTICID}/raw/${PARTICID}');exit"

# Move raw dicoms to Converted folder, then rename them as XNAT used to.
mv 2* ../Converted
cd ../Converted
matlab -nodisplay -nosplash -r "nameLikeXnat2016('/corral-repl/utexas/${STUDYNAME}/${PARTICID}/raw/Converted');exit"

# Move the renamed files to folder raw/particID, then split them by scan. These steps also rename "Converted" to "Converted_unnamed".
mv $PARTICID* ../${PARTICID}
cd ..
mv Converted Converted_unnamed
cd ${PARTICID}
matlab -nodisplay -nosplash -r "splitSiemensScans_churchlab('/corral-repl/utexas/${STUDYNAME}/${PARTICID}/raw/${PARTICID}');exit"
