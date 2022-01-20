import pickle
import hail as hl
from gnomad.sample_qc.ancestry import assign_population_pcs
hl.init()

# Load MatrixTable for projection and gnomAD loadings Hail Table
mt_to_project = hl.read_matrix_table("gs://fc-secure-4adb21f6-46f4-4a79-99f9-afd63890c6d0/data/AoU_22K_WGS_all.mt")
loadings_ht = hl.read_table("gs://gcp-public-data--gnomad/release/3.1/pca/gnomad.v3.1.pca_loadings.ht")

# Project new genotypes onto loadings
ht = hl.experimental.pc_project(
    mt_to_project.GT,
    loadings_ht.loadings,
    loadings_ht.pca_af,
)

# Assign global ancestry using the gnomAD RF model and PC project scores
# Loading of the v2 RF model requires an older version of scikit-learn, this can be installed using pip install -U scikit-learn==0.21.3
with hl.hadoop_open("gs://gcp-public-data--gnomad/release/3.1/pca/gnomad.v3.1.RF_fit.pkl", "rb") as f:
    fit = pickle.load(f)

# Reduce the scores to only those used in the RF model, this was 6 for v2 and 16 for v3.1
num_pcs = fit.n_features_
ht = ht.annotate(scores=ht.scores[:num_pcs])
ht, rf_model = assign_population_pcs(
    ht,
    pc_cols=ht.scores,
    fit=fit,
)
ht.show(5)
ht.export("gs://fc-secure-a7a6da68-f796-46ad-86bb-4b56f01bfeb2/data/gnomad_inferred.tsv.bgz", delimiter='\t')
