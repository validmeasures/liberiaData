################################################################################
#
#'
#' Function to interpolate indicators from the Liberia Coverage Survey
#'
#' @param indicator A character vector of indicator data.frame names
#' @param core.columns A vector of variable names included in indicator
#'   data.frames
#' @param coords A data.frame containing per enumeration area centroid
#'   coordinates
#' @param hexgrid A SpatialPoints class object containing locations of
#'   interpolation
#' @param idp Inverse distance power. Default is 2.
#'
#' @return A data.frame as long as `hexgrid` containing
#'   interpolated indicator values at each location of `hexgrid`
#'
#' @examples
#' interpolate_indicators(indicator = "anthroDF",
#'                        coords = sampleList.r2[ , c("EFEACODE", "lon", "lat")],
#'                        hexgrid = gmHexGrid)
#'
#' @export
#'
#
################################################################################

interpolate_indicators <- function(indicator = c("ifaDF", "iycfDF",
                                                 "mnpDF", "vitDF",
                                                 "anthroDF", "cmamDF"),
                                   core.columns = c("spid", "cid", "did", "eid",
                                                    "motherID", "m2"),
                                   coords, hexgrid,
                                   idp = 2) {
  ##
  interpolationResults <- vector(mode = "list", length = length(indicator))
  names(interpolationResults) <- indicator
  ##
  for(i in indicator) {
    ##
    currentDF <- get(i)
    ##
    currentDFresults <- data.frame(matrix(nrow = length(hexgrid),
                                          ncol = length(names(currentDF)[!names(currentDF) %in% core.columns])))
    ##
    names(currentDFresults) <- names(currentDF)[!names(currentDF) %in% core.columns]
    ##
    currentSP <- create_sp(df = currentDF,
                           coords = coords[ , c("EFEACODE", "lon", "lat")],
                           proj = sp::CRS(sp::proj4string(hexgrid)))
    ##
    for(j in names(currentDF)[!names(currentDF) %in% core.columns]) {
      currentIndicator <- currentSP[!is.na(currentSP[[j]]), ]
      temp <- gstat::idw(formula = eval(parse(text = paste(j, "~", 1, sep = " "))),
                         locations = currentIndicator,
                         newdata = create_points(hexgrid = hexgrid),
                         idp = idp)
      currentDFresults[[j]] <- temp$var1.pred
    }
    ##
    interpolationResults[[i]] <- currentDFresults
  }
  return(interpolationResults)
}
