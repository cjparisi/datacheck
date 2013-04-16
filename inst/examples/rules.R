# An example rule file

# Testing the example database db.csv

# Rules regarding ELEVATION
sapply(ELEVATION, is.integer) # is right datatype
is.withinRange(ELEVATION, -1, 8) # is between min max
-2 < ELEVATION #
ELEVATION < 9 #
-2 < ELEVATION & ELEVATION < 9 # alternative form of range testing

sapply(LOCATION, is.character) #
LOCATION %in% LETTERS[1:10] #

sapply(GENUS, is.character) #
is.properName(GENUS)
