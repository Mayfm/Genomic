#$ -S /bin/bash

#

# Your job name

#$ -N fastQC

#
# Use current working directory
#$ -cwd
#
# Join stdout and stderr
#$ -j y
#
# Send an email after the job has finished
#$ -m e
#$ -M maye.fosado@gmail.com
#
# If modules are needed, source modules environment (Do not delete the next line):
. /etc/profile.d/modules.sh
#
# Add any modules you might require:
module load fastqc/0.11.3
#
#pe (Parallel environment)request a parallel environment (MPI, OpenMP). Set your number of requested slots here.
#A continuación, número de hilos pedidos a máquina
#$ -pe mpich 1
#
# Write your commands in the next line
fastqc /mnt/Timina/alfredvar/alfredvar/seqdata/SENASICA_7/BC54_S37_R2_001.fastq
