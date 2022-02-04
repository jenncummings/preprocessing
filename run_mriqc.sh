#!/bin/bash
# Edited from Pygers workshop template

source globals.sh

#Begin:
subj=$1

/usr/local/bin/singularity run --cleanenv \
    --bind $project_dir:/project \
    --bind $scratch_dir:/scratch \
    /working/mochila2/JC/containers/mriqc.simg \
    --participant-label $subj \
    --correct-slice-timing --no-sub \
    --nprocs 8 -w /scratch \
    /project/data/bids /project/data/bids/derivatives participant