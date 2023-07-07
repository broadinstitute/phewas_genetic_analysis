FROM analysiscommon/genesis_wdl:v1.5

MAINTAINER Seung Hoan Choi <schoi@broadinstitute.org>

USER root

RUN sudo wget https://bioconductor.statistik.tu-dortmund.de/packages/3.11/bioc/src/contrib/GENESIS_2.18.0.tar.gz
RUN sudo git clone https://github.com/broadinstitute/phewas_genetic_analysis.git
#RUN sudo git clone https://github.com/seanjosephjurgens/UKBB_200KWES_CVD.git
RUN sudo git clone https://github.com/broadinstitute/TOPMed_AFib_pipeline.git
RUN sudo git clone --branch v1.2 https://github.com/seanjosephjurgens/UKBB_200KWES_CVD.git

RUN sudo R CMD INSTALL GENESIS_2.18.0.tar.gz


## how to build the docker
#docker build -t genesis_2.18.0 ./
#docker tag b370f7e0eb3c genesis_2.18.0:jul2023
#docker tag genesis_2.18.0:jul2023 us.gcr.io/aou-project-385720/genesis_2.18.0:jul2023
#docker push us.gcr.io/aou-project-385720/genesis_2.18.0:jul2023
#docker tag us.gcr.io/aou-project-385720/genesis_2.18.0:jul2023 schoi/genesis_2.18.0:jul2023
#docker push schoi/genesis_2.18.0:jul2023
