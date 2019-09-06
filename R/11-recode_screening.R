################################################################################
#
#'
#' Function to recode nutrition screening coverage indicators
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#' @param core.columns A vector of variable names to include in resulting
#'   data.frame
#'
#' @return A data.frame of recoded nutrition screening coverage indicators
#'
#' @examples
#' recode_screening(df = coverageData.r2)
#'
#' @export
#'
#
################################################################################

recode_screening <- function(df,
                             core.columns = c("spid", "cid", "did", "eid",
                                              "motherID", "m2")) {
  muac.screen <- bbw::recode(var = df$muac_screen, recodes = "2=0;99=0")
  oedema.screen <- bbw::recode(var = df$oedema_screen, recodes = "2=0;99=0")
  weight.screen <- bbw::recode(var = df$weight_screen, recodes = "2=0;99")
  height.screen <- bbw::recode(var = df$height_screen, recodes = "2=0;99=0")

  screenDF <- data.frame(df[ , core.columns], muac.screen, oedema.screen,
                         weight.screen, height.screen)
  return(screenDF)
}
