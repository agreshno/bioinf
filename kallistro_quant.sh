#!/bin/bash

#

#we first start by giving the cluster a few options on the job: which queue to put it into (nick), and the name we are giving it

#SBATCH --partition=bigmem

#SBATCH --reservation=vicores_2

#SBATCH --job-name=kallistro_quant

#SBATCH --output=kallistro_quant_output

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

module load kallisto

#run commands on SLURM's srun

srun kallisto quant -t 16 -i transcripts.idx -o SRR5311884 -b 100 SRR5311884_1_short.fastq SRR5311884_2_short.fastq

srun kallisto quant -t 16 -i transcripts.idx -o SRR5311879 -b 100 SRR5311879_1_short.fastq SRR5311879_2_short.fastq

srun kallisto quant -t 16 -i transcripts.idx -o SRR5311881 -b 100 SRR5311881_1_short.fastq SRR5311881_2_short.fastq

srun kallisto quant -t 16 -i transcripts.idx -o SRR5311882 -b 100 SRR5311882_1_short.fastq SRR5311882_2_short.fastq

srun kallisto quant -t 16 -i transcripts.idx -o SRR5311883 -b 100 SRR5311883_1_short.fastq SRR5311883_2_short.fastq

srun kallisto quant -t 16 -i transcripts.idx -o SRR5311880 -b 100 SRR5311880_1_short.fastq SRR5311880_2_short.fastq
