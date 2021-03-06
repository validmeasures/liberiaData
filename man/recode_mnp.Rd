% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/07-recode_mnp.R
\name{recode_mnp}
\alias{recode_mnp}
\title{Function to recode micronutrient powder coverage indicators}
\usage{
recode_mnp(
  df,
  core.columns = c("spid", "cid", "did", "eid", "motherID", "m2"),
  ls1 = NULL,
  ls2 = NULL
)
}
\arguments{
\item{df}{A coverage data.frame collected for the Liberia Coverage Survey}

\item{core.columns}{A vector of variable names to include in resulting
data.frame}

\item{ls1}{A list of thematically named string pattern vectors to use for
searching and organising `others` responses for mnp2a}

\item{ls2}{A list of thematically named string pattern vectors to use for
searching and organising `others` responses for mnp2a}
}
\value{
A data.frame of iron-folic acid coverage indicators
}
\description{
Function to recode micronutrient powder coverage indicators
}
\examples{
\dontrun{
mnp2d <- c("delivery", "hospital", "constantly") # Did not go to hospital
mnp2e <- c("know") # Don't know about the tablets
mnp2f <- c("any", "go") # Didn't get any tablets
mnp2g <- c("given") # Was given but never took it
mnp2h <- c("interest", "interested", "Not") # Not interested
mnp2i <- c("Reasons") # No reasons
ls1 <- list(mnp2d, mnp2e, mnp2f, mnp2g, mnp2h, mnp2i)
names(ls1) <- paste("mnp2", letters[4:9], sep = "")
recode_mnp(df = coverageData.r2, ls1 = ls1)
}

}
