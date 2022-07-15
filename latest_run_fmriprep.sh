#!/bin/bash
# Edited from Pygers workshop template

project_dir=/working/mochila2/JC
work_dir=/working/mochila2/JC/work_3

#Begin:
subj=$1

#Run fmriprep
singularity run -e -B $project_dir:/project,$work_dir:/scratch /working/mochila2/JC/containers/fmriprep-21.0.2.simg \
    /project/data/nofm_latest_new_testbids /project/data/nofm_latest_new_testbids/derivatives \
    participant \
    --participant-label $subj \
    --fs-license-file /project/code/preprocessing/license.txt \
    --ignore fieldmaps \
    --verbose \
    --debug all \
    --fs-no-reconall \
    --omp-nthreads $SLURM_CPUS_PER_TASK \
    --nprocs $SLURM_CPUS_PER_TASK \
    --mem_mb $SLURM_MEM_PER_CPU \
    --low-mem \
    --use-aroma \
    --return-all-components \
    --resource-monitor \
    --output-spaces MNI152NLin2009cAsym \
    --write-graph --work-dir /scratch \

echo "Completed fmriprep script for BACPAC sub-$subj."
