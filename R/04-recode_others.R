################################################################################
#
#' Function to recode others responses
#'
#' @param df A data.frame containing data from the Liberia Coverage Survey
#' @param var A character value for variable name containing `others` responses
#' @param ls A list of thematically named string pattern vectors to use for
#'   searching and organising `others` responses
#'
#' @return A data.frame with same number of rows as `df` and number of columns
#'   equal to the length of `ls` containing recoded values
#'
#' @examples
#' \dontrun{
#' recode_others(df = coverageData2, var = "ifa3a_other", ls = )
#' }
#'
#' @export
#'
#
################################################################################

recode_others <- function(df, var, ls) {

  recodeDF <- data.frame(matrix(data = NA, nrow = nrow(df), ncol = length(ls)))
  names(recodeDF) <- paste(var, 1:length(ls), sep = ".")

  for(i in 1:length(ls)) {
    recodeDF[ , i] <- as.integer(
      as.logical(
        stringr::str_detect(string == df$var,
                            pattern = paste(ls[[i]], collapse = "|"))
      )
    )
  }
}
