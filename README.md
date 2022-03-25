<<<<<<< HEAD
# phewas_genetic_analysis

## Running acnestry inference using gnomAD PC loadings in a terminal
pip install -U gnomad --user --force-reinstall
pip install -U scikit-learn==0.23.2 --user

rm -rf AoU_genetic_analysis

seuchoi
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

git clone https://github.com/broadinstitute/AoU_genetic_analysis.git
chmod 777 AoU_genetic_analysis/src/ancestry_inference.py

python3 AoU_genetic_analysis/src/ancestry_inference.py -help

python3 AoU_genetic_analysis/src/ancestry_inference.py --inputfile=gs://fc-secure-4adb21f6-46f4-4a79-99f9-afd63890c6d0/data/AoU_22K_WGS_all.mt \
--loadingfile=gs://gcp-public-data--gnomad/release/3.1/pca/gnomad.v3.1.pca_loadings.ht \
--RFmodelfile=gs://gcp-public-data--gnomad/release/3.1/pca/gnomad.v3.1.RF_fit.pkl \
--outputfile=gs://fc-secure-a7a6da68-f796-46ad-86bb-4b56f01bfeb2/data/gnomad_inferred_test.tsv.bgz
=======
# phewas_genetic_analysis
>>>>>>> c2a115c4b883b7ae5bfda274a5a2e21154dad3e6
