library(data.table)
library(dplyr)
library(GENESIS)
library(GWASTools)
library(SeqArray)
library(SeqVarTools)
library(SPAtest)
source("/UKBB_200KWES_CVD/GENESIS_adaptation_source.R")


args=(commandArgs(TRUE))
trait=as.character(args[1])
gdsfile=as.character(args[2])
groupfile=as.character(args[3])
phenfile=as.character(args[4])
ID_col=as.character(args[5])
nullfile=as.character(args[6])
outfile=as.character(args[7])

perform_burden_collapse(gdsfile=gdsfile,
                        groupfile=groupfile,
                        phenfile=phenfile,
                        ID_col=ID_col,
                        nullfile=nullfile,
                        outfile=outfile,
                        burden.test=c('Score.SPA'),
                        collapse=TRUE,
                        AF.max=0.001,
                        MAC.max=4,
                        use.weights=FALSE)

sessionInfo()
quit("no")