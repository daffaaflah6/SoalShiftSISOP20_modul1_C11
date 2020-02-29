# SoalShiftSISOP20_modul1_C11

Marsha Nabilah Wibowo - 05111840000027 || Muhammmad Daffa' Aflah Syarif - 05111840000030

# 1. Sample-Superstore.tsv --> AWK
Source Code : [soal1.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal1/soal1.sh)

Dalam persoalan ini diminta untuk menentukan sesuatu terhadap profit yang didapat tapi yang paling minimum.

a. Menentukan Region dengan Profit minimum
```sh
$(awk -F "," 'NR > 1 {r[$13]+=$21} END {for(x in r) print x " " r[x] "/"}' Sample-Superstore.tsv | sort -g | head -1
```
- `awk -F ","` untuk mengubah field separator menjadi tanda koma (secara default spasi)
- `NR > 1` untuk melakukan proses setelah baris 1 karena baris 1 merupakan penamaan kolom
- `r[$13]+=$21` untuk menjumlahkan nilai profit berdasarkan kolom `region`
- `for(x in r) print x " " r[x] "/"` untuk mengeluarkan hasil
- `sort -g` untuk mengurutkan secara generic numeric value (minimum value) hasil yang didapat
- `head -1` untuk mendapatkan hasil urutan teratas

b. Menentukan 2 State dengan Profit minimum berdasarkan hasil 1 a
```
awk -F "," 'NR > 1 {if($13 == "Central"){s[$11]+=$21}} END {for(x in s) print s[x] " " x "/"}' Sample-Superstore.tsv | sort -g | head -2
```
- `awk -F ","` untuk mengubah field separator menjadi tanda koma (secara default spasi)
- `NR > 1` untuk melakukan proses setelah baris 1 karena baris 1 merupakan penamaan kolom
- `if($13 == "Central")` untuk menentukan kolom `state` berdasarkan `region` yang telah didapat di 1 a
- `r[$11]+=$21` untuk menjumlahkan nilai profit berdasarkan kolom `state`
- `for(x in s) print s[x] " " x "/"` untuk mengeluarkan hasil
- `sort -g` untuk mengurutkan secara generic numeric value (minimum value) hasil yang didapat
- `head -2` untuk mendapatkan hasil 2 urutan teratas

c. Menentukan 10 Product Name dengan Profit minimum berdasarkan hasil 1 b
```
awk -F "," 'NR > 1 {if($11 == "Texas" || $11 == "Illinois"){pn[$17]+=$21}} END {for(x in pn) print pn[x] " " x "/"}' Sample-Superstore.tsv | sort -g | head -10
```
- `awk -F ","` untuk mengubah field separator menjadi tanda koma (secara default spasi)
- `NR > 1` untuk melakukan proses setelah baris 1 karena baris 1 merupakan penamaan kolom
- `if($11 == "Texas" || $11 == "Illinois")` untuk menentukan kolom `product name` berdasarkan `state` yang telah didapat di 1 b
- `r[$17]+=$21` untuk menjumlahkan nilai profit berdasarkan kolom `product name`
- `for(x in pn) print pn[x] " " x "/"` untuk mengeluarkan hasil
- `sort -g` untuk mengurutkan secara generic numeric value (minimum value) hasil yang didapat
- `head -10` untuk mendapatkan hasil 10 urutan teratas

