\encoding{latin1}
\name{plot.stslist.rep}
\alias{plot.stslist.rep}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot method for representative sequence sets}

\description{
This is the plot method for output produced by the \code{\link{seqrep}} function, i.e, for objects of class \emph{stslist.rep}. It produces a
representative sequence plot.
}

\usage{
\method{plot}{stslist.rep}(x, cpal = NULL, missing.color=NULL, pbarw = TRUE,
    dmax = NULL, stats=TRUE, ylab = NULL, xaxis = TRUE,
    xtlab = NULL, xtstep = NULL, cex.plot = 1, ...)
}

%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{an object of class \emph{stslist.rep} as produced by the \code{\link{seqrep}} function.}
  \item{cpal}{alternative color palette to use for the states. If user specified, a vector of colors with number of
      elements equal to the number of states in the alphabet. By default, the 'cpal' attribute of the \code{x} object is
      used.}
  \item{missing.color}{alternative color for representing missing values inside the sequences. By default, this color is taken from the "missing.color" attribute of the sequence object being plotted.}
  \item{pbarw}{when \code{TRUE}, the bar heights are set proportional to the number of represented sequences.}
  \item{dmax}{maximal theoretical distance, used for the x axis limits.}
  \item{stats}{if \code{TRUE} (default), mean discrepancy in each subset defined by all sequences attributed to one representative sequence and the mean distance to this representative sequence are displayed.}
  \item{ylab}{an optional label for the y axis. If set to \code{NA}, no label is drawn.}
  \item{xaxis}{controls whether a x axis is plotted.}
  \item{xtlab}{optional labels for the x axis ticks labels. If unspecified, the column names of the object being plotted.}
  \item{xtstep}{optional interval at which the tick-marks and labels of the x-axis are displayed. For example, with \code{xtstep=3} a tick-mark is drawn at position 1, 4, 7, etc... The display of the corresponding labels depends on the available space and is dealt with automatically. If unspecified, the \code{xtstep} attribute of the \code{x} object is used.}
  \item{cex.plot}{expansion factor for setting the size of the font for the axis labels and names. The default value is 1. Values lesser than 1 will reduce the size of the font, values greater than 1 will increase the size.}
  \item{\dots}{further graphical parameters. For more details about the graphical parameter arguments, see \code{barplot} and \code{par}.}
}
\details{
This is the plot method for the output produced by the \code{\link{seqrep}} function, i.e. objects of class \emph{stslist.rep}.
It produces a plot where the representative sequences are displayed as horizontal bars with width proportional to the
number of sequences assigned to them. Sequences are plotted bottom-up according to their representativeness score. \cr
Above the plot, two parallel series of symbols associated to each representative are displayed horizontally on a scale ranging
from 0 to the maximal theoretical distance \eqn{D_{max}}{D_max}. The location of the symbol associated to the representative \eqn{r_i}
indicates on axis \eqn{A} the (pseudo) variance (\eqn{V_i}) within the subset of sequences assigned to \eqn{r_i} and on the axis \eqn{B}
the mean distance \eqn{MD_i} to the representative.

This method is called by the generic \code{\link{seqplot}} function (if \code{type="r"}) that produces more sophisticated
plots with group splits and automatic display of the color legend. The \code{\link{seqrplot}} function is a shortcut for
calling \code{seqplot} with \code{type="r"}.
}

\author{Alexis Gabadinho (with Gilbert Ritschard for the help page)}

\examples{
## Loading the mvad data set and creating a sequence object
data(mvad)
mvad.labels <- c("employment", "further education", "higher education",
                    "joblessness", "school", "training")
mvad.scodes <- c("EM","FE","HE","JL","SC","TR")

## First 36 months trajectories
mvad.seq <- seqdef(mvad, 15:50, states=mvad.scodes, labels=mvad.labels)

## Computing Hamming distances
##
dist.ham <- seqdist(mvad.seq, method="HAM")

## Extracting a representative set using the sequence frequency
## as a representativeness criterion
mvad.rep <- seqrep(mvad.seq, dist.matrix=dist.ham)

## Plotting the representative set
plot(mvad.rep)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Plot}
