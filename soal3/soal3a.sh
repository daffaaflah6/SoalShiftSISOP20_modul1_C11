for no in 1 .. 28
do
  wget -O "pdkt_kusuma_$no" "https://loremflickr.com/320/240/cat" --append-output wget.log
done
