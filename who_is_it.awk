
BEGIN { 
    tag["2646984483"]= " (Anita)";
    tag["1266650301"]="A (Your Name Here)";
    tag["3406986173"]="Amelia"
    tag["184842941"]= "C (Your Name Here)";
    tag["3146871423"]= "Tucker"
    tag["3946481597"]="Lily Bug"
    FS=" "
}

{ 
  hex=sprintf("0X%s%s%s%s\n", $3,$4,$5,$6);
  dec=strtonum(hex);
  if(tag[dec] == "" ) {
    print dec
  } else {
    print tag[dec]
  }
}
