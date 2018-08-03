FROM rocker/verse
LABEL authors="davismcc@gmail.com" \
    maintainer="Davis McCarthy <davismcc@gmail.com>" \
    description="Docker image containing latest R with tidyverse and Bioconductor packages"
 
# Install container-wide requrements gcc, pip, zlib, libssl, make, libncurses, fortran77, g++, R
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        libbz2-dev \
        libcurl4-openssl-dev \
        libgsl0-dev \
        libgsl-dev \
        libgsl2 \
        liblzma-dev \
        libncurses5-dev \
        libpcre3-dev \
        libpng-dev \
        librdf0-dev \
        libreadline-dev \
        libssh2-1-dev \
        libssl-dev \
        libxml2-dev \
        libzmq3-dev \
        pandoc \
        pandoc-citeproc \
        python-dev \
        python-pip \
        wget \
        zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install --upgrade virtualenv

RUN mkdir -p /usr/local/lib/R/site-library
ADD install.R /tmp/
RUN R -f /tmp/install.R
