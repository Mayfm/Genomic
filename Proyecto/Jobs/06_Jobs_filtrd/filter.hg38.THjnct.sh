#!/bin/bash
# filtra la salida de los archivos de mutec2 del mapeo de la cabeza y cola, selecciona los de un solo nuclétido, invierte alelos si es necesario, elimina el sesgo (0.66), porcentaje gt, elimina 1 kb de cola y cabeza y calcula la frecuencia alélica

for i in $(ls -1 BC5?j.vcf.gz | awk -F '.' '{print $1}')

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
awk '($11 ? $10/$11<=1.5 : 0) && ($10 ? $11/$10<=1.5 : 0) && ($8/$9<=1.5) &&
($9/$8<=1.5) && $10>=5 && 11>=5 {print $0}' |\
awk '{if ($1>2000 && 1>3001) print $1+13569"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$6/$7;
else if ($1>3000 && $1<4001) print $1-
3000"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11"\t"$6/$7} '>
$i.fltrd.1

done
