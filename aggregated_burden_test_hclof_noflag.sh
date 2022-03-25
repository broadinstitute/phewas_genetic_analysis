#!/bin/bash
set -o errexit

# Author: Seung Hoan Choi <schoi@broadinstitute.org>
# March 2022


git clone https://github.com/broadinstitute/AoU_genetic_analysis.git

R CMD BATCH "--args ${outfile}" /medpop/afib/schoi/projects/TIMI/Annotation/script/vep/wes_vcf_annotation_parse_HC_missense.R /medpop/afib/schoi/projects/TIMI/Annotation/script/vep/out/${filename}_chr${num}.out











chmod +x ${REGENIE_BIN}

BED_PATH=$(dirname "${bed}")
BED_NAME_ROOT=$(basename "${bed}" .bed)
WHICH_BED="${BED_PATH}/${BED_NAME_ROOT}"

echo "Operating on ${WHICH_BED}"

OUTPUT_DIR="$(dirname "${output_path}")"
STAGE1_DIR="$(dirname "${STAGE1_OUTPUT_FILES}")"

echo "Raw variable for STAGE1_OUTPUT_FILES='${STAGE1_OUTPUT_FILES}'"
echo "Directory name for input files STAGE1_DIR='${STAGE1_DIR}'"

# Need to correct the path assigned to the stage1 files. So we replace
# /mnt/data/output with /mnt/data/input:
cat "${STAGE1_DIR}/stage1_out_pred.list" | \
    sed 's|/mnt/data/output|/mnt/data/input|g' > corrected.stage1_out_pred.list

echo "corrected.stage1_out_pred.list is:"
cat corrected.stage1_out_pred.list

COVAR_COLUMNS="enroll_age,enroll_age2,PC1,PC2,PC3,PC4,PC5,PC6,PC7,PC8,PC9,PC10,PC11,PC12,PC13,PC14,PC15,PC16,PC17,PC18,PC19,PC20"
MERGED_COVAR_COL_LIST="${COVAR_COLUMNS},${prs_column}"

# For bsize choice, please see https://rgcgithub.github.io/regenie/faq/ for
# rationale.
${REGENIE_BIN} \
    --step 2 \
    --aaf-bins 0.0001,0.01 \
    --anno-file ${annotations} \
    --set-list ${setlist} \
    --mask-def ${MASKS} \
    --bed ${WHICH_BED} \
    --lowmem \
    --covarFile ${PHENO_FILENAME} \
    --covarColList ${MERGED_COVAR_COL_LIST} \
    --catCovarList sex,genotyping_array \
    --phenoFile ${PHENO_FILENAME} \
    --phenoCol ${pheno_column} \
    --threads 3 \
    --bsize 4000 \
    --print-pheno \
    --pred corrected.stage1_out_pred.list \
    --out result

mv result_${pheno_column}.regenie ${output_file}
