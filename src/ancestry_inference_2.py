### source of the code
### https://gnomad.broadinstitute.org/news/2021-09-using-the-gnomad-ancestry-principal-components-analysis-loadings-and-random-forest-classifier-on-your-dataset/

import os
import sys, getopt
import pickle
import hail as hl
from gnomad.sample_qc.ancestry import assign_population_pcs

def parse_param():
    long_opts_list = ['inputfile=', 'loadingfile=', 'RFmodelfile=', 'outputfile=','help']

    param_dict = {'inputfile': None, 'loadingfile': None, 'RFmodelfile': None, 'outputfile': None}

    print('\n')

    if len(sys.argv) > 1:
        try:
            opts, args = getopt.getopt(sys.argv[1:], "h", long_opts_list)
        except:
            print('Option not recognized.')
            print('Use --help for usage information.\n')
            sys.exit(2)

        for opt, arg in opts:
            if opt == "-h" or opt == "--help":
                print(__doc__)
                sys.exit(0)
            elif opt == "--inputfile": param_dict['inputfile'] = arg
            elif opt == "--loadingfile": param_dict['loadingfile'] = arg
            elif opt == "--RFmodelfile": param_dict['RFmodelfile'] = arg
            elif opt == "--outputfile": param_dict['outputfile'] = arg
    else:
        print(__doc__)
        sys.exit(0)

    if param_dict['inputfile'] == None:
        print('* Please specify the hail matrix table file using --inputfile\n')
        sys.exit(2)
    elif param_dict['loadingfile'] == None:
        print('* Please specify the loading file using --loadingfile\n')
        sys.exit(2)
    elif param_dict['RFmodelfile'] == None:
        print('* Please specify the random forest model file using --RFmodelfile\n')
        sys.exit(2)
    elif param_dict['outputfile'] == None:
        print('* Please specify outputfile --outputfile\n')
        sys.exit(2)

    for key in param_dict:
        print('--%s=%s' % (key, param_dict[key]))

    print('\n')
    return param_dict



param_dict = parse_param()

# Assign global ancestry using the gnomAD RF model and PC project scores
# Loading of the v2 RF model requires an older version of scikit-learn, this can be installed using pip install -U scikit-learn==0.21.3
with hl.hadoop_open(param_dict['RFmodelfile'], "rb") as f:
        fit = pickle.load(f)

# Load MatrixTable for projection and gnomAD loadings Hail Table
mt_to_project = hl.read_matrix_table(param_dict['inputfile'])
loadings_ht = hl.read_table(param_dict['loadingfile'])

# Project new genotypes onto loadings
ht = hl.experimental.pc_project(
    mt_to_project.GT,
    loadings_ht.loadings,
    loadings_ht.pca_af,
)

# Reduce the scores to only those used in the RF model, this was 6 for v2 and 16 for v3.1
num_pcs = fit.n_features_
ht = ht.annotate(scores=ht.scores[:num_pcs])
ht, rf_model = assign_population_pcs(
    ht,
    pc_cols=ht.scores,
    fit=fit,
    )
ht.show(5)
ht.export(param_dict['outputfile'], delimiter='\t')
