\encoding{latin1}
\name{seqplot}
\alias{seqplot}
\alias{seqdplot}
\alias{seqfplot}
\alias{seqiplot}
\alias{seqHtplot}
\alias{seqmsplot}
\alias{seqmtplot}
\alias{seqrplot}

\title{Plot functions for state sequence objects}
\description{
High level plot functions for state sequence objects that can produce state distribution, frequency, index,  transversal entropy, sequence of modes, meant time, and representative plots.
}
\usage{
seqplot(seqdata, group=NULL, type="i", title=NULL,
	cpal=NULL, missing.color=NULL,
	ylab=NULL, yaxis=TRUE, axes="all", xtlab=NULL, cex.plot=1,
	withlegend="auto", ltext=NULL, cex.legend=1,
	use.layout=(!is.null(group) | withlegend!=FALSE),
	legend.prop=NA, rows=NA, cols=NA, ...)

seqdplot(seqdata, group=NULL, title=NULL, ...)
seqfplot(seqdata, group=NULL, title=NULL, ...)
seqiplot(seqdata, group=NULL, title=NULL, ...)
seqHtplot(seqdata, group=NULL, title=NULL, ...)
seqmsplot(seqdata, group=NULL, title=NULL, ...)
seqmtplot(seqdata, group=NULL, title=NULL, ...)
seqrplot(seqdata, group = NULL, title = NULL, ...)
}
\arguments{
	\item{seqdata}{a state sequence object created with the \code{\link{seqdef}} function.}

	\item{group}{Plots one plot for each level of the factor given as argument.}
	
	\item{type}{the type of the plot. Available types are \code{"d"} for state distribution plots, \code{"f"} for sequence frequency plots, \code{"Ht"} for entropy index plots, \code{"i"} for sequence index plots, \code{"ms"} for plotting the sequence of modal states, \code{"mt"} for mean times plots and \code{"r"} for representative sequence plots.}

	\item{title}{title for the graphic. Default to NULL.}

	\item{cpal}{alternative color palette to use for the states. If user specified, a vector of colors with number of elements equal to the number of distinct states. By default, the 'cpal' attribute of the 'seqdata' sequence object is used (see \code{\link{seqdef}}).}

	\item{missing.color}{alternative color for representing missing values inside the sequences. By default, this color is taken from the "missing.color" attribute of the sequence object being plotted.}

	\item{ylab}{an optional label for the y axis. If set to NA, no label is drawn.}

	\item{yaxis}{controls whether a y axis is plotted. If left to \code{'NULL'}, the value is set according to the plot type, i.e. \code{FALSE} for \code{type="i"} and \code{'TRUE'} for all other types. When set to \code{'TRUE'}, sequence indexes are displayed for \code{"i"}, mean time values for \code{"mt"} and percentages for \code{"d"} and \code{"f"}. }

	\item{axes}{if set to "all" (default value) x axes are drawn for each plot in the graphic. If set to "bottom" and \code{group} is used, axes are drawn only under the plots located at the bottom of the graphic area. If FALSE, no x axis is drawn.}

  \item{xtlab}{optional labels for the x axis ticks labels. If unspecified, the column names of the 'seqdata' sequence object are used (see \code{\link{seqdef}}).}

	\item{cex.plot}{expansion factor for setting the size of the font for the axis labels and names. The default value is 1. Values lesser than 1 will reduce the size of the font, values greater than 1 will increase the size.}

  \item{withlegend}{defines if and where the legend of the state colors is plotted. The default value 'auto' sets the position of the legend automatically. Other possible value is 'right'. Obsolete option 'TRUE' is identical to 'auto'.}

  \item{ltext}{optional description of the states to appear in the legend. Must be a vector of character strings with number of elements equal to the size of the alphabet. If unspecified, the 'label' attributes of the 'seqdata' sequence object is used (see \code{\link{seqdef}}).}

	\item{cex.legend}{expansion factor for setting the size of the font for the labels in the legend. The default value is 1. Values lesser than 1 will reduce the size of the font, values greater than 1 will increase the size.}

 \item{use.layout}{if TRUE, layout is used to arrange plots when using the group option or plotting a legend. If layout is used, the standard 'par(mfrow=....)' for arranging plots will not work anymore. When \code{withlegend} is FALSE and \code{group} is NULL, layout is automatically deactivated and 'par(mfrow=....)' will work.}

 \item{legend.prop}{sets the proportion of the graphic area used for plotting the legend when use.layout=TRUE and withlegend=TRUE. Default value is set according to the place (bottom or right of the graphic area) where the legend is plotted. Values from 0 to 1.}

 \item{rows,cols}{optional arguments to arrange plots when use.layout=TRUE.}

 \item{...}{arguments to be passed to the function called to produce the appropriate statistics and the associated plot method (see details), or other graphical parameters.}
}

