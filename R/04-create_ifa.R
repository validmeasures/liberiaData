################################################################################
#
#' Function to create iron-folic acid coverage indicators
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
  ## Take IFA?
  ifa4 <- as.numeric(df$ifa4)
  ifa4 <- bbw::recode(ifa4, "2=0;99=0")
  ## How many days?
  ifa5 <- as.numeric(df$ifa5)
  ## Create IFA data.frame
  ifa <- data.frame(df[ , core.columns], ifa1, ifa2, ifa3, ifa4, ifa5)
  ##
  return(ifa)
}
