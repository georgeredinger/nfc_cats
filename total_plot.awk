BEGIN { 
  FS=" ";
    user = ENVIRON["USER"]
    print "" > "/home/" user "/workspace/nfc_cats/tucker_total.dat"
    print "" > "/home/" user "/workspace/nfc_cats/amelia_total.dat"
    print "" > "/home/" user "/workspace/nfc_cats/bug_total.dat"
}

function isLeapYear(xyear)
{
# for gregorian calendar
# returns one if xyear is a leap year

  if ( xyear % 4 == 0  && ( xyear % 100 != 0  ||  xyear % 400 == 0 )){ 
    return 1 
    }
    else
    { 
    return 0
  } 
}



function DayOfYear(yy, mm, dd, typ,         i, xyear,xmonth, xday,lp,  doy)
{
#  Function: DayOfYear
#  Version: 1.0
#  Type: AWK script
#
#  Usage:   calculate Day of Year by summation
#           uses isLeapYear()
# 
#  Call Format:     DayOfYear(yy, mm, dd, typ)
#
#  Author:  Ing. Gerald Pechoc <gerald@pechoc.eu>
#           Use this code snippet for free
#  Date:    December 2012
#            
#########################################################
#
# 
	_DayOfYear["ver"] =  "1.0;2012-12-30"
#
doy = -1*1

	# the following two lines should better stand in the
	# main program
	gregyear = "31,28,31,30,31,30, 31,31,30,31,30,31"
	split(gregyear, _mb_gmonth, ",")


	xyear = yy*1
	xmonth = mm*1
	xday = dd*1
	
	
	# add 2000 if year is two digit
	if (length(xyear) < 4) xyear = xyear + 2000 

	#
	# Gregorian Calendar
	#
	if (typ == "gregorian"){
		lp = isLeapYear(xyear)
		doy = 0
		for (i = 1; i <= xmonth-1; i++){   # add days of month
		    doy = doy + _mb_gmonth[i]
		}
		if (xmonth > 2) doy = doy + lp     # add leap year if necessary
		doy = doy + xday 		   # add day of month
	}# end gregorian
	
return doy
}




{

  day_of_year = DayOfYear(strftime("%Y",$1),strftime("%m",$1),strftime("%d",$1),"gregorian");

}


/Tucker/ { 
  day_of_year = DayOfYear(strftime("%Y",$1),strftime("%m",$1),strftime("%d",$1),"gregorian");
  tucker[day_of_year]++
}

/Lily Bug/ { 
  day_of_year = DayOfYear(strftime("%Y",$1),strftime("%m",$1),strftime("%d",$1),"gregorian");
  lily_bug[day_of_year]++;
}

/Amelia/ { 
  day_of_year = DayOfYear(strftime("%Y",$1),strftime("%m",$1),strftime("%d",$1),"gregorian");
  amelia[day_of_year]++;
}

END {

  for(key in tucker) {
    print key,tucker[key] >> "/home/" user "/workspace/nfc_cats/tucker_total.dat"
  }

  for(key in lily_bug) {
    print key,lily_bug[key] >> "/home/" user "/workspace/nfc_cats/bug_total.dat"
  }

  for(key in amelia) {
    print key,amelia[key] >> "/home/" user "/workspace/nfc_cats/amelia_total.dat"
  }
}

