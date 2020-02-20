awk -F "," 'NR > 1 {if($11 == "Texas" || $11 == "Illinois"){pn[$17]+=$21}} END {for(x in pn) print (pn[x], x)}' Sample-Superstore.tsv | sort -g | head -n 10
