FROM analysiscommon/genesis_wdl:v1.5

MAINTAINER Seung Hoan Choi <schoi@broadinstitute.org>

RUN sudo wget https://bioconductor.statistik.tu-dortmund.de/packages/3.11/bioc/src/contrib/GENESIS_2.18.0.tar.gz
RUN sudo git clone https://github.com/broadinstitute/phewas_genetic_analysis.git
RUN sudo git clone https://github.com/seanjosephjurgens/UKBB_200KWES_CVD.git
RUN sudo R CMD INSTALL GENESIS_2.18.0.tar.gz



#docker build -t genesis_2.18.0 ./
#docker tag 2196e67e2d54 genesis_2.18.0:v1
#docker tag genesis_2.18.0:v1 us.gcr.io/broad-ml4cvd/genesis_2.18.0:v1
#docker push us.gcr.io/broad-ml4cvd/genesis_2.18.0:v1
#docker tag gcr.io/broad-ml4cvd/genesis_2.18.0:v1 schoi/genesis_2.18.0:v1
#docker push schoi/genesis_2.18.0:v1
