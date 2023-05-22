#!/usr/bin/env bash

# 1000bp upstream and downstream

if [ $# -lt 6 ]; then
   echo "Usage: get_pedinfo.sh [plink binary] [chrom] [from-bp] [to-bp] [out] [make-pheno <true/false>]"
else

   bed=$1; chrom=$2; frombp=$3; tobp=$4; out=$5; phe=$6
   # b38 (28501218−25000 to 28524906+25000)
   #frombp=28476218; tobp=28549906
   # b37  (29075355−25000 to 29099043+25000)
   #frombp=29050355; tobp=29124043

   if [[ "${phe}" == "true" ]]; then
      plink \
         --recode HV-1chr \
         --bfile ${bed} \
         --keep-allele-order \
         --chr ${chrom} \
         --out ${out} \
         --from-bp ${frombp} \
         --to-bp ${tobp} \
         --tail-pheno 0.2 \
         --snps-only just-acgt \
         --biallelic-only 
   else
      plink \
         --recode HV-1chr \
         --bfile ${bed} \
         --chr ${chrom} \
         --keep-allele-order \
         --out ${out} \
         --from-bp ${frombp} \
         --to-bp ${tobp} \
         --snps-only just-acgt \
         --biallelic-only
         #--extract cm_tz_chr13_flt1.info
   fi


fi
