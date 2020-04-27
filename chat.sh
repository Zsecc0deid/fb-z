#!/bin/bash
# just an example "sb=yours;datr=yours;c_user=yours;xs=;fr=yours"
hijau=$(tput setaf 2)
merah=$(tput setaf 1)
cyan=$(tput setaf 6)
function fbkrim(){
            b=("Mozilla/5.0 (Linux; Android 4.4.2; Nexus 4 Build/KOT49H) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36")
            web=$(curl --silent 'https://mbasic.facebook.com/messages/read/?tid=cid.c.${a}%3A100046129553724&refid=11&ref=dbl#fua' \
            -H "cookie: $ina" \
            -A "$b")
            fb_dtsg=$(echo "$web" | grep -Po 'value="\K.*?(?=".*)' | grep A | head -1)
            jazoest=$(echo "$web" | grep -Po '(?<=name="jazoest" value=")[^"]*' | head -1)
            tids=$(echo "$web" | grep -Po '(?<=name="tids" value=")[^"]*' | head -1)
            wwwupp=$(echo "$web" | grep -Po '(?<=name="wwwupp" value=")[^"]*' | head -1)
            csid=$(echo "$web" | grep -Po '(?<=name="csid" value=")[^"]*' | head -1)
            data="fb_dtsg=$fb_dtsg&jazoest=$jazoest&body=$z&send=Kirim&tids=$tids&wwwupp=$wwwupp&ids%5B$a%5D=$a&cver=legacy&csid=$csid"
            gas=$(curl -D - -X POST --silent -L 'https://mbasic.facebook.com/messages/send/?icm=1&refid=12' \
            -H "cookie: $ina" \
            -H 'authority: mbasic.facebook.com' \
            -H 'origin: https://free.facebook.com' \
            -H 'upgrade-insecure-requests: 1' \
            -H 'content-type: application/x-www-form-urlencoded' \
            -A "$b" --data "$data" --compressed)
            if [[ $gas =~ "HTTP/2 200" ]]; then
                   printf "${hijau}[+]${WHITE} SUCCES TERKIRIM .\n"
            else
                   printf "${merah}[-] GAGAL TERKIRIM .\n"
                   sleep 1.1
             fi
}
#____   __  ___ ___ ___ ___ __  __  ___    ______ ___  _   _    _ __   
#|  \ `v' / |_  | __/ _// _//  \| _\| __|_ / _/ _ \ __|| | | |__| | _\  
#| -<`. .'   / /| _| \_| \_| // | v | _|__| \_| v / _| | 'V' |__| | v | 
#|__/ !_!   |___|___\__/\__/\__/|__/|___|  \__/_|_\___|!_/ \_!  |_|__/
echo -e "
\t\033[0;34m ██████╗██╗  ██╗ █████╗ \033[0;36m████████╗\033[0;35m███████╗██████╗ 
\t\033[0;34m██╔════╝██║  ██║██╔══██╗\033[0;36m╚══██╔══╝\033[0;35m██╔════╝██╔══██╗
\t\033[0;34m██║     ███████║███████║\033[0;36m   ██║   \033[0;35m█████╗  ██████╔╝
\t\033[0;34m██║     ██╔══██║██╔══██║\033[0;36m   ██║   \033[0;35m██╔══╝  ██╔══██╗
\t\033[0;34m╚██████╗██║  ██║██║  ██║\033[0;36m   ██║   \033[0;35m██║     ██████╔╝
\t\033[0;34m ╚═════╝╚═╝  ╚═╝╚═╝  ╚═╝\033[0;36m   ╚═╝   \033[0;35m╚═╝     ╚═════╝ 
                [ ${cyan}created by widhisec ]
    "
    echo -n "[ COOKIE ] :"; read ina
    echo -n "[ USERID ] :"; read a
    echo -n "[ PESAN  ] :"; read o
    echo -n "[ BERAPA ] :"; read brp
for x in $(seq 1 $brp);do
    z=$(echo "$o" | tr -d '[:space:]')
    fbkrim $a $z
done