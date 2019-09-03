################################################################################
#
#' Function to recode iron-folic acid coverage indicators
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#' @param core.columns A vector of variable names to include in resulting
#'   data.frame
#'
#' @return A data.frame of iron-folic acid coverage indicators
#'
#' @examples
#' calculate_ifa(df = coverageData2)
#'
#' @export
#'
#
################################################################################

calculate_ifa <- function(df, core.columns = c("cid", "did", "eid", "m2")) {
  ## Go to antenatal care?
  ifa1 <- as.numeric(df$ifa1)
  ifa1 <- bbw::recode(ifa1, "2=0;99=0")
  ## Received information about IFA?
  ifa2 <- as.numeric(df$ifa2)
  ifa2 <- bbw::recode(ifa2, "2=0;99=0")
  ## Receive/purchase IFA?
  ifa3 <- as.numeric(df$ifa3)
  ifa3 <- bbw::recode(ifa3, "2=0;99=0")
  ## Reasons: Health centre ran out
  ifa3a <- as.numeric(df$ifa3a.1)
  ifa3a[is.na(df$ifa1)] <- NA
  ## Reasons: Took too long to get tablets
  ifa3b <- as.numeric(df$ifa3a.2)
  ifa3b[is.na(df$ifa1)] <- NA
  ## Reasons: Too expensive
  ifa3c <- as.numeric(df$ifa3a.3)
  ifa3c[is.na(df$ifa1)] <- NA
  ## Take IFA?
  ifa4 <- as.numeric(df$ifa4)
  ifa4 <- bbw::recode(ifa4, "2=0;99=0")
  ## Reasons: Concerns about side effects
  ifa4a <- as.numeric(df$ifa4a.1)
  ifa4a[is.na(df$ifa1)] <- NA
  ## Reasons: Don't need it
  ifa4b <- as.numeric(df$ifa4a.2)
  ifa4b[is.na(df$ifa1)] <- NA
  ## Reasons: I was told not to take it
  ifa4c <- as.numeric(df$ifa4a.3)
  ifa4c[is.na(df$ifa1)] <- NA
  ## Reasons: I don't think it helps
  ifa4d <- as.numeric(df$ifa4a.4)
  ifa4d[is.na(df$ifa1)] <- NA
  ## How many days?
  ifa5 <- as.numeric(df$ifa5)
  ## Create IFA data.frame
  ifa <- data.frame(df[ , core.columns], ifa1, ifa2, ifa3, ifa3a, ifa3b, ifa3c,
                    ifa4, ifa4a, ifa4b, ifa4c, ifa4d, ifa5)
  ##
  return(ifa)
}
