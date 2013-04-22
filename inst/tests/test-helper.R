
# SETUP sample database
ELEVATION = -1:8
LOCATION  = LETTERS[1:10]
GENUS = rep("Solanum")
db = cbind(ELEVATION, LOCATION, GENUS )
db = as.data.frame(db, stringsAsFactors=F)

context("datacheck helper function: has.punct")

test_that("has.punct works",{
  expect_that( has.punct("test")  , is_false() )
  expect_that( has.punct("test123")  , is_false() )
  expect_that( has.punct("test  123")  , is_true() ) 
  expect_that( has.punct("test.")    , is_true() )
  expect_that( has.punct("test?")    , is_true() )
  expect_that( has.punct("test'")    , is_true() )
  expect_that( has.punct("test\\")   , is_true() )
  expect_that( has.punct("test!")    , is_true() )
  expect_that( has.punct("test_")    , is_true() )
  expect_that( has.punct("test@")    , is_true() )
  expect_that( has.punct("test#")    , is_true() )
  expect_that( has.punct("test$")    , is_true() )
  expect_that( has.punct("test\\%")  , is_true() )
  expect_that( has.punct("test^")  , is_true() )
  expect_that( has.punct("test\\&")  , is_true() )
  expect_that( has.punct("test\\*")  , is_true() )
  expect_that( has.punct("test\\(")  , is_true() )
  expect_that( has.punct("test\\)")  , is_true() )
  expect_that( has.punct("test-")  , is_true() )
  expect_that( has.punct("test+")  , is_true() )
  expect_that( has.punct("test=")  , is_true() )
  expect_that( has.punct("test:")  , is_true() )
  expect_that( has.punct("test;")  , is_true() )
  expect_that( has.punct("test<")  , is_true() )
  expect_that( has.punct("test>")  , is_true() )
  expect_that( has.punct("test,")  , is_true() )
  expect_that( has.punct("test\\/")  , is_true() )
  expect_that( has.punct("test\\{")  , is_true() )
  expect_that( has.punct("test\\}")  , is_true() )
  expect_that( has.punct("test\\[")  , is_true() )
  expect_that( has.punct("test\\]")  , is_true() )
  expect_that( has.punct("test\\|")  , is_true() )
  expect_that( has.punct("test\\\\")  , is_true() )
  
})


context("datacheck helper function: is.properName")

test_that("is.properName works",{
  expect_that( is.properName("Solanum")    , is_true() )
  expect_that( is.properName("123") , is_false() )
  expect_that( is.properName(123) , is_false() )
  expect_that( is.properName("Sol_anum") , is_false() )
  expect_that( is.properName("solanum") , is_false() )
  expect_that( is.properName("Sol-anum") , is_false() )
  expect_that( is.properName("Sol@anum") , is_false() )
})

context("datacheck helper function: is.onlyLowers")

test_that("is.onlyLowers works",{
  expect_that( is.onlyLowers("solanum")    , is_true() )
  expect_that( is.onlyLowers("Solanum") , is_false() )
  expect_that( is.onlyLowers("123") , is_false() )
  expect_that( is.onlyLowers("sol.") , is_false() )
  expect_that( is.onlyLowers("sol-") , is_false() )
  expect_that( is.onlyLowers("so12l") , is_false() )
  expect_that( is.onlyLowers(123) , throws_error() )
  expect_that( is.onlyLowers() , throws_error() )
  expect_that( is.onlyLowers(x) , throws_error() )
})

context("datacheck helper function: is.oneOf")

test_that("is.oneOf works",{
  expect_that( is.oneOf("s","s")    , is_true() )
  expect_that( is.oneOf("S","T;S") , is_true() )
  expect_that( is.oneOf("s","t") , is_false() )
  
  expect_that( is.oneOf("a;b","a;b;c") , is_true() )
})


context("datacheck helper function: is.withinRange")

test_that("is.withinRange works",{
  expect_that( is.withinRange(2,1,3)    , is_true() )
  expect_that( is.withinRange(1,1,3)    , is_true() )
  expect_that( is.withinRange(3,1,3)    , is_true() )
  expect_that( is.withinRange(3.1,1,3)    , is_false() )
  
  expect_that( is.withinRange(0,1,3) , is_false() )
 expect_that( is.withinRange("x",1,3) , throws_error() )
})


context("datacheck helper function: apply a rule")

test_that("Rule testing works", {
  ELEVATION = -1:8
  LOCATION  = LETTERS[1:10]
  GENUS = rep("Solanum")
  db = cbind(ELEVATION, LOCATION, GENUS )
  db = as.data.frame(db, stringsAsFactors=F)
  expect_that( check.dataRule("-1 <= ELEVATION", db)[1], is_true() )
  expect_that( check.dataRule("ELEVATION <=8  ", db)[10], is_true() )
  expect_that( check.dataRule("1 <= ELEVATION & ELEVATION <= 9", db)[2], is_false() )
  expect_that( check.dataRule("1 <= ELEVATION & ELEVATION <= 9", db)[3], is_true() )
  expect_that( all(check.dataRule("sapply(LOCATION, is.character)", db)), is_true() )
  expect_that( all(check.dataRule("'A' %in% LOCATION", db)), is_true() )
  expect_that( all(check.dataRule("sapply(GENUS,is.properName)", db)), is_true() )
  rm(db)
})


context("Testing reading a rules file in R compliant format.")

test_that("Reading a file works",{
  apath = system.file("examples/rules.R", package='datacheck')
  # SETUP sample database
  ELEVATION = -1:8
  LOCATION  = LETTERS[1:10]
  GENUS = rep("Solanum")
  db = cbind(ELEVATION, LOCATION, GENUS )
  db = as.data.frame(db, stringsAsFactors=F)
  
                    
  expect_that( is.na(read.rules("")), is_true())
  expect_that( is.na(read.rules(NA)),  is_true())
  expect_that( (nrow(read.rules(apath)) > 0), is_true())
  
  rr = read.rules(apath)
#   print("\n")
#   print(rr)
#   expect_that( all(check.dataRule(rr[4,"Rules"], db)), is_true())
#   expect_that( all(check.dataRule(rr[6,"Rules"], db)), is_true())
  
  rm(db)
})

context("Testing the rule profiler.")

test_that("Rule profiling works",{
  arule = system.file("examples/rules.R", package='datacheck')
  arule2 = system.file("examples/rules2.R", package='datacheck')
  atbl  = system.file("examples/db.csv", package='datacheck')
  atbler= system.file("examples/db-err.csv", package='datacheck')
  
  at = read.csv(atbl, stringsAsFactors = FALSE)
  ad = read.rules(arule)
  
  pt = datadict.profile(at, ad)
  expect_that( nrow(pt$checks)==9, is_true())
  expect_that( has.ruleErrors(pt$checks),  is_false())
  rm(pt)
  
  at = read.csv(atbler, stringsAsFactors = FALSE)
  pte = datadict.profile(at, ad)
  at = read.csv(atbler, stringsAsFactors = FALSE, encoding = "UTF-8")
  expect_that( nrow(pte$checks)==9, is_true())
  expect_that( is.na(read.rules(arule2)), is_true())
  
})

context("Testing: pkg.version")

test_that("Access works",{
  expect_that( pkg.version("datacheck") == "0.9.8", is_true() )
})

