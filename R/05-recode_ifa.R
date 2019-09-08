################################################################################
#
#' Function to recode iron-folic acid coverage indicators
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#' @param core.columns A vector of variable names to include in resulting
#'   data.frame
#' @param ls1 A list of thematically named string pattern vectors to use for
#'   searching and organising `others` responses for ifa3a
#' @param ls2 A list of thematically named string pattern vectors to use for
#'   searching and organising `others` responses for ifa4a
#'
#' @return A data.frame of iron-folic acid coverage indicators
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
#' recode_ifa(df = coverageData.r2, ls1 = ls1)
#'
#' @export
#'
#
################################################################################

recode_ifa <- function(df,
                       core.columns = c("spid", "cid", "did", "eid",
                                        "motherID", "m2"),
                       ls1 = NULL, ls2 = NULL) {
  ## Go to antenatal care?
  ifa1 <- as.numeric(df$ifa1)
  ifa1 <- bbw::recode(ifa1, "2=0;99=0")
  ## Received information about IFA?
  ifa2 <- as.numeric(df$ifa2)
  ifa2 <- bbw::recode(ifa2, "2=0;99=0")
  ## Receive/purchase IFA?
  ifa3 <- as.numeric(df$ifa3)
  ifa3 <- bbw::recode(ifa3, "2=0;99=0")

  ######################## recode others ifa3a #################################

  ## Reasons: Health centre ran out
  ifa3a <- as.numeric(df$ifa3a.1)
  ifa3a[is.na(df$ifa1)] <- NA
  ifa3a[ifa3 == 1] <- NA
  ## Reasons: Took too long to get tablets
  ifa3b <- as.numeric(df$ifa3a.2)
  ifa3b[is.na(df$ifa1)] <- NA
  ifa3b[ifa3 == 1] <- NA
  ## Reasons: Too expensive
  ifa3c <- as.numeric(df$ifa3a.3)
  ifa3c[is.na(df$ifa1)] <- NA
  ifa3c[ifa3 == 1] <- NA

  if(length(table(df[["ifa3a_other"]])) != 0 | !is.null(ls1)) {
    ifa3a_other <- data.frame(ifa3a, ifa3b, ifa3c,
                               recode_others(df = df, var = "ifa3a_other",
                                             ls = ls1, label = names(ls1)))
    ifa3a_other[is.na(df$ifa1) | df$ifa3 == 1, ] <- NA
  } else {
    ifa3a_other <- data.frame(ifa3a, ifa3b, ifa3c)
  }

  ##############################################################################

  ## Take IFA?
  ifa4 <- as.numeric(df$ifa4)
  ifa4 <- bbw::recode(ifa4, "2=0;99=0")
  ifa4[ifa3 == 0] <- 0

  ######################## recode others ifa4a #################################

  ## Reasons: Concerns about side effects
  ifa4a <- as.numeric(df$ifa4a.1)
  ifa4a[is.na(df$ifa1)] <- NA
  ifa4a[ifa4 == 1] <- NA
  ## Reasons: Don't need it
  ifa4b <- as.numeric(df$ifa4a.2)
  ifa4b[is.na(df$ifa1)] <- NA
  ifa4b[ifa4 == 1] <- NA
  ## Reasons: I was told not to take it
  ifa4c <- as.numeric(df$ifa4a.3)
  ifa4c[is.na(df$ifa1)] <- NA
  ifa4c[ifa4 == 1] <- NA
  ## Reasons: I don't think it helps
  ifa4d <- as.numeric(df$ifa4a.4)
  ifa4d[is.na(df$ifa1)] <- NA
  ifa4d[ifa4 == 1] <- NA

  if(length(table(df[["ifa4a_other"]])) != 0 | !is.null(ls2)) {
    ifa4a_other <- data.frame(ifa4a, ifa4b, ifa4c, ifa4d,
                              recode_others(df = df, var = "ifa4a_other",
                                            ls = ls2, label = names(ls2)))
    ifa4a_other[is.na(df$ifa1) | df$ifa4 == 1, ] <- NA
  } else {
    ifa4a_other <- data.frame(ifa4a, ifa4b, ifa4c, ifa4d)
  }

  ##############################################################################

  ## How many days?
  ifa5 <- as.numeric(df$ifa5)
  ## 90 days or more
  ifa6 <- bbw::recode(ifa5, "90:hi=1;NA=NA;else=0")
  ## 180 days
  ifa7 <- bbw::recode(ifa5, "180=1;NA=NA;else=0")
  ## Create IFA data.frame
  ifa <- data.frame(df[ , core.columns], ifa1, ifa2, ifa3, ifa3a_other,
                    ifa4, ifa4a_other, ifa5, ifa6, ifa7)
  ##
  return(ifa)
}
