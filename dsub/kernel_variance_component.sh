#!/bin/bash
set -o errexit

# Author: Seung Hoan Choi <seuchoi@bu.edu>
# July 2023

## re-install github repository
rm -rf phewas_genetic_analysis
git clone https://github.com/broadinstitute/phewas_genetic_analysis.git
rm -rf TOPMed_AFib_pipeline
git clone https://github.com/broadinstitute/TOPMed_AFib_pipeline.git
rm -rf UKBB_200KWES_CVD
git clone --branch v1.2 https://github.com/seanjosephjurgens/UKBB_200KWES_CVD.git

## download pre-installed R-pcakges
wget https://bit.ly/3rmveIc -O rpackages4_1_3_aou.tar.gz
tar -xvf rpackages4_1_3_aou.tar.gz

## if the phenotypefile is compressed then decompressed the file
if (file ${phenfile} | grep -q compressed ) ; then
     echo "phenotypefile is compressed"
     gunzip -c ${phenfile} > phenotypefile.tsv
     phenfile=phenotypefile.tsv
fi

#### preparing multithread approach

aargs="${chr1_gdsfile}\n${chr1_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr1_outfile}\n${chr1_logfile}\n
${chr2_gdsfile}\n${chr2_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr2_outfile}\n${chr2_logfile}\n
${chr3_gdsfile}\n${chr3_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr3_outfile}\n${chr3_logfile}\n
${chr4_gdsfile}\n${chr4_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr4_outfile}\n${chr4_logfile}\n
${chr5_gdsfile}\n${chr5_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr5_outfile}\n${chr5_logfile}\n
${chr6_gdsfile}\n${chr6_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr6_outfile}\n${chr6_logfile}\n
${chr7_gdsfile}\n${chr7_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr7_outfile}\n${chr7_logfile}\n
${chr8_gdsfile}\n${chr8_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr8_outfile}\n${chr8_logfile}\n
${chr9_gdsfile}\n${chr9_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr9_outfile}\n${chr9_logfile}\n
${chr10_gdsfile}\n${chr10_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr10_outfile}\n${chr10_logfile}\n
${chr11_gdsfile}\n${chr11_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr11_outfile}\n${chr11_logfile}\n
${chr12_gdsfile}\n${chr12_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr12_outfile}\n${chr12_logfile}\n
${chr13_gdsfile}\n${chr13_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr13_outfile}\n${chr13_logfile}\n
${chr14_gdsfile}\n${chr14_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr14_outfile}\n${chr14_logfile}\n
${chr15_gdsfile}\n${chr15_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr15_outfile}\n${chr15_logfile}\n
${chr16_gdsfile}\n${chr16_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr16_outfile}\n${chr16_logfile}\n
${chr17_gdsfile}\n${chr17_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr17_outfile}\n${chr17_logfile}\n
${chr18_gdsfile}\n${chr18_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr18_outfile}\n${chr18_logfile}\n
${chr19_gdsfile}\n${chr19_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr19_outfile}\n${chr19_logfile}\n
${chr20_gdsfile}\n${chr20_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr20_outfile}\n${chr20_logfile}\n
${chr21_gdsfile}\n${chr21_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr21_outfile}\n${chr21_logfile}\n
${chr22_gdsfile}\n${chr22_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr22_outfile}\n${chr22_logfile}"


## Run analysis
echo -e ${aargs} | xargs -n7 -P${nprarelle} sh -c 'R CMD BATCH \"--args $0 $1 $2 $3 $4 $5\" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R $6' sh