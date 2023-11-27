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
    --bed ukb_cal_v2_LF_Hg38 \
    --extract qc_pass.snplist \
    --covarFile covar_extra_trans.txt \
    --phenoFile pheno_extra_trans.txt \
    --bsize 1000 \
    --loocv \
    --lowmem \
    --lowmem-prefix ${TMPDIR} \
    --qt \
    --out LF_extra_fit_qt_out_Hg38 \
    --threads 8
