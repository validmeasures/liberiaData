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
#' interpolate_indicators(indicator = "vitDF",
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
    ## Check if i is anthroDF
    if(i == "anthroDF") {
      core.columns <- c(core.columns, "age", "sex", "position", "flag")
    }
    ## Check if i is cmamDF
    if(i == "cmamDF") {
      core.columns <- c("spid", "cin", "cout", "rin")
    }
    ##
    currentDFresults <- data.frame(matrix(nrow = length(hexgrid),
                                          ncol = length(names(currentDF)[!names(currentDF) %in% core.columns])))
    ##
    names(currentDFresults) <- names(currentDF)[!names(currentDF) %in% core.columns]
    ## check if i is cmamDF
    if(i == "cmamDF") {
      temp <- aggregate(x = coords[ , c("lon", "lat")],
                        by = list(coords$spid),
                        FUN = mean)
      names(temp) <- c("spid", "lon", "lat")
      currentSP <- create_sp(df = currentDF,
                             coords = temp,
                             by.x = "spid", by.y = "spid",
                             proj = sp::CRS(sp::proj4string(hexgrid)))
    } else {
      ##
      currentSP <- create_sp(df = currentDF,
                             coords = coords[ , c("EFEACODE", "lon", "lat")],
                             by.x = "eid", by.y = "EFEACODE",
                             proj = sp::CRS(sp::proj4string(hexgrid)))
    }
    ##
    for(j in names(currentDF)[!names(currentDF) %in% core.columns]) {
      currentIndicator <- currentSP[!is.na(currentSP[[j]]), ]
      if(length(currentIndicator) != 0 ) {
        temp <- gstat::idw(formula = eval(parse(text = paste(j, "~", 1, sep = " "))),
                           locations = currentIndicator,
                           newdata = create_points(hexgrid = hexgrid),
                           idp = idp)
        currentDFresults[[j]] <- temp$var1.pred
      }
    }
    ##
    interpolationResults[[i]] <- currentDFresults
  }
  return(interpolationResults)
}
