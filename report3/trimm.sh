#!/bin/bash
#

#we first start by giving the cluster a few options on the job: which queue to put it into (nick), and the name we are giving it

#SBATCH --partition=bigmem

#SBATCH --reservation=vicores_2

#SBATCH --job-name=trimm

#SBATCH --output=trimm_output

#

#Number of CPU cores to use within one node

#SBATCH -c 5

#

#Define the number of hours the job should run.

#Maximum runtime is limited to 10 days, ie. 240 hours

#SBATCH --time=96:00:00

#

#Define the amount of RAM used by your job in GigaBytes

#In shared memory applications this is shared among multiple CPUs

#SBATCH --mem=10G

#

#Send emails when a job starts, it is finished or it exits

#SBATCH --mail-user=youremail@ist.ac.at

#SBATCH --mail-type=ALL

#

#Pick whether you prefer requeue or not. If you use the --requeue

#option, the requeued job script will start from the beginning,

#potentially overwriting your previous progress, so be careful.

#For some people the --requeue option might be desired if their

#application will continue from the last state.

#Do not requeue the job in the case it fails.

#SBATCH --no-requeue

#

#Do not export the local environment to the compute nodes

#SBATCH --export=NONE

unset SLURM_EXPORT_ENV

#

#Set the number of threads to the SLURM internal variable

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

#

#load any module you need here

module load java

#run commands on SLURM's srun

srun java -jar /nfs/scistore03/vicosgrp/Bioinformatics_2018/Beatriz/0-Software/Trimmomatic-0.36/trimmomatic-0.36.jar PE -phred33 ERR305392_1.fastq ERR305392_2.fastq ERR305392_1_paired.fastq ERR305392_1_unpaired.fastq ERR305392_2_paired.fastq ERR305392_2_unpaired.fastq ILLUMINACLIP:/nfs/scistore03/vicosgrp/Bioinformatics_2018/Beatriz/0-Software/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36

