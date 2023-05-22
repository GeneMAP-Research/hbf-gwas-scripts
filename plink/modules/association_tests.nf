process plinkAdditiveAssociation() {
    tag "processing ${bedPrefix}"
    label 'plink_assoc'
    label 'plink2'
    cache 'lenient'
    input:
          tuple \
              val(bedPrefix), \
              path(plinkBinaryFileSet)
    output:
          publishDir path: "${params.outputDir}", mode: 'copy'
          path "${params.outputPrefix}.add.PHENO1.glm.linear.txt.gz"
          path "${params.outputPrefix}.add.PHENO1.glm.linear.adjusted.gz"
          path "${params.outputPrefix}.add.log"
    script:
        template 'additive.sh'
}

process plinkDominantAssociation() {
    tag "processing ${bedPrefix}"
    label 'plink_assoc'
    label 'plink2'
    cache 'lenient'
    input:
          tuple \
              val(bedPrefix), \
              path(plinkBinaryFileSet)
    output:
          publishDir path: "${params.outputDir}", mode: 'copy'
          path "${params.outputPrefix}.dom.PHENO1.glm.linear.txt.gz"
          path "${params.outputPrefix}.dom.PHENO1.glm.linear.adjusted.gz"
          path "${params.outputPrefix}.dom.log"
    script:
        template 'dominant.sh'
}

process plinkRecessiveAssociation() {
    tag "processing ${bedPrefix}"
    label 'plink_assoc'
    label 'plink2'
    cache 'lenient'
    input:
          tuple \
              val(bedPrefix), \
              path(plinkBinaryFileSet)
    output:
          publishDir path: "${params.outputDir}", mode: 'copy'
          path "${params.outputPrefix}.rec.PHENO1.glm.linear.txt.gz"
          path "${params.outputPrefix}.rec.PHENO1.glm.linear.adjusted.gz"
          path "${params.outputPrefix}.rec.log"
    script:
        template 'recessive.sh'
}

process plinkGenotypicAssociation() {
    tag "processing ${bedPrefix}"
    label 'plink_assoc'
    label 'plink2'
    cache 'lenient'
    input:
          tuple \
              val(bedPrefix), \
              path(plinkBinaryFileSet)
    output:
          publishDir path: "${params.outputDir}", mode: 'copy'
          path "${params.outputPrefix}.geno.PHENO1.glm.linear.txt.gz"
          path "${params.outputPrefix}.geno.PHENO1.glm.linear.adjusted.gz"
          path "${params.outputPrefix}.geno.log"
    script:
        template 'genotypic.sh'
}

process plinkHethomAssociation() {
    tag "processing ${bedPrefix}"
    label 'plink_assoc'
    label 'plink2'
    cache 'lenient'
    input:
          tuple \
              val(bedPrefix), \
              path(plinkBinaryFileSet)
    output:
          publishDir path: "${params.outputDir}", mode: 'copy'
          path "${params.outputPrefix}.hethom.PHENO1.glm.linear.txt.gz"
          path "${params.outputPrefix}.hethom.PHENO1.glm.linear.adjusted.gz"
          path "${params.outputPrefix}.hethom.log"
    script:
        template 'hethom.sh'
}

process sortPlinkAssociationResults() {
    tag "processing ${assoc_result}"
    input:
        path assoc_result
    output:
        publishDir path: "${params.outputDir}", mode: 'copy'
        path "${assoc_result}.txt.gz"
    script:
        template 'sort_association_results.sh'
}
