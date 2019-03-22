function group(){
           lozl=`curl -Gs "https://graph.facebook.com/$id/members?fields=id&limit=999999999&access_token=$tokens"`
           Z=$(echo $lozl | grep -Po '(?<="id":)[^,]*' | tr -d '}]"')
           printf "$Z" > group.txt
           printf "jumlah list `wc -l group.txt`\n"
           echo "berhasil tersimpan!\n"
      }
     function commend(){
             lozl=$(curl -X POST -s "https://graph.facebook.com/v3.2/$i/comments/?access_token=$access" -d "message=$pesanz")
             if [[ $lozl =~ "id" ]]; then
             printf "succes \n"
             elif [[ $lozl =~ "error" ]];then
             printf "gagal\n"
         fi
}
