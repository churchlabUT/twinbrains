#!/bin/sh

### To test 1 person, define the sub; comment out basedir, subnums, for sub in
### subnums, the first do, and the last done.

#sub='/corral-repl/utexas/ldrc/TWINS/250222'

basedir='/corral-repl/utexas/ldrc/TWINS'

##### Twin Brains
subnums=`ls -d ${basedir}/B*`

for sub in $subnums

do
  subcode=`basename ${sub}`
  #mkdir ${sub}/model/NB
  #mkdir ${sub}/model/NB/designs
  run_labels=`ls -d ${sub}/BOLD/Run*NB*`
  for run in ${run_labels}
  do
    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `
    nvols=`fslnvols ${run}/bold`
  
#    sed   -e 's:NVOLS:'${nvols}':g'  -e 's:SUBDIRPATH:'${sub}':'  -e 's:RUNDIRPATH:'${run}':' -e 's:RUNNUM:'${runnum}':'  /corral-repl/utexas/ldrc/TWINS/SCRIPTS/design_template_NB.fsf > ${sub}/model/NB/designs/run_${runnum}.fsf

    echo feat ${sub}/model/NB/designs/run_${runnum}.fsf >> /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev1_${subcode}_NB.txt

  done
  
done


#### TADS
subnums=`ls -d ${basedir}/2*`

for sub in $subnums

do
  subcode=`basename ${sub}`
  #mkdir ${sub}/model/NB
  #mkdir ${sub}/model/NB/designs
  run_labels=`ls -d ${sub}/BOLD/Run*NB*`
  for run in ${run_labels}
  do
    runnum=`echo ${run} | sed 's/^.*\(.\)$/\1/' `
    nvols=`fslnvols ${run}/bold`
  
#    sed   -e 's:NVOLS:'${nvols}':g'  -e 's:SUBDIRPATH:'${sub}':'  -e 's:RUNDIRPATH:'${run}':' -e 's:RUNNUM:'${runnum}':'  /corral-repl/utexas/ldrc/TWINS/SCRIPTS/design_template_NB.fsf > ${sub}/model/NB/designs/run_${runnum}.fsf

    echo feat ${sub}/model/NB/designs/run_${runnum}.fsf >> /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev1_${subcode}_NB.txt

  done
  
done

