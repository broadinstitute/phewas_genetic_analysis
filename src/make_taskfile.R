generate_taskfile <- function(
  taskname,
  trait,
  phenfile,
  ID_col,
  nprallel=1,
  gdsfile,
  groupfile,
  nullfile,
  outfolder,
  taskfile  ){

    if(length(gdsfile)!=22){
       stop("we need 22 gds files")
    }

    if(length(groupfile)!=22){
       stop("we need 22 groupingfile files")
    }

    if(length(nullfile)!=length(trait)){
       stop("N nullfile needs to match N trait")
    }

    lsting<-substr(outfolder, nchar(outfolder) - 1 + 1, nchar(outfolder))

    ntasks    <- length(nullfile)
    taskinput <- NULL
    for (ii in 1:ntasks){
        task_id   <- taskname[ii]
        traitname <- trait[ii]
        phenfile0 <- phenfile[ii]
        nullfile0 <- nullfile[ii]
        if(lsting=="/"){
        outfile <- paste0(outfolder,traitname,"/",task_id,"_",traitname,"_chr",1:22,".RData")
        logfile <- paste0(outfolder,traitname,"/",task_id,"_",traitname,"_chr",1:22,".log")
        }else{
        outfile <- paste0(outfolder,"/",traitname,"/",task_id,"_",traitname,"_chr",1:22,".RData")
        logfile <- paste0(outfolder,"/",traitname,"/",task_id,"_",traitname,"_chr",1:22,".log")
        }
        taskinput1 <- c(task_id,nprallel,traitname,ID_col,
                        gdsfile, groupfile,
                        phenfile0, nullfile0, outfile, logfile)
        taskinput  <- rbind(taskinput,taskinput1)
    }

    env_variables<- c("--env taskid","--env nparallel","--env trait","--env ID_col")
    gdsfiles     <- paste0("--input chr",1:22,"_gdsfile")
    groupfiles   <- paste0("--input chr",1:22,"_groupfile")
    common_input <- c("--input phenfile","--input nullfile")
    outputfiles  <- paste0("--output chr",1:22,"_outfile")
    logfiles     <- paste0("--output chr",1:22,"_logfile")

    rownames(taskinput) <- NULL
    taskinput           <- as.data.frame(taskinput, stringsAsFactors=F)
    colnames(taskinput) <- c(env_variables,gdsfiles,groupfiles,common_input,outputfiles,logfiles)

return(taskinput)
}
