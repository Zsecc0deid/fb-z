#!/bin/bash
# dump group facebook via api 
# tolong jangan di recode gan . itu aja pesan saya
GREEN=$(tput setaf 2) #HIJAU
WHITE=$(tput setaf 7) #PUTIH
RED=$(tput setaf 1) #MERAH
function fbgroup(){
	gas="https://graph.facebook.com/me/groups?access_token=${access_token}"
	   curl --silent "$gas" >> as.json
	az=$(cat as.json | grep -Po '(?<="id":)(.*?)(?=})' | grep -Eo "([0-9]{1,3}){9}[0-9]{1,3}")
	   gz=$(cat as.json | jq -r .data | tr -d '{}[]"",')
  out=$(echo "$az")
  out2=$(echo "$gz")
  if [[ $(cat as.json) =~ "error" ]]; then
  	 printf "${RED}GAGAL NGDUMP GAN. \n"
  	 rm -rf as.json
else
	 echo -e "$out" >> ID.txt
	 echo -e "$out2"
	 echo -e "${GREEN}[+]${WHITE}ID GROUP BERHASIL DI SIMPAN !!\n"
	 rm -rf as.json
   fi
}
echo -e "[CREATE BY WIDHISEC]"
echo -e "[DUMP ID FACEBOOK]"
read -p "${GREEN}[*] ${WHITE}access_token : " access_token
fbgroup