#$ -S /bin/bash
#
# Your job name
#$ -N BC50j
#
# Use current working directory
#$ -cwd
#
# Join stdout and stderr
#$ -j y
#
# If modules are needed, source modules environment (Do not delete the next line):
. /etc/profile.d/modules.sh
#
# Agregar módulos necesarios
module load segemehl/0.3.4
#
#A continuación, número de hilos pedidos a máquina
#$ -pe mpich 8
#
# Comandos
segemehl.x -S -b -t 8 -g RGmt -d chrM.hg38.THjnct.fa -i chrM.hg38.THjnct.idx -q /mnt/Timina/alfredvar/alfredvar/seqdata/SENASICA_7/BC50_R1_trimP.fastq -p /mnt/Timina/alfredvar/alfredvar/seqdata/SENASICA_7/BC50_R2_trimP.fastq -o BC50j.bam
