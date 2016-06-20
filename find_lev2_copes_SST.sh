#!/bin/sh

basedir='/corral-repl/utexas/ldrc/TWINS'

rm ${basedir}/SCRIPTS/QC_lev2/featdirs_SST*.txt

task="SST"

#####################################
subnums=`ls -d ${basedir}/B*`

cope=1
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope1.txt    
  done
done


cope=2
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope2.txt    
  done
done


cope=3
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope3.txt    
  done
done


cope=4
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope4.txt    
  done
done


cope=5
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope5.txt    
  done
done


cope=6
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope6.txt    
  done
done


cope=7
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope7.txt    
  done
done


cope=8
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope8.txt    
  done
done


cope=9
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope9.txt    
  done
done


#####################################
subnums=`ls -d ${basedir}/2*`

cope=1
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope1.txt    
  done
done


cope=2
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope2.txt    
  done
done


cope=3
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope3.txt    
  done
done


cope=4
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope4.txt    
  done
done


cope=5
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope5.txt    
  done
done


cope=6
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope6.txt    
  done
done


cope=7
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope7.txt    
  done
done


cope=8
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope8.txt    
  done
done


cope=9
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_SST_cope9.txt    
  done
done
