% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/SCESet-methods.R
\docType{methods}
\name{featureControlInfo}
\alias{featureControlInfo}
\alias{featureControlInfo<-}
\alias{featureControlInfo}
\alias{featureControlInfo.SCESet}
\alias{featureControlInfo,SCESet-method}
\alias{featureControlInfo<-,SCESet,AnnotatedDataFrame-method}
\alias{featureControlInfo<-}
\alias{featureControlInfo,SCESet-method}
\alias{featureControlInfo}
\alias{featureControlInfo<-}
\alias{featureControlInfo}
\title{featureControlInfo in an SCESet object}
\usage{
featureControlInfo(object)

featureControlInfo(object) <- value

featureControlInfo.SCESet(object)

\S4method{featureControlInfo}{SCESet}(object)

\S4method{featureControlInfo}{SCESet,AnnotatedDataFrame}(object) <- value
}
\arguments{
\item{object}{a \code{SCESet} object.}

\item{value}{an AnnotatedDataFrame object, where each row contains
information for a single set of control features.}
}
\value{
An SCESet object containing new feature control information.
}
\description{
Each SCESet object stores optional information about the controls in the
\code{featureControlInfo} slot. These functions can be used to access,
replace or modify this information.
}
\examples{
data("sc_example_counts")
data("sc_example_cell_info")
pd <- new("AnnotatedDataFrame", data = sc_example_cell_info)
example_sceset <- newSCESet(countData = sc_example_counts, phenoData = pd)
example_sceset <- calculateQCMetrics(example_sceset,
                            feature_controls = list(ERCC = 1:40, Mito=41:50))
featureControlInfo(example_sceset)
featureControlInfo(example_sceset)$IsSpike <- c(TRUE, FALSE)
}
\author{
Aaron Lun
}
