#!/bin/sh

### To test 1 person, define the sub; comment out basedir, subnums, for sub in
### subnums, the first do, and the last done.

#sub='/corral-repl/utexas/ldrc/TWINS/244922'

rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev2_CF.txt

basedir='/corral-repl/utexas/ldrc/TWINS'


subnums=`ls -d ${basedir}/B*`

for sub in $subnums

do
  subcode=`basename ${sub}`
  num_lev1_dirs=`ls -d ${sub}/model/CF/Run*.feat | wc -l`

  if [ "$num_lev1_dirs" -ge 1 ] ; then
     echo python /corral-repl/utexas/ldrc/TWINS/SCRIPTS/mk_lev2fsf.py ${sub}/model/CF ${sub}/model/CF >> launch_lev2fsf_CF.txt
    
  elif [ "$num_lev1_dirs" -lt 1 ] ; then
  echo ${subcode} "no level1 dirs"

fi
    
done


########################

subnums=`ls -d ${basedir}/2*`

for sub in $subnums

do
  subcode=`basename ${sub}`
  num_lev1_dirs=`ls -d ${sub}/model/CF/Run*.feat | wc -l`
  
  if [ "$num_lev1_dirs" -ge 1 ] ; then   
     echo python /corral-repl/utexas/ldrc/TWINS/SCRIPTS/mk_lev2fsf.py ${sub}/model/CF ${sub}/model/CF >> launch_lev2fsf_CF.txt
     
  elif [ "$num_lev1_dirs" -lt 1 ] ; then
  echo ${subcode} "no level1 dirs"

fi
     
done


