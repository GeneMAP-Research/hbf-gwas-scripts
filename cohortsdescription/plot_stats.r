#!/usr/bin/env Rscript

library(tidyverse)

cm <- read_table("../clinicaldata/cm_clinical_data.tsv")
tz <- read_table("../clinicaldata/tz_clinical_data.tsv")

# Summary of Cameroon data

cm %>% names()

variables <- c(
  "AGE",                   # Age in years
  "HbS",                   # Proportion of HbS
  "HbF",                   # Proportion of fetal haemoglobin
  "HbA2_percentage",       # Proportion of HbA2
  "Consultation.year",     # Number of consultations per year
  "MCHC",                  # Mean corpuscular haemoglobin concentration
  "Mono",                  # Monocyte count (x10^9/l)
  "Hosp",                  # Number of hospitalizations per year
  "RBC",                   # Red blood cell count (x10^12/l)
  "WBC",                   # White blood cell count (x10^9/l)
  "Platelets",             # Platelet count (x10^9/l)
  "VOC.year",              # Number of vaso occlusive crises per year
  "MCV.fl.",               # Mean cell volume
  "Lymp"                   # Lymphocyte count (x10^9/l)
)

cm %>% 
  select(variables) %>% 
  summary()

# 
cm %>% 
  select(SEX) %>% 
  table() %>% 
  as.data.frame() %>% 
  na.omit() %>%
  mutate(Prop = (Freq/sum(Freq))*100) -> sex       # Sex

colnames(sex) <- c(
  "cat", 
  "freq", 
  "prop"
)

svg(
  "cm_sex_hist.svg", 
  width = 19,
  height = 16,
  pointsize = 26
)

par(
  mar = c(4,4,3,4)
)

plot.new()

grid( lwd = 0.8 )

par(
  new = TRUE
)

barplot(
  sex$prop, 
  ylim = c(0, 60), 
  col = c(2,4)
)

text(
  x = c(0.7,1.9), 
  y = 30, 
  labels = c("Female", "Male"),
  cex = 1.2
)

mtext(
  text = "Proportion (%)",
  side = 2,
  line = 3
)

mtext(
  text = "Sex",
  side = 1,
  line = 1
)

dev.off()

# Number of patients with at least one overt stroke
cm %>%
  select(Stroke) %>%
  table()

## .
##   No  Yes
## 1195   46

# 3.7 kb HbA1/HbA2 alpha thalassaemia deletion
cm %>%
  select(athal) %>%
  table()

## .
## α3.7/α3.7   αα/α3.7     αα/αα
##        18       101       286

# HBB gene cluster haplotypes
cm %>%
  select(Haplotypes) %>%
  table()

# Summary of Tanzania data

tz %>% names()

variables <- c(
  "AGE",
  "HbF"
)

tz %>%
  select(variables) %>%
  summary()

tz %>%
  mutate(sex.updated = ifelse(SEX == 1, "M", ifelse(SEX == 2, "F", NA))) %>%
  select(sex.updated) %>%
  table() %>%
  as.data.frame() %>%
  na.omit() %>%
  mutate(Prop = (Freq/sum(Freq))*100) -> sex           # Sex

sex

##   . Freq   Prop
## 1 F  539 52.895
## 2 M  480 47.105

colnames(sex) <- c(
  "cat",
  "freq",
  "prop"
)

svg(
  "tz_sex_hist.svg",
  width = 19,
  height = 16,
  pointsize = 26
)

par(
  mar = c(4,4,3,4)
)

plot.new()

grid( lwd = 0.8 )

barplot(
  sex$prop,
  ylim = c(0, 60),
  col = c(2,4)
)

text(
  x = c(0.7,1.9),
  y = 30,
  labels = c("Female", "Male")
)

mtext(
  text = "Proportion (%)",
  side = 2,
  line = 3
)

mtext(
  text = "Sex",
  side = 1,
  line = 1
)

dev.off()

# HbF normalization

## Cameroon

cm %>%
  mutate(normalizedHbF = HbF^(1/3)) -> cm.hbf.norm

# write.table(
#   cm.hbf.norm,
#   "../clinicaldata/cm_clinical_data_updated.tsv",
#   col.names = T,
#   row.names = F,
#   quote = F,
#   sep = "\t"
# )

cm.hbf.norm %>%
  select(HbF, normalizedHbF) %>%
  head()

tz %>%
  mutate(normalizedHbF = HbF^(1/3)) -> tz.hbf.norm

# write.table(
#   tz.hbf.norm,
#   "../clinicaldata/tz_clinical_data_updated.tsv",
#   col.names = T,
#   row.names = F,
#   quote = F,
#   sep = "\t"
# )

tz.hbf.norm %>% 
   select(HbF, normalizedHbF) %>% 
   head()

# HbF distribution before and after normalization

cm.hbf.den <- density(
  cm.hbf.norm$HbF
)

cm.nhbf.den <- density(
  cm.hbf.norm$normalizedHbF
)

tz.hbf.den <- density(
  tz.hbf.norm$HbF
)

tz.nhbf.den <- density(
  tz.hbf.norm$normalizedHbF
)

svg(
  "cm_tz_hbf_normaliztion.svg",
  width = 25,
  height = 19,
  pointsize = 30
)

layout(
  matrix(
    data = c(1:4),
    nrow = 2,
    ncol = 2,
    byrow = TRUE	# fill rows first
  )
)

par(
  mar = c(4,4,3,2)
)

plot(
  cm.hbf.den,
  main = "Cameroon HbF"
)

polygon(
  cm.hbf.den,
  col = 2
)

par(
  mar = c(4,3,3,2)
)

plot(
  cm.nhbf.den,
  ylab = "",
  main = "Cameroon normalized HbF"
)

polygon(
  cm.nhbf.den,
  col=5
)

par(
  mar = c(4,4,3,2)
)

plot(
  tz.hbf.den,
  main = "Tanzania HbF"
)

polygon(
  tz.hbf.den,
  col = 2
)

par(
  mar = c(4,3,3,2)
)

plot(
  tz.nhbf.den,
  ylab = "",
  main = "Tanzania normalized HbF"
)

polygon(
  tz.nhbf.den,
  col = 5
)

dev.off()
