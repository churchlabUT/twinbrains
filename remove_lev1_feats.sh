#!/bin/sh

#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev1.txt
#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev1_SST.txt

basedir='/corral-repl/utexas/ldrc/TWINS'


####### SST
#subnums=`ls -d ${basedir}/2*`

#for sub in $subnums

#do  
#rm -r ${sub}/model/SST/Run*
#done

################
#subnums=`ls -d ${basedir}/B*`
#for sub in $subnums

#do  
#rm -r ${sub}/model/SST/Run*
#done


##### individual participants
#rm -r ${basedir}/259721/model/SST/Run*
#rm -r ${basedir}/259722/model/SST/Run*
#rm -r ${basedir}/279722/model/SST/Run*
#rm -r ${basedir}/B106022/model/CF/Run2*


####### N-Back
#subnums=`ls -d ${basedir}/2*`

#for sub in $subnums

#do  
#rm -r ${sub}/model/NB/Run*
#done

################
#subnums=`ls -d ${basedir}/B*`
#for sub in $subnums

#do  
#rm -r ${sub}/model/NB/Run*
#done

#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev1*NB.txt



################################
# CF: "archive" original level 1 and level 2 output in order to execute new contrasts (copes)

subnums=`ls -d ${basedir}/B*`

for sub in $subnums

do
  num_lev1_dirs=`ls -d ${sub}/model/CF/Run*.feat | wc -l`
  if [ "$num_lev1_dirs" -ge 1 ] ; then
     mkdir ${sub}/model/CF/levs12_originalcopes
     mv ${sub}/model/CF/Run* ${sub}/model/CF/levs12_originalcopes/
     mv ${sub}/model/CF/designs ${sub}/model/CF/levs12_originalcopes/
     mv ${sub}/model/CF/cope* ${sub}/model/CF/levs12_originalcopes/
     mv ${sub}/model/CF/run_feat.txt ${sub}/model/CF/levs12_originalcopes/
  
  elif [ "$num_lev1_dirs" -lt 1 ] ; then
     rm -r ${sub}/model/CF/designs
     rm ${sub}/model/CF/run_feat.txt
     
  fi
  
done 

####
subnums=`ls -d ${basedir}/2*`
for sub in $subnums

do
  num_lev1_dirs=`ls -d ${sub}/model/CF/Run*.feat | wc -l`
  if [ "$num_lev1_dirs" -ge 1 ] ; then
     mkdir ${sub}/model/CF/levs12_originalcopes
     mv ${sub}/model/CF/Run* ${sub}/model/CF/levs12_originalcopes/
     mv ${sub}/model/CF/designs ${sub}/model/CF/levs12_originalcopes/
     mv ${sub}/model/CF/cope* ${sub}/model/CF/levs12_originalcopes/
     mv ${sub}/model/CF/run_feat.txt ${sub}/model/CF/levs12_originalcopes/

  elif [ "$num_lev1_dirs" -lt 1 ] ; then
     rm -r ${sub}/model/CF/designs
     rm ${sub}/model/CF/run_feat.txt
     
  fi
  
done 
