################################################################################
#
#' Function to recode micronutrient powder coverage indicators
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#' @param core.columns A vector of variable names to include in resulting
#'   data.frame
#' @param ls1 A list of thematically named string pattern vectors to use for
#'   searching and organising `others` responses for mnp2a
#' @param ls2 A list of thematically named string pattern vectors to use for
#'   searching and organising `others` responses for mnp2a
#'
#' @return A data.frame of iron-folic acid coverage indicators
#'
#' @examples
#' \dontrun{
#' mnp2d <- c("delivery", "hospital", "constantly") # Did not go to hospital
#' mnp2e <- c("know") # Don't know about the tablets
#' mnp2f <- c("any", "go") # Didn't get any tablets
#' mnp2g <- c("given") # Was given but never took it
#' mnp2h <- c("interest", "interested", "Not") # Not interested
#' mnp2i <- c("Reasons") # No reasons
#' ls1 <- list(mnp2d, mnp2e, mnp2f, mnp2g, mnp2h, mnp2i)
#' names(ls1) <- paste("mnp2", letters[4:9], sep = "")
#' recode_mnp(df = coverageData.r2, ls1 = ls1)
#' }
#'
#' @export
#'
#
################################################################################

recode_mnp <- function(df,
                       core.columns = c("spid", "cid", "did", "eid",
                                        "motherID", "m2"),
                       ls1 = NULL, ls2 = NULL) {
  ## Heard/seen MNP?
  mnp1 <- as.numeric(df$mnp1)
  mnp1 <- bbw::recode(mnp1, "2=0;99=0")
  ## Received/bought MNP?
  mnp2 <- as.numeric(df$mnp2)
  mnp2 <- bbw::recode(mnp2, "2=0;99=0")

  ######################## recode others mnp2a #################################

  ## Reasons: Health centre ran out
  mnp2a <- as.numeric(df$mnp2a.1)
  mnp2a[is.na(df$mnp1)] <- NA
  ## Reasons: Took too long to get MNP
  mnp2b <- as.numeric(df$mnp2a.2)
  mnp2b[is.na(df$mnp1)] <- NA
  ## Reasons: Too expensive
  mnp2c <- as.numeric(df$mnp2a.3)
  mnp2c[is.na(df$mnp1)] <- NA
  ## Reasons: Child doesn't need it
  mnp2d <- as.numeric(df$mnp2a.4)
  mnp2d[is.na(df$mnp1)] <- NA
  ## Reasons: Heard it doesn't work/help
  mnp2e <- as.numeric(df$mnp2a.5)
  mnp2e[is.na(df$mnp1)] <- NA

  if(length(table(df[["mnp2a_other"]])) != 0 | !is.null(ls1)) {
    mnp2a_other <- data.frame(mnp2a, mnp2b, mnp2c, mnp2d, mnp2e,
                              recode_others(df = df, var = "mnp2a_other",
                                            ls = ls1, label = names(ls1)))
    mnp2a_other[is.na(df$mnp1), ] <- NA
  } else {
    mnp2a_other <- data.frame(mnp2a, mnp2b, mnp2c, mnp2d, mnp2e)
  }

  ##############################################################################

  ## Take mnp?
  mnp3 <- as.numeric(df$mnp3)
  mnp3 <- bbw::recode(mnp3, "2=0;99=0")

  ######################## recode others mnp3a #################################

  ## Reasons: Too expensive
  mnp3a <- as.numeric(df$mnp3a.1)
  mnp3a[is.na(df$mnp1)] <- NA
  ## Reasons: Not availabe in the market
  mnp3b <- as.numeric(df$mnp3a.2)
  mnp3b[is.na(df$mnp1)] <- NA
  ## Reasons: Do not need MNP
  mnp3c <- as.numeric(df$mnp3a.3)
  mnp3c[is.na(df$mnp1)] <- NA
  ## Reasons: Heard other's bad experience
  mnp3d <- as.numeric(df$mnp3a.4)
  mnp3d[is.na(df$mnp1)] <- NA
  ## Reasons: Advised not to use it
  mnp3e <- as.numeric(df$mnp3a.5)
  mnp3e[is.na(df$mnp1)] <- NA
  ## Reasons: Not seen other mothers us it
  mnp3f <- as.numeric(df$mnp3a.6)
  mnp3f[is.na(df$mnp1)] <- NA
  ## Reasons: Don't trust the product
  mnp3g <- as.numeric(df$mnp3a.7)
  mnp3g[is.na(df$mnp1)] <- NA
  ## Reasons: Using another product
  mnp3h <- as.numeric(df$mnp3a.8)
  mnp3h[is.na(df$mnp1)] <- NA
  ## Reasons: Haven't seen it
  mnp3i <- as.numeric(df$mnp3a.9)
  mnp3i[is.na(df$mnp1)] <- NA

  if(length(table(df[["mnp3a_other"]])) != 0 | !is.null(ls2)) {
    mnp3a_other <- data.frame(mnp3a, mnp3b, mnp3c, mnp3d, mnp3e, mnp3f, mnp3g, mnp3h, mnp3i,
                              recode_others(df = df, var = "mnp3a_other",
                                            ls = ls2, label = names(ls2)))
    mnp3a_other[is.na(df$mnp1), ] <- NA
  } else {
    mnp3a_other <- data.frame(mnp3a, mnp3b, mnp3c, mnp3d, mnp3e, mnp3f, mnp3g, mnp3h, mnp3i)
  }

  ##############################################################################

  ## How many times did child eat MNP in the past week?
  mnp4 <- as.numeric(df$mnp4)
  ## Create mnp data.frame
  mnp <- data.frame(df[ , core.columns], mnp1, mnp2, mnp2a_other,
                    mnp3, mnp3a_other, mnp4)
  ##
  return(mnp)
}
