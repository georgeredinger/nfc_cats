
BEGIN { 
    tag["A"]= 1
    tag["B"]= 2
    tag["C"]= 3
    tag["D"]= 4
    FS=" "
}


/Bug/ { 
  print $1,1 >> "/home/pi/workspace/nfc_cats/bug.dat"
}

/No Name/ { 
  print $1,1 >> "/home/pi/workspace/nfc_cats/noname.dat"
}
