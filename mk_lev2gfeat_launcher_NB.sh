#!/bin/sh


basedir='/corral-repl/utexas/ldrc/TWINS'

subnums=`ls -d ${basedir}/B*`

for sub in $subnums

do 
    subcode=`basename ${sub}`
    dirpth=${sub}/model/NB
    cope=${dirpth}/run_feat.txt
    cat ${cope} >> launch_lev2_gfeat_NB.txt #${subcode}.txt

done



subnums=`ls -d ${basedir}/2*`

for sub in $subnums

do 
    subcode=`basename ${sub}`
    dirpth=${sub}/model/NB
    cope=${dirpth}/run_feat.txt
    cat ${cope} >> launch_lev2_gfeat_NB.txt  #${subcode}.txt

done
