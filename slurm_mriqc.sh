#!/bin/bash

# Run from BIDS code/preprocessing directory: sbatch slurm_mriqc.sh <subject id>

#SBATCH --job-name=mriqc
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=jenncummings@ucsf.edu
#SBATCH --output=/working/mochila2/JC/code/preprocessing/logs/mriqc-%A_%a.log

# How long is job?
#SBATCH -t 3:00:00

# How much memory to allocate (in MB)?
#SBATCH --cpus-per-task=8 --mem-per-cpu=14000

# Print job submission info
echo "Slurm job ID: " $SLURM_JOB_ID
date

# PARTICIPANT LEVEL
echo "Running MRIQC on sub-${1}"

/working/mochila2/JC/code/preprocessing/run_mriqc.sh $1

echo "Finished running MRIQC on sub-${1}"
date

# GROUP LEVEL
echo "Running MRIQC on group"

/working/mochila2/JC/code/preprocessing/run_mriqc_group.sh

echo "Finished running MRIQC on group"
date