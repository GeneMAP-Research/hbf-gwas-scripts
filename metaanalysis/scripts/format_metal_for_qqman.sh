#!/usr/bin/env bash

# MarkerName	Allele1	Allele2	Freq1	FreqSE	MinFreq	MaxFreq	Effect	StdErr	P-value	Direction	HetISq	HetChiSq	HetDf	HetPVal
#MarkerName	Allele1	Allele2	Weight	Zscore	P-value	Direction	HetISq	HetChiSq	HetDf	HetPVal

if [ $# -lt 1 ]; then
    echo "Usage: format_meta_for_qqman.sh [metal-output]"
else
    tbl=$1
    zgrep -v '?' ${tbl} | \
    csvcut \
        --tabs \
        --columns "MarkerName,P-value" | \
    csvformat \
        --out-tabs | \
    awk '{print $1,$1,$2,$3}' | \
    sed '1d' | \
    sed 's/:/ /1' | \
    sed 's/:/ /1' | \
    cut -f1-2,4- -d' ' | \
    awk '$4 <= 1e-3' | \
    sed '1 i CHR BP SNP P' | \
    gzip -c > \
    $(basename ${tbl/metaanalysis*/for_qqman.txt.gz})


#    hdr=$(head -1 ${tbl})
#    if grep -q "Weight" <<< ${hdr}; then
#        csvcut \
#            --tabs \
#            --columns "MarkerName,P-value" \
#            cm_tz_topmed_saige_metaanalysis1.tbl | \
#        csvformat \
#            --out-tabs | \
#        awk '{print $1,$1,$2,$3}' | \
#        sed '1d' | \
#        sed 's/:/ /1' | \
#        sed 's/:/ /1' | \
#        cut -f1-2,4- -d' ' | \
#        sed '1 i CHR BP SNP P' > \
#        ${tbl/metaanalysis*/for_qqman.txt.gz}
#    elif grep -q "Effect" <<< ${hdr}; then
#         
#
##    grep -v '?' ${tbl} | \
#    sed 's|:|\t|g' ${tbl} | \
#    sed '1d' | \
#    awk '{print $1,$2,$1":"$2$4,$5,$6,$7,$8,$9,$10,$11,$12,$13}' | \
#    sed '1 i CHR BP SNP REF ALT SAMPLESIZE ZSCORE P DIRECTION HetISq HetChiSq HetDf HetPVal' | \
#    gzip -c \
#    > ${tbl/metaanalysis*/for_qqman.txt.gz}
#    else

fi
