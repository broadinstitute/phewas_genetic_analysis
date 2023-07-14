#!/bin/bash
set -o errexit
set -o xtrace

# Author: Seung Hoan Choi <seuchoi@bu.edu>
# July 2023

# if the phenotypefile is compressed then decompressed the file
if (file ${phenfile} | grep -q compressed ) ; then
echo "phenotypefile is compressed"
gunzip -c ${phenfile} > phenotypefile.tsv
phenfile=phenotypefile.tsv
fi

aargs="${chr1_gdsfile}\n${chr1_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr1_outfile}}\n${chr1_logfile}\n
${chr2_gdsfile}\n${chr2_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr2_outfile}}\n${chr2_logfile}\n
${chr3_gdsfile}\n${chr3_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr3_outfile}}\n${chr3_logfile}\n
${chr4_gdsfile}\n${chr4_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr4_outfile}}\n${chr4_logfile}\n
${chr5_gdsfile}\n${chr5_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr5_outfile}}\n${chr5_logfile}\n
${chr6_gdsfile}\n${chr6_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr6_outfile}}\n${chr6_logfile}\n
${chr7_gdsfile}\n${chr7_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr7_outfile}}\n${chr7_logfile}\n
${chr8_gdsfile}\n${chr8_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr8_outfile}}\n${chr8_logfile}\n
${chr9_gdsfile}\n${chr9_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr9_outfile}}\n${chr9_logfile}\n
${chr10_gdsfile}\n${chr10_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr10_outfile}}\n${chr10_logfile}\n
${chr11_gdsfile}\n${chr11_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr11_outfile}}\n${chr11_logfile}\n
${chr12_gdsfile}\n${chr12_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr12_outfile}}\n${chr12_logfile}\n
${chr13_gdsfile}\n${chr13_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr13_outfile}}\n${chr13_logfile}\n
${chr14_gdsfile}\n${chr14_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr14_outfile}}\n${chr14_logfile}\n
${chr15_gdsfile}\n${chr15_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr15_outfile}}\n${chr15_logfile}\n
${chr16_gdsfile}\n${chr16_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr16_outfile}}\n${chr16_logfile}\n
${chr17_gdsfile}\n${chr17_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr17_outfile}}\n${chr17_logfile}\n
${chr18_gdsfile}\n${chr18_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr18_outfile}}\n${chr18_logfile}\n
${chr19_gdsfile}\n${chr19_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr19_outfile}}\n${chr19_logfile}\n
${chr20_gdsfile}\n${chr20_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr20_outfile}}\n${chr20_logfile}\n
${chr21_gdsfile}\n${chr21_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr21_outfile}}\n${chr21_logfile}\n
${chr22_gdsfile}\n${chr22_groupfile}\n${phenfile}\n${ID_col}\n${nullfile}\n${chr22_outfile}}\n${chr22_logfile}"
echo -e ${aargs}

# Run analysis
echo -e ${aargs} | xargs -n9 -P2 sh -c 'R CMD BATCH \"--args $0 $1 $2 $3 $4 $5\" /phewas_genetic_analysis/src/kernel_variance_component.R $6' sh








#R CMD BATCH "--args ${chr22_gdsfile} ${chr22_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr22_outfile}" /phewas_genetic_analysis/src/kernel_variance_component.R ${chr22_logfile}

# run the analysis
#R CMD BATCH "--args ${trait} ${chr1_gdsfile} ${chr1_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr1_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test_cont.R ${chr1_logfile}
#R CMD BATCH "--args ${chr22_gdsfile} ${chr22_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr22_outfile} ${test_type} ${af_cutoff} " /TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_test.R ${chr22_logfile}
#R CMD BATCH "--args ${chr2_gdsfile} ${chr2_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr2_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr2_logfile}
#R CMD BATCH "--args ${chr3_gdsfile} ${chr3_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr3_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr3_logfile} &
#R CMD BATCH "--args ${chr4_gdsfile} ${chr4_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr4_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr4_logfile}
#R CMD BATCH "--args ${chr5_gdsfile} ${chr5_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr5_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr5_logfile} &
#R CMD BATCH "--args ${chr6_gdsfile} ${chr6_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr6_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr6_logfile}
#R CMD BATCH "--args ${chr7_gdsfile} ${chr7_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr7_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr7_logfile} &
#R CMD BATCH "--args ${chr9_gdsfile} ${chr8_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr8_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr8_logfile}
#R CMD BATCH "--args ${chr9_gdsfile} ${chr9_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr9_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr9_logfile} &
#R CMD BATCH "--args ${chr10_gdsfile} ${chr10_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr10_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr10_logfile}
#R CMD BATCH "--args ${chr11_gdsfile} ${chr11_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr11_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr11_logfile} &
#R CMD BATCH "--args ${chr12_gdsfile} ${chr12_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr12_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr12_logfile}
#R CMD BATCH "--args ${chr13_gdsfile} ${chr13_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr13_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr13_logfile} &
#R CMD BATCH "--args ${chr14_gdsfile} ${chr14_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr14_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr14_logfile}
#R CMD BATCH "--args ${chr15_gdsfile} ${chr15_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr15_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr15_logfile} &
#R CMD BATCH "--args ${chr16_gdsfile} ${chr16_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr16_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr16_logfile}
#R CMD BATCH "--args ${chr17_gdsfile} ${chr17_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr17_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr17_logfile} &
#R CMD BATCH "--args ${chr18_gdsfile} ${chr18_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr18_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr18_logfile}
#R CMD BATCH "--args ${chr19_gdsfile} ${chr19_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr19_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr19_logfile} &
#R CMD BATCH "--args ${chr20_gdsfile} ${chr20_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr20_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr20_logfile}
#R CMD BATCH "--args ${chr21_gdsfile} ${chr21_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr21_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr21_logfile} &
#R CMD BATCH "--args ${chr22_gdsfile} ${chr22_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr22_outfile} ${test_type} ${af_cutoff}" TOPMed_AFib_pipeline/DNANexus/kernell_variance_component_v3.R ${chr22_logfile}
