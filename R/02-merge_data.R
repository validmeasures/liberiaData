################################################################################
#
#' Function to merge main ODK form with repeats
#'
#' @param x A list of data.frames produced by `get_liberia_data` after
#'   retreiving data from ODK server.
#' @param rep.name A character value specifying name of repeat form to merge
#'   with main form.
#'
#' @return A data.frame with rows equal to repeat data merged with main form
#'
#' @examples
#' \dontrun{
#' fullData <- merge_repeats(x = coverageData, rep.name = "child_repeat")
#' head(fullData)
#' }
#'
#' @export
#'
#
################################################################################

merge_repeats <- function(x, rep.name) {
  merge(x[[1]], x[[rep.name]], by.x = "KEY", by.y = "PARENT_KEY")
}
