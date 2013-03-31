
BEGIN { 
    tag["A"]= 1
    tag["B"]= 2
    tag["C"]= 3
    tag["D"]= 4
    FS=" "
}


/Oliver/ { 
  print $1,1 >> "/home/pi/workspace/nfc_cats/oliver.dat"
}

/Sadie/ { 
  print $1,1 >> "/home/pi/workspace/nfc_cats/sadie.dat"
}
