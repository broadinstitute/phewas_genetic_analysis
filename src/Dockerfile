FROM analysiscommon/genesis_wdl:v1.5

MAINTAINER Seung Hoan Choi <schoi@broadinstitute.org>

USER root

RUN sudo git clone https://github.com/broadinstitute/phewas_genetic_analysis.git
RUN sudo git clone --branch v1.2 https://github.com/seanjosephjurgens/UKBB_200KWES_CVD.git
RUN sudo git clone https://github.com/broadinstitute/TOPMed_AFib_pipeline.git

RUN sudo wget https://bit.ly/3rmveIc -O rpackages4_1_3_aou.tar.gz
RUN tar -xvf rpackages4_1_3_aou.tar.gz


#RUN sudo R CMD INSTALL GENESIS_2.18.0.tar.gz

## how to build the docker
#docker build --no-cache -t genesis_2.18.0:jul112023 ./
#docker tag 2047102472bc genesis_2.18.0:jul112023
#docker tag genesis_2.18.0:jul112023 us.gcr.io/aou-project-385720/genesis_2.18.0:jul112023
#docker push us.gcr.io/aou-project-385720/genesis_2.18.0:jul112023
#docker tag us.gcr.io/aou-project-385720/genesis_2.18.0:jul112023 schoi/genesis_2.18.0:jul112023
#docker push schoi/genesis_2.18.0:jul102023
