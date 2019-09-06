################################################################################
#
#'
#' Create sp class versions of datasets
#'
#' @param df A data.frame of recoded indicator values for the Liberia Coverage
#'   Survey
#' @param coords A data.frame containing per enumeration area centroid
#'   coordinates
#' @param proj A projection string of class CRS
#'
#' @return An `sp` class version of datasets
#'
#' @examples
#' create_sp(df = coverageData.r2, coords = sampleList.r2,
#'           proj = sp::CRS(sp::proj4string(gmHexGrid)))
#'
#' @export
#'
#
################################################################################

create_sp <- function(df, coords,
                      proj) {
  ##
  temp <- merge(df, coords, by.x = "eid", by.y = "EFEACODE", all.x = TRUE)
  ##
  tempSP <- sp::SpatialPointsDataFrame(coords = temp[ , c("lon", "lat")],
                                       data = temp, proj4string = proj)
  ##
  return(tempSP)
}


################################################################################
#
#' Create SpatialPoints from a hexagonal grid map
#'
#' @param hexgrid A SpatialPolygonsDataFrame hexagonal grid map
#'
#' @return A SpatialPoints class object of hexagonal grid centroids
#'
#' @examples
#' create_points(hexgrid = gmHexGrid)
#'
#' @export
#'
#
################################################################################

create_points <- function(hexgrid) {
  sp::SpatialPoints(coords = sp::coordinates(hexgrid),
                    proj4string = sp::CRS(sp::proj4string(hexgrid)))
}

