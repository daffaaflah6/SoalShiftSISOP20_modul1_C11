awk -F "," 'NR > 1 {if($11 == "Texas" || $11 == "Illinois"){pn[$16]+=$21}} END {for(x in pn) print (pn[x], x)}' Sample-Superstore.tsv | sort -g | head -10
