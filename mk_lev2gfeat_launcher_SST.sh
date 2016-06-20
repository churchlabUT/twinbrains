#!/bin/sh

rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev2_gfeat_SST*.txt

basedir='/corral-repl/utexas/ldrc/TWINS'

subnums=`ls -d ${basedir}/B*`

for sub in $subnums

do 
    subcode=`basename ${sub}`
    dirpth=${sub}/model/SST
    cope=${dirpth}/run_feat.txt
    cat ${cope} >> launch_lev2_gfeat_${subcode}SST.txt

done



subnums=`ls -d ${basedir}/2*`

for sub in $subnums

do 
    subcode=`basename ${sub}`
    dirpth=${sub}/model/SST
    cope=${dirpth}/run_feat.txt
    cat ${cope} >> launch_lev2_gfeat_${subcode}SST.txt

done
