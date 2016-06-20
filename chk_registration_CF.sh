# Grabs each level 1 fun2standard.png for SST and compiles them into an html file to check registration.
# Mary Abbe Roe April 2014 (adapted from Jeanette's fMRI class script). Edited by LEE February 2016.

#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/chk_registration_CF.html


for subnum in 235121 235122 250221 250222 252321 252322 259721 259722 268721 268722 270321 274521 274522 277122 278621 278622 279721 279722 279731 279732 279921 282322 282621 282622 B100922 B101322 B102321 B102322 B102421 B102422 B103221 B103222 B103722 B103822 B103823 B104121 B104122 B104621 B104622 B105621 B105622 B105821 B105822 B105921 B105922 B106021 B106022 B106722 B107721 B107722 B108921 B108922 B109021 B109022 B109321 B111921 B112721 B112722 B113721 B113722 B114521 B114522

#for subnum in 

do
for i in Run1.feat Run2.feat
do
dirpth=/corral-repl/utexas/ldrc/TWINS/$subnum/model/CF/${i}/

echo '<p>============================================
<p> Registration for analysis in '$dirpth'

<p>FMRI to Highres<br><IMG BORDER=0 SRC='$dirpth'reg/example_func2highres.png WIDTH=100%>
<p>Highres to standard space<br><IMG BORDER=0 SRC='$dirpth'reg/highres2standard.png WIDTH=100%>
<p>FMRI to standard space<br><IMG BORDER=0 SRC='$dirpth'reg/example_func2standard.png WIDTH=100%>
</BODY></HTML>' >> /corral-repl/utexas/ldrc/TWINS/SCRIPTS/chk_registration_CF.html


done

done


