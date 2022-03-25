#!/bin/bash
set -o errexit

# Author: Seung Hoan Choi <schoi@broadinstitute.org>
# March 2022


sudo git clone https://github.com/broadinstitute/phewas_genetic_analysis.git

R CMD BATCH "--args ${trait} ${gdsfile} ${groupfile} ${phenfile} ${ID_col} ${nullfile} ${outfile}" phewas_genetic_analysis/aggregated_burden_test.R ${logfile}
