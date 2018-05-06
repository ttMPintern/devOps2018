#!/bin/bash

cd /app
#cp /var/log/nginx/old.log /app/log.tmp
cp /app/old.log /app/log.tmp
grep -v status=200 /app/log.tmp >no200.tmp
part2=$( grep 'remote_addr=8.8.8.8' /app/log.tmp | wc -l )
part3=$( curl -Is hint.macpaw.io | grep ETag | cut -d \" -f2 | cut -c -2 )
part1=0
stats=()
for st in $( grep -o 'status=[0-9]*' no200.tmp | grep -o '[0-9]*' ); do
        if [[ -z ${stats["$st"]} ]]; then
            stats["$st"]=1
        else
            stats["$st"]=$((${stats["$st"]}+1))
        fi
done
count=0
for st in ${!stats[@]}; do
        echo "===$st==${stats["$st"]}=" ############
        if [[ $count -lt ${stats["$st"]} ]]; then
            count=${stats["$st"]}
            part1=$st
        fi
done
pw=$(( $part1 + $part2 + $part3 ))
echo "quest:( $part1 $part2 $part3 ) password is: $pw"
unzip -P $pw -j /tmp/additional.zip  -d /app
rm /app/*.tmp

