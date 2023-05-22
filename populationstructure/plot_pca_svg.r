#!/usr/bin/env Rscript

tz.b <- read.table("../tanzania/pca/pca_before_pruning.cov", h=T)
cm.b <- read.table("pca.cm.before.outlier.pruning.txt", h=T)
tz.a <- read.table("tz_after_pruning.pca.txt", h=T)
cm.a <- read.table("cm_after_pruning.pca.txt", h=T)
afr <- read.table("cm_tz_afr_pca_with_pop.txt", h=T)
kgp <- read.table("cm_tz_kgp_pca_with_pop.txt", h=T)

margin.txt <- function() {
   mtext(text="PC1", side=1, line=2, cex=0.6)
   mtext(text="PC2", side=2, line=2, cex=0.6)
}

svg(file="cm_tz_afr_kgp.svg", pointsize=16, height=7, width=7.5)
par(mfrow=c(2,2), cex.axis=0.7)
par(mar=c(3,3,1,1))
plot(cm.a$PC1, cm.a$PC2, pch=21, bg="coral", xlab="", ylab="")
margin.txt()
legend("topright", legend=c("CAM"), cex = 0.8, bty="n")
par(mar=c(3,2,1,1))
plot(tz.a$PC1, tz.a$PC2, pch=21, bg="gold", xlab="", ylab="")
margin.txt()
legend("topright", legend=c("TZN"), cex = 0.8, bty="n")
par(mar=c(3,3,1,1))
plot(afr$PC1, afr$PC2, pch=21, bg="lightblue", xlab="", ylab="", type="n")

pop <- afr[afr$ETH == "GWD",]
points(pop$PC1, pop$PC2, pch=21, bg="deepskyblue3")
pop <- afr[afr$ETH == "MSL",]
points(pop$PC1, pop$PC2, pch=21, bg="darkorchid4")
pop <- afr[afr$ETH == "YRI",]
points(pop$PC1, pop$PC2, pch=21, bg="aquamarine2")
pop <- afr[afr$ETH == "ESN",]
points(pop$PC1, pop$PC2, pch=21, bg="chartreuse4")
pop <- afr[afr$ETH == "CAM",]
points(pop$PC1, pop$PC2, pch=21, bg="coral")
pop <- afr[afr$ETH == "TZN",]
points(pop$PC1, pop$PC2, pch=21, bg="gold")
pop <- afr[afr$ETH == "LWK",]
points(pop$PC1, pop$PC2, pch=21, bg="azure4")
margin.txt()
legend(
  "topright", 
  legend = c(
	   "GWD", 
	   "MSL", 
	   "YRI", 
	   "ESN", 
	   "CAM", 
	   "TZN", 
	   "LWK"
	   ), 
  pt.bg = c(
	"deepskyblue3",
	"darkorchid4",
	"aquamarine2",
	"chartreuse4",
	"coral",
	"gold",
	"azure4"
	),
  pch = 21,
  horiz = F, 
  ncol = 3, 
  bty = "n",
  cex = 0.7
)
par(mar=c(3,2,1,1))
plot(kgp$PC1, kgp$PC2, pch=21, bg="lightblue", xlab="", ylab="", type="n")
pop <- kgp[kgp$POP == "AFR" & (kgp$ETH != "CAM" & kgp$ETH != "TZN"),]
points(pop$PC1, pop$PC2, pch=21, bg="cadetblue2")
pop <- kgp[kgp$POP == "AMR",]
points(pop$PC1, pop$PC2, pch=21, bg="gainsboro")
pop <- kgp[kgp$POP == "EUR",]
points(pop$PC1, pop$PC2, pch=21, bg="dodgerblue1")
pop <- kgp[kgp$POP == "SAS",]
points(pop$PC1, pop$PC2, pch=21, bg="deeppink1")
pop <- kgp[kgp$POP == "EAS",]
points(pop$PC1, pop$PC2, pch=21, bg="darkseagreen")
pop <- kgp[kgp$ETH == "TZN",]
points(pop$PC1, pop$PC2, pch=21, bg="gold")
pop <- kgp[kgp$ETH == "CAM",]
points(pop$PC1, pop$PC2, pch=21, bg="coral")
margin.txt()
legend(
  "bottomright",
  legend = c(
           "CAM",
           "TZN",
           "AFR",
           "AMR",
           "EUR",
           "SAS",
           "EAS"
           ),
  pt.bg = c(
        "coral",
        "gold",
        "cadetblue2",
        "gainsboro",
        "dodgerblue1",
        "deeppink1",
        "darkseagreen"
        ),
  pch = 21,
  horiz = F,
  ncol = 3,
  bty = "n",
  cex = 0.7
)
dev.off()

