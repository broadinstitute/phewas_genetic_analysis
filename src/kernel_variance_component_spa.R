args=(commandArgs(TRUE))
gdsfile=as.character(args[1])
groupfile=as.character(args[2])
phenfile=as.character(args[3])
ID_col=as.character(args[4])
nullfile=as.character(args[5])
outfile=as.character(args[6])
#scoretype=as.character(args[7])
#afcutoff=as.numeric(args[7])

cat('\nReading in packages for analysis...\n')
source("/UKBB_200KWES_CVD/GENESIS_adaptation_source.R")
source("/meta_transcript/src/ExtractKernalStatistics_SPA_transcript.R")

try(kernell_variance_component_aou(gdsfile=gdsfile,
groupfile=groupfile,
phenfile=phenfile,
ID_col=ID_col,
nullfile=nullfile,
outfile=outfile,
test="ExtractKernelStatistics",
vc.test="Score.SPA",
AF.max=0.001,
MAC.max=Inf,
use.weights=FALSE),silent=F)

sessionInfo()
quit("no")
