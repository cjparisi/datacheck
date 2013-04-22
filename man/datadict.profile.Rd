\name{datadict.profile}
\alias{datadict.profile}
\title{Create a data quality profile (main function)}
\usage{
  datadict.profile(atable, adictionary)
}
\arguments{
  \item{atable}{a data.frame}

  \item{adictionary}{a list of rules in rule format}
}
\value{
  a data.profile object or NA
}
\description{
  Tests a database against a set of rules (one per line) in
  a 'data dictionary file'. Rules will be summarized in the
  returned object: the variable/column, the rule, any
  comment after the rule, the execution success, the total
  number of rule violations if any, the record id for any
  non-compliant records. Rules that can't be executed for
  any reason will be marked as 'failed'.
}
\details{
  The rule file must be a simple list of one rule per line.
  Functions can be used but since they are applied on a
  'vector' (the column) they should be used within a sapply
  statement (see example rule file). Rules may be separated
  by empty lines or lines with comment character #.
  Comments after a rule within the same line will be used
  for display in the summary table and should be short. A
  rule must only test one variable and one aspect at a
  time.
}
\examples{

# Get example data files
atable = system.file("examples/db.csv", package='datacheck')
arule  = system.file("examples/rules1.R", package='datacheck')
aloctn = system.file("examples/location.csv", package='datacheck') # for use in is.oneOf

ctable = basename(atable)
crule  = basename(arule)
cloctn = basename(aloctn)

cwd = tempdir()
owd = getwd()
setwd(cwd)

file.copy(atable, ctable)
file.copy(arule,  crule)
file.copy(aloctn, cloctn)

at = read.csv(ctable, stringsAsFactors = FALSE)
ad = read.rules(crule)

db = datadict.profile(at, ad)

is.datadict.profile(db) == TRUE

db

setwd(owd)

}
\author{
  Reinhard Simon
}
\seealso{
  Other datadict: \code{\link{as.rules}},
  \code{\link{has.ruleErrors}},
  \code{\link{is.datadict.profile}},
  \code{\link{prep4rep}}, \code{\link{read.rules}}
}

