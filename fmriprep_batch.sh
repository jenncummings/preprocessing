#!/bin/bash

#SBATCH --mail-type=START,END,FAIL
#SBATCH --mail-user=jenncummings@ucsf.edu
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=60G
#SBATCH --time=48:00:00
#SBATCH --output=/working/mochila2/JC/code/preprocessing/logs/%x-%j.log

pwd; hostname; date

echo "Running fmriprep script for BACPAC sub-${1}."

#User inputs:
project_dir=/working/mochila2/JC
bids_dir=$project_dir/data/bids
work_dir=$project_dir/work

#Begin:
subj=${1}

#Run fmriprep

singularity run -e -B $bids_dir:/BIDS,$work_dir:/work /working/mochila2/JC/containers/fmriprep-21.0.2.simg \
    /BIDS /BIDS/derivatives/nofm \
    participant \
    --omp-nthreads $SLURM_CPUS_PER_TASK \
    --n_cpus $SLURM_CPUS_PER_TASK \
    --participant-label $subj \
    --ignore fieldmaps \
    --bold2t1w-dof 9 \
    --use-aroma \
    --fs-no-reconall \
    --debug all \
    --resource-monitor \
    --fs-license-file $project_dir/code/preprocessing/license.txt \
    --output-spaces MNI152NLin2009cAsym \
    -w /work \

echo "Completed fmriprep script for BACPAC sub-${1}."
