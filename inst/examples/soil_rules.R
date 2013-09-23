
sapply(ID, is.integer)
 !duplicated(ID)
 ID > 0 & ID < 1754

sapply(Latitude, is.numeric)
Latitude < 0

sapply(Longitude, is.numeric)
Longitude < 180 & Longitude > -180

is.null(Longitude) == is.null(Latitude)

sapply(Adm1, is.character)
sapply(Adm2, is.character)
sapply(Adm3, is.character)
sapply(Country, is.character)
sapply(Altitude, is.integer)

is.null(Adm1) == is.null(Longitude) # 
is.null(Adm2) == is.null(Longitude)
is.null(Adm3) == is.null(Longitude)
is.null(Country) == is.null(Longitude)
is.null(Altitude) == is.null(Longitude)

sapply(pH, is.numeric)
#sapply(pH, is.withinRange,0,14)
pH >=  0 # pH bigger than
pH <= 14 # pH lesser than



sapply(Conductivity, is.numeric)
Conductivity >= 0

sapply(CaCO3, is.numeric)
CaCO3 >= 0

sapply(Sand, is.numeric)
sapply(Sand, is.withinRange,0,100)

sapply(Lime, is.numeric)
sapply(Lime, is.withinRange,0,100)

sapply(Clay, is.numeric)
sapply(Clay, is.withinRange,0,100)

sapply(Soil_texture, is.character)
sapply(Soil_texture, is.oneOf,"Loam;Clay Loam;Sandy Loam;Sandy Clay Loam;Clay;Sand;Loamy Sand;Sandy Clay;Silt Loam;Silty Clay Loam;Silty Clay;Organic Soil")

sapply(P, is.numeric)
P >= 0




