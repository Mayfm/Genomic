#$ -S /bin/bash

#

# Nombre

#$ -N fastQC

#
# Utilizar el directorio donde está el archivo
#$ -cwd
#
# Unir stdout and stderr
#$ -j y
#
# Enviar un correo cuando esté listo el job
#$ -m e
#$ -M maye.fosado@gmail.com
#
# Si se necesitan módulos, el entorno de los módulos de origen
. /etc/profile.d/modules.sh
#
# Agregar módulos necesarios
module load fastqc/0.11.3
#
#A continuación, número de hilos pedidos a máquina
#$ -pe mpich 1
#
# Comandos
fastqc /mnt/Timina/alfredvar/alfredvar/seqdata/SENASICA_7/BC57_S44_R2_001.fastq
