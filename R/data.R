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


################################################################################
#
#' Iron-folic acid (IFA) indicator set
#'
#' @format A data.frame with 25 columns:
#'
#' * `cid` - County identifier. 1 = Urban Montserrado; 2 = Grand Bassa
#' * `did` - District identifier
#' * `eid` - Enumeration area identifier
#' * `motherID` - Mother identifier
#' * `m2` - Mother age
#' * `ifa1` - Go to antenatal care?
#' * `ifa2` - Received information about IFA?
#' * `ifa3` - Received/purchased IFA?
#' * `ifa3a` - Reasons: Health centre ran out
#' * `ifa3b` - Reasons: Took too long to get tablets
#' * `ifa3c` - Too expensive
#' * `ifa3d` - Did not go to hospital
#' * `ifa3e` - Don't know about the tablets
#' * `ifa3f` - Didn't get any tablets
#' * `ifa3g` - Was given but never took it
#' * `ifa3h` - Not interested
#' * `ifa3i` - No reason
#' * `ifa4` - Did you take IFA?
#' * `ifa4a` - Reasons: Concerns about side effects
#' * `ifa4b` - Reasons: Don't need it
#' * `ifa4c` - Reasons: I was told not to take it
#' * `ifa4d` - Reasons: I don't think it helps
#' * `ifa5` - How many days did you take IFA?
#' * `ifa6` - Took IFA for at least 90 days
#' * `ifa7` - Took IFA for 180 days
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"ifaDF"


################################################################################
#
#' Infant and Young Child Feeding (IYCF) counselling coverage
#'
#' @format A data.frame with 15 columns:
#'
#' * `cid` - County identifier. 1 = Urban Montserrado; 2 = Grand Bassa
#' * `did` - District identifier
#' * `eid` - Enumeration area identifier
#' * `motherID` - Mother identifier
#' * `m2` - Mother age
#' * `icf1` - Hear about IYCF counselling?
#' * `icf2` - Attend IYCF counselling?
#' * `icf2a` - Reasons: timing not convenient
#' * `icf2b` - Reasons: Not interested
#' * `icf2c` - Reasons: Do not trust counsellor
#' * `icf2d` - Reasons: Don't think I need it
#' * `icf2e` - Reasons: Did not go to hospital
#' * `icf2f` - Reasons: No one told me about it/not invited
#' * `icf2g` - Reasons: No time
#' * `icf3` - Received/purchased IFA?
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"iycfDF"
