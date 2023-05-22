#!/usr/bin/env bash

#CHR	POS	MarkerID	Allele1	Allele2	AC_Allele2	AF_Allele2	imputationInfo	BETA	SE	Tstat	var	p.value	N

if [[ $# != 1 ]]; then
    echo "Usage: get_metaljob_script.sh [imp-panel-name]"
else
    imp=$1;
echo """
# Meta-analysis weighted by standard error does not work well
# because different studies used very different transformations
# SCHEME   STDERR

# Not sure if genomic control is a good idea, given the large
# number of true associations in these three regions ...
GENOMICCONTROL ON

# To help identify allele flips, it can be useful to track
# allele frequencies in the meta-analysis.
# AVERAGEFREQ ON
# MINMAXFREQ ON
FREQ     AF_Allele2

VERBOSE ON

MARKER   MarkerID
WEIGHT   N
ALLELE   Allele2 Allele1
EFFECT   BETA
STDERR   SE
PVAL     p.value

PROCESS  ./input/cm_${imp}_imputed.assoc

MARKER   MarkerID
WEIGHT   N
ALLELE   Allele2 Allele1
EFFECT   BETA
STDERR   SE
PVAL     p.value

PROCESS  ./input/tz_${imp}_imputed.assoc

OUTFILE   ./output/cm_tz_${imp}_saige_metaanalysis .tbl
LOGPVALUE   OFF
ANALYZE   HETEROGENEITY
QUIT""" > ./metal_jobscripts/${imp}_metaljob_saige.txt
fi
