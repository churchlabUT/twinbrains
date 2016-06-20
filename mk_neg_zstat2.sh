#!/bin/sh

#Before running this script, all steps up to renaming the zstats need to be complete.

basedir='GROUP/allpartic_zstats/thresh'
cd ../$basedir/CF
CF_zstats=`ls -d *_zstat2.nii.gz`
echo ${CF_zstats} 

for zstat in ${CF_zstats}
do
  
  zstat_temp=$(echo $zstat | cut -d "." -f 1)
  fslmaths ${zstat} -mul -1 ${zstat_temp}_neg.nii.gz

done


cd ../SST
SST_zstats=`ls -d *_zstat2.nii.gz`
echo ${SST_zstats} 

for zstat in ${SST_zstats}
do
  
  zstat_temp=$(echo $zstat | cut -d "." -f 1)
  fslmaths ${zstat} -mul -1 ${zstat_temp}_neg.nii.gz

done


cd ../NB
NB_zstats=`ls -d *_zstat2.nii.gz`
echo ${NB_zstats} 

for zstat in ${NB_zstats}
do
  
  zstat_temp=$(echo $zstat | cut -d "." -f 1)
  fslmaths ${zstat} -mul -1 ${zstat_temp}_neg.nii.gz

done

scripts
