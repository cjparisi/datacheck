\name{read.rules}
\alias{read.rules}
\title{Reads a file containing rules in data dictionary format.}
\usage{
  read.rules(file = "")
}
\arguments{
  \item{file}{R file with conditions}
}
\value{
  The results as a datadict object or NA for 'empty' rules
  file
}
\description{
  The rules must be one per line and should evaluate to a
  vector of TRUE or FALSE.
}
\details{
  A rule must only refer to one 'column' name. Rule
  statements may not have assignment operators (= or <-).
  Rules may be separated by empty or commented lines. A
  comment after a rule is used to document the specific
  rule in the summary table.
}
\author{
  Reinhard Simon
}
\seealso{
  Other datadict: \code{\link{as.rules}},
  \code{\link{datadict.profile}},
  \code{\link{has.ruleErrors}},
  \code{\link{is.datadict.profile}}, \code{\link{prep4rep}}
}

