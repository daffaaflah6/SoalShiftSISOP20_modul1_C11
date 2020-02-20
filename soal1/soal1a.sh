awk -F "," 'NR > 1 {r[$13]+=$21} END {for(x in r) print (x, r[x])}' Sample-Superstore.tsv | sort -g | head -n 1
