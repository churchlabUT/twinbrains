#!/bin/sh

### To test 1 person, define the sub; comment out basedir, subnums, for sub in
### subnums, the first do, and the last done.
#sub='/corral-repl/utexas/ldrc/TWINS/244922'

#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev1_SST.txt

basedir='/corral-repl/utexas/ldrc/TWINS'

subnums=`ls -d ${basedir}/B*`

for sub in $subnums

do
  subcode=`basename ${sub}`
  mkdir ${sub}/model/SST
  mkdir ${sub}/model/SST/designs
  run_labels=`ls -d ${sub}/BOLD/Run*SST*`
  for run in ${run_labels}
  do
    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `
    nvols=`fslnvols ${run}/bold`
  
    sed   -e 's:NVOLS:'${nvols}':g'  -e 's:SUBDIRPATH:'${sub}':'  -e 's:RUNDIRPATH:'${run}':' -e 's:RUNNUM:'${runnum}':' /corral-repl/utexas/ldrc/TWINS/SCRIPTS/design_template_SST.fsf > ${sub}/model/SST/designs/run_${runnum}.fsf

    echo feat ${sub}/model/SST/designs/run_${runnum}.fsf >> /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev1_${subcode}_SST.txt

  done
  
done


########################

subnums=`ls -d ${basedir}/2*`

for sub in $subnums

do
  subcode=`basename ${sub}`
  mkdir ${sub}/model/SST
  mkdir ${sub}/model/SST/designs
  run_labels=`ls -d ${sub}/BOLD/Run*SST*`
  for run in ${run_labels}
  do
    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `
    nvols=`fslnvols ${run}/bold`
  
    sed   -e 's:NVOLS:'${nvols}':g'  -e 's:SUBDIRPATH:'${sub}':'  -e 's:RUNDIRPATH:'${run}':' -e 's:RUNNUM:'${runnum}':' /corral-repl/utexas/ldrc/TWINS/SCRIPTS/design_template_SST.fsf > ${sub}/model/SST/designs/run_${runnum}.fsf

    echo feat ${sub}/model/SST/designs/run_${runnum}.fsf >> /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev1_${subcode}_SST.txt

  done
  
done
