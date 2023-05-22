#!/usr/bin/env Rscript


cm.after.pruning <- read.table("cm_after_pruning.pca.txt", h=T)
cm.batches <- read.table("cm_batch_1_2_plink_ids.txt", h=T)
cm.after.pruning.batches <- merge(cm.after.pruning, cm.batches[,-c(2)], by="FID", sort=F)
svg("cm_batch_effects.svg", height=8, width=8, pointsize=16)
  plot(cm.after.pruning.batches$PC1, cm.after.pruning.batches$PC2, xlab="PC1", ylab="PC2", type="n")
  d <- cm.after.pruning.batches[cm.after.pruning.batches$BATCH=="2018",]
  points(d$PC1, d$PC2, pch=21, bg="lightblue")
  d <- cm.after.pruning.batches[cm.after.pruning.batches$BATCH=="2019",]
  points(d$PC1, d$PC2, pch=21, bg="coral")
  legend("topright", legend=c("batch 1", "batch 2"), pch=21, pt.bg=c("lightblue", "coral"), bty="n")
dev.off()
