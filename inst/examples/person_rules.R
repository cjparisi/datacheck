sapply(id, is.integer) # id
id > 0 & id < 11 # id

sapply(lastname, is.character) #lastname
sapply(lastname, is.properName) #lastname

sapply(firstname, is.character) #firstname
sapply(firstname, is.properName) #firstname

sapply(gender, is.character) #gender
sapply(gender, is.oneOf, "m;f") #gender

age > 10 & age < 70
