#!/usr/bin/env bash

# if [ $# != 3 ]; then
#    echo "Usage: run_locuszoom.sh [input] [chrom] [build <hg19|hg38>]"
#    echo "input: must contain two columns labeled 'MarkerName' and 'P-value' (delimiter must be tab, MarkerName must be chr:pos)"
# else
#    metal=$1; chrom=$(echo $2 | sed 's|chr||g'); build=$3; output=$(basename ${metal}_regional_association_plot); ld=$(basename ${metal}_ld)
#    zoomdir="/mnt/lustre/groups/CBBI1243/KEVIN/gwasdata/locuszoom/bin/"
#    #metalocusdir="/mnt/lustre/groups/CBBI1243/KEVIN/gwasdata/cam_tz_merge/meta_analysis/locuszoom/"
#    refsnp=$(zcat $metal | sort -g -k2 | sed '1d' | head -n 1 | awk '{print $1}')
# 
#    ${zoomdir}locuszoom \
#       --metal ${metal} \
#       --refsnp ${refsnp} \
#       --chr ${chrom} \
#       --flank 200kb \
#       --pop AFR \
#       --build ${build} \
#       --cache ${ld} \
#       --source 1000G_Nov2014 \
#       --plotonly \
#       --markercol "MarkerName" \
#       --prefix ${output} \
#       --svg
# fi

zoomdir="/mnt/lustre/groups/CBBI1243/KEVIN/gwasdata/locuszoom/bin/"
suffix="_regional_association_plot"
###########################################
#  ${zoomdir}locuszoom \
#     --metal ${metalocusdir}cm_tz_am_unimputed_metaanalysis1_chr2.txt.gz \
#     --refsnp 'chr2:60718043' \
#     --chr 2 \
#     --flank 200kb \
#     --pop AFR \
#     --build hg19 \
#     --cache cm_tz_am_unimputed_metaanalysis1_chr2_ld \
#     --source 1000G_Nov2014 \
#     --plotonly \
#     --markercol "MarkerName" \
#     --prefix cm_tz_am_unimputed_metaanalysis1_chr2_ld_from_vcf \
#     --svg \
#     --ld-vcf /mnt/lustre/groups/CBBI1243/KEVIN/gwasdata/mergedBatches/phased/phased/chr2-phased.vcf.gz \
#     --ignore-vcf-filter 
###########################################

#   ${zoomdir}locuszoom \
#      --metal cm_topmed_imputed.assoc_chr13.txt.gz \
#      --refsnp 'chr13:28506155' \
#      --chr 13 \
#      --flank 250kb \
#      --pop AFR \
#      --build hg38 \
#      --cache cm_topmed_imputed.assoc_chr13_ld \
#      --source 1000G_Nov2014 \
#      --plotonly \
#      --prefix cm_topmed_imputed.assoc_chr13${suffix} \
#      --ld-vcf cm_chr13_topmed_1mb.vcf.gz \
#      --ignore-vcf-filter \
#      --svg

#   #     --gwas-cat whole-cat_significant-only
#   
#   ${zoomdir}locuszoom \
#      --metal cm_kgp_imputed.assoc_chr6.txt.gz \
#      --refsnp 'chr6:135419018' \
#      --chr 6 \
#      --flank 250kb \
#      --pop AFR \
#      --build hg19 \
#      --source 1000G_Nov2014 \
#      --cache cm_kgp_imputed.assoc_chr6_ld \
#      --plotonly \
#      --prefix cm_kgp_imputed.assoc_chr6${suffix} \
#      --ld-vcf cm_chr6_kgp_1mb.vcf.gz \
#      --ignore-vcf-filter \
#      --svg

#   ${zoomdir}locuszoom \
#      --metal cm_topmed_imputed.assoc_chr2.txt.gz \
#      --refsnp 'chr2:60498316' \
#      --chr 2 \
#      --flank 250kb \
#      --pop AFR \
#      --build hg38 \
#      --source 1000G_Nov2014 \
#      --plotonly \
#      --prefix cm_topmed_imputed.assoc_chr2${suffix} \
#      --ld-vcf cm_chr2_topmed_1mb.vcf.gz \
#      --ignore-vcf-filter \
#      --svg \
#      --cache cm_topmed_imputed.assoc_chr2_ld

