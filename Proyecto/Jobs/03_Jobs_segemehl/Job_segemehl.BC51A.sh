#$ -S /bin/bash
#
# Your job name
#$ -N BC51.bam
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
segemehl.x -b -S -t 8 -g RGmt -d chrM.hg38A.fa -i chrM.hg38A.idx -q /mnt/Timina/alfredvar/alfredvar/seqdata/SENASICA_7/BC51_R1_trimP.fastq -p /mnt/Timina/alfredvar/alfredvar/seqdata/SENASICA_7/BC51_R2_trimP.fastq > BC51A.bam
