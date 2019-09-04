################################################################################
#
#' Liberia Coverage Survey Data Round 2
#'
#' @format A data.frame with 134 columns
#'
#' * `sdate` - Date of data collection
#' * `cid` - County identifier
#' * `county` - County name
#' * `did` - District identifier
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"coverageData.r2"


################################################################################
#
#' Liberia Coverage Survey Data Round 2 - main form
#'
#' @format A data.frame with 69 columns
#'
#' * `sdate` - Date of data collection
#' * `cid` - County identifier
#' * `county` - County name
#' * `did` - District identifier
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"coverageData1.r2"


################################################################################
#
#' Liberia Coverage Survey Data Round 2 - repeat form
#'
#' @format A data.frame with 65 columns
#'
#' * `sdate` - Date of data collection
#' * `cid` - County identifier
#' * `county` - County name
#' * `did` - District identifier
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"coverageData2.r2"


################################################################################
#
#' Liberia Coverage Survey Village Data Round 2
#'
#' @format A data.frame with 11 columns
#'
#' * `cid` - County identifier
#' * `county` - County name
#' * `did` - District identifier
#' * `eid` - Enumerator identifier
#' * `lat` - Provided latitude coordinate
#' * `lon` - Provided longitude coordinate
#' * `pop` - Population
#' * `coords.Latitude` - Recorded latitude coordinate
#' * `coords.Longitude` - Recorded longitude coordinate
#' * `coords.Altitude` - Recorded altitude
#' * `coords.Accuracy` - Accuracy of coordinates recording
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"villageData.r2"


################################################################################
#
#' Liberia Coverage Survey data codebook
#'
#' @format A tibble with 3 columns and 152 rows:
#'
#' * `variable` - Variable name
#' * `question` - Question or data assigned to `variable`
#' * `choices` - Possible responses for specific `variable`
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"codebook"


################################################################################
#
#' Liberia Coverage Survey sample list
#'
#' @format A data.frame of with 23 columns and 178 rows:
#'
#' * `spid` - Sampling point identifier
#' * `CCNAME` - County name
#' * `DNAME` - District name
#' * `CLNAME` - Clan name
#' * `FEACODE` - Enumeration area code
#' * `SAREA` - Sampling area code
#' * `EFEACODE` - Enumeration area code
#' * `CCODE` - County code
#' * `DCODE` - District code
#' * `CLCODE` - Clan code
#' * `EACODE` - Enumeration area code
#' * `TOTAL` - Total population
#' * `MALE` - Male population
#' * `FEMALE` - Female population
#' * `HH` - Number of households
#' * `CCODE1` - County code
#' * `DCODE1` - District code
#' * `CLCODE1` - Clan code
#' * `EACODE1` - Enumeration area code
#' * `lon` - Longitude coordinate of centroid of enumeration area
#' * `lat` - Latitude coordinate of centroid of enumeration area
#' * `d` - Distance from centroid of grid
#' * `gmap` - Google maps link
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"sampleList.r2"


