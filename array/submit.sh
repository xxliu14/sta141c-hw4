#!/bin/bash -l

# Use the staclass partition. Only applies if you are in STA141C
#SBATCH --partition=staclass

# Use two cores to get some pipeline parallelism
#SBATCH --cpus-per-task=2

# Give the job a name
#SBATCH --job-name=hw4

# #SBATCH --mail-type=END
# #SBATCH --mail-user=

# Run all the questions
#SBATCH --array=1-2

export DATAFILE="/scratch/transaction.zip"

srun bash q${SLURM_ARRAY_TASK_ID}.sh
