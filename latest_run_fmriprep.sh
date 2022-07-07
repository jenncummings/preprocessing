#!/bin/bash
# Edited from Pygers workshop template

project_dir=/working/mochila2/JC
work_dir=/working/mochila2/JC/work_2

#Begin:
subj=$1

#Run fmriprep
singularity run -e -B $project_dir:/project,$work_dir:/scratch /working/mochila2/JC/containers/fmriprep-21.0.2.simg \
    /project/data/latest_new_testbids /project/data/latest_new_testbids/derivatives \
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
