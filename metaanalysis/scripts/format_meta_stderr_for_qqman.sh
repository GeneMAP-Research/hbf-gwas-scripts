#!/usr/bin/env bash

#MarkerName      Allele1 Allele2 Effect  StdErr  P-value Direction       HetISq  HetChiSq        HetDf   HetPVal
#5       144238397       SNP     c       g       0.0126  0.0148  0.394   ++?     0.0     0.006   1       0.9366

if [ $# -lt 1 ]; then
    echo "Usage: format_meta_for_qqman.sh [metal-output]"
else
    tbl=$1

    #cut -f1,6 output/cm_tz_unimputed_saige_metaanalysis1.tbl | awk '{print $1,$0}' | sed 's/ /\t/g' | sed 's/:/\t/1' | sed 's/:/\t/1' | sed '1d' | cut -f1-2,4-5 | sed '1 i CHR\tBP\tSNP\tP' | sed 's/X/23/1' | gzip -c > formatted_for_qqman/cm_tz_unimputed_for_qqman.txt.gz

#    grep -v '?' ${tbl} | \
    sed 's|:|\t|g' ${tbl} | \
    sed '1d' | \
    awk '{print $1,$2,$1":"$2,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13}' | \
    sed '1 i CHR BP SNP A1 A2 BETA SE P DIRECTION HetISq HetChiSq HetDf HetPVal' | \
    gzip -c \
    > ${tbl/metaanalysis*/for_qqman.txt.gz}
fi
