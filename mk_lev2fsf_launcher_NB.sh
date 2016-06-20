#!/bin/sh

### To test 1 person, define the sub; comment out basedir, subnums, for sub in
### subnums, the first do, and the last done.

#sub='/corral-repl/utexas/ldrc/TWINS/244922'

#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/launch_lev2_SST.txt

basedir='/corral-repl/utexas/ldrc/TWINS'

subnums=`ls -d ${basedir}/B*`

for sub in $subnums

do
  subcode=`basename ${sub}`     
  echo python /corral-repl/utexas/ldrc/TWINS/SCRIPTS/mk_lev2fsf.py ${sub}/model/NB ${sub}/model/NB >> launch_lev2fsf_NB.txt
    
done


########################

subnums=`ls -d ${basedir}/2*`

for sub in $subnums

do
  subcode=`basename ${sub}`   
  echo python /corral-repl/utexas/ldrc/TWINS/SCRIPTS/mk_lev2fsf.py ${sub}/model/NB ${sub}/model/NB >> launch_lev2fsf_NB.txt
     
done
