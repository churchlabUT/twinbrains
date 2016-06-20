# Grabs each level 1 design.png for CF and compiles them into an html file to check the design matrices.
# Mary Abbe Roe April 2014 (adapted from Jeanette's fMRI class script). Edited by LEE February 2016.

#rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/chk_design_NB.html

for subnum in 235121 244922 250221 250222 252321 252322 259721 259722 268721 268722 270321 274521 274522 277122 278621 278622 279721 279722 279921 282322 282621 282622 B101322 B101921 B102321 B102421 B103221 B103222 B103822 B104122 B104621 B104622 B105621 B105622 B105821 B105822 B105921 B105922 B106021 B106022 B107722 B108921 B108922 B109021 B109022 B109321 B111921 B112721 B112722 B113721 B113722 B114521 B114522

do

for i in Run1.feat Run2.feat
do
dirpth=/corral-repl/utexas/ldrc/TWINS/$subnum/model/NB/${i}/

echo '<p>============================================
<p> Design Matrix in '$dirpth'

<p>Design Matrix<br><IMG BORDER=0 SRC='$dirpth'design.png WIDTH=100%>
</BODY></HTML>' >> /corral-repl/utexas/ldrc/TWINS/SCRIPTS/chk_design_NB.html


done

done
