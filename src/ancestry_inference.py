#!/usr/bin/python

import sys, getopt

def main(argv):
   inputfile = ''
   loadingfile = ''
   RFmodelfile = ''
   outputfile = ''
   try:
      opts, args = getopt.getopt(argv,"hi:l:m:o:",["ifile=","lfile=","mfile=","ofile="])
   except getopt.GetoptError:
      print 'test.py -i <inputfile> -l <loadingfile> -m <RFmodelfile> -o <outputfile>'
      sys.exit(4)
   for opt, arg in opts:
      if opt == '-h':
         print 'ancestry_inference.py -i <inputfile> -l <loadingfile> -m <RFmodelfile> -o <outputfile>'
         sys.exit()
      elif opt in ("-i", "--ifile"):
         inputfile = arg
      elif opt in ("-l", "--lfile"):
         loadingfile = arg
      elif opt in ("-m", "--mfile"):
         RFmodelfile = arg
      elif opt in ("-o", "--ofile"):
         outputfile = arg
   print 'Input file is "', inputfile
   print 'Loadings file is "', outputfile
   print 'Random forest model file is "', inputfile
   print 'Output file is "', outputfile

if __name__ == "__main__":
   main(sys.argv[1:])

import pickle
import hail as hl
from gnomad.sample_qc.ancestry import assign_population_pcs
hl.init()

# Load MatrixTable for projection and gnomAD loadings Hail Table
mt_to_project = hl.read_matrix_table(inputfile)
loadings_ht = hl.read_table(loadingfile)

# Project new genotypes onto loadings
ht = hl.experimental.pc_project(
    mt_to_project.GT,
    loadings_ht.loadings,
    loadings_ht.pca_af,
)

# Assign global ancestry using the gnomAD RF model and PC project scores
# Loading of the v2 RF model requires an older version of scikit-learn, this can be installed using pip install -U scikit-learn==0.21.3
with hl.hadoop_open(RFmodelfile, "rb") as f:
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
ht.export(outputfile, delimiter='\t')
