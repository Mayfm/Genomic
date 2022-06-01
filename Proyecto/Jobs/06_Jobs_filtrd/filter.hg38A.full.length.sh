#!/bin/bash
# filtra los archivos de salida de mutec2 de la longitud completo, selecciona los de un nucleótido, elimina el sesgo de la hebra, elimina 1 kb de la cola y cabeza, calcula la frecuencia alélica 

for i in $(ls -1 BC5?A.vcf.gz | awk -F '.' '{print $1}')

do

zcat $i.vcf.gz |\
grep ^chrM |\
awk '{print $2"\t"$4"\t"$5"\t"$10}' |\
awk -F ':' '{print $1"\t"$2"\t"$4"\t"$7}' |\
grep '  0/1  '|\
awk -F ',' '{print $1"\t"$2"\t"$3"\t"$4"\t"$5}'|\
awk '{if ($5 < $6) print
$1"\t"$3"\t"$2"\t"$4"\t"$6"\t"$5"\t"$7"\t"$10"\t"$11"\t"$8"\t"$9; else print
$0}'|\
awk '($1>1000) && ($1 < 15570) && ($11 ? $10/$11<=1.5 : 0) && ($10 ? $11/$10<=1.5 :
0) && ($8/$9<=1.5) && ($9/$8<=1.5) && $10>=5 && $11 >=5 {print $0"\t"$6/$7}'>
$i.fltrd.1

done
