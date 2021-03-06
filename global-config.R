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

global.libraries <- c("dplyr","rmarkdown","ggplot2","ggthemes","knitr", "knitcitations")

results <- sapply(as.list(global.libraries), pkgTest)
