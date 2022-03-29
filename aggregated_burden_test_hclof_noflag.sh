#!/bin/bash
set -o errexit

# Author: Seung Hoan Choi <schoi@broadinstitute.org>
# March 2022


# sudo git clone https://github.com/broadinstitute/phewas_genetic_analysis.git

cd /
pwd > ${logfile}
ls > ${outfile}
ls /phewas_genetic_analysis/src/aggregated_burden_test.R >> ${logfile}
echo ${trait} >> ${logfile}
#ls ${trait} >> ${logfile}
echo ${gdsfile} >> ${logfile}
ls  ${gdsfile} >> ${logfile}
echo ${groupfile} >> ${logfile}
ls  ${groupfile} >> ${logfile}
echo ${phenfile} >> ${logfile}
ls  ${phenfile} >> ${logfile}
echo ${ID_col} >> ${logfile}
#ls  ${ID_col} >> ${logfile}
echo ${nullfile} >> ${logfile}
ls  ${nullfile} >> ${logfile}
echo ${outfile} >> ${logfile}
ls  ${outfile} >> ${logfile}

R CMD BATCH "--args ${trait} ${gdsfile} ${groupfile} ${phenfile} ${ID_col} ${nullfile} ${outfile}" /phewas_genetic_analysis/src/aggregated_burden_test.R ${logfile}

# +
#mv tmp/text.out ${logfile}
#mv tmp/text2.out ${outfile}
