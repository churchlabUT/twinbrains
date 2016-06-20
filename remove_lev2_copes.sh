#!/bin/sh

basedir='/corral-repl/utexas/ldrc/TWINS'

############## CogFlex
subnums=`ls -d ${basedir}/B*`

for sub in $subnums

do  
rm -r ${sub}/model/CF/cope* #.gfeat # to remove pre-lev2 fsf design files in addition to lev2 output, comment out .gfeat
rm ${sub}/model/CF/run_feat.txt
rm -r ${sub}/model/CF/*+.feat
done

####
subnums=`ls -d ${basedir}/2*`
for sub in $subnums

do  
rm -r ${sub}/model/CF/cope* #.gfeat
rm ${sub}/model/CF/run_feat.txt
rm -r ${sub}/model/CF/*+.feat
done



############## Stop Signal
#subnums=`ls -d ${basedir}/B*`

#for sub in $subnums

#do  
#rm -r ${sub}/model/SST/cope*.gfeat # if starting from the very beginning, comment out .gfeat
#rm ${sub}/model/SST/run_feat.txt
#rm -r ${sub}/model/SST/*+.feat # duplicate level1 feats
#done

####
#subnums=`ls -d ${basedir}/2*`
#for sub in $subnums

#do  
#rm -r ${sub}/model/SST/cope*.gfeat
#rm ${sub}/model/SST/run_feat.txt
#rm -r ${sub}/model/SST/*+.feat # duplicate level1 feats
#done


##### individual participants
#rm -r ${basedir}/259721/model/CF/cope*.gfeat
