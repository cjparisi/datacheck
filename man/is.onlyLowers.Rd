\name{is.onlyLowers}
\alias{is.onlyLowers}
\title{Tests if a string has only lower case letters}
\usage{
  is.onlyLowers(s)
}
\arguments{
  \item{s}{a character string}
}
\value{
  boolean TRUE if detects anything
}
\description{
  Tests if a string has only lower case letters
}
\examples{
is.onlyLowers("example") == TRUE

is.onlyLowers("Example") == FALSE


}
\author{
  Reinhard Simon
}
\seealso{
  Other rule_checks: \code{\link{has.punct}},
  \code{\link{is.oneOf}}, \code{\link{is.properName}},
  \code{\link{is.withinRange}}
}

