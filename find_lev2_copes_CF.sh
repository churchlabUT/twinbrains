#!/bin/sh

basedir='/corral-repl/utexas/ldrc/TWINS'

rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/QC_lev2/featdirs_CF*.txt

task="CF"

#####################################
subnums=`ls -d ${basedir}/B*`

cope=1
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope1.txt    
  done
done


cope=2
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope2.txt    
  done
done


cope=3
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope3.txt    
  done
done


cope=4
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope4.txt    
  done
done


cope=5
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope5.txt    
  done
done


cope=6
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope6.txt    
  done
done


cope=7
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope7.txt    
  done
done


cope=8
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope8.txt    
  done
done


cope=9
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope9.txt    
  done
done


cope=10
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope10.txt    
  done
done


cope=11
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope11.txt    
  done
done


cope=12
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope12.txt    
  done
done


cope=13
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope13.txt    
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
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope1.txt    
  done
done


cope=2
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope2.txt    
  done
done


cope=3
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope3.txt    
  done
done


cope=4
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope4.txt    
  done
done


cope=5
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope5.txt    
  done
done


cope=6
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope6.txt    
  done
done


cope=7
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope7.txt    
  done
done


cope=8
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope8.txt    
  done
done


cope=9
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope9.txt    
  done
done

cope=10
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope10.txt    
  done
done


cope=11
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope11.txt    
  done
done


cope=12
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope12.txt    
  done
done


cope=13
for sub in $subnums
do
  run_labels=`ls -d ${sub}/model/${task}/cope${cope}_lev2.gfeat/cope1.feat/stats/cope1.nii.gz`
  for run in ${run_labels}
  do
      echo ${run} >> ${basedir}/SCRIPTS/QC_lev2/featdirs_CF_cope13.txt    
  done
done
