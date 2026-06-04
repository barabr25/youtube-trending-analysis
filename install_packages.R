# Install all R packages required to knit youtube_trending_final.Rmd
# Run with:  Rscript install_packages.R

packages <- c(
  "tidyverse",   # data wrangling + ggplot2
  "jsonlite",    # read the category-ID JSON
  "GGally",      # pairwise scatterplots (ggpairs)
  "MASS",        # negative binomial regression (glm.nb)
  "skimr",       # summary statistics
  "knitr",       # tables (kable) + knitting
  "scales",      # axis label formatting
  "gridExtra",   # multi-panel plot layout
  "lubridate",   # date parsing
  "e1071"        # skewness()
)

to_install <- packages[!packages %in% installed.packages()[, "Package"]]
if (length(to_install) > 0) {
  install.packages(to_install, repos = "https://cloud.r-project.org")
}
