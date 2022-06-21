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
    --verbose \
    --participant-label $subj \
    --fs-license-file /project/code/preprocessing/license.txt \
    --fs-no-reconall \
    --omp-nthreads 8 \
    --nthreads 12 \
    --mem_mb 30000 \
    --use-aroma \
    --return-all-components \
    --output-spaces MNI152NLin2009cAsym \
    --write-graph --work-dir /scratch \
    /project/data/testbids_2 /project/data/testbids_2/derivatives participant
