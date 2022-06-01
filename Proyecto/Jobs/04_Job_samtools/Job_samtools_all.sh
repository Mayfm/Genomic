#$ -S /bin/bash

#

# Your job name

#$ -N samtools.B

#
# Use current working directory
#$ -cwd
#
# Join stdout and stderr
#$ -j y
#
#
# If modules are needed, source modules environment (Do not delete the next line):
. /etc/profile.d/modules.sh
#
# Agregar módulos necesarios
module load samtools/1.3.1
#
#pe (Parallel environment)request a parallel environment (MPI, OpenMP). Set your number of requested slots here.
#A continuación, número de hilos pedidos a máquina
#$ -pe mpich 1
#
# Write your commands in the next line
samtools sort BC50A.bam -o BC50A.bam.sort
samtools sort BC50.j.bam -o BC50.j.bam.sort
samtools sort BC51A.bam -o BC51A.bam.sort
samtools sort BC51.j.bam -o BC51.j.bam.sort
samtools sort BC52A.bam -o BC52A.bam.sort
samtools sort BC52.j.bam -o BC52.j.bam.sort
samtools sort BC54A.bam -o BC54A.bam.sort
samtools sort BC54.j.bam -o BC54.j.bam.sort
samtools sort BC55A.bam -o BC55A.bam.sort
samtools sort BC55.j.bam -o BC55.j.bam.sort
samtools sort BC56A.bam -o BC56A.bam.sort
samtools sort BC56.j.bam -o BC56.j.bam.sort
samtools sort BC57A.bam -o BC57A.bam.sort
samtools sort BC57.j.bam -o BC57.j.bam.sort
samtools sort BC58A.bam -o BC58A.bam.sort
samtools sort BC58.j.bam -o BC58.j.bam.sort
