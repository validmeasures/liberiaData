################################################################################
#
#' Function to recode others responses
#'
#' @param df A data.frame containing data from the Liberia Coverage Survey
#' @param var A character value for variable name containing `others` responses
#' @param ls A list of thematically named string pattern vectors to use for
#'   searching and organising `others` responses
#' @param label A character vector for names of the resulting data.frame.
#'
#' @return A data.frame with same number of rows as `df` and number of columns
#'   equal to the length of `ls` containing recoded values
#'
#' @examples
#' ifa3d <- c("delivery", "hospital", "constantly") # Did not go to hospital
#' ifa3e <- c("know") # Don't know about the tablets
#' ifa3f <- c("any", "go") # Didn't get any tablets
#' ifa3g <- c("given") # Was given but never took it
#' ifa3h <- c("interest", "interested", "Not") # Not interested
#' ifa3i <- c("Reasons") # No reasons
#' ls1 <- list(ifa3d, ifa3e, ifa3f, ifa3g, ifa3h, ifa3i)
#' names(ls1) <- paste("ifa3", letters[4:9], sep = "")
#' recode_others(df = coverageData1.r2, var = "ifa3a_other", ls = ls1)
#'
#' @export
#'
#
################################################################################

recode_others <- function(df, var, ls,
                          label = paste(var, 1:length(ls), sep = ".")) {

  recodeDF <- data.frame(matrix(data = NA, nrow = nrow(df), ncol = length(ls)))
  names(recodeDF) <- label

  for(i in 1:length(ls)) {
    recodeDF[ , i] <- as.integer(
      as.logical(
        stringr::str_detect(string = df[[var]],
                            pattern = paste(ls[[i]], collapse = "|"))
      )
    )
  }
  ##
  return(recodeDF)
}
