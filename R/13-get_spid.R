################################################################################
#
#'
#' Function to get sampling point identifiers for Liberia Coverage dataset
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#' @param splist A data.frame containing sampling point identifier information
#'   per enumeration area
#'
#' @return Coverage data.frame with corresponding sampling point identifier
#'   per enumeration area
#'
#' @examples
#' get_spid(df = coverageData.r2, splist = sampleList.r2[ , c("spid", "EFEACODE")])
#'
#' @export
#'
#
################################################################################

get_spid <- function(df, splist) {
  merge(df, splist[ , c("spid", "EFEACODE")],
        by.x = "eid", by.y = "EFEACODE", all.x = TRUE)
}
