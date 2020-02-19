#!/bin/bash

sebelum="${1%.*}"

change=`stat --printf="%z" $sebelum.txt`

time=`echo "$change" | awk -F ' ' '{ print $2 }'`

hour=`echo "$time" | awk -F ':' '{ print $1 }'`

key1=`expr $hour + 98`
key2=`expr $hour + 97`

chr() {
  printf "\\$(printf '%03o' "$1")"
}

up=`chr $key1`
down=`chr $key2`

setelah=`printf "$sebelum" | tr $up-za-$down${up^^}-ZA-${down^^} b-zaB-ZA`

mv $sebelum.txt $setelah.txt