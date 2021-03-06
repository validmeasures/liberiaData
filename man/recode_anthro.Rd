% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/09-recode_anthro.R
\name{recode_anthro}
\alias{recode_anthro}
\title{Function to recode child anthropometric indicators and calculate
anthropometric z-scores}
\usage{
recode_anthro(
  df,
  core.columns = c("spid", "cid", "did", "eid", "motherID", "m2"),
  flag = TRUE,
  cases = TRUE
)
}
\arguments{
\item{df}{A coverage data.frame collected for the Liberia Coverage Survey}

\item{core.columns}{A vector of variable names to include in resulting
data.frame}

\item{flag}{Logical. Should WHO flagging criteria be applied to the z-scores?
Default is TRUE.}

\item{cases}{Logical. Should cases of child undernutrition be assessed?
Default is TRUE.}
}
\value{
A data.frame of recoded anthropometric measurements and z-scores
}
\description{
Function to recode child anthropometric indicators and calculate
anthropometric z-scores
}
\examples{
recode_anthro(df = coverageData.r2)

}
