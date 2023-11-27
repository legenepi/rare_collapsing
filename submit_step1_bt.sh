#!/bin/bash

BASE=/rare_variants/collapsing_Hg38
REGENIE=regenie_v3.3.gz_x86_64_Centos7_mkl
NAME=pain_step1

REGENIE_CMD="cp ${REGENIE} /tmp; chmod u+x /tmp/${REGENIE}; /tmp/${REGENIE} --step 1 --bed ukb_cal_v2_pain_Hg38 --extract qc_pass.snplist --covarFile pain_covar.txt --phenoFile EUR_pain_bt_pheno.txt --bsize 1000 --loocv --lowmem --lowmem-prefix tmp --bt --out pain_fit_bt_out_Hg38 --threads 16"

dx run swiss-army-knife \
    -iin="ukb_cal_v2_pain_Hg38.bed" \
    -iin="ukb_cal_v2_pain_Hg38.bim" \
    -iin="ukb_cal_v2_pain_Hg38.fam" \
    -iin="qc_pass.snplist" \
    -iin="pain_covar.txt" \
    -iin="EUR_pain_bt_pheno.txt" \
    -iin="regenie_v3.3.gz_x86_64_Centos7_mkl" \
    -icmd="$REGENIE_CMD" \
    --instance-type "mem1_ssd1_v2_x16" \
    --name="$NAME" \
    --destination="$BASE" \
    --brief --yes
