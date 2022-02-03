#!/bin/bash
# Edited from Pygers workshop template

source globals.sh

#Begin:
subj=$1

#Run fmriprep
/usr/local/bin/singularity run --cleanenv \
    --bind $project_dir:/project \
    --bind $scratch_dir:/scratch \
    /data/i2/software/singularity/fmriprep-latest.simg \
    --participant-label $subj \
    --fs-license-file /project/code/preprocessing/license.txt \
    --omp-nthreads $SLURM_CPUS_PER_TASK \
    --n_cpus $SLURM_CPUS_PER_TASK \
    --use-aroma \
    --return-all-components
    --output-spaces MNI152NLin2009cAsym \
    --write-graph --work-dir /scratch \
    /project/data/bids /project/data/bids/derivatives participant