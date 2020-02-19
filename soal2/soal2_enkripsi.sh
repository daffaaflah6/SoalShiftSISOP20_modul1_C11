#!/bin/bash

sebelum="${1%.*}"

hour=`date "+%H"`

key1=`expr $hour + 98`
key2=`expr $hour + 97`

chr() {
  printf "\\$(printf '%03o' "$1")"
}

up=`chr $key1`
down=`chr $key2`

setelah=`printf "$sebelum" | tr b-zaB-ZA $up-za-$down${up^^}-ZA-${down^^}`

mv $sebelum.txt $setelah.txt