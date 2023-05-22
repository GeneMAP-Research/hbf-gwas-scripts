#!/usr/bin/env bash

rhemc_dir=/mnt/lustre/groups/CBBI1243/KEVIN/gwasdata/RHE-mc/build/
geno=cmtz_unimputed.bimann
pheno=cmtz_hbf_clean.pheno
cov=cmtz_hbf_with_agesq_20pcs.cov
anno=cmtz_unimputed.ann.txt
out=cmtz_unimputed_dom

for i in {1..30}; do
  for cov in cmtz_hbf_20pcs.cov cmtz_hbf_20pcs_with_agesq.cov cmtz_hbf_30pcs.cov cmtz_hbf_30pcs_with_agesq.cov cmtz_hbf_100pcs.cov cmtz_hbf_100pcs_with_agesq.cov cmtz_hbf_50pcs.cov cmtz_hbf_50pcs_with_agesq.cov; do
    out="${cov/.cov/_dom}" 
    ${rhemc_dir}RHEmc_dom \
      -g ${geno} \
      -p ${pheno} \
      -c ${cov} \
      -k 10 \
      -jn 1000 \
      -annot ${anno} \
      -o ${out}_rep${i}.txt
  done
done
