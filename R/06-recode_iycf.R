################################################################################
#
#' Function to recode IYCF counselling coverage indicators
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#' @param core.columns A vector of variable names to include in resulting
#'   data.frame
#' @param ls A list of thematically named string pattern vectors to use for
#'   searching and organising `others` responses for icf2a
#'
#' @return A data.frame of IYCF counselling coverage indicators
#'
#' @examples
#' icf2e <- c("delivery", "health", "hospital") # Did not go to hospital
#' icf2f <- c("Doctor", "invited", "talk", "counselling") # No one told me about it/not invited
#' icf2g <- c("time") # No time
#' ls <- list(icf2e, icf2f, icf2g)
#' names(ls) <- paste("icf2", letters[5:7], sep = "")
#' recode_iycf(df = coverageData1.r2, ls = ls)
#'
#' @export
#'
#
################################################################################

recode_iycf <- function(df,
                        core.columns = c("cid", "did", "eid",
                                         "motherID", "m2"),
                        ls = NULL) {
  ## Receive information/heard about IYCF counselling?
  icf1 <- as.numeric(df$icf1)
  icf1 <- bbw::recode(icf1, "2=0;99=0")
  ## Attend IYCF counselling?
  icf2 <- as.numeric(df$icf2)
  icf2 <- bbw::recode(icf2, "2=0;99=0")

  ######################## recode others ifa2a #################################

  ## Reasons: Timing was not convenient
  icf2a <- as.numeric(df$icf2a.1)
  icf2a[is.na(df$icf1)] <- NA
  ## Reasons: Not interested
  icf2b <- as.numeric(df$icf2a.2)
  icf2b[is.na(df$icf1)] <- NA
  ## Reasons: Do not trust counsellor
  icf2c <- as.numeric(df$icf2a.3)
  icf2c[is.na(df$icf1)] <- NA
  ## Reasons: Don't think I need it
  icf2d <- as.numeric(df$icf2a.4)
  icf2d[is.na(df$icf1)] <- NA

  if(length(table(df[["icf2a_other"]])) != 0 | !is.null(ls)) {
    icf2a_other <- data.frame(icf2a, icf2b, icf2c, icf2d,
                              recode_others(df = df, var = "icf2a_other",
                                            ls = ls, label = names(ls)))
    icf2a_other[is.na(df$icf1), ] <- NA
  } else {
    icf2a_other <- data.frame(icf2a, icf2b, icf2c, icf2d)
  }

  ##############################################################################

  ## Number of sessions attended
  icf3 <- as.numeric(df$icf3)
  icf3 <- bbw::recode(icf3, "2=0;99=0")

  ## Create ICF data.frame
  icf <- data.frame(df[ , core.columns], icf1, icf2, icf2a_other, icf3)
  ##
  return(icf)
}
