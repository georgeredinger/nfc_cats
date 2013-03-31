
BEGIN { 
    tag["2646984483"]= "credit_card (Anita)";
    tag["1266650301"]="A (Sadie)";
    tag["3406986173"]="B (Chi)";
    tag["184842941"]= "C (Oliver)";
    tag["3946481597"]="D (No Name)";
    FS=" "
}


{ 
  hex=sprintf("0X%s%s%s%s\n", $3,$4,$5,$6);
  dec=strtonum(hex);
  print tag[dec]
}
