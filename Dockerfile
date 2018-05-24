FROM rocker/verse
LABEL authors="davismcc@gmail.com" \
    maintainer="Davis McCarthy <davismcc@gmail.com>" \
    description="Docker image containing latest R with tidyvers and Bioconductor packages"
 
FROM bioconductor/release_core2
RUN mkdir -p /usr/local/lib/R/site-library
ADD install.R /tmp/
RUN R -f /tmp/install.R
