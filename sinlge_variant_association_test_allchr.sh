#!/bin/bash
set -o errexit

# Author: Seung Hoan Choi <schoi@broadinstitute.org>
# March 2022


#sudo git clone https://github.com/broadinstitute/phewas_genetic_analysis.git

R CMD BATCH "--args ${trait} ${chr1_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr1_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr1_logfile}
R CMD BATCH "--args ${trait} ${chr2_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr2_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr2_logfile}
R CMD BATCH "--args ${trait} ${chr3_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr3_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr3_logfile}
R CMD BATCH "--args ${trait} ${chr4_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr4_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr4_logfile}
R CMD BATCH "--args ${trait} ${chr5_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr5_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr5_logfile}
R CMD BATCH "--args ${trait} ${chr6_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr6_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr6_logfile}
R CMD BATCH "--args ${trait} ${chr7_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr7_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr7_logfile}
R CMD BATCH "--args ${trait} ${chr8_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr8_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr8_logfile}
R CMD BATCH "--args ${trait} ${chr9_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr9_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr9_logfile}
R CMD BATCH "--args ${trait} ${chr10_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr10_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr10_logfile}
R CMD BATCH "--args ${trait} ${chr11_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr11_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr11_logfile}
R CMD BATCH "--args ${trait} ${chr12_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr12_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr12_logfile}
R CMD BATCH "--args ${trait} ${chr13_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr13_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr13_logfile}
R CMD BATCH "--args ${trait} ${chr14_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr14_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr14_logfile}
R CMD BATCH "--args ${trait} ${chr15_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr15_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr15_logfile}
R CMD BATCH "--args ${trait} ${chr16_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr16_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr16_logfile}
R CMD BATCH "--args ${trait} ${chr17_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr17_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr17_logfile}
R CMD BATCH "--args ${trait} ${chr18_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr18_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr18_logfile}
R CMD BATCH "--args ${trait} ${chr19_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr19_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr19_logfile}
R CMD BATCH "--args ${trait} ${chr20_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr20_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr20_logfile}
R CMD BATCH "--args ${trait} ${chr21_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr21_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr21_logfile}
R CMD BATCH "--args ${trait} ${chr22_gdsfile} ${phenfile} ${ID_col} ${maf_cutoff} ${stat} ${nullfile} ${chr22_outfile}" /phewas_genetic_analysis/src/single_variant_test.R ${chr22_logfile}
