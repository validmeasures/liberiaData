################################################################################
#
#'
#' Function to recode CMAM coverage indicators
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#' @param core.columns A vector of variable names to include in resulting
#'   data.frame
#'
#' @return A data.frame of recoded CMAM coverage indicators
#'
#' @examples
#' recode_cmam(df = coverageData.r2)
#'
#' @export
#'
#
################################################################################

recode_cmam <- function(df,
                        core.columns = c("spid", "cid", "did", "eid",
                                             "motherID", "m2")) {
  anthroDF <- recode_anthro(df = df)
  cin <- vector(mode = "numeric", length = nrow(df))
  cin[is.na(anthroDF$age)] <- NA
  cin[anthroDF$oedema == 0 & anthroDF$sam.whz == 0 & anthroDF$sam.muac == 0] <- NA
  cin[(anthroDF$oedema == 1 | anthroDF$sam.whz == 1 | anthroDF$sam.muac == 1) & df$in. == 1] <- 1

  cout <- vector(mode = "numeric", length = nrow(df))
  cout[is.na(anthroDF$age)] <- NA
  cout[anthroDF$oedema == 0 & anthroDF$sam.whz == 0 & anthroDF$sam.muac == 0] <- NA
  cout[(anthroDF$oedema == 1 | anthroDF$sam.whz == 1 | anthroDF$sam.muac == 1) & df$out == 1] <- 1

  rin <- vector(mode = "numeric", length = nrow(df))
  rin[is.na(anthroDF$age)] <- NA
  rin[anthroDF$oedema == 1 | anthroDF$sam.whz == 1 | anthroDF$sam.muac == 1] <- NA
  rin[anthroDF$oedema == 0 & anthroDF$sam.whz == 0 & anthroDF$sam.muac == 0 & df$recovering == 1] <- 1

  ## q1: Think child is sick?
  q1 <- bbw::recode(var = df$q1, recodes = "1=0;2=1")
  ## q1a: What condition is child suffering from?: malnutrition
  q1a <- vector(mode = "numeric", length = nrow(df))
  q1a[is.na(anthroDF$age)] <- NA
  q1a[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q1a[cin == 1 | rin == 1] <- NA
  q1a[df$q1a.1 == 1] <- 1
  q1a[df$q1a.1 == 2] <- 0
  ## q1b: What condition is child suffering from?: diarrhoea
  q1b <- vector(mode = "numeric", length = nrow(df))
  q1b[is.na(anthroDF$age)] <- NA
  q1b[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q1b[cin == 1 | rin == 1] <- NA
  q1b[df$q1a.2 == 1] <- 1
  q1b[df$q1a.2 == 2] <- 0
  ## q1c: What condition is child suffering from?: Fever
  q1c <- vector(mode = "numeric", length = nrow(df))
  q1c[is.na(anthroDF$age)] <- NA
  q1c[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q1c[cin == 1 | rin == 1] <- NA
  q1c[df$q1a.3 == 1] <- 1
  q1c[df$q1a.3 == 2] <- 0
  ## q1d: What condition is child suffering from?: Cough
  q1d <- vector(mode = "numeric", length = nrow(df))
  q1d[is.na(anthroDF$age)] <- NA
  q1d[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q1d[cin == 1 | rin == 1] <- NA
  q1d[df$q1a.4 == 1] <- 1
  q1d[df$q1a.4 == 2] <- 0
  ## q1e: What condition is child suffering from?: malaria
  q1e <- vector(mode = "numeric", length = nrow(df))
  q1e[is.na(anthroDF$age)] <- NA
  q1e[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q1e[cin == 1 | rin == 1] <- NA
  q1e[df$q1a.5 == 1] <- 1
  q1e[df$q1a.5 == 2] <- 0
  ## q1f: What condition is child suffering from?: Don't know
  q1f <- vector(mode = "numeric", length = nrow(df))
  q1f[is.na(anthroDF$age)] <- NA
  q1f[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q1f[cin == 1 | rin == 1] <- NA
  q1f[df$q1a.6 == 1] <- 1
  q1f[df$q1a.6 == 2] <- 0
  ## q2: Do you think your child is too thin or too small
  q2 <- bbw::recode(var = df$q2, recodes = "1=0;2=1")
  ## q3: Aware of treament
  q3 <- bbw::recode(var = df$q3, recodes = "1=0;2=1")
  ## q4a: Went to health centre but child was not measured
  q4a <- vector(mode = "numeric", length = nrow(df))
  q4a[is.na(anthroDF$age)] <- NA
  q4a[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4a[cin == 1 | rin == 1] <- NA
  q4a[df$q4.q4a == 1] <- 1
  q4a[df$q4.q4a == 2] <- 0
  ## q4b: Too far
  q4b <- vector(mode = "numeric", length = nrow(df))
  q4b[is.na(anthroDF$age)] <- NA
  q4b[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4b[cin == 1 | rin == 1] <- NA
  q4b[df$q4.q4b == 1] <- 1
  q4b[df$q4.q4b == 2] <- 0
  ## q4c: No time/too busy
  q4c <- vector(mode = "numeric", length = nrow(df))
  q4c[is.na(anthroDF$age)] <- NA
  q4c[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4c[cin == 1 | rin == 1] <- NA
  q4c[df$q4.q4c == 1] <- 1
  q4c[df$q4.q4c == 2] <- 0
  ## q4d: Mother/carer is sick
  q4d <- vector(mode = "numeric", length = nrow(df))
  q4d[is.na(anthroDF$age)] <- NA
  q4d[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4d[cin == 1 | rin == 1] <- NA
  q4d[df$q4.q4d == 1] <- 1
  q4d[df$q4.q4d == 2] <- 0
  ## q4e: Mother/carer cannot carry more than one child
  q4e <- vector(mode = "numeric", length = nrow(df))
  q4e[is.na(anthroDF$age)] <- NA
  q4e[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4e[cin == 1 | rin == 1] <- NA
  q4e[df$q4.q4e == 1] <- 1
  q4e[df$q4.q4e == 2] <- 0
  ## q4f: Mother/carer feels ashamed or shy about coming
  q4f <- vector(mode = "numeric", length = nrow(df))
  q4f[is.na(anthroDF$age)] <- NA
  q4f[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4f[cin == 1 | rin == 1] <- NA
  q4f[df$q4.q4f == 1] <- 1
  q4f[df$q4.q4f == 2] <- 0
  ## q4g: Security problems
  q4g <- vector(mode = "numeric", length = nrow(df))
  q4g[is.na(anthroDF$age)] <- NA
  q4g[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4g[cin == 1 | rin == 1] <- NA
  q4g[df$q4.q4g == 1] <- 1
  q4g[df$q4.q4g == 2] <- 0
  ## q4h: There is no one else to take care of the other siblings
  q4h <- vector(mode = "numeric", length = nrow(df))
  q4h[is.na(anthroDF$age)] <- NA
  q4h[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4h[cin == 1 | rin == 1] <- NA
  q4h[df$q4.q4h == 1] <- 1
  q4h[df$q4.q4h == 2] <- 0
  ## q4i: Child rejected by the programme
  q4i <- vector(mode = "numeric", length = nrow(df))
  q4i[is.na(anthroDF$age)] <- NA
  q4i[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4i[cin == 1 | rin == 1] <- NA
  q4i[df$q4.q4i == 1] <- 1
  q4i[df$q4.q4i == 2] <- 0
  ## q4j: Other parent's children have been rejected
  q4j <- vector(mode = "numeric", length = nrow(df))
  q4j[is.na(anthroDF$age)] <- NA
  q4j[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4j[cin == 1 | rin == 1] <- NA
  q4j[df$q4.q4j == 1] <- 1
  q4j[df$q4.q4j == 2] <- 0
  ## q4k: Husband refused
  q4k <- vector(mode = "numeric", length = nrow(df))
  q4k[is.na(anthroDF$age)] <- NA
  q4k[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4k[cin == 1 | rin == 1] <- NA
  q4k[df$q4.q4k == 1] <- 1
  q4k[df$q4.q4k == 2] <- 0
  ## q4l: Thought it was necessary to be enrolled at the hospital first
  q4l <- vector(mode = "numeric", length = nrow(df))
  q4l[is.na(anthroDF$age)] <- NA
  q4l[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4l[cin == 1 | rin == 1] <- NA
  q4l[df$q4.q4l == 1] <- 1
  q4l[df$q4.q4l == 2] <- 0
  ## q4m: Does not think the programme can help child/children
  q4m <- vector(mode = "numeric", length = nrow(df))
  q4m[is.na(anthroDF$age)] <- NA
  q4m[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4m[cin == 1 | rin == 1] <- NA
  q4m[df$q4.q4m == 1] <- 1
  q4m[df$q4.q4m == 2] <- 0
  ## q4n: Heard that children who took treatment got diarrhoea
  q4n <- vector(mode = "numeric", length = nrow(df))
  q4n[is.na(anthroDF$age)] <- NA
  q4n[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4n[cin == 1 | rin == 1] <- NA
  q4n[df$q4.q4n == 1] <- 1
  q4n[df$q4.q4n == 2] <- 0
  ## q4o: Heard that ration has worms
  q4o <- vector(mode = "numeric", length = nrow(df))
  q4o[is.na(anthroDF$age)] <- NA
  q4o[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4o[cin == 1 | rin == 1] <- NA
  q4o[df$q4.q4o == 1] <- 1
  q4o[df$q4.q4o == 2] <- 0
  ## q4p: Out of stock
  q4p <- vector(mode = "numeric", length = nrow(df))
  q4p[is.na(anthroDF$age)] <- NA
  q4p[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4p[cin == 1 | rin == 1] <- NA
  q4p[df$q4.q4p == 1] <- 1
  q4p[df$q4.q4p == 2] <- 0
  ## q4q: Lack of money to pay for transport
  q4q <- vector(mode = "numeric", length = nrow(df))
  q4q[is.na(anthroDF$age)] <- NA
  q4q[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4q[cin == 1 | rin == 1] <- NA
  q4q[df$q4.q4q == 1] <- 1
  q4q[df$q4.q4q == 2] <- 0
  ## q4r: SAM case in SFP
  q4r <- vector(mode = "numeric", length = nrow(df))
  q4r[is.na(anthroDF$age)] <- NA
  q4r[is.na(cin) | is.na(cout) | is.na(rin)] <- NA
  q4r[cin == 1 | rin == 1] <- NA
  q4r[df$q4.q4r == 1] <- 1
  q4r[df$q4.q4r == 2] <- 0
  ##
  cmamDF <- data.frame(df[ , core.columns], cin, cout, rin,
                       q1, q1a, q1b, q1c, q1d, q1e, q1f,
                       q2, q3,
                       q4a, q4b, q4c, q4d, q4e, q4f, q4g, q4h, q4i, q4j,
                       q4k, q4l, q4m, q4n, q4o, q4p, q4q, q4r)
  cmamDF1 <- cmamDF[cmamDF$cid == 1, ]
  ##
  cmamDF1 <- aggregate(x = cmamDF1[ , c("cin", "cout", "rin",
                                        "q1", "q1a", "q1b", "q1c", "q1d", "q1e", "q1f",
                                        "q2", "q3",
                                        "q4a", "q4b", "q4c", "q4d", "q4e", "q4f", "q4g",
                                        "q4h", "q4i", "q4j", "q4k", "q4l", "q4m", "q4n",
                                        "q4o", "q4p", "q4q", "q4r")],
                      by = list(cmamDF1$spid), FUN = sum, na.rm = TRUE)
  ##
  cmamDF2 <- cmamDF[cmamDF$cid == 2, ]
  ##
  cmamDF2 <- aggregate(x = cmamDF2[ , c("cin", "cout", "rin",
                                        "q1", "q1a", "q1b", "q1c", "q1d", "q1e", "q1f",
                                        "q2", "q3",
                                        "q4a", "q4b", "q4c", "q4d", "q4e", "q4f", "q4g",
                                        "q4h", "q4i", "q4j", "q4k", "q4l", "q4m", "q4n",
                                        "q4o", "q4p", "q4q", "q4r")],
                       by = list(cmamDF2$spid), FUN = sum, na.rm = TRUE)
  ##
  cmamDF <- data.frame(rbind(cbind(cid = 1, cmamDF1), cbind(cid = 2, cmamDF2)))
  ##
  names(cmamDF) <- c("cid", "spid", "cin", "cout", "rin",
                     "q1", "q1a", "q1b", "q1c", "q1d", "q1e", "q1f",
                     "q2", "q3",
                     "q4a", "q4b", "q4c", "q4d", "q4e", "q4f", "q4g",
                     "q4h", "q4i", "q4j", "q4k", "q4l", "q4m", "q4n",
                     "q4o", "q4p", "q4q", "q4r")
  ##
  cf <- squeacr::calculate_cf(cin = cmamDF$cin, cout = cmamDF$cout)
  ##
  tc <- squeacr::calculate_tc(cin = cmamDF$cin, cout = cmamDF$cout,
                              rin = cmamDF$rin, k = 3)
  ##
  cmamDF <- data.frame(cmamDF, cf, tc)
  ##
  return(cmamDF)
}
