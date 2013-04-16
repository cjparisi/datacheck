\name{scoreSum}
\alias{scoreSum}
\title{Line chart of cumulative sum of rule scores.}
\usage{
  scoreSum(profile)
}
\arguments{
  \item{profile}{a datadict profile object}
}
\description{
  A record receives one point per rule which evaluates
  TRUE. The total number of points is the 'quality score'
  per record.
}
\author{
  Reinhard Simon
}
\seealso{
  Other visuals: \code{\link{heatmap.quality}},
  \code{\link{ruleCoverage}}
}

