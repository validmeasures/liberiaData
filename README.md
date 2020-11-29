
<!-- README.md is generated from README.Rmd. Please edit that file -->

# liberiaData: Liberia Coverage Survey Data Handler

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/validmeasures/liberiaData.svg?branch=master)](https://travis-ci.org/validmeasures/liberiaData)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/validmeasures/liberiaData?branch=master&svg=true)](https://ci.appveyor.com/project/validmeasures/liberiaData)
<!-- badges: end -->

The Liberia Coverage Survey for the assessment of *CMAM coverage*,
*micronutrient powder supplementation coverage*, *vitamin A
supplementation coverage*, *iron folic acid supplementation coverage*
and *IYCF counselling coverage* has been commissioned by [UNICEF
Liberia](https://www.unicef.org/liberia/) with funding from [Power of
Nutrition](https://www.powerofnutrition.org). In support of this survey,
this package for data manipulation, processing and analysis has been
developed.

## Installation

<!-- You can install the released version of liberiaData from [CRAN](https://CRAN.R-project.org) with: -->

You can install the development version of `liberiaData` from
[GitHub](https://github.com/validmeasures/liberiaData) with:

``` r
if(!require(remotes)) install.packages("remotes")
remotes::install_github("validmeasures/liberiaData")
```

## Usage

The `liberiaData` package has 4 sets of functions that perform the
following tasks:

### **Data management**

These functions interface with the server that holds the collected raw
data from the survey conducted. The server is an [Open Data
Kit](https://getodk.org) Aggregate server. Two functions fall under this
task. The first is `get_liberia_data()` which is a wrapper function to
functions in the `odkr` package (see
[repository](https://github.com/rapidsurveys/odkr)) for pulling forms
from the server and exporting the forms into datasets. The second is a
utility function called `merge_repeats()` that merges data from nested
forms within the main forms into the main dataset.

### **Data processing**

The next set of functions process the raw data to be usable for
analysis. These functions are primarily *recode* functions (functions
beginning with `recode_` followed by a descriptor of what the function
processes) specific to the various indicators in the survey.

In addition to the `recode_*` functions, there are also a couple of
spatial data processing functions (`create_sp()` and `get_spid()`) that
transform datasets into spatial class formats needed for spatial
analysis.

For a detailed description of the indicators in this survey and their
definitions, see the section on indicators in the survey’s design
document [here](https://validmeasures.org/liberiaS3M/indicators.html)

### **Data analysis**

The next set of functions are the analysis functions. First are the
estimator functions to report results for the whole survey area. Two
types of estimation are performed for specific types of indicators. A
classic unweighted estimator (`estimate_classic()`) is used to estimate
the coverage of the Integrated Management of Acute Malnutrition (IMAM)
while for all other indicators a weighted bootstrap estimator
(`boot_estimate()`) is used. We use the `bbw` package (see
[repository](https://github.com/rapidsurveys/bbw)) to apply a *blocked
weighted bootstrap* estimator as our survey sample is not priorly
weighted.

Second is the spatial interpolation function
(`interpolate_indicators()`) which is a wrapper to the `gstat` package
function for inverse distance weighting (IDW) interpolation.

For a detailed description of the analysis approach for this survey, see
the section on analysis in the survey’s design document
[here](https://validmeasures.org/liberiaS3M/data.html).

### **Reporting**

The `liberiaData` package has a function (`run_dashboard()`) that runs
an embedded Shiny application to demonstrate the preliminary output of
the analysis.

## Data analysis workflow and replication data

The `liberiaData` package contains all the R scripts used to perform the
different steps described above. These scripts can be found in the
*data-raw* folder - *data.R* contains the script for pulling the data
from server, cleaning, recoding and then analysis.; *maps.R* contains
the script for spatial interpolation.

All outputs were then exported as package data (*.rda* format) found in
the *data* folder.

This package was used to produce the final report using Rmarkdown which
can be found in this
[repository](https://github.com/validmeasures/liberiaCoverageReport).
