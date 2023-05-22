#!/usr/bin/env Rscript

args <- commandArgs(TRUE)
if(length(args)<1) {
  message("\nUsage: prepare_annotation_files.r [bim file (gzipped)]\n")
} else {

  require(data.table)

  bim <- args[1]
  bimout <- sub(".gz", "ann.gz", bim)

  message("\nbim file: \n", bim)

  for(chrom in 1:22) { 
    #ann <- fread(paste0("/mnt/lustre/groups/CBBI1243/KEVIN/gwasdata/heritability/annotations/1KG.", chrom, ".annot.gz"), h=T, nThread=24)
    #bim <- fread(paste0("cm.sanger.chr", chrom, ".bim.gz"), col.names=c("CHR","RSID","cM","BP","A1","A2"), h=F, nThread=24)
    #fwrite(bim.ann, paste0("cm.sanger.chr", chrom, ".bimann.gz"), col.names=T, row.names=F, quote=F, sep=" ")

    ann <- fread(
      "/mnt/lustre/groups/CBBI1243/KEVIN/gwasdata/heritability/annotations/1KG.all.annot.gz", 
      h = T, 
      nThread = 24
    )

    bim <- fread(
      bim, 
      col.names = c("CHR","RSID","cM","BP","A1","A2"), 
      h = F, 
      nThread = 24
    )

    bim.ann <- merge(
      bim, 
      ann, 
      by = "RSID", 
      sort = F
    )

    fwrite(
      bim.ann, 
      file = bimout, 
      col.names = T, 
      row.names = F, 
      quote = F, 
      sep = " ", 
      nThread = 24
    ) 
  }

}
