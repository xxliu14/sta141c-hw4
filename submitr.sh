#!/bin/bash -l

#SBATCH --partition=staclass

#SBATCH --mail-type=ALL
#SBATCH --mail-user=xliu9@ucdavis.edu

# Specify which version of the software you want to use, and make it available
module load R

Rscript testfun.R