#!/usr/bin/env bash

#./../prepare_annotation_files.r

#for i in {1..22}; do zgrep -v "RSID CHR" cm.sanger.chr${i}.bimann.gz; done | sed '1 i RSID CHR cM BP A1 A2 CODING UTR PROMOTER DHS INTRON' | bgzip -c > cm.sanger.all.bimann.gz

zgrep -v "RSID CHR" cmtz_unimputed.bimann.gz | cut -f7- -d' ' > cmtz_unimputed.ann.txt
