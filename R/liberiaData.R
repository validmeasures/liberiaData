################################################################################
#
#' Liberia Coverage Survey Data Handler
#'
#' @docType package
#' @name liberiaData
#' @keywords internal
#' @importFrom odkr renameODK get_briefcase pull_remote export_data
#' @importFrom utils read.csv
#' @importFrom bbw recode
#' @importFrom stringr str_detect
#' @importFrom zscorer addWGSR getWGSR
#' @importFrom sp SpatialPointsDataFrame SpatialPolygonsDataFrame SpatialPoints CRS proj4string coordinates
#' @importFrom gstat idw
#' @importFrom stats aggregate quantile
#'
#
################################################################################
"_PACKAGE"

## quiets concerns of R CMD check re: the string that appear in recode_others
if(getRversion() >= "2.15.1")  utils::globalVariables("string")
