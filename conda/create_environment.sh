#BASE=$(conda info | grep -i 'base environment' | sed 's/^.*: \([^ ]*\).*$/\1/')
#conda create -y -n scRNAseq_analysis python=3.7
#source $BASE/etc/profile.d/conda.sh
#conda activate scRNAseq_analysis

# set channel order
conda config --env --add channels defaults
conda config --env --add channels bioconda
conda config --env --add channels conda-forge

########################
## install R packages ##
########################
conda install -y r-base==3.6.1 r-essentials rstudio r-dplyr
# install the latest version of Seurat seperately since latest version isn't on conda
R --slave --no-restore --no-save -e "install.packages('Seurat', repos='http://cran.us.r-project.org', version = '3.2.1')"

#############################
## install python packages ##
#############################
conda install -y scanpy==1.6.0 jupyter jupyter_contrib_nbextensions
pip install streamlit==0.68.1 leidenalg
