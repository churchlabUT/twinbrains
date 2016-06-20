# Grabs each level 1 design.png for SST and compiles them into an html file to check the design matrices.
# Mary Abbe Roe April 2014 (adapted from Jeanette's fMRI class script). Edited by LEE February 2016.

rm /corral-repl/utexas/ldrc/TWINS/SCRIPTS/chk_design_SST.html


for subnum in 235121 235122 244922 250221 250222 252321 252322 268721 268722 270321 274521 278621 279721 279732 282322 282621 282622 B101322 B101922 B102321 B102322 B102421 B102422 B103222 B103721 B103822 B103823 B104122 B104621 B104622 B105621 B105622 B105821 B105822 B105921 B105922 B106021 B106022 B107721 B107722 B108921 B108922 B109021 B109022 B109321 B111921 B112721 B112722 B113721 B113722 B114521 B114522

#for subnum in 259721 259722 279722

do

dirpth=/corral-repl/utexas/ldrc/TWINS/$subnum/model/SST/Run1.feat/

echo '<p>============================================
<p> Design Matrix in '$dirpth'

<p>Design Matrix<br><IMG BORDER=0 SRC='$dirpth'design.png WIDTH=50%>
</BODY></HTML>' >> /corral-repl/utexas/ldrc/TWINS/SCRIPTS/chk_design_SST.html


done
