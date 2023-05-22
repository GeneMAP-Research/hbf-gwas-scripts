#!/usr/bin/env bash

mkdir -p merge/isec

bcftools \
  isec \
  -n+1 \
  -p merge/isec \
  -Oz \
  /mnt/lustre/groups/CBBI1243/KEVIN/gwasdata/mergedBatches/phased/cm_hbf_aligned.vcf.gz \
  /mnt/lustre/groups/CBBI1243/KEVIN/gwasdata/tanzania/phased/tz_scd_alinged.vcf.gz
