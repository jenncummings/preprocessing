#!/bin/bash

# Run from BIDS code/preprocessing directory: sbatch v2_slurm_fmriprep.sh <subject id>

#SBATCH --job-name=v2_fmriprep
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=jenncummings@ucsf.edu
#SBATCH --nodes=1
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=4G
#SBATCH --output=/working/mochila2/JC/code/preprocessing/logs/%x-%j.log

pwd; hostname; date

echo "Running fmriprep script for BACPAC dataset sub-${1}."

#SCRIPTS TO RUN
/working/mochila2/JC/code/preprocessing/v2_run_fmriprep.sh $1

date
squeue -j $JOB_ID

## End-of-job summary, if running as a job
[[ -n "$SLURM_JOB_ID" ]] && sstat --format="JobID,AveCPU,MaxRSS,MaxPages,MaxDiskRead,MaxDiskWrite" -j "$SLURM_JOB_ID"
