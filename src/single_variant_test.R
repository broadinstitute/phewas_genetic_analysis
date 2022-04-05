library(data.table)
library(dplyr)
library(GENESIS)
library(GWASTools)
library(SeqArray)
library(SeqVarTools)
library(SPAtest)

args=(commandArgs(TRUE))
trait=as.character(args[1])
gdsfile=as.character(args[2])
phenfile=as.character(args[3])
ID_col=as.character(args[4])
maf_cutoff=as.numeric(args[5])
stat=as.character(args[6])
nullfile=as.character(args[7])
outfile=as.character(args[8])

aou_sinlgevaraint<-function(gdsfile,phenofile,ID_col,maf_cutoff=0.01,stat="Score.SPA",nullmodel,outfile){

pheno <- fread(phenofile,header=T,data.table=F,sep="\t")
pheno$sample.id<-pheno[,id_col]
ids <- pheno$sample.id

gds <- seqOpen(gdsfile, allow.duplicate=T)
samples <- seqGetData(gds, 'sample.id')
missamples <- samples[!samples %in% ids]
misphen <- data.frame(matrix(NA, nrow=length(missamples), ncol=ncol(pheno)))
colnames(misphen) <- names(pheno)
misphen$sample.id <- missamples
combphen <- rbind(pheno, misphen)
combphen <- combphen[match(samples, combphen$sample.id),]
seqData <- SeqVarData(gds, sampleData=AnnotatedDataFrame(combphen))

seqSetFilter(seqData, sample.id=ids)
afreq <- SeqVarTools::alleleFrequency(seqData, use.names=T)
comvar <- names(which(afreq > maf_cutoff & afreq < (1-maf_cutoff)))
seqSetFilter(seqData, variant.id=comvar)

iterator <- SeqVarBlockIterator(seqData, variantBlock=100)
nullmod <- get(load(nullmodel))
assoc <- assocTestSingle(iterator, null.model = nullmod, test=stat,verbose=TRUE)

save(assoc,file=outfile)
}


aou_sinlgevaraint(gdsfile=gdsfile,
  phenofile=phenfile,
  ID_col=ID_col,
  maf_cutoff=maf_cutoff,
  stat=stat,
  nullmodel=nullfile,
  outfile=outfile)



sessionInfo()
quit("no")