\details{
\code{seqplot} is the generic function for high level plots of state sequence objects with group splits and automatic display of the color legend. Many different types of plots can be produced by means of the \code{type} argument. Except for sequence index plots, \code{seqplot} first calls the specific function producing the required statistics and then the plot method for objects produced by this function (see below). For sequence index plots, the state sequence object itself is plotted by calling the \code{\link{plot.stslist}} method. When splitting by groups and/or displaying the color legend, the \code{\link[graphics]{layout}} function is used for arranging the plots.

The \code{seqdplot, seqfplot, seqiplot, seqHtplot, seqmsplot, seqmtplot} and \code{seqrplot} functions are aliases for calling \code{seqplot} with \code{type} argument set respectively to \code{"d", "f", "i", "Ht", "ms", "mt"} or \code{"r"}.

State distribution plot (\code{type="d"}) represent the sequence of the transversal state frequencies by position (time point) computed by the \code{\link{seqstatd}} function.

\emph{Sequence frequency plots} (\code{type="f"}) display the most frequent sequences, each one with an horizontal stack bar of its successive states. Sequences are ordered bottom-up according to the relative frequencies computed by the \code{\link{seqtab}} function. The \code{\link{plot.stslist.freq}} plot method is called for producing the plot. \cr
The \code{tlim} optional argument may be specified for selecting the number of sequences to be plotted (default is 10, i.e. the ten most frequent sequences). The width of the bars representing the sequences is by default proportional to the sequences frequencies, but this can be disabled with the \code{pbarw=FALSE} optional argument. If weights have been specified when creating \code{seqdata}, weighted frequencies will be returned by \code{seqtab} since the default option is \code{weighted=TRUE}. See examples below, the \code{\link{seqtab}} and \code{\link{plot.stslist.freq}} manual pages for a complete list of optional arguments and \cite{M�ller et al., 2008)} for a description of sequence frequency plots.

In \emph{sequence index plots} (\code{type="i"}), the requested individual sequences are rendered with horizontal stacked bars depicting the states over successive positions (time). Optional arguments are \code{tlim} for specifying the indexes of the sequences to be plotted (defaults to the first ten sequences, i.e \code{tlim=1:10}). For plotting nicely a (big) whole set use \code{tlim=0} together with additional graphical parameter \code{border=NA} and \code{space=0} to suppress bar borders and space between bars. The \code{sortv} argument can be used to pass a vector of numerical values for sorting the sequences. See \code{plot.stslist} for a complete list of optional arguments.

The interest of sequence index plots has for instance been stressed by \cite{Scherer (2001)} and \cite{Brzinsky-Fay et al. (2006)}. Notice that index plots for thousands of sequences result in very heavy PDF or POSTSCRIPT graphic files. Dramatic file size reduction may be achieved by saving the figures in bitmap format with using for instance the \code{\link[grDevices]{png}} graphic device instead of \code{\link[grDevices]{postscript}} or \code{\link[grDevices]{pdf}}.

The \emph{entropy index plot} (\code{type="Ht"}) displays the evolution over positions of the transversal entropies (\cite{Billari, 2001}). Transversal entropies are computed by calling \code{\link{seqstatd}} function and then plotted by calling the \code{\link{plot.stslist.statd}} plot method.

The \emph{modal state sequence plot} (\code{type="ms"}) displays the sequence of the modal states with each mode proportional to its frequency at the given position. The \code{\link{seqmodst}} function is called which returns the sequence and the result is plotted by calling the \code{\link{plot.stslist.modst}} plot method.

The \emph{mean time plot} (\code{type="mt"}) displays the mean time spent in each state of the alphabet as computed by the \code{link{seqmeant}} function. The \code{\link{plot.stslist.meant}} plot method is used to plot the resulting statistics.

