\name{heatmap.quality}
\alias{heatmap.quality}
\title{Draws a heatmap based on data quality scores}
\usage{
  heatmap.quality(profile, recLab = NULL, recMax = 50,
    scoreMax = NULL, cols = NULL, ...)
}
\arguments{
  \item{profile}{a datadict.profile object}

  \item{recLab}{variable that should be used for labeling
  the records}

  \item{recMax}{maximum first n records for display}

  \item{scoreMax}{maxim quality score to filter out}

  \item{cols}{color scheme}

  \item{...}{as in heatmap function}
}
\description{
  Knows to extract the quality matrix from the profile
  object and pass it on to the heatmap function. Plots a
  heatmap.
}
\author{
  Reinhard Simon
}
\seealso{
  Other visuals: \code{\link{ruleCoverage}},
  \code{\link{scoreSum}}
}

