
# Case 1: define the reference set or lookup set within the function. Useful for small or 
# binary sets like m(ale)/f(emale)
is.oneOf("m","m") == TRUE

is.oneOf("m","f; m") == TRUE

is.oneOf("y", "f; m") == FALSE

is.oneOf("b;c;d", "a;b;c;d;e") == TRUE


# Case 2: use an external lookup table. The external lookup table must have at least one 
# column called exactly 'VALUES'. May have also another one 'LABELS'. Useful for long 
# lookup tables like list of countries.

# some preparation work for using a temporary directory
owd = getwd()
td = tempdir()
setwd(td)


VALUES = LETTERS[1:10]
LABELS = VALUES
db = cbind(VALUES, LABELS)
db = as.data.frame(db, stringsAsFactors = FALSE)
names(db) = c("VALUES","LABELS")
write.csv(db, 'sample.csv', row.names=FALSE)

is.oneOf("A", "sample.csv") == TRUE
is.oneOf("Z", "sample.csv") == FALSE

# switching back to your working directory
setwd(owd)
