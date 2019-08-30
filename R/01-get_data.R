################################################################################
#
#'
#' Function to get Liberia Coverage Survey datasets and forms from ODK server.
#' This function is a wrapper for a set of functions from the \code{odkr}
#' package.
#'
#' @param id Form ID. Can be one of two form IDs used by the
#'   different forms designed for the Liberia Coverage Survey -
#'   \code{liberiaCoverageRound2} and \code{liberiaVillageFormRound2}.
#' @param username ONA server username credentials. For
#' @param password ONA server password credentials.
#' @param start Include data from submission dates after (inclusive) this
#'   start date in export to CSV. Date format <yyyy/MM/dd> and default is
#'   current system date
#' @param end Include data from submission dates before (exclusive) this date
#'   in export to CSV. Date format is <yyyy/MM/dd> and default value current
#'   system date
#' @param filename Filename to use for data without the CSV file extension.
#'
#' @return A data.frame corresponding to dataset corresponding to the form ID
#'   specified.
#'
#' @examples
#' \dontrun{
#'   get_liberia_data(id = "liberiaCoverageRound2",
#'                    username = "cadnihead",
#'                    password = "kEv-hAB-Arb-6Cn",
#'                    filename = "surveyData")
#' }
#'
#' @export
#'
#
################################################################################

get_liberia_data <- function(id, username, password,
                             start = Sys.Date(), end = Sys.Date(),
                             filename) {
  ## Create temporary directory
  temp <- tempdir()
  ## Get latest briefcase and put in temporary directory
  odkr::get_briefcase(destination = tempdir())
  ## Pull ODK forms definitions and submissions from server
  odkr::pull_remote(target = temp,
                    id = id,
                    from = "https://ona.io/validmeasures",
                    to = temp,
                    username = username,
                    password = password)
  ## Export dataset
  odkr::export_data(target = temp,
                    id = id,
                    from = temp,
                    to = temp,
                    start = start,
                    end = end,
                    filename = paste(filename, ".csv", sep = ""),
                    overwrite = TRUE)
  ## Read specified dataset
  surveyData <- read.csv(paste(temp, "/", filename, ".csv", sep = ""),
                         stringsAsFactors = FALSE)
  ## Return data.frame
  return(surveyData)
}
