% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PIC_ODGC.R
\name{PIC_ODGC}
\alias{PIC_ODGC}
\title{PICODGC}
\usage{
PIC_ODGC(my_df, X, Y, my_tree, MAD_threshold, threshold.auto = TRUE)
}
\arguments{
\item{my_df}{dataframe of traits}

\item{X}{trait1 name}

\item{Y}{trait2 name}

\item{my_tree}{phylogenetic tree}

\item{MAD_threshold}{MAD threshold of outlier}

\item{threshold.auto}{logical value, TRUE means using the estimated threshold automatically according to the sample size, if False, you can indicate MAD_threshold manually}
}
\value{
PICODGC model
}
\description{
Perform PICODGC
}
