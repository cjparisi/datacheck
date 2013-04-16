\name{is.withinRange}
\alias{is.withinRange}
\title{Tests if a numeric value is between a minimal and maximum value. Serves as convenience function.}
\usage{
  is.withinRange(val, min, max)
}
\arguments{
  \item{val}{The value to be checked}

  \item{min}{The minimal value (inclusive)}

  \item{max}{The maximum value (inclusive)}
}
\value{
  boolean TRUE if detects anything
}
\description{
  Tests if a numeric value is between a minimal and maximum
  value. Serves as convenience function.
}
\examples{
is.withinRange(1,0,2) == TRUE

is.withinRange(-1,0,2) == FALSE
}
\author{
  Reinhard Simon
}
\seealso{
  Other rule_checks: \code{\link{has.punct}},
  \code{\link{is.oneOf}}, \code{\link{is.onlyLowers}},
  \code{\link{is.properName}}
}

