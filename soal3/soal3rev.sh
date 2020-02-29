for no in {1..28}
do
	wget -O "pdkt_kusuma_$no" "https://loremflickr.com/320/240/cat" --append-output wget.log
done

grep 'Location' wget.log >> location.log

mkdir duplicate
mkdir kenangan

cd duplicate
z=$(ls | grep -o '[0-9]*' | sort -nr | head -n 1)
z=$(($z+1))

cd ..
cd kenangan
w=$(ls | grep -o '[0-9]*' | sort -nr | head -n 1)
w=$(($w+1))
cd ..

for ((x=1;x<=28;x=x+1))
do
	for ((y=$x+1;y<=28;y=y+1))
	do
		if diff -s "pdkt_kusuma_$x" "pdkt_kusuma_$y"
		then 
			mv pdkt_kusuma_$y ./duplicate/duplicate_$d
			d=$(($d+1))
		fi
	done
done

for no in {1..28}
do
	mv pdkt_kusuma_$no ./kenangan/kenangan_$k
	w=$(($w+1))
done

cat wget.log > wget.log.bak
cat location.log > location.log.bak