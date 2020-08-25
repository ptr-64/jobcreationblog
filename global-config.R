####################################
# global libraries used everywhere #
####################################

pkgTest <- function(x)
{
  if (!require(x,character.only = TRUE))
  {
    install.packages(x,dep=TRUE)
    if(!require(x,character.only = TRUE)) stop("Package not found")
  }
  return("OK")
}

global.libraries <- c("dplyr","rmarkdown","ggplot2","ggthemes","knitr", "knitcitations", "rjson", "tidyr")

results <- sapply(as.list(global.libraries), pkgTest)

# file locations
# Main directories
basepath <- file.path(getwd())
dataloc <- file.path(basepath, "data")

for ( dir in list(dataloc)){
  if (file.exists(dir)){
  } else {
    dir.create(file.path(dir))
  }
}

# we combine the generic Zenodo API with the file identifier

# Zenodo DOI
zenodo.prefix <- "10.5072/zenodo"  # this is the DOI for the sandboxed data files
# Specific DOI - resolves to a fixed version
zenodo.id <- "664408" # the fixed _and sandboxed_ data files
# We will recover the rest from Zenodo API
zenodo.api = "https://sandbox.zenodo.org/api/records/" # https://zenodo... --> https://sandbox.zenodo...

