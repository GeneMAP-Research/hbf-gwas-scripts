#!/usr/bin/env bash

for i in *.tbl; do head -1 $i > ${i/metaanalysis*/topsignlas.txt}; awk '$6 <= 1e-5' $i | grep -v '?' | sort -g -k6 >> ${i/metaanalysis*/topsignlas.txt}; done
