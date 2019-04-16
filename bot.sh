#!/usr/bin/bash
# update : 16/04/2019
# telegram : @Mr_28dh8
clear;
RED='\033[0;31m'
CYAN='\033[0;36m'
WHITE=$(tput setaf 7)
GREEN=$(tput setaf 2)
source "botfb.sh"
#https://graph.facebook.com/me/friends?&access_token=
NAA() {
                 curl -Gs "https://graph.facebook.com/v3.2/me/friends/?fields=email&access_token=$toke&limit=$total" | jq -r .data | grep -Po '(?<="email":)[^,]*' | tr -d '[]}"'
}
bangsat() {
   	             njir=$(curl -X GET "https://graph.facebook.com/v3.0/me?fields=home.limit(100)&access_token=$TOKEN" -s)
   	             lol=$(echo $njir | grep -Po '(?<="id":)[^,]*' | tr -d '[]}"')
   	             printf "$lol\n"
}
apasalahku() {
                URL=`curl -s "https://graph.facebook.com/me/groups?access_token=$tox" | grep -Po '(?<="id":)[^,]*' | tr '""' "\n"`
                printf "$URL" >> groups.txt
}
banner() {
printf "
\t$RED███████╗███████╗███████╗ ██████╗
\t$RED╚══███╔╝██╔════╝██╔════╝██╔════╝
\t$RED  ███╔╝ ███████╗█████╗  ██║     
\t$WHITE ███╔╝  ╚════██║██╔══╝  ██║     
\t$WHITE███████╗███████║███████╗╚██████╗
\t$WHITE╚══════╝╚══════╝╚══════╝ ╚═════╝.ID
\t$CYAN    [ ${CYAN} coder by ${GREEN}widhisec  ]
                 version : full             
"
}
banner
function menu(){
printf "[1].dump id friends\n"
printf "[2].dump id friends from group\n"
printf "[3].auto comment\n"
printf "[4].auto unfrend\n"
printf "[5].dump id status\n"
printf "[6].dump id group\n"
printf "[7].dump email \n"
read -p "=>" ga
if [[ $ga == "1" ]]; then
echo -n "masukkan access_token : "; read -s toks
read -p "limit : " limit
frend $toks $limit
elif [[ $ga == "2" ]]; then
read -p "masukkan ID group :" id
read -s -p  "masukkan access_token : " tokens
group $id $tokens
elif [[ $ga == "3" ]]; then
printf "masukkan access_token : "; read -s access
printf "masukkan list : "; read idX
echo -n "pesan nya gan : "; read pesanz
for i in $(cat $idX); do
commend $access $idX $pesanz
done
elif [[ $ga == "4" ]]; then
read -p "list : " TARGED
echo -n "masukkan access_token :"; read -s tokex
for i in $(cat $TARGED); do
Zsecc0de-crew.id $TARGED $tokex
done
fi
     case $ga in
     	5 )
            read -s -p "masukkan access token : " TOKEN
            bangsat $TOKEN
     		;;
     	6 )
     	    read -s -p "masukkan access_token : " tox
     	    apasalahku $tox
     esac
if [[ $ga == "7" ]]; then
read -p "masukkan access_token : " toke
read -p "limit : " total
NAA $toke $total
fi
}
frend() {
                  gas=$(curl -Gs "https://graph.facebook.com/v3.2/100001396455823/friends?access_token=$toks&pretty=1&limit=$limit") 
                  z=$(echo $gas | grep -Po '(?<="id":)[^,]*' | tr -d '}]"')
                  printf "$z" > teman.txt
                  printf "succes tersimpan!\n"
}
Zsecc0de-crew.id() {
                  njo=$(curl -X POST "https://graph.facebook.com/me/friends/$i?method=delete&access_token=$tokex" -s)
                  if [[ $njo =~ "true" ]]; then
                  	 printf "succes unfrend \n"
                  elif [[ $njo =~ "error" ]]; then
                  	 printf "gagal\n"
                  fi
}
menu