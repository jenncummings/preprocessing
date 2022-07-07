#!/bin/bash

# Run from BIDS code/preprocessing directory: sbatch slurm_fmriprep.sh <subject id>

#SBATCH --job-name=fmriprep
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=jenncummings@ucsf.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=24000
#SBATCH --time=20:00:00
#SBATCH --output=/working/mochila2/JC/code/preprocessing/logs/%x-%j.log

pwd; hostname; date

echo "Running fmriprep script for BACPAC dataset sub-${1}."

#SCRIPTS TO RUN
/working/mochila2/JC/code/preprocessing/run_fmriprep.sh $1

date

## End-of-job summary, if running as a job
[[ -n "$SLURM_JOB_ID" ]] && sstat --format="JobID,AveCPU,MaxRSS,MaxPages,MaxDiskRead,MaxDiskWrite" -j "$SLURM_JOB_ID"
