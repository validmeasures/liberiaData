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
#' @param rep Logical. Does the form have repeat/s? Default FALSE.
#' @param rep.name A vector of repeat names to read in the form. Default
#'   is NULL. Must be specified if \code{rep} is TRUE.
#'
#' @return A data.frame corresponding to dataset corresponding to the form ID
#'   specified.
#'
#' @examples
#'   get_liberia_data(id = "liberiaCoverageRound2",
#'                    username = "cadnihead",
#'                    password = "kEv-hAB-Arb-6Cn",
#'                    filename = "surveyData")
#'
#'
#' @export
#'
#
################################################################################

get_liberia_data <- function(id, username, password,
                             start = Sys.Date(), end = Sys.Date(),
                             filename,
                             rep = FALSE, rep.name = NULL) {
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
  ## Read repeat data
  for(i in rep.name) {
    assign(x = paste(rep.name, "_data", sep = ""),
           value = read.csv(paste(temp, "/", filename, "-",
                                  rep.name, ".csv", sep = ""),
                            stringsAsFactors = FALSE))
  }
  ##
  fullData <- surveyData
  ##
  if(rep) {
    fullData <- vector(mode = "list", length = length(rep.name) + 1)
    fullData[[1]] <- surveyData
    for(i in length(rep.name)) {
      fullData[[i + 1]] <- get(paste(rep.name[i], "_data", sep = ""))
    }
  }
  ## Return data.frame
  return(fullData)
}
