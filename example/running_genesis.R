### dsub script
from datetime import datetime
import os
import pandas as pd

pd.set_option('display.max_colwidth', 0)

USER_NAME = os.getenv('OWNER_EMAIL').split('@')[0].replace('.','-')

# Save this Python variable as an environment variable so that its easier to use within %%bash cells.
%env USER_NAME={USER_NAME}

PATH_BED_ALPHA3 = 'gs://fc-aou-datasets-controlled/v5/microarray/plink/arrays.bed'

folder_plink_alpha3 = os.path.dirname(PATH_BED_ALPHA3)

folder_plink_alpha3

!gsutil ls -lh {folder_plink_alpha3}**

input_files = !gsutil ls {folder_plink_alpha3}**/*.*

input_files

# Use hyphens, not whitespace since it will become part of the bucket path.
LINE_COUNT_JOB_NAME='line-count-aou_dsub'

# Save this Python variable as an environment variable so that its easier to use within %%bash cells.
%env JOB_NAME={LINE_COUNT_JOB_NAME}


line_count_results_folder = os.path.join(
    os.getenv('WORKSPACE_BUCKET'),
    'dsub',
    'results',
    LINE_COUNT_JOB_NAME,
    USER_NAME,
    datetime.now().strftime('%Y%m%d/%H%M%S'))

line_count_results_folder

df = pd.DataFrame(data={
    '--input INPUT_FILE': input_files,
    '--output OUTPUT_FILE': [os.path.join(line_count_results_folder,
                                          os.path.basename(f) + '.line_count')
                             for f in input_files]
})

df.head()

PARAMETER_FILENAME = 'count_lines_in_files_aou_dsub.tsv'

# Save this Python variable value an environment variable so that its easier to use within %%bash cells.
%env PARAMETER_FILENAME={PARAMETER_FILENAME}

df.to_csv(PARAMETER_FILENAME, sep='\t', index=False)

!cat {PARAMETER_FILENAME} | head



%%bash --out LINE_COUNT_JOB_ID

source ~/aou_dsub.bash # This file was created via notebook 01_dsub_setup.ipynb.

aou_dsub \
  --name "${JOB_NAME}" \
  --preemptible \
  --disk-size 256 \
  --tasks "${PARAMETER_FILENAME}" \
  --command 'set -o errexit && \
             set -o xtrace && \
             wc -l ${INPUT_FILE} > ${OUTPUT_FILE}'


%env JOB_ID={LINE_COUNT_JOB_ID}

%%bash

dstat \
    --provider google-cls-v2 \
    --project "${GOOGLE_PROJECT}" \
    --location us-central1 \
    --jobs "${JOB_ID}" \
    --users "${USER_NAME}" \
    --status '*'
#
%%bash

dstat \
    --provider google-cls-v2 \
    --project "${GOOGLE_PROJECT}" \
    --location us-central1 \
    --jobs "${JOB_ID}" \
    --users "${USER_NAME}" \
    --status '*' \
    --full


####
####
dsub \
   --project $PROJECT \
   --provider "google-cls-v2" \
   --use-private-address \
   --regions us-central1 us-east1 us-west1 \
   --disk-type pd-ssd \
   --disk-size 1000 \
   --machine-type "n2-custom-80-40960" \
   --image "gcr.io/broad-ml4cvd/vep:105" \
   --skip \
   --wait \
   --logging "gs://ml4cvd/schoi/annotation/MGB_53K/log/" \
   --output OUTFILE="gs://ml4cvd/schoi/annotation/MGB_53K/logtest.txt*" \
   --command 'pwd;./vep --help;echo "Hello World" > ${OUTFILE}'





   local DSUB_USER_NAME="$(echo "${OWNER_EMAIL}" | cut -d@ -f1)"

   # For AoU RWB projects network name is "network".
   local AOU_NETWORK=network
   local AOU_SUBNETWORK=subnetwork

   dsub \
       --provider google-cls-v2 \
       --project "${GOOGLE_PROJECT}" \
       --network "${AOU_NETWORK}" \
       --subnetwork "${AOU_SUBNETWORK}" \
       --service-account "$(gcloud config get-value account)" \
       --user "${DSUB_USER_NAME}" \
       --regions us-central1 \
       --logging "${WORKSPACE_BUCKET}/dsub/logs/{job-name}/{user-id}/$(date +'%Y%m%d/%H%M%S')/{job-id}-{task-id}-{task-attempt}.log" \
       --image 'marketplace.gcr.io/google/ubuntu1804:latest' \
       "$@"
