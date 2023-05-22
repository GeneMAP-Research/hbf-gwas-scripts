#!/usr/bin/env bash

if [ $# != 2 ]; then
   echo "Usage: format_metal_result_for_locuszoom.sh [metal-result] [chromosome <e.g. chr2>]"
else
   locusin=$1; chrom=$2
   grep -v '?' ${locusin} | \
   csvcut \
     -t \
     -c "MarkerName,P-value" | \
   csvformat -T | \
   sed 's/:SNP//g' | \
   awk '{print "chr"$1"\t"$2}' | \
   grep ${chrom} | \
   sed '1 i MarkerName\tP-value' | \
   gzip -c > $(basename ${locusin/.tbl/}_${chrom}.txt.gz)
fi
