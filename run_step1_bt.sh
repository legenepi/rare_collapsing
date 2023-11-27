#!/bin/bash

#SBATCH -A gen1
#SBATCH -J step1
#SBATCH -o log/%x-%A_%a.log
#SBATCH -t 23:00:00
#SBATCH --mem=64gb
#SBATCH -c 8
#SBATCH -D .

./regenie_v3.3.gz_x86_64_Centos7_mkl \
    --step 1 \
    --bed ukb_cal_v2_pain_Hg38 \
    --extract qc_pass.snplist \
    --covarFile pain_covar.txt \
    --phenoFile EUR_pain_bt_pheno.txt \
    --bsize 1000 \
    --loocv \
    --lowmem \
    --lowmem-prefix ${TMPDIR} \
    --bt \
    --out pain_fit_bt_out_Hg38 \
    --threads 8
