#$ -S /bin/bash
#
# Your job name
#$ -N BC58j
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
#pe (Parallel environment)request a parallel environment (MPI, OpenMP). Set your number of requested slots here.
#A continuación, número de hilos pedidos a máquina
#$ -pe mpich 8
#
# Write your commands in the next line
segemehl.x -S -b -t 8 -g RGmt -d chrM.hg38.THjnct.fa -i chrM.hg38.THjnct.idx -q /mnt/Timina/alfredvar/alfredvar/seqdata/SENASICA_7/BC58_R1_trimP.fastq -p /mnt/Timina/alfredvar/alfredvar/seqdata/SENASICA_7/BC58_R2_trimP.fastq -o BC58j.bam
