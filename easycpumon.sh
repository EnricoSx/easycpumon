#!/bin/sh
while [ 1 ]
do
free -m | awk 'NR==2{printf "Ram: %s/%sMB (%.2f%%)", $3,$2,$3*100/$2 }'
df -h | awk '$NF=="/"{printf "Disco: %d/%dGB (%s)", $3,$2,$5}'
top -bn1 | grep load | awk '{printf "CPU: %.2f\r", $(NF-2)}'

sleep 1
done
