# SoalShiftSISOP20_modul1_C11

Marsha Nabilah Wibowo - 05111840000027 || Muhammmad Daffa' Aflah Syarif - 05111840000030

# #1. Sample-Superstore.tsv --> AWK
Source Code : [soal1.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal1/soal1.sh)

Dalam persoalan ini diminta untuk menentukan sesuatu terhadap profit yang didapat tapi yang paling minimum. Penjelasan masing-masing soal :
a. Menentukan Region dengan Profit minimum
```
$(awk -F "," 'NR > 1 {r[$13]+=$21} END {for(x in r) print x " " r[x] "/"}' Sample-Superstore.tsv | sort -g | head -n 1
```
- `awk -F ","` untuk mengubah field separator menjadi tanda koma (secara default spasi)
- `NR > 1` untuk melakukan proses setelah baris 1 karena baris 1 merupakan penamaan kolom
- `r[$13]+=$21` untuk menjumlahkan nilai profit berdasarkan kolom `region`
- `for(x in r) print x " " r[x] "/"` untuk mengeluarkan hasil
- `sort -g` untuk mengurutkan secara ascending hasil yang didapat
- `head -n 1` untuk mendapatkan hasil urutan teratas

b. Menentukan 2 State dengan Profit minimum berdasarkan hasil 1 a
```
awk -F "," 'NR > 1 {if($13 == "Central"){s[$11]+=$21}} END {for(x in s) print s[x] " " x "/"}' Sample-Superstore.tsv | sort -g | head -n 2
```
- `awk -F ","` untuk mengubah field separator menjadi tanda koma (secara default spasi)
- `NR > 1` untuk melakukan proses setelah baris 1 karena baris 1 merupakan penamaan kolom
- `if($13 == "Central")` untuk menentukan kolom `state` berdasarkan `region` yang telah didapat di 1 a
- `r[$11]+=$21` untuk menjumlahkan nilai profit berdasarkan kolom `state`
- `for(x in s) print s[x] " " x "/"` untuk mengeluarkan hasil
- `sort -g` untuk mengurutkan secara ascending hasil yang didapat
- `head -n 2` untuk mendapatkan hasil 2 urutan teratas

c. Menentukan 10 Product Name dengan Profit minimum berdasarkan hasil 1 b
```
awk -F "," 'NR > 1 {if($11 == "Texas" || $11 == "Illinois"){pn[$17]+=$21}} END {for(x in pn) print pn[x] " " x "/"}' Sample-Superstore.tsv | sort -g | head -n 10
```
- `awk -F ","` untuk mengubah field separator menjadi tanda koma (secara default spasi)
- `NR > 1` untuk melakukan proses setelah baris 1 karena baris 1 merupakan penamaan kolom
- `if($11 == "Texas" || $11 == "Illinois")` untuk menentukan kolom `product name` berdasarkan `state` yang telah didapat di 1 b
- `r[$17]+=$21` untuk menjumlahkan nilai profit berdasarkan kolom `product name`
- `for(x in pn) print pn[x] " " x "/"` untuk mengeluarkan hasil
- `sort -g` untuk mengurutkan secara ascending hasil yang didapat
- `head -n 10` untuk mendapatkan hasil 10 urutan teratas

Jadi dapat disimpulkan bahwa, pada kasus ini hasil masing-masing point mempengaruhi kasus setelahnya. Jadi jika disatukan maka hasilnya dapat dilihat di > Source Code
```
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
```
Berikut hasil screenshot persoalan ini.

# #2. Caesar Chiper --> Bash Script
Source Code : [soal2a2b.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal2/soal2a2b.sh), [soal2_enkripsi.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal2/soal2_enkripsi.sh), [soal2_dekripsi.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal2/soal2_dekripsi.sh)

# #3. Cat --> Bash, AWK, Crontab
Source Code : [soal3a.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal3/soal3a.sh)
