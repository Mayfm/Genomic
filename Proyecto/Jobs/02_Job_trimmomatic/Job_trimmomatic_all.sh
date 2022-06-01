#$ -S /bin/bash

#

# Nombre

#$ -N trimm.B

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
# Add any modules you might require:
module load trimmomatic/0.33
#
#pe (Parallel environment)request a parallel environment (MPI, OpenMP). Set your number of requested slots here.
#A continuación, número de hilos pedidos a máquina
#$ -pe mpich 1
#
# Write your commands in the next line

trimmomatic PE -trimlog trimlog.BC50 BC50_S37_R1_001.fastq BC50_S37_R2_001.fastq BC50_R1_trimP.fastq BC50_R1_trimU.fastq BC50_R2_trimP.fastq BC50_R2_trimU.fastq HEADCROP:9
trimmomatic PE -trimlog trimlog.BC51 BC51_S38_R1_001.fastq BC51_S38_R2_001.fastq BC51_R1_trimP.fastq BC51_R1_trimU.fastq BC51_R2_trimP.fastq BC51_R2_trimU.fastq HEADCROP:9
trimmomatic PE -trimlog trimlog.BC52 BC52_S39_R1_001.fastq BC52_S39_R2_001.fastq BC52_R1_trimP.fastq BC52_R1_trimU.fastq BC52_R2_trimP.fastq BC52_R2_trimU.fastq HEADCROP:9
trimmomatic PE -trimlog trimlog.BC54 BC54_S41_R1_001.fastq BC54_S41_R2_001.fastq BC54_R1_trimP.fastq BC54_R1_trimU.fastq BC54_R2_trimP.fastq BC54_R2_trimU.fastq HEADCROP:9
trimmomatic PE -trimlog trimlog.BC55 BC55_S42_R1_001.fastq BC55_S42_R2_001.fastq BC55_R1_trimP.fastq BC55_R1_trimU.fastq BC55_R2_trimP.fastq BC55_R2_trimU.fastq HEADCROP:9
trimmomatic PE -trimlog trimlog.BC56 BC56_S43_R1_001.fastq BC56_S43_R2_001.fastq BC56_R1_trimP.fastq BC56_R1_trimU.fastq BC56_R2_trimP.fastq BC56_R2_trimU.fastq HEADCROP:9
trimmomatic PE -trimlog trimlog.BC57 BC57_S44_R1_001.fastq BC57_S44_R2_001.fastq BC57_R1_trimP.fastq BC57_R1_trimU.fastq BC57_R2_trimP.fastq BC57_R2_trimU.fastq HEADCROP:9
trimmomatic PE -trimlog trimlog.BC58 BC58_S45_R1_001.fastq BC58_S45_R2_001.fastq BC58_R1_trimP.fastq BC58_R1_trimU.fastq BC58_R2_trimP.fastq BC58_R2_trimU.fastq HEADCROP:9
