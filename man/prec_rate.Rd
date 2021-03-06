% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/descriptive_stats.R
\name{prec_rate}
\alias{prec_rate}
\title{Sample size or precision for a rate}
\usage{
prec_rate(r, x = NULL, conf.width = NULL, conf.level = 0.95,
  method = c("score", "vs", "exact", "wald"),
  tol = .Machine$double.eps^0.25)
}
\arguments{
\item{r}{rate or rate ratio.}

\item{x}{number of events}

\item{conf.width}{precision (the full width of the conficende interval)}

\item{conf.level}{confidence level}

\item{method}{The method to use to calculate precision. Exactly one method
may be provided. Methods can be abbreviated.}

\item{tol}{numerical tolerance used in root finding, the default providing
(at least) four significant digits}
}
\value{
Object of class "presize", a list of arguments (including the
  computed one) augmented with method and note elements.
}
\description{
\code{prec_rate} returns the sample size or the precision for the provided
rate
}
\details{
Exactly one of the parameters \code{r, conf.width} must be passed as NULL,
and that parameter is determined from the other.

The \code{score}, variance stabilizing (\code{vs}), \code{exact}, and
\code{wald} method are implemented to calculate the rate and the precision.
For few events \code{x} (<5), the exact method is recommended.

If more than one method is specified or the method is miss-specified, the
'score' method will be used.

\code{\link[stats]{uniroot}} is used to solve n for the score and
exact method. Agresti-coull can be abbreviated by ac.
}
\examples{
prec_rate(2.5, x = 20, met = "score")
prec_rate(2.5, x = 20, met = "exact")
# vs and wald have the same conf.width, but different lwr and upr
prec_rate(2.5, x = 20, met = "wald")
prec_rate(2.5, x = 20, met = "vs")
}
\references{
Barker, L. (2002) \emph{A Comparison of Nine Confidence Intervals
for a Poisson Parameter When the Expected Number of Events is \eqn{\le} 5},
The American Statistician, 56:2, 85-89,
\href{https://doi.org/10.1198/000313002317572736}{DOI:
10.1198/000313002317572736}
}
\seealso{
\code{\link[stats]{poisson.test}}
}
