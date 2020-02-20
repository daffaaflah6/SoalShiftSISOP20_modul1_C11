awk -F "," 'NR > 1 {if($13=="Central"){s[$11]+=$21}} END {for(x in s) print (s[x], x)}' Sample-Superstore.tsv | sort -g | head -n 2
