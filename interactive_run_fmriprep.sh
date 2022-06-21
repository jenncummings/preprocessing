#!/bin/bash
# Edited from Pygers workshop template

source globals.sh

#Begin:
subj=$1

#Run fmriprep
singularity run --cleanenv \
    --bind $project_dir:/project \
    --bind $work_dir:/scratch \
    /working/mochila2/JC/containers/fmriprep-v21.0.1 \
    --verbose \
    --participant-label $subj \
    --fs-license-file /project/code/preprocessing/license.txt \
    --fs-no-reconall \
    --nthreads $SLURM_CPUS_PER_TASK \
    --use-aroma \
    --return-all-components \
    --resource-monitor \
    --output-spaces MNI152NLin2009cAsym \
    --write-graph --work-dir /scratch \
    /project/data/455_bids /project/data/455_bids/derivatives participant
