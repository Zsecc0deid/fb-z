#!/bin/bash
# just an example "sb=yours;datr=yours;c_user=yours;xs=;fr=yours"
hijau=$(tput setaf 2)
merah=$(tput setaf 1)
cyan=$(tput setaf 6)
function fbkrim(){
            ua[0]="Mozilla/5.0 (Linux; U; Android 2.2) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.1"
            ua[1]="Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148"
            ua[2]="Mozilla/5.0 (iPad; CPU OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148"
            ua[3]="Mozilla/5.0 (Linux; Android 9; SM-G960F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.157 Mobile Safari/537.36"
            ua[4]="Mozilla/5.0 (Linux; Android 6.0.1; SM-G532G Build/MMB29T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.83 Mobile Safari/537.36"
            ua[5]="Mozilla/5.0 (Linux; Android 9; SM-G950F Build/PPR1.180610.011; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/74.0.3729.157 Mobile Safari/537.36"
            ua[6]="Mozilla/5.0 (iPad; CPU OS 9_3_5 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13G36"
            ua[7]="Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-en) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4"
            rand=$[$RANDOM % ${#ua[@]}]
            IFS=$'\r\n'
            get_ua=$(echo ${ua[$rand]})
            web=$(curl --silent 'https://mbasic.facebook.com/messages/read/?tid=cid.c.${a}%3A100046129553724&refid=11&ref=dbl#fua' \
            -H "cookie: $ina" \
            -H "$get_ua")
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
            -H "$b" --data "$data" --compressed)
            echo -e "$gas"
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
LIMITATOR=("15")
for x in $(seq 1 $brp);do
    ((thread=thread%LIMITATOR)); ((thread++==0)) && wait
    z=$(echo "$o" | tr -d '[:space:]');fbkrim $a $z &
done
wait
