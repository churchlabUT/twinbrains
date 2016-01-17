SUBCODE='B101322'
STUDYNAME='ldrc/TWINS'
cd /corral-repl/utexas/${STUDYNAME}
SETUP_SUBJECT='/corral-repl/utexas/ldrc/setup_subject.py'
#$SETUP_SUBJECT --xnat-project church --getdata --keepdata -b /corral-repl/utexas/ --studyname $STUDYNAME -s $SUBCODE
echo "$SETUP_SUBJECT -o --dcm2nii --motcorr --qa --betfunc --fm --fsrecon --fs-subdir /corral-repl/utexas/ldrc/FREESURFER/TWINS/ --keepdata -b /corral-repl/utexas/ldrc --studyname TWINS -s $SUBCODE">setup_$SUBCODE.sh 

launch -s setup_$SUBCODE.sh -r 10:00:00 -n setup_$SUBCODE -j Analysis_Lonestar -m churchlab@austin.utexas.edu
