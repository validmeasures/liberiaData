################################################################################
#
#' Function to recode vitamin A supplementation coverage indicators
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#' @param core.columns A vector of variable names to include in resulting
#'   data.frame
#' @param ls A list of thematically named string pattern vectors to use for
#'   searching and organising `others` responses for vit1a
#'
#' @return A data.frame of vitamin A supplementation coverage indicators
#'
#' @examples
#' \dontrun{
#' ifa3d <- c("delivery", "hospital", "constantly") # Did not go to hospital
#' ifa3e <- c("know") # Don't know about the tablets
#' ifa3f <- c("any", "go") # Didn't get any tablets
#' ifa3g <- c("given") # Was given but never took it
#' ifa3h <- c("interest", "interested", "Not") # Not interested
#' ifa3i <- c("Reasons") # No reasons
#' ls1 <- list(ifa3d, ifa3e, ifa3f, ifa3g, ifa3h, ifa3i)
#' names(ls1) <- paste("ifa3", letters[4:9], sep = "")
#' recode_ifa(df = coverageData.r2, ls1 = ls1)
#' }
#'
#' @export
#'
#
################################################################################

recode_vita <- function(df,
                        core.columns = c("spid", "cid", "did", "eid",
                                         "motherID", "m2"),
                        ls = NULL) {
  ## Receive vitamin A in past 6 months?
  vit1 <- as.numeric(df$vit1)
  vit1 <- bbw::recode(vit1, "2=0;99=0")

  ######################## recode others vit1a #################################

  ## Reasons: Health centre ran out
  vit1a <- as.numeric(df$vita.1)
  vit1a[is.na(df$vit1)] <- NA
  vit1a[df$vit1 == 1] <- NA
  ## Reasons: Took too long to get drops
  vit1b <- as.numeric(df$vit1a.2)
  vit1b[df$vit1 == 1] <- NA
  vit1b[is.na(df$vit1)] <- NA
  ## Reasons: Child doesn't need it
  vit1c <- as.numeric(df$vit1a.3)
  vit1c[is.na(df$vit1)] <- NA
  vit1c[df$vit1 == 1] <- NA
  ## Reasons: Heard it doesn't work/help
  vit1d <- as.numeric(df$vit1a.4)
  vit1d[is.na(df$vit1)] <- NA
  vit1d[df$vit1 == 1] <- NA

  if(length(table(df[["vit1a_other"]])) != 0 | !is.null(ls)) {
    vit1a_other <- data.frame(vit1a, vit1b, vit1c, vit1d,
                              recode_others(df = df, var = "vit1a_other",
                                            ls = ls, label = names(ls)))
    vit1a_other[is.na(df$vit1) | df$vit1 == 1, ] <- NA
  } else {
    vit1a_other <- data.frame(vit1a, vit1b, vit1c, vit1d)
  }

  ##############################################################################

  ## Create vitamin A data.frame
  vit <- data.frame(df[ , core.columns], vit1, vit1a_other)
  ##
  return(vit)
}
