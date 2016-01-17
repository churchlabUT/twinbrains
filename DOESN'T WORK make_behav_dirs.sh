#!/bin/sh

basedir='/corral-repl/utexas/ldrc/TWINS'

subnums=`ls -d ${basedir}/B*`

for sub in $subnums

#do
#  cd ${sub}/behav
#  mkdir SST
#  mkdir CogFlex
#  mkdir Nback
#  cd SST
#  mkdir Run1
#  cd ../CogFlex
#  mkdir Run1
#  mkdir Run2
#  cd ../Nback
#  mkdir Run1
#  mkdir Run2
#  cd ../../..
# done

do
   #mv ${sub}/*.pkl ${sub}/behav/SST/Run1
   #mv ${sub}/Nback*run1* ${sub}/behav/Nback/Run1
   #mv ${sub}/Nback*run2* ${sub}/behav/Nback/Run2
   mv ${sub}/CogFlex*run1* ${sub}/behav/CogFlex/Run1
   mv ${sub}/CogFlex*run2* ${sub}/behav/CogFlex/Run2
done
