\name{is.properName}
\alias{is.properName}
\title{Tests if string is like a proper name with inital letter in upper case}
\usage{
  is.properName(aname)
}
\arguments{
  \item{aname}{a character string}
}
\value{
  boolean TRUE if ok
}
\description{
  Tests if string is like a proper name with inital letter
  in upper case
}
\examples{
# Valid proper names

is.properName("John") == TRUE

is.properName("john") == FALSE

is.properName(123) == FALSE
}
\author{
  Reinhard Simon
}
\seealso{
  Other rule_checks: \code{\link{has.punct}},
  \code{\link{is.oneOf}}, \code{\link{is.onlyLowers}},
  \code{\link{is.withinRange}}
}

