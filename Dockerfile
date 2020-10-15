FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y vim wget curl

# install miniconda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py37_4.8.3-Linux-x86_64.sh -O ~/miniconda.sh
RUN bash ~/miniconda.sh -b -p /miniconda
ENV PATH="/miniconda/bin:$PATH"

# change channel order
RUN conda config --add channels defaults
RUN conda config --add channels bioconda
RUN conda config --add channels conda-forge

# copy over files from repository
COPY . /scRNAseq_analysis
WORKDIR /scRNAseq_analysis

# setup environment
RUN /bin/bash conda/create_environment.sh

CMD /bin/bash
