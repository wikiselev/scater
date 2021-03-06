% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/plotting.R
\docType{methods}
\name{plotReducedDim}
\alias{plotReducedDim}
\alias{plotReducedDim}
\alias{plotReducedDim.default}
\alias{plotReducedDim,SCESet-method}
\alias{plotReducedDim,data.frame-method}
\alias{plotReducedDim.SCESet}
\alias{plotReducedDim}
\alias{plotReducedDim,SCESet-method}
\alias{plotReducedDIm}
\alias{plotReducedDim,data.frame-method}
\alias{plotReducedDim}
\title{Plot reduced dimension representation of cells}
\usage{
plotReducedDim(object, ...)

plotReducedDim.default(df_to_plot, ncomponents = 2, colour_by = NULL,
  shape_by = NULL, size_by = NULL, percentVar = NULL, theme_size = 10,
  legend = "auto")

plotReducedDim.SCESet(object, ncomponents = 2, colour_by = NULL,
  shape_by = NULL, size_by = NULL, exprs_values = "exprs",
  theme_size = 10, legend = "auto")

\S4method{plotReducedDim}{SCESet}(object, ncomponents = 2, colour_by = NULL,
  shape_by = NULL, size_by = NULL, exprs_values = "exprs",
  theme_size = 10, legend = "auto")

\S4method{plotReducedDim}{data.frame}(object, ncomponents = 2,
  colour_by = NULL, shape_by = NULL, size_by = NULL, percentVar = NULL,
  legend = "auto")
}
\arguments{
\item{object}{an \code{SCESet} object with a non-NULL \code{reducedDimension}
slot.}

\item{...}{optional arguments (from those listed above) passed to
\code{plotReducedDim.SCESet} or \code{plotReducedDim.default}}

\item{df_to_plot}{data.frame containing a reduced dimension represenation of
cells and optional metadata for the plot.}

\item{ncomponents}{numeric scalar indicating the number of principal
components to plot, starting from the first principal component. Default is
2. If \code{ncomponents} is 2, then a scatterplot of Dimension 2 vs Dimension
1 is produced. If \code{ncomponents} is greater than 2, a pairs plots for the
 top dimensions is produced.}

\item{colour_by}{character string defining the column of \code{pData(object)} to
be used as a factor by which to colour the points in the plot. Alternatively, a 
data frame with one column containing values to map to colours for all cells.}

\item{shape_by}{character string defining the column of \code{pData(object)} to
be used as a factor by which to define the shape of the points in the plot.}

\item{size_by}{character string defining the column of \code{pData(object)} to
be used as a factor by which to define the size of points in the plot.}

\item{percentVar}{numeric vector giving the proportion of variance in
expression explained by each reduced dimension. Only expected to be used
internally in the \code{\link[scater]{plotPCA}} function.}

\item{theme_size}{numeric scalar giving default font size for plotting theme
(default is 10).}

\item{legend}{character, specifying how the legend(s) be shown? Default is
\code{"auto"}, which hides legends that have only one level and shows others.
Alternatives are "all" (show all legends) or "none" (hide all legends).}

\item{exprs_values}{a string specifying the expression values to use for
colouring the points, if \code{colour_by} or \code{size_by} are set as feature names.}
}
\value{
a ggplot plot object
}
\description{
Plot reduced dimension representation of cells
}
\details{
The function \code{plotReducedDim.default} assumes that the first
\code{ncomponents} columns of \code{df_to_plot} contain the reduced dimension
 components to plot, and that any subsequent columns define factors for
 \code{colour_by}, \code{shape_by} and \code{size_by} in the plot.
}
\examples{
data("sc_example_counts")
data("sc_example_cell_info")
pd <- new("AnnotatedDataFrame", data = sc_example_cell_info)
example_sceset <- newSCESet(countData = sc_example_counts, phenoData = pd)
drop_genes <- apply(exprs(example_sceset), 1, function(x) {var(x) == 0})
example_sceset <- example_sceset[!drop_genes, ]

reducedDimension(example_sceset) <- prcomp(t(exprs(example_sceset)), scale. = TRUE)$x
plotReducedDim(example_sceset)
plotReducedDim(example_sceset, colour_by="Cell_Cycle")
plotReducedDim(example_sceset, colour_by="Cell_Cycle", shape_by="Treatment")
plotReducedDim(example_sceset, colour_by="Cell_Cycle", size_by="Treatment")
plotReducedDim(example_sceset, ncomponents=5)
plotReducedDim(example_sceset, ncomponents=5, colour_by="Cell_Cycle", shape_by="Treatment")
plotReducedDim(example_sceset, colour_by="Gene_0001") 

}
