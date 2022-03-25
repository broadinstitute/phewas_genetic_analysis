FROM analysiscommon/genesis_wdl:v1.5

MAINTAINER Seung Hoan Choi <schoi@broadinstitute.org>

RUN sudo wget https://bioconductor.statistik.tu-dortmund.de/packages/3.11/bioc/src/contrib/GENESIS_2.18.0.tar.gz
RUN sudo R CMD INSTALL GENESIS_2.18.0.tar.gz
RUN sudo git clone https://github.com/seanjosephjurgens/UKBB_200KWES_CVD.git
