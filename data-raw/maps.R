##
if(!require(remotes)) install.packages("remotes")
if(!require(rgdal)) install.packages("rgdal")
if(!require(rgeos)) install.packages("rgeos")
if(!require(raster)) install.packages("raster")
##
if(!require(liberia)) remotes::install_github("validmeasures/liberia")
if(!require(liberiaData)) remotes::install_github("validmeasures/liberiaData")

##
gmHexGrid <- readOGR(dsn = "data-raw/maps/coveragePolyGM", layer = "coveragePolyGM", verbose = FALSE)
gmHexGrid@data <- subset(gmHexGrid@data, select = county)
writeOGR(gmHexGrid, dsn = "data-raw/maps/gmHexGrid.gpkg", layer = "Monrovia", driver = "GPKG",
         overwrite_layer = TRUE, delete_dsn = FALSE)
##
usethis::use_data(gmHexGrid, compress = "xz", overwrite = TRUE)

##
gbHexGrid <- readOGR(dsn = "data-raw/maps/coveragePolyGB", layer = "coveragePolyGB", verbose = FALSE)
gbHexGrid@data <- subset(gbHexGrid@data, select = county)
writeOGR(gbHexGrid, dsn = "data-raw/maps/gbHexGrid.gpkg", layer = "Grand Bassa", driver = "GPKG",
         overwrite_layer = TRUE, delete_dsn = FALSE)
##
usethis::use_data(gbHexGrid, compress = "xz", overwrite = TRUE)
