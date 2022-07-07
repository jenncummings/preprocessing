#!/bin/bash
# Edited from Pygers workshop template

source globals.sh

#Begin:
subj=$1

#Run fmriprep
singularity run -e -B $project_dir:/project,$work_dir:/scratch /data/i2/software/singularity/fmriprep-latest.simg \
    /project/data/new_testbids /project/data/new_testbids/derivatives \
    participant \
    --participant-label $subj \
    --fs-license-file /project/code/preprocessing/license.txt \
    --verbose \
    --debug all \
    --fs-no-reconall \
    --omp-nthreads $SLURM_CPUS_PER_TASK \
    --n_cpus $SLURM_CPUS_PER_TASK \
    --mem $SLURM_MEM_PER_NODE \
    --low-mem \
    --use-aroma \
    --return-all-components \
    --resource-monitor \
    --output-spaces MNI152NLin2009cAsym \
    --write-graph --work-dir /scratch \

echo "Completed fmriprep script for BACPAC sub-$subj."
