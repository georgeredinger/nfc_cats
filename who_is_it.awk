
BEGIN { 
    tag["2646984483"]= "credit_card (Anita)";
    tag["1266650301"]="A (Bad Catay)";
    tag["3406986173"]="B (Tucker)";
    tag["184842941"]= "C (Jaz)";
    tag["3946481597"]="D (Bug)";
    FS=" "
}


{ 
  hex=sprintf("0X%s%s%s%s\n", $3,$4,$5,$6);
  dec=strtonum(hex);
  print tag[dec]
}
