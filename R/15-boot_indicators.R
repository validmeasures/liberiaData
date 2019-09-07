################################################################################
#
#'
#' Apply blocked weighted bootstrap to indicator datasets
#'
#' A wrapper for \code{bootBW} function in \code{bbw} package.
#'
#' @param indicator A character vector of indicator data.frame names
#' @param w Population dataset
#' @param replicates Number of bootstrap replicates
#' @param core.columns A vector of variable names included in indicator
#'   data.frames
#'
#' @return A data.frame of indicator estimates with lower and upper confidence
#'   limits
#'
#' @examples
#' boot_estimate(indicator = "iycfDF", w = psuDataGM, replicates = 9)
#'
#' @export
#'
#
################################################################################

boot_estimate <- function(indicator = c("ifaDF", "iycfDF",
                                        "mnpDF", "vitDF",
                                        "screenDF",
                                        "anthroDF"),
                          w, replicates = 399,
                          core.columns = c("spid", "cid", "did", "eid",
                                           "motherID", "m2")) {
  ##
  bootResults <- vector(mode = "list", length = length(indicator))
  names(bootResults) <- indicator
  ##
  for(i in indicator) {
    currentDF <- get(i)
    ## Rename "eid" to psu
    colnames(currentDF)[4] <- "psu"
    ##
    params <- names(currentDF)[!names(currentDF) %in% core.columns]
    if(i == "anthroDF") {
      core.columns <- c(core.columns, "age", "sex", "position", "flag")
      params <- names(currentDF)[!names(currentDF) %in% core.columns]
    }
    ##
    outputColumns <- params
    ##
    temp <- bbw::bootBW(x = currentDF, w = w,
                        statistic = bbw::bootClassic,
                        params = params,
                        outputColumns = outputColumns,
                        replicates = 399)
    est <- apply(X = temp, MARGIN = 2, FUN = quantile, probs = c(0.5, 0.025, 0.975))
    est <- t(est)
    bootResults[[i]] <- data.frame(row.names(est), est)
  }
  return(bootResults)
}