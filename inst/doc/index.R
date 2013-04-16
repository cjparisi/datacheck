
## @knitr setup,echo=FALSE, results='hide', message=FALSE
library(xtable)
library(datacheck)
options(xtable.type = 'html')


## @knitr 
atable = system.file("examples/soilsamples.csv", package="datacheck")
srules = system.file("examples/soil_rules.R", package="datacheck")

# Uncomment the next two lines

# file.copy(atable, "soilsamples.csv")
# file.copy(srules, "soil_rules.R")



## @knitr message=FALSE, results='hide'


atable = read.csv(atable, header = TRUE, stringsAsFactors = FALSE)
srules = read.rules(srules)
profil = datadict.profile(atable, srules)


## @knitr fig.width=7, fig.height=6
ruleCoverage(profil)


## @knitr fig.width=7, fig.height=6
scoreSum(profil)


## @knitr results = 'asis'
xtable(atable[1:20, 1:6])


## @knitr results='asis'
ps = profil$scores
recs = c(1:10, nrow(ps)-1, nrow(ps))
cols = c(1:4,  ncol(ps))
xtable(ps[recs, cols])


## @knitr echo=FALSE, fig.width=7, fig.height=8
#filter out only records with less than maximum points
mp = max(ps$Record.score[nrow(ps)-2])

heatmap.quality(profil, scoreMax = mp)



## @knitr message=FALSE, results='hide'
atable$P[1]  = -100
atable$pH[11]= -200
srule1 = srules[-c(33),]
profil = datadict.profile(atable, srule1)


## @knitr results='asis'
xtable(shortSummary(atable))


## @knitr results = 'asis'
xtable(profil$checks)


## @knitr message=FALSE, results = 'hide'
atable$Sand[20:30] = -1
profil = datadict.profile(atable, srule1)


## @knitr results='asis'

xtable(prep4rep(profil$checks))


## @knitr message = FALSE, results='hide'
srule1$Variable[25] = "caCO3"
srule1$Rule[25] = "caCO3 >= 0"
profil = datadict.profile(atable, srule1)



## @knitr results = 'asis'
xtable(prep4rep(profil$checks[20:30,]))


