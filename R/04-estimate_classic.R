################################################################################
#
#' Estimate proportion using classic estimator
#'
#' @param x Total number of successes
#' @param n Total number of tests
#' @param z z-value. Default is 1.96 for 95\% confidence interval
#'
#' @return A list containing the following components:
#' \item{\code{estimate}}{A vector with the sample proportions}
#' \item{\code{conf.int}}{A confidence interval for the true proportion}
#'
#' @examples
#'
#' estimate_classic(x = 50, n = 200)
#'
#' @export
#'
#
################################################################################

estimate_classic <- function(x, n, z = 1.96) {
  estimate <- x / n
  lowerCI  <- estimate - z * sqrt((estimate * (1 - estimate)) / (n ^ 2))
  upperCI  <- estimate + z * sqrt((estimate * (1 - estimate)) / (n ^ 2))
  conf.int <- c(lowerCI, upperCI)
  x <- list(estimate, conf.int)
  return(x)
}
