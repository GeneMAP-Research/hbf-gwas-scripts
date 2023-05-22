#!/usr/bin/env Rscript

oldcov <- read.table("cmtz_hbf_old.cov", h=T)
newcov <- read.table("cmtz_hbf_pca.eigenvec", h=T)
cov <- merge(newcov, oldcov[,-c(2)], by="FID", sort=F)
write.table(cov, "cmtz_hbf_100pcs.cov", col.names=T, row.names=F, quote=F, sep=" ")
cov$AGESq <- as.numeric((cov$AGE)^2)
write.table(cov, "cmtz_hbf_100pcs_with_agesq.cov", col.names=T, row.names=F, quote=F, sep=" ")
