
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

/Amelia/ { 
  print $1,1 >> "/home/pi/workspace/nfc_cats/amelia.dat"
}

/Tucker/ { 
  print $1,1 >> "/home/pi/workspace/nfc_cats/tucker.dat"
}
