% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/09-recode_anthro.R
\name{recode_muac}
\alias{recode_muac}
\title{Function to recode MUAC variable}
\usage{
recode_muac(df)
}
\arguments{
\item{df}{A coverage data.frame collected for the Liberia Coverage Survey}
}
\value{
A vector of recoded MUACs based on any re-testing done
}
\description{
Function to recode MUAC variable
}
\examples{

recode_muac(df = coverageData.r2)

}
