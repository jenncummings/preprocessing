#!/bin/bash

INPUT=all_subs.csv
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read subject
do
    #echo "dir : $dir"
    #echo "subject : $subject"
    #echo "session : $session"
    #sh job_test.sh $dir $subject $session
    sbatch fmriprep_batch.sh $subject
done < $INPUT
IFS=$OLDIFS