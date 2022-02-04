#!/bin/bash

source globals.sh

/usr/local/bin/singularity run --cleanenv \
    --bind $project_dir:/project \
    --bind $scratch_dir:/scratch \
    /working/mochila2/JC/containers/mriqc-v21.0.0.simg \
    --correct-slice-timing --modalities T1w bold \
    --no-sub \
    --nprocs 8 -w /scratch \
    /project/data/bids /project/data/bids/derivatives group