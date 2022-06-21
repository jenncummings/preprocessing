#!/bin/bash
# Edited from Pygers workshop template

source globals.sh

#Begin:
subj=$1

#Run fmriprep
singularity run --cleanenv \
    --bind $project_dir:/project \
    --bind $work_dir:/scratch \
    /working/mochila2/JC/containers/fmriprep-v21.0.1.simg \
    --verbose \
    --participant-label $subj \
    --fs-license-file /project/code/preprocessing/license.txt \
    --fs-no-reconall \
    --omp-nthreads $SLURM_CPUS_PER_TASK \
    --n_cpus $SLURM_CPUS_PER_TASK \
    --use-aroma \
    --return-all-components \
    --output-spaces MNI152NLin2009cAsym \
    --write-graph --work-dir /scratch \
    /project/data/testbids_2 /project/data/testbids_2/derivatives participant