Jadi dapat disimpulkan bahwa, pada kasus ini hasil masing-masing point mempengaruhi kasus setelahnya. Jadi jika disatukan maka hasilnya dapat dilihat di > Source Code
```sh
echo "Region dengan Profit minimum : "
a=$(awk -F "," 'NR > 1 {r[$13]+=$21} END {for(x in r) print x " " r[x] "/"}' Sample-Superstore.tsv | sort -g | head -1)
echo $a
echo "--------------------------------"
echo "	"
echo "State dengan Profit minimum : "
b=$(awk -F "," 'NR > 1 {if($13 == "Central"){s[$11]+=$21}} END {for(x in s) print s[x] " " x "/"}' Sample-Superstore.tsv | sort -g | head -2)
echo $b
echo "--------------------------------"
echo "	"
echo "Produk dengan Profit minimum : "
c=$(awk -F "," 'NR > 1 {if($11 == "Texas" || $11 == "Illinois"){pn[$17]+=$21}} END {for(x in pn) print pn[x] " " x "/"}' Sample-Superstore.tsv | sort -g | head -10)
echo $c
echo "--------------------------------"
```
Berikut hasil screenshot persoalan ini.
![soal1sh](https://user-images.githubusercontent.com/52326074/75002830-53728e00-5498-11ea-99a3-8b9bd8575b9d.jpg)

# 2. Caesar Chiper --> Bash Script
Source Code : [soal2a2b.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal2/soal2a2b.sh), [soal2_enkripsi.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal2/soal2_enkripsi.sh), [soal2_dekripsi.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal2/soal2_dekripsi.sh)

a. Membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf
besar, huruf kecil, dan angka. 

```sh
password=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 28 | head -n 1)
```

- Membuat karakter yang dihasilkan hanya huruf besar, huruf kecil, dan angka.

```sh
tr -dc A-Za-z0-9
``` 

- Membuat karakter yang dihasilkan hanya sebatas 28 karakter.

```sh
head -c 28 | head -n 1
``` 

b. Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet.

```sh
while true; do
   read -r -p "Enter file name: " nama
   if [[ $nama =~ ^[A-Za-z]+$ ]];then
      fname="$nama.txt"
      echo "$password" > "$fname"
      break
   else
      echo "error."
   fi
done
```

- Membuat kondisi agar nama file yang diinput hanya berupa alphabet. Apabila tidak memenuhi akan terjadi peringatan erorr.

c. Supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan dienkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah.

```sh
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
```

- Menghilangkan kata-kata setelah '.' agar .txt tidak ikut dienkripsi.
```sh
sebelum="${1%.*}"
```

- Variabel 'hour' digunakan untuk menyimpan jam yang ada saat ini.
```sh
hour=`date "+%H"`
```

- Variabel 'key1' dan 'key2' berperan sebagai batas atas (b) dan batas bawah (a) pada saat translate.
```sh
key1=`expr $hour + 98`
key2=`expr $hour + 97`
```

- Fungsi untuk mengubah ASCII ke value-nya.
```sh
chr() {
  printf "\\$(printf '%03o' "$1")"
}
```

- Variabel 'up' dan 'down' untuk menyimpan batas atas dan batas bawah setelah di-shift sesuai jam.
```sh
up=`chr $key1`
down=`chr $key2`
```

- Setiap huruf dalam sebelum akan dibaca dan terjadi pergantian huruf sesuai dengan format translate (b-zaB-ZA) yang sudah diganti dengan hasil dari up dan down sesuai dengan format jam. Hasilnya akan disimpan di variabel 'setelah'.
```sh
setelah=`printf "$sebelum" | tr b-zaB-ZA $up-za-$down${up^^}-ZA-${down^^}`
```

- Mengganti nama file yang disimpan di 'sebelum' menjadi hasil enkripsi yang disimpan di 'setelah'.
```sh
mv $sebelum.txt $setelah.txt
```

d. Jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

```sh
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
```

- Variabel 'change' digunakan untuk menyimpan waktu last change pada file untuk mengetahui jam berapa nama file terakhir diganti.
```sh
change=`stat --printf="%z" $sebelum.txt
```

- Variabel 'time' digunakan untuk mengambil jam dari variabel 'change' karena pada variabel tersebut terdapat informasi yang tidak diperlukan. Di-cut menggunakan awk dengan field separator ' ' dan diprint pada argumen 2.
```sh
time=`echo "$change" | awk -F ' ' '{ print $2 }'`
```

- Variabel 'hour' digunakan untuk mengambil jamnya saja pada variabel 'time' agar nama file bisa didekripsi.
```sh
hour=`echo "$time" | awk -F ':' '{ print $1 }'`
```

# 3. Cat --> Bash, AWK, Crontab
Source Code : [soal3a.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal3/soal3a.sh),
[crontab3.sh](https://github.com/daffaaflah6/SoalShiftSISOP20_modul1_C11/blob/master/soal3/crontab3.sh)

a. Mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log".

```sh
for no in {1..28}
do
  wget -O "pdkt_kusuma_$no" "https://loremflickr.com/320/240/cat" --append-output wget.log
done
```
- Menggunakan wget untuk download dan diberi nomor dari 1-28 dan juga membuat wget.log menggunakan --append-output.

b. Melakukan penjadwalan download setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu.

```
5 6-23/8 * * 0-5 /bin/bash /home/bela/modul1/soal3/soal3a.sh
```
- Crontab dibuat setiap 8 jam di mulai dari jam 06.05 di setiap hari kecuali hari Sabtu.

c. Membuat sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar yang terdownload tadi. Bila terindikasi sebagai gambar yang identik, maka sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate dengan format filename "duplicate_nomor". Setelah tidak ada gambar di current directory, maka lakukan backup seluruh log menjadi ekstensi ".log.bak".

```sh
grep 'Location' wget.log >> location.log

mkdir duplicate
mkdir kenangan

cd duplicate
d=$(ls | grep -o '[0-9]*' | sort -nr | head -n 1)
d=$(($d+1))

cd ..
cd kenangan
k=$(ls | grep -o '[0-9]*' | sort -nr | head -n 1)
k=$(($k+1))
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
	k=$(($k+1))
done
cat wget.log > wget.log.bak
cat location.log > location.log.bak
```

```sh
grep 'Location' wget.log >> location.log
```
- Mengambil location yang ada di wget.log dan memasukkannya ke file location.log.

```sh
mkdir duplicate
mkdir kenangan
```
- Membuat direktori baru untuk menempatkan foto-foto yang sudah disortir.

```sh
cd duplicate
z=$(ls | grep -o '[0-9]*' | sort -nr | head -n 1)
z=$(($z+1))

cd ..
cd kenangan
w=$(ls | grep -o '[0-9]*' | sort -nr | head -n 1)
w=$(($w+1))
cd ..
```
- Menyimpan sampai di nomor berapa foto-foto yang ada di folder kenangan dan duplicate.

```sh
for ((x=1;x<=28;x=x+1))
do
	for ((y=$x+1;y<=28;y=y+1))
	do
		if diff -s "pdkt_kusuma_$x" "pdkt_kusuma_$y"
		then 
			mv pdkt_kusuma_$y ./duplicate/duplicate_$z
			z=$(($z+1))
		fi
	done
done
```
- Membandingkan foto-foto yang sudah terdownload apakah ada yang dobel atau tidak dan memindahkannya ke direktori duplicate. Membandingkan menggunakan ```diff -s```.

```sh
for no in {1..28}
do
	mv pdkt_kusuma_$no ./kenangan/kenangan_$w
	w=$(($w+1))
done
```
- Memindahkan semua foto ke direktori kenangan.

```sh
cat wget.log > wget.log.bak
cat location.log > location.log.bak
```
- Membuat backup file log dengan ekstensi .log.bak
