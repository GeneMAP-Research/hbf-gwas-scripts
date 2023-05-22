#!/usr/bin/env Rscript

tz.b <- read.table("../tanzania/pca/pca_before_pruning.cov", h=T)
cm.b <- read.table("pca.cm.before.outlier.pruning.txt", h=T)
tz.a <- read.table("tz_after_pruning.pca.txt", h=T)
cm.a <- read.table("cm_after_pruning.pca.txt", h=T)

svg(file="tz_before_pruning.svg", pointsize=16)
#par(mfrow=c(1,4))
par(mar=c(4,4,1,1))
plot(tz.b$PC1, tz.b$PC2, pch=21, bg="lightblue", xlab="PC1", ylab="PC2", cex.axis=0.7, cex.lab=0.8)
dev.off()

svg(file="tz_after_pruning.svg", pointsize=16)
#par(mfrow=c(1,4))
par(mar=c(4,4,1,1))
plot(tz.a$PC1, tz.a$PC2, pch=21, bg="lightblue", xlab="PC1", ylab="PC2", cex.axis=0.7, cex.lab=0.8)
dev.off()

svg(file="cm_before_pruning.svg", pointsize=16)
#par(mfrow=c(1,4))
par(mar=c(4,4,1,1))
plot(cm.b$PC1, cm.b$PC2, pch=21, bg="lightblue", xlab="PC1", ylab="PC2", cex.axis=0.7, cex.lab=0.8)
dev.off()

svg(file="cm_after_pruning.svg", pointsize=16)
#par(mfrow=c(1,4))
par(mar=c(4,4,1,1))
plot(cm.a$PC1, cm.a$PC2, pch=21, bg="lightblue", xlab="PC1", ylab="PC2", cex.axis=0.7, cex.lab=0.8)
dev.off()