#   ${zoomdir}locuszoom \
#      --metal tz_sanger_imputed.assoc_chr2.txt.gz \
#      --refsnp 'chr2:60719074' \
#      --chr 2 \
#      --flank 250kb \
#      --pop AFR \
#      --build hg19 \
#      --source 1000G_Nov2014 \
#      --plotonly \
#      --prefix tz_sanger_imputed.assoc_chr2${suffix} \
#      --ld-vcf tz_sanger_chr2_1mb_bcl11a.vcf.gz \
#      --ignore-vcf-filter \
#      --svg \
#      --cache tz_sanger_imputed.assoc_chr2_ld

#   ${zoomdir}locuszoom \
#      --metal tz_sanger_imputed.assoc_chr2.txt.gz \
#      --refsnp 'chr2:186827712' \
#      --chr 2 \
#      --flank 500kb \
#      --pop AFR \
#      --build hg19 \
#      --source 1000G_Nov2014 \
#      --plotonly \
#      --prefix tz_sanger_imputed.assoc_chr2_znf804a_2${suffix} \
#      --ld-vcf tz_sanger_chr2_1mb_znf804a.vcf.gz \
#      --ignore-vcf-filter \
#      --svg \
#      --cache tz_sanger_imputed.assoc_chr2_znf804a_2_ld
#   
#   ${zoomdir}locuszoom \
#      --metal tz_sanger_imputed.assoc_chr2.txt.gz \
#      --refsnp 'chr2:185797285' \
#      --chr 2 \
#      --flank 500kb \
#      --pop AFR \
#      --build hg19 \
#      --source 1000G_Nov2014 \
#      --plotonly \
#      --prefix tz_sanger_imputed.assoc_chr2_znf804a${suffix} \
#      --ld-vcf tz_sanger_chr2_1mb_znf804a.vcf.gz \
#      --ignore-vcf-filter \
#      --svg \
#      --cache tz_sanger_imputed.assoc_chr2_znf804a_ld

${zoomdir}locuszoom \
   --metal tz_sanger_imputed.assoc_chr2.txt.gz \
   --chr 2 \
   --start 184827712 \
   --end 187827712 \
   --build hg19 \
   --plotonly \
   --prefix tz_sanger_imputed.assoc_chr2_znf804a_all${suffix} \
   --ld-vcf tz_sanger_chr2_1mb_znf804a.vcf.gz \
   --ignore-vcf-filter \
   --svg \
   --cache tz_sanger_imputed.assoc_chr2_znf804a_all

  
#   ${zoomdir}locuszoom \
#      --metal tz_custom_imputed.assoc_chr3.txt.gz \
#      --refsnp 'chr3:139066061' \
#      --chr 3 \
#      --flank 250kb \
#      --pop AFR \
#      --build hg19 \
#      --source 1000G_Nov2014 \
#      --plotonly \
#      --prefix tz_custom_imputed.assoc_chr3${suffix} \
#      --ld-vcf tz_custom_chr3_1mb.vcf.gz \
#      --ignore-vcf-filter \
#      --svg \
#      --cache tz_custom_imputed.assoc_chr3_ld
#   
#   ${zoomdir}locuszoom \
#      --metal tz_h3a_imputed.assoc_chr11.txt.gz \
#      --refsnp 'chr11:133334906' \
#      --chr 11 \
#      --flank 250kb \
#      --pop AFR \
#      --build hg19 \
#      --source 1000G_Nov2014 \
#      --plotonly \
#      --prefix tz_h3a_imputed.assoc_chr11${suffix} \
#      --ld-vcf tz_h3a_chr11_1mb.vcf.gz \
#      --ignore-vcf-filter \
#      --svg \
#      --cache tz_h3a_imputed.assoc_chr11_ld
#   
#   ${zoomdir}locuszoom \
#      --metal tz_caapa_imputed.assoc_chr6.txt.gz \
#      --refsnp 'chr6:135419018' \
#      --chr 6 \
#      --flank 250kb \
#      --pop AFR \
#      --build hg19 \
#      --source 1000G_Nov2014 \
#      --plotonly \
#      --prefix tz_caapa_imputed.assoc_chr6${suffix} \
#      --ld-vcf tz_caapa_chr6_1mb.vcf.gz \
#      --ignore-vcf-filter \
#      --svg \
#      --cache tz_caapa_imputed.assoc_chr6_ld

