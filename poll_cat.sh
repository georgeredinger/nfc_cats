#!/bin/bash
function watchForCat() {
  while true
  do
      ./read.sh
      sleep 0.5s
  done
}

(
  if [ "$1" == "test" ]
  then
      echo "Testing..."
      function nfc-poll() {
        echo "UID (NFCID1): de ad be ef" 
        return 0
      }
      export -f nfc-poll
      export  PAGE_DESTINATION="./TESTPAGE.HTML"
      cd /home/george/workspace/nfc_cats
      (watchForCat & my_pid="$!";sleep 5; kill "$my_pid";echo "enough testing";exit) 
      firefox "$PAGE_DESTINATION"
      exit
  else
      cd /home/pi/workspace/nfc_cats
      export  PAGE_DESTINATION="/var/www/index.lighttpd.html"
      watchForCat
  fi
echo "all done"
)

