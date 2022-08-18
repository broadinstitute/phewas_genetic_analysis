library(data.table)
library(dplyr)
library(logistf)
library(GENESIS)
library(GWASTools)
library(SeqArray)
library(SeqVarTools)
library(SPAtest)
source('/UKBB_200KWES_CVD/GENESIS_adaptation_source.R')

args=(commandArgs(TRUE))
trait = as.character(args[1])
gene = as.character(args[2])
plink_file = as.character(args[3])
group_file = as.character(args[4])
pheno_file = as.character(args[5])
ID_col = as.character(args[6])
null_file = as.character(args[7])
unrel_file = as.character(args[8])
result_file = as.character(args[9])
log_file = as.character(args[10])

################################################################################

# Covariates
load(null_file)
fixef <- colnames(nullmod$betaCov)[c(2:ncol(nullmod$betaCov))]

# Extract carriers
source('/UKBB_200KWES_CVD/extract_carriers.R')
plink_path <- './plink2'
plinkfile_type <- 'bfile'
max_maf <- 0.001
max_mac <- ifelse(grepl('mask3', result_file), 4, 100000000)
carz <- NULL 
try(carz <- extract_carriers(groupfile=group_file, 
                             groupings_to_extract=gene, 
                             plink_path=plink_path, 
                             plinkfile=plink_file, 
                             plinkfile_type=plinkfile_type, 
                             max_maf=max_maf, 
                             max_mac=max_mac))
try(carz <- carz[,c(1, 7:(ncol(carz)))])
try(colnames(carz)[1] <- ID_col)
try(colnames(carz) <- gsub('__freq0.001', '', colnames(carz)))

pheno <- fread(pheno_file)
try(pheno <- pheno %>% merge(carz, by='person_id'))

# Run Firth's regression in each ancestry group
res <- NULL
ancestry_groups <- c('all', 'eur', 'afr', 'amr', 'eas', 'oth', 'sas', 'mid', 'non_eur')
for (anc in ancestry_groups) {
  
  if(anc=='all'){
    df <- pheno
  }else if(anc=='non_eur'){
    df <- pheno %>% filter(ancestry_pred_other %in% c('afr', 'amr', 'eas', 'oth', 'sas', 'mid'))
  }else{
    df <- pheno %>% filter(ancestry_pred_other==paste0(anc))
  }
  
  # related samples
  sample_size_relat <- nrow(df)
  n_cases_relat <- nrow(df %>% filter(has_disease==1))
  try(n_carriers_in_all_relat <- sum(df[[gene]]))
  try(n_carriers_in_cases_relat <- sum((df %>% filter(has_disease==1))[[gene]]))
  
  # unrelated samples
  unrel <- fread(unrel_file) %>% rename(person_id=ID)
  df.unrel <- df %>% merge(unrel, by='person_id')
  
  sample_size_unrel <- nrow(df.unrel)
  n_cases_unrel <- nrow(df.unrel %>% filter(has_disease==1))
  try(n_carriers_unrel <- sum(df.unrel[[gene]]))
  try(n_carriers_in_cases_unrel <- sum((df.unrel %>% filter(has_disease==1))[[gene]]))
  
  # Firth modeling
  if(n_cases_relat>=50 & n_cases_unrel>20 & n_carriers_unrel>20){
    
    f <- as.formula(paste('has_disease ~ ', paste0(c(gene, fixef), collapse='+')))
    
    df.unrel <- df.unrel %>% mutate(age = (age - mean(age)) / sd(age),
                                    age2 = (age2 - mean(age2)) / sd(age2),
                                    PC1 = (PC1 - mean(PC1)) / sd(PC1),
                                    PC2 = (PC2 - mean(PC2)) / sd(PC2),
                                    PC3 = (PC3 - mean(PC3)) / sd(PC3),
                                    PC4 = (PC4 - mean(PC4)) / sd(PC4),
                                    PC5 = (PC5 - mean(PC5)) / sd(PC5),
                                    PC6 = (PC6 - mean(PC6)) / sd(PC6),
                                    PC7 = (PC7 - mean(PC7)) / sd(PC7),
                                    PC8 = (PC8 - mean(PC8)) / sd(PC8),
                                    PC9 = (PC9 - mean(PC9)) / sd(PC9),
                                    PC10 = (PC10 - mean(PC10)) / sd(PC10),
                                    PC11 = (PC11 - mean(PC11)) / sd(PC11),
                                    PC12 = (PC12 - mean(PC12)) / sd(PC12),
                                    PC13 = (PC13 - mean(PC13)) / sd(PC13),
                                    PC14 = (PC14 - mean(PC14)) / sd(PC14),
                                    PC15 = (PC15 - mean(PC15)) / sd(PC15),
                                    PC16 = (PC16 - mean(PC16)) / sd(PC16))
    
    logistf.control(maxit=400)
    mod <- logistf(formula=f, data=df.unrel)
    logOR <- mod$coefficients[2]
    logOR.SE <- sqrt(diag(vcov(mod)))[2]
    
  }else{
    
    mod <- logOR <- logOR.SE <- NA
    
  }else{
    
    sample_size_relat <- n_cases_relat <- n_carriers_in_all_relat <- n_carriers_in_cases_relat <- sample_size_unrel <- n_cases_unrel <- n_carriers_unrel <- n_carriers_in_cases_unrel <- mod <- logOR <- logOR.SE <- NA
    
  }
  
  line <- data.table(phenotype = trait, 
                     gene_id = gene, 
                     ancestry = anc, 
                     sample_size_relat = sample_size_relat,
                     n_cases_relat = n_cases_relat, 
                     n_carriers_in_all_relat = n_carriers_in_all_relat, 
                     n_carriers_in_cases_relat = n_carriers_in_cases_relat, 
                     sample_size_unrel = sample_size_unrel, 
                     n_cases_unrel = n_cases_unrel, 
                     n_carriers_unrel = n_carriers_unrel, 
                     n_carriers_in_cases_unrel = n_carriers_in_cases_unrel, 
                     mask = ifelse(grepl('mask1', result_file), 'mask1', 
                                    ifelse(grepl('mask2', result_file), 'mask2', 'mask3')), 
                     logOR = logOR, 
                     logOR.SE = logOR.SE)
  
  res <- rbind(res, line)
  
}
save(res, file=result_file)

################################################################################

quit('n')