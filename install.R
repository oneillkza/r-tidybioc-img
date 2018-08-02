## install script for R pkgs
install.packages("BiocManager")
## update installed packages
BiocManager::install()

pkgs <- c(
  "apcluster",
  "batchtools",
  "bayesplot",
  "bblme",
  "clustermq",
  "coda",
  "cowplot",
  "d3heatmap",
  "data.table",
  "devtools",
  "DiagrammeR",
  "docopt",
  "DT",
  "dynamicTreeCut",
  "e1071",
  "future",
  "future.batchtools",
  "flexmix",
  "formatR",
  "fpc",
  "GGally",
  "ggbeeswarm",
  "ggdendro",
  "ggmcmc",
  "ggpubr",
  "ggrepel",
  "ggridges",
  "ggsci",
  "ggthemes",
  "ggtree",
  "glmnet",
  "gdata",
  "gplots",
  "gtools",
  "greta",
  "keras",
  "lattice",
  "latticeExtra",
  "lintr",
  "lme4",
  "Matrix",
  "MatrixModels",
  "matrixStats",
  "microbenchmark",
  "mvoutlier",
  "NMF",
  "packrat",
  "pcaMethods",
  "pheatmap",
  "preprocessCore",
  "pryr",
  "qvalue",
  "RColorBrewer",
  "reticulate",
  "roxygen2",
  "rprojroot",
  "scales",
  "superheat",
  "tensorflow",
  "testthat",
  "tufte",
  "UpSetR",
  "VGAM",
  "VariantAnnotation",
  "viridis",
  "wesanderson",
  "xtable"
)

# check that desired packages are available
ap.db <- available.packages(contrib.url(BiocManager::repositories()))
ap <- rownames(ap.db)
pkgs_to_install <- pkgs[pkgs %in% ap]

# do not reinstall packages that are already installed in the image
ip.db <- installed.packages()
ip <- rownames(ip.db)
pkgs_to_install <- pkgs_to_install[!(pkgs_to_install %in% ip)]

BiocManager::install(pkgs_to_install)
install.packages("rmote", repos = c(getOption("repos"), "http://cloudyr.github.io/drat"))
greta::install_tensorflow()

## just in case there were warnings, we want to see them
## without having to scroll up:
warnings()

if (!is.null(warnings()))
{
  w <- capture.output(warnings())
  if (length(grep("is not available|had non-zero exit status", w)))
    quit("no", 1L)
}

