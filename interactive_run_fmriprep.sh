#!/bin/bash
# Edited from Pygers workshop template

source globals.sh

#Begin:
subj=$1

#Run fmriprep
singularity run --cleanenv \
    --bind $project_dir:/project \
    --bind $work_dir:/scratch \
    /data/i2/software/singularity/fmriprep-latest.simg \
    --skip-bids-validation \
    --verbose \
    --participant-label $subj \
    --fs-license-file /project/code/preprocessing/license.txt \
    --fs-no-reconall \
    --nthreads 8 \
    --mem_mb 12000 \
    --use-aroma \
    --return-all-components \
    --resource-monitor \
    --output-spaces MNI152NLin2009cAsym \
    --write-graph --work-dir /scratch \
    /project/data/bids /project/data/bids/derivatives participant
