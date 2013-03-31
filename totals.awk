BEGIN { 
  FS=" ";
}

/Oliver/ { 
  day =  strftime("%D",$1)
  oliver[day]++
}

/Sadie/ { 
  day =  strftime("%D",$1)
  sadie[day]++;
}

END {
  for(key in sadie) {
    printf("Sadie %s %d\n", key,sadie[key]);
  }
  for(key in oliver) {
    printf("Oliver %s %d\n", key,oliver[key]);
  }
}
