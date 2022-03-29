#!/bin/bash
set -o errexit

# Author: Seung Hoan Choi <schoi@broadinstitute.org>
# March 2022


#sudo git clone https://github.com/broadinstitute/phewas_genetic_analysis.git

R CMD BATCH "--args ${trait} ${chr1_gdsfile} ${chr1_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr1_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr1_logfile}
R CMD BATCH "--args ${trait} ${chr2_gdsfile} ${chr2_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr2_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr2_logfile}
R CMD BATCH "--args ${trait} ${chr3_gdsfile} ${chr3_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr3_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr3_logfile}
R CMD BATCH "--args ${trait} ${chr4_gdsfile} ${chr4_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr4_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr4_logfile}
R CMD BATCH "--args ${trait} ${chr5_gdsfile} ${chr5_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr5_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr5_logfile}
R CMD BATCH "--args ${trait} ${chr6_gdsfile} ${chr6_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr6_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr6_logfile}
R CMD BATCH "--args ${trait} ${chr7_gdsfile} ${chr7_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr7_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr7_logfile}
R CMD BATCH "--args ${trait} ${chr8_gdsfile} ${chr8_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr8_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr8_logfile}
R CMD BATCH "--args ${trait} ${chr9_gdsfile} ${chr9_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr9_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr9_logfile}
R CMD BATCH "--args ${trait} ${chr10_gdsfile} ${chr10_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr10_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr10_logfile}
R CMD BATCH "--args ${trait} ${chr11_gdsfile} ${chr11_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr11_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr11_logfile}
R CMD BATCH "--args ${trait} ${chr12_gdsfile} ${chr12_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr12_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr12_logfile}
R CMD BATCH "--args ${trait} ${chr13_gdsfile} ${chr13_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr13_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr13_logfile}
R CMD BATCH "--args ${trait} ${chr14_gdsfile} ${chr14_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr14_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr14_logfile}
R CMD BATCH "--args ${trait} ${chr15_gdsfile} ${chr15_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr15_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr15_logfile}
R CMD BATCH "--args ${trait} ${chr16_gdsfile} ${chr16_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr16_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr16_logfile}
R CMD BATCH "--args ${trait} ${chr17_gdsfile} ${chr17_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr17_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr17_logfile}
R CMD BATCH "--args ${trait} ${chr18_gdsfile} ${chr18_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr18_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr18_logfile}
R CMD BATCH "--args ${trait} ${chr19_gdsfile} ${chr19_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr19_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr19_logfile}
R CMD BATCH "--args ${trait} ${chr20_gdsfile} ${chr20_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr20_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr20_logfile}
R CMD BATCH "--args ${trait} ${chr21_gdsfile} ${chr21_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr21_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr21_logfile}
R CMD BATCH "--args ${trait} ${chr22_gdsfile} ${chr22_groupfile} ${phenfile} ${ID_col} ${nullfile} ${chr22_outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${chr22_logfile}
