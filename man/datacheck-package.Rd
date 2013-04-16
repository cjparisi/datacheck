\docType{package}
\name{datacheck-package}
\alias{datacheck-package}
\title{Check a table against a set of constraints or rules defined in R.}
\description{
  The rules can be written in standard R syntax. A rule
  must contain the names of 'columns' or variables present
  in the table and use R operators or simple functions. If
  not, the rule will simply be ignored. Each line must
  'test' one rule and return a vector of boolean values as
  many as the table has rows. Rules must not contain an
  assignment. The set of rules is simply defined as a set
  of R statements and can be mixed with empty lines and
  comments. Comments after a rule will be used for
  summarizing rule check results in a table and should
  therefore be short - usually short names. This allows to
  visually organize rules in a file and also document them.
  One may put more extensive comments just before the rule
  and add a short name or comment on the same line after
  it. This also allows to use standard R editors for
  development of the rules.
}
\details{
  A simple score is calculated based on the number of rules
  a datapoint (= table cell) complies with. Like in a
  school test only the number of correct answers (or rule
  compliances) are counted. Summaries of scores by row
  (record) and column (variable) are added to a score data
  frame.

  The table itself must be a simple dataframe or .csv file.

  The package includes a simple graphical user interface as
  a web page. This can be started with
  \code{runDatacheck()}. This interface shows summaries of
  the checks by rule and by record. The score table can be
  'downloaded'. The user interface is meant as an easy way
  to get to know the package. All results can be also
  created using the command line interface of R.

  The main function and the principal example can be found
  under \code{datadict.profile}.

  Several helper functions like \code{is.properName} or
  \code{is.onlyLowers} are for convenience and illustration
  on how to express rules more clearly or succinct.
}

