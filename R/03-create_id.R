################################################################################
#
#' Function to create unique mother and child identifiers
#'
#' @param ls A list of data.frames produced when retrieving the Liberia Coverage
#'   Survey data from the ODK server
#'
#' @return A list of two vectors each with length equal to the number of rows of
#'   the corresponding data.frame in `ls`
#'
#' @examples
#' \dontrun{
#' create_id(ls = coverageData)
#' }
#'
#' @export
#'
#
################################################################################

create_id <- function(ls) {
  motherID <- ls[[1]]
}
