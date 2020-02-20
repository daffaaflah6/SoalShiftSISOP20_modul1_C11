echo "Region dengan Profit minimum : "
a=$(awk -F "," 'NR > 1 {r[$13]+=$21} END {for(x in r) print x " " r[x] "/"}' Sample-Superstore.tsv | sort -g | head -n 1)
echo $a
echo "--------------------------------"
echo "	"
echo "State dengan Profit minimum : "
b=$(awk -F "," 'NR > 1 {if($13 == "Central"){s[$11]+=$21}} END {for(x in s) print s[x] " " x "/"}' Sample-Superstore.tsv | sort -g | head -n 2)
echo $b
echo "--------------------------------"
echo "	"
echo "Produk dengan Profit minimum : "
c=$(awk -F "," 'NR > 1 {if($11 == "Texas" || $11 == "Illinois"){pn[$17]+=$21}} END {for(x in pn) print pn[x] " " x "/"}' Sample-Superstore.tsv | sort -g | head -n 10)
echo $c
echo "--------------------------------"
