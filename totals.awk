BEGIN { 
  FS=" ";
}

/Tucker/ { 
  day =  strftime("%D",$1)
  tucker[day]++
}

/Lily Bug/ { 
  day =  strftime("%D",$1)
  lily_bug[day]++;
}

/Amelia/ { 
  day =  strftime("%D",$1)
  amelia[day]++;
}
END {
  sum = 0.0;
  for(key in tucker) {
    sum += tucker[key]; 
    printf("Tucker %s %d\n", key,tucker[key]);
  }
  printf("Tucker Totals %d\n", sum);
  print " " ;
  sum = 0.0;
  for(key in lily_bug) {
    sum += tucker[key]; 
    printf("Lily Bug %s %d\n", key,lily_bug[key]);
  }
  printf("Lily Bug Totals %d\n", sum);
  print " " ;
  sum = 0.0;
  for(key in amelia) {
    sum += amelia[key]; 
    printf("Amelia %s %d\n", key,amelia[key]);
  }
  printf("Amelia Totals %d\n", sum);
  print " ";
}