The \emph{representative sequence plot} (\code{type="r"}) displays a reduced, non redundant set of representative sequences extracted from the provided state sequence object and sorted according to a representativeness criterion. The \code{\link{seqrep}} function is called to extract the representative set which is then plotted by calling the \code{\link{plot.stslist.rep}} method. A distance matrix is required that is passed with the \code{dist.matrix} argument or by calling the \code{seqdist} function if \code{dist.matrix=NULL}. The \code{criterion} argument sets the representativeness criterion used to sort the sequences. See examples below, the \code{\link{seqrep}} and \code{\link{plot.stslist.rep}} manual pages for a complete list of optional arguments and \cite{Gabadinho et al. (2009)} for more details on the extraction of representative sets.
}

\references{
Billari, F. C. (2001). The analysis of early life courses: Complex description of
the transition to adulthood. \emph{Journal of Population Research} \bold{18}(2), 119-142.

Brzinsky-Fay C., U. Kohler, M. Luniak (2006). Sequence Analysis with Stata. \emph{The Stata Journal}, \bold{6}(4), 435-460.

Gabadinho, A., G. Ritschard, M. Studer and N. S. M�ller (2009). Summarizing Sets of Categorical Sequences. In \emph{International Conference on Knowledge Discovery and Information Retrieval, Madeira, 6-8 October}. INSTICC.

M�ller, N. S., A. Gabadinho, G. Ritschard and M. Studer (2008). Extracting knowledge from life courses: Clustering and visualization. In \emph{Data Warehousing and Knowledge Discovery, 10th International Conference  DaWaK 2008, Turin, Italy, September 2-5}, LNCS 5182, Berlin: Springer, 176-185.

Scherer S (2001). Early Career Patterns: A Comparison of Great Britain and West Germany.
\emph{European Sociological Review}, \bold{17}(2), 119-144.
}

\examples{
## ======================================================
## Creating state sequence objects from example data sets
## ======================================================

## biofam data set
data(biofam)
biofam.lab <- c("Parent", "Left", "Married", "Left+Marr",
"Child", "Left+Child", "Left+Marr+Child", "Divorced")
biofam.seq <- seqdef(biofam, 10:25, labels=biofam.lab)

## actcal data set
data(actcal)
actcal.lab <- c("> 37 hours", "19-36 hours", "1-18 hours", "no work")
actcal.seq <- seqdef(actcal,13:24,labels=actcal.lab)

## ex1 using weights
data(ex1)
ex1.seq <- seqdef(ex1, 1:13, weights=ex1$weights)

## ========================
## Sequence frequency plots
## ========================

## Plot of the 10 most frequent sequences
seqplot(biofam.seq, type="f")

## Grouped by sex
seqfplot(actcal.seq, group=actcal$sex, tlim=10)

## Unweighted vs weighted frequencies
seqfplot(ex1.seq, weighted=FALSE)
seqfplot(ex1.seq, weighted=TRUE)

## =====================
## Modal states sequence
## =====================
seqplot(biofam.seq, type="ms")
## same as
seqmsplot(biofam.seq)

## ====================
## Representative plots
## ====================

## Computing a distance matrix
## with OM metric
costs <- seqsubm(biofam.seq, method="TRATE")
biofam.om <- seqdist(biofam.seq, method="OM", sm=costs)

## Plot of the representative sets grouped by sex
## using the default frequency criterion
seqrplot(biofam.seq, dist.matrix=biofam.om, group=biofam$sex)

## Plot of the representative sets grouped by sex
## using the default frequency criterion
seqrplot(biofam.seq, group=biofam$sex, dist.matrix=biofam.om)

## Plot of the representative sets grouped by sex
## using the "density" criterion
seqrplot(biofam.seq, group=biofam$sex, criterion="density", dist.matrix=biofam.om)

## ====================
## Sequence index plots
## ====================

## First ten sequences
seqiplot(biofam.seq)

## All sequences sorted by age in 2000
## grouped by sex
## using 'border=NA' and 'space=0' options to have a nicer plot
seqiplot(actcal.seq, group=actcal$sex, tlim=0, border=NA, space=0,
	sortv=actcal$age00)

## ===================
## Entropy index plots
## ===================
seqplot(biofam.seq, type="Ht", group=biofam$sex)

## =======================
## State distribution plot
## =======================

## Grouped by sex
seqplot(actcal.seq, type="d", group=actcal$sex)

## Sequence index plot (first 10 seq.)
## for the actcal data set
## grouped by sex
seqplot(actcal.seq, type="i", group=actcal$sex)

## ===============
## Meant time plot
## ===============

## actcal data set, grouped by sex
seqplot(actcal.seq, type="mt", group=actcal$sex)

## biofam data set, grouped by sex
seqmtplot(biofam.seq, group=biofam$sex)

}
\keyword{hplot}