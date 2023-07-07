generate_taskfile<-function(
taskname,
trait,
phenfile,
ID_col,
nprallel=1,
gdsfiles,
goupgingfile,
nullfile,
outfolder,
taskfile){

if(length(gdsfiles)!=22){
stop("we need 22 gds files")
}

if(length(goupgingfile)!=22){
stop("we need 22 groupingfile files")
}

if(length(nullfile)!=length(trait)){
stop("N nullfile needs to match N trait")
}

ntasks<-length(nullfile)

for (ii in 1:length(ntasks)){

trask_id<-taskname[ii]
traitname<-trait[ii]
phenfile0<-phenfile[ii]
nullfile0<-nullfile[ii]

outfile<-paste0(outfolder,"/",traitname,"/",task_id,"_",traitname,"_chr",1:22,".RData")
logfile<-paste0(outfolder,"/",traitname,"/",task_id,"_",traitname,"_chr",1:22,".log")

taskinput1<-data.frame(task_id,nprallel,traitname,ID_col,
  gdsfile[1],gdsfile[2],gdsfile[3],gdsfile[4],gdsfile[5],gdsfile[6],gdsfile[7],gdsfile[8],gdsfile[9],gdsfile[10],gdsfile[11],gdsfile[12],gdsfile[13],gdsfile[14],gdsfile[15],gdsfile[16],gdsfile[17],gdsfile[18],gdsfile[19],gdsfile[20],gdsfile[21],gdsfile[22],
  groupfile[1],groupfile[2],groupfile[3],groupfile[4],groupfile[5],groupfile[6],groupfile[7],groupfile[8],groupfile[9],groupfile[10],groupfile[11],groupfile[12],groupfile[13],groupfile[14],groupfile[15],groupfile[16],groupfile[17],groupfile[18],groupfile[19],groupfile[20],groupfile[21],groupfile[22],
  phenfile0,nullfile0,
  outfile[1],outfile[2],outfile[3],outfile[4],outfile[5],outfile[6],outfile[7],outfile[8],outfile[9],outfile[10],outfile[11],outfile[12],outfile[13],outfile[14],outfile[15],outfile[16],outfile[17],outfile[18],outfile[19],outfile[20],outfile[21],outfile[22],
  logfile[1],logfile[2],logfile[3],logfile[4],logfile[5],logfile[6],logfile[7],logfile[8],logfile[9],logfile[10],logfile[11],logfile[12],logfile[13],logfile[14],logfile[15],logfile[16],logfile[17],logfile[18],logfile[19],logfile[20],logfile[21],logfile[22],
  stringsAsFactors=F)
}


env_variables<-c("--env taskid","--env nparallel","--env trait","--env ID_col")
gdsfiles<-paste0("--input chr",1:22,"_gdsfile")
groupfiles<-paste0("--input chr",1:22,"_groupfile")
common_input<-c("--input phenfile","--input nullfile")
outputfiles<-paste0("--output chr",1:22,"_outfile")
logfiles<-paste0("--output chr",1:22,"_logfile")

names(taskinput)<-c(env_variables,gdsfiles,groupfiles,common_input,outputfiles,logfiles)

}
