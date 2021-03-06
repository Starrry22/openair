% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kernelExceed.R
\name{kernelExceed}
\alias{kernelExceed}
\title{Kernel density plot for daily mean exceedance statistics}
\usage{
kernelExceed(polar, x = "wd", y = "ws", pollutant = "pm10",
  type = "default", by = c("day", "dayhour", "all"), limit = 50,
  data.thresh = 0, more.than = TRUE, cols = "default", nbin = 256,
  auto.text = TRUE, ...)
}
\arguments{
\item{polar}{A data frame minimally containing \code{date} and at least
three other numeric variables, typically \code{ws}, \code{wd} and a
\code{pollutant}.}

\item{x}{x-axis variable. Mandatory.}

\item{y}{y-axis variable. Mandatory}

\item{pollutant}{Mandatory. A pollutant name corresponding to a variable in
a data frame should be supplied e.g. \code{pollutant = "nox"}}

\item{type}{The type of analysis to be done. The default is will produce a
single plot using the entire data. Other types include "hour" (for hour
of the day), "weekday" (for day of the week) and "month" (for month of
the year), "year" for a polarPlot for each year. It is also possible to
choose \code{type} as another variable in the data frame. For example,
\code{type = "o3"} will plot four kernel exceedance plots for different
levels of ozone, split into four quantiles (approximately equal numbers
of counts in each of the four splits). This offers great flexibility for
understanding the variation of different variables dependent on another.
See function \code{cutData} for further details.}

\item{by}{\code{by} determines how data above the \code{limit} are
selected. \code{by = "day"} will select \emph{all} data (typically hours)
on days where the daily mean value is above \code{limit}. \code{by =
"dayhour"} will select only those data above \code{limit} on days where
the daily mean value is above \code{limit}. \code{by = "hour"} will
select all data above \code{limit}.}

\item{limit}{The threshold above which the \code{pollutant} concentration
will be considered.}

\item{data.thresh}{The data capture threshold to use (%) when aggregating
the data using \code{timeAverage} to daily means. A value of zero means
that all available data will be used in a particular period regardless if
of the number of values available. Conversely, a value of 100 will mean
that all data will need to be present for the average to be calculated,
else it is recorded as \code{NA}.}

\item{more.than}{If \code{TRUE} data will be selected that are greater than
\code{limit}. If \code{FALSE} data will be selected that less than
\code{limit}.}

\item{cols}{Colours to be used for plotting. Options include "default",
"increment", "heat", "spectral", "hue", "brewer1" and user defined (see
manual for more details). The same line colour can be set for all
pollutant e.g. \code{cols = "black"}.}

\item{nbin}{number of bins to be used for the kernel density estimate.}

\item{auto.text}{Either \code{TRUE} (default) or \code{FALSE}. If
\code{TRUE} titles and axis labels will automatically try and format
pollutant names and units properly e.g.  by subscripting the `2' in NO2.}

\item{\dots}{Other graphical parameters passed onto \code{lattice:levelplot}
and \code{cutData}. For example, \code{kernelExceed} passes the option
\code{hemisphere = "southern"} on to \code{cutData} to provide southern
(rather than default northern) hemisphere handling of \code{type = "season"}.
Similarly, common axis and title labelling options (such as \code{xlab},
\code{ylab}, \code{main}) are passed to \code{levelplot} via \code{quickText}
to handle routine formatting.}
}
\value{
To be completed.
}
\description{
This function is used to explore the conditions leading to exeedances of
air quality limits. Currently the focus is on understanding the conditions
under which daily limit values for PM10 are in excess of a specified
threshold. Kernel density estimates are calculated and plotted to highlight
those conditions.
}
\details{
The \code{kernelExceed} functions is for exploring the conditions under
which exceedances of air pollution limits occur. Currently it is focused on
the daily mean (European) Limit Value for PM10 of 50~ug/m3 not to be
exceeded on more than 35 days. However, the function is sufficiently
flexible to consider other limits e.g. could be used to explore days where
the daily mean are greater than 100~ug/m3.

By default the function will plot the kernel density estimate of wind speed
and wind directions for all days where the concentration of
\code{pollutant} is greater than \code{limit}. Understanding the conditions
where exceedances occur can help with source identification.

The function offers different ways of selecting the data on days where the
\code{pollutant} are greater than \code{limit} through setting \code{by}.
By default it will select all data on days where \code{pollutant} is
greater than \code{limit}. With the default setting of \code{by} it will
select all data on those days where \code{pollutant} is greater than
\code{limit}, even if individual data (e.g. hours) are less than
\code{limit}. Setting \code{by = "dayhour"} will additionally ensure that
all data on the those dates are also greater than \code{limit}. Finally,
\code{by = "all"} will select all values of \code{pollutant} above limit,
regardless of when they occur.

The usefulness of the function is greatly enhanced through using
\code{type}, which conditions the data according to the level of another
variable. For example, \code{type = "season"} will show the kernel density
estimate by spring, summer, autumn and winter and \code{type = "so2"} will
attempt to show the kernel density estimates by quantiles of SO2
concentration. By considering different values of \code{type} it is
possible to develop a good understanding of the conditions under which
exceedances occur.

To aid interpretation the plot will also show the \emph{estimated} number
of days or hours where exeedances occur. For \code{type = "default"} the
number of days should exactly correspond to the actual number of exceedance
days. However, with different values of \code{type} the number of days is
an estimate. It is an estimate because conditioning breaks up individual
days and the estimate is based on the proportion of data calculated for
each level of \code{type}.
}
\note{
This function automatically chooses the bandwidth for the kernel
  density estimate. We generally find that most data sets are not overly
  sensitive to the choice of bandwidth. One important reason for this
  insensitivity is likley to be the characteristics of air pollution
  itself. Due to atmospheric dispersion processes, pollutant plumes
  generally mix rapidly in the atmosphere. This means that pollutant
  concentrations are \sQuote{smeared-out} and extra fidelity brought about
  by narrower bandwidths do not recover any more detail.
}
\examples{

# Note! the manual contains other examples that are more illuminating
# basic plot
kernelExceed(mydata, pollutant = "pm10")

# condition by NOx concentrations
\dontrun{kernelExceed(mydata, pollutant = "pm10", type = "nox")}



}
\seealso{
\code{\link{polarAnnulus}}, \code{\link{polarFreq}},
  \code{\link{polarPlot}}
}
\author{
David Carslaw
}
\keyword{methods}
