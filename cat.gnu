set terminal png size 1024, 250 
user = system("echo $USER")
png_file=sprintf("/home/%s/workspace/nfc_cats/cat.png",user)
bug_dat=sprintf("/home/%s/workspace/nfc_cats/bug.dat",user)
amelia_dat=sprintf("/home/%s/workspace/nfc_cats/amelia.dat",user)
tucker_dat=sprintf("/home/%s/workspace/nfc_cats/tucker.dat",user)
out_png = sprintf("/home/%s/workspace/nfc_cats/cat.png",user)
set output out_png
set xdata time
set timefmt "%s"
set format x "%d-%H"     # or anything else
set xlabel "Time DD-HH"
set pointsize 2.5
set title "Who is the thirstist cat ?"
plot bug_dat  using ($1-7*3600):($2) with points title "Bug", amelia_dat using ($1-7*3600):($2) with points title "Amelia", tucker_dat using ($1-7*3600):($2) with points title "Tucker"


