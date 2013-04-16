\name{prep4rep}
\alias{prep4rep}
\title{Prepares a summary table for display in a 'printed' report.}
\usage{
  prep4rep(rule.checks, txt = "... more")
}
\arguments{
  \item{rule.checks}{table in a data.profile object}

  \item{txt}{text to be added after the first 5 record ids}
}
\value{
  the modified rule.checks table
}
\description{
  Currently reduces the number of displayed record ids to 5
  and adds a referral.
}
\author{
  Reinhard Simon
}
\seealso{
  Other datadict: \code{\link{as.rules}},
  \code{\link{datadict.profile}},
  \code{\link{has.ruleErrors}},
  \code{\link{is.datadict.profile}},
  \code{\link{read.rules}}
}

