################################################################################
#
#'
#' Initialise built-in Shiny application
#'
#' @return NULL
#' @examples
#' #
#'
#' @export
#
################################################################################

run_dashboard <- function() {
  appDir <- system.file("liberiaDashboard", package = "liberiaData")

  if (appDir == "") {
    stop("Could not find Shiny directory. Try re-installing `liberiaData`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
