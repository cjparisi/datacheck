
# Get example data file with some errors in it
atbler= system.file("examples/db-err.csv", package='datacheck')
arule = system.file("examples/rules1.R", package='datacheck')

at = read.csv(atbler, stringsAsFactors = FALSE)
ad = read.rules(arule)

db_e = datadict.profile(at, ad)

has.ruleErrors(db_e) == TRUE

