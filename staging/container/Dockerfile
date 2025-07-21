# ==============================================================================
# STAGE 1: BUILD STAGE — Compile dependencies, build virtualenv
# ==============================================================================
FROM python:3.7-slim AS builder

# Install build tools and R
RUN apt update && apt install -y \
    software-properties-common \
    make gcc g++ git cmake curl \
    wget unzip \
    r-base r-base-dev \
 && apt clean && rm -rf /var/lib/apt/lists/*

# Compile BGEN library
RUN git clone --depth=1 https://github.com/limix/bgen.git && \
    mkdir bgen/build
WORKDIR /bgen/build
RUN cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --config Release && \
    make install

# Set up Python virtualenv and install packages
ENV VIRTUAL_ENV=/opt/venv
RUN python3.7 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN pip install --upgrade pip && \
    pip install numpy pandas scipy matplotlib

# Install R packages
RUN Rscript -e 'install.packages(c("optparse", "RColorBrewer", "Rcpp", "RcppEigen", "glmnet", "methods"))'

# Get plink2R and install
WORKDIR /
RUN wget https://github.com/gabraham/plink2R/archive/master.zip && \
    unzip master.zip && rm master.zip
RUN Rscript -e 'install.packages("plink2R-master/plink2R/", repos=NULL)'

# ==============================================================================
# STAGE 2: FINAL RUNTIME STAGE
# ==============================================================================
FROM python:3.7-slim AS final

# Install runtime system packages including R
RUN apt update && apt install -y \
    git r-base sqlite3 \
    wget unzip tree \
 && apt clean && rm -rf /var/lib/apt/lists/*

# Copy virtual environment from builder
ENV VIRTUAL_ENV=/opt/venv
COPY --from=builder $VIRTUAL_ENV $VIRTUAL_ENV

# Copy R libraries from builder
COPY --from=builder /usr/local/lib/R/site-library /usr/local/lib/R/site-library

# Copy plink2R from builder
COPY --from=builder /plink2R-master /plink2R-master

# Set Python paths
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Clone MetaXcan (spredixcan software)
RUN git clone --depth=1 https://github.com/hakyimlab/MetaXcan.git /workshop/software/MetaXcan
ENV PATH="/workshop/software/MetaXcan/software:$PATH"

# Get TWAS FUSION software
RUN wget https://github.com/gusevlab/fusion_twas/archive/master.zip && \
    unzip master.zip && rm master.zip && mv fusion_twas-master /workshop/software/FUSION

# Copy workshop materials
COPY data /workshop/data

# Configure jupyterlab
RUN pip install jupyterlab bash_kernel

RUN python -m bash_kernel.install

RUN pip install jupyterlab-spreadsheet

RUN Rscript -e "install.packages('IRkernel'); IRkernel::installspec()"

EXPOSE 8888

WORKDIR /workshop

ENV SHELL=/bin/bash

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]