################################################################################
#
#' Liberia Coverage Survey Data Handler
#'
#' @keywords internal
#'
#' @docType package
#' @name liberiaData
#' @importFrom odkr renameODK get_briefcase pull_remote export_data
#' @importFrom utils read.csv
#' @importFrom bbw recode
#' @importFrom stringr str_detect
#'
#
################################################################################
"_PACKAGE"

## quiets concerns of R CMD check re: the string that appear in recode_others
if(getRversion() >= "2.15.1")  utils::globalVariables("string")
