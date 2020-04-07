#!/bin/bash

#

#we first start by giving the cluster a few options on the job: which queue to put it into (nick), and the name we are giving it

#SBATCH --partition=defaultp

#SBATCH --job-name=picard

#SBATCH --output=picard_output

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

#SBATCH --mem=20G

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

module load picard/2.13.2

#run commands on SLURM's srun

srun java -jar $PICARD SortSam I=SRR869918_uniq.sam O=SRR869918_sorted.bam SORT_ORDER=coordinate

srun java -jar $PICARD MarkDuplicates  I=SRR869918_sorted.bam  O=SRR869918_nodups.bam  M=SRR869918_marked_dup_metrics.txt REMOVE_DUPLICATES=true ASSUME_SORTED=false

srun java -jar $PICARD SortSam I=SRR869919_uniq.sam O=SRR869919_sorted.bam SORT_ORDER=coordinate

srun java -jar $PICARD MarkDuplicates  I=SRR869919_sorted.bam  O=SRR869919_nodups.bam  M=SRR869919_marked_dup_metrics.txt REMOVE_DUPLICATES=true ASSUME_SORTED=false

srun java -jar $PICARD SortSam I=SRR869920_uniq.sam O=SRR869920_sorted.bam SORT_ORDER=coordinate

srun java -jar $PICARD MarkDuplicates  I=SRR869920_sorted.bam  O=SRR869920_nodups.bam  M=SRR869920_marked_dup_metrics.txt REMOVE_DUPLICATES=true ASSUME_SORTED=false

srun java -jar $PICARD SortSam I=SRR869921_uniq.sam O=SRR869921_sorted.bam SORT_ORDER=coordinate

srun java -jar $PICARD MarkDuplicates  I=SRR869921_sorted.bam  O=SRR869921_nodups.bam  M=SRR869921_marked_dup_metrics.txt REMOVE_DUPLICATES=true ASSUME_SORTED=false
