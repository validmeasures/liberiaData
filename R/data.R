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
#' Liberia Coverage Survey sample list Round 2
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
#' Iron-folic acid (IFA) indicator set Round 2
#'
#' @format A data.frame with 25 columns:
#'
#' * `spid` - Sampling point identifier
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
#' Infant and Young Child Feeding (IYCF) counselling coverage Round 2
#'
#' @format A data.frame with 15 columns:
#'
#' * `spid` - Sampling point identifier
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


################################################################################
#
#' Micronutrient Powder (MNP) supplementation coverage Round 2
#'
#' @format A data.frame with 28 columns:
#'
#' * `spid` - Sampling point identifier
#' * `cid` - County identifier. 1 = Urban Montserrado; 2 = Grand Bassa
#' * `did` - District identifier
#' * `eid` - Enumeration area identifier
#' * `motherID` - Mother identifier
#' * `m2` - Mother age
#' * `mnp1` - Heard about MNP?
#' * `mnp2` - Received/purchased MNP?
#' * `mnp2a` - Reasons: Health centre ran out
#' * `mnp2b` - Reasons: Took too long to get MNP
#' * `mnp2c` - Reasons: Too expensive
#' * `mnp2d` - Reasons: Child doesn't need it
#' * `mnp2e` - Reasons: Heard it doesn't work/help
#' * `mnp2f` - Reasons: Don't know/not seen/not heard of MNP
#' * `mnp2g` - Reasons: Have not gone to hospital
#' * `mnp2h` - Reasons: Have not received any from hospital/centre
#' * `mnp2i` - Reasons: Hospital didn't tell me about it
#' * `mnp3` - Take MNP?
#' * `mnp3a` - Reasons: Too expensive
#' * `mnp3b` - Reasons: Not available in the market
#' * `mnp3c` - Reasons: Do not need MNP
#' * `mnp3d` - Reasons: Heard other's bad experience
#' * `mnp3e` - Reasons: Advised not to use it
#' * `mnp3f` - Reasons: Not seen other mothers use it
#' * `mnp3g` - Reasons: Don't trust the product
#' * `mnp3h` - Reasons: Using another product
#' * `mnp3i` - Reasons: Haven't seen it
#' * `mnp3j` - Reasons: Child refused to take it
#' * `mnp4` - How many times child ate MNP in the past week?
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"mnpDF"


################################################################################
#
#' Vitamin A supplementation coverage Round 2
#'
#' @format A data.frame with 16 columns:
#'
#' * `spid` - Sampling point identifier
#' * `cid` - County identifier. 1 = Urban Montserrado; 2 = Grand Bassa
#' * `did` - District identifier
#' * `eid` - Enumeration area identifier
#' * `motherID` - Mother identifier
#' * `m2` - Mother age
#' * `vit1` - Received vitamin A?
#' * `vit1a` - Reasons: Health centre ran out
#' * `vit1b` - Reasons: Took too long to get drops
#' * `vit1c` - Reasons: Child doesn't need it
#' * `vit1d` - Reasons: Heard it doesn't work/help
#' * `vit1e` - Reasons: Child too young during latest campaign
#' * `vit1f` - Reasons: Not around during last campaign
#' * `vit1g` - Reasons: Didn't hear/know about it
#' * `vit1h` - Reasons: Never been to hospital
#' * `vit1i` - Reasons: Vaccine team didn't come/reach
#' * `vit1j` - Reasons: Not interested
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"vitDF"


################################################################################
#
#' Child anthropometry indicators Round 2
#'
#' @format A data.frame with 28 columns:
#'
#' * `spid` - Sampling point identifier
#' * `cid` - County identifier. 1 = Urban Montserrado; 2 = Grand Bassa
#' * `did` - District identifier
#' * `eid` - Enumeration area identifier
#' * `motherID` - Mother identifier
#' * `m2` - Mother age
#' * `age` - Age of child in months
#' * `sex` - Sex of child. 1 = Male; 2 = Female
#' * `muac` - Mid-upper arm circumference (MUAC) of child in centimetres
#' * `height` - Height of child in centimetres
#' * `weight` - Weight of child in kilograms
#' * `oedema` - Does child have oedema? 1 = Yes; 2 = No
#' * `position` - Position of child on height measurement. 1 = standing; 2 = supine
#' * `waz` - Weight-for-age z-score
#' * `haz` - Height-for-age z-score
#' * `whz` - Weight-for-height z-score
#' * `flag` - Flag values based on WHO flagging criteria
#' * `global.haz` - Global stunting
#' * `moderate.haz` - Moderate stunting
#' * `severe.haz` - Severe stunting
#' * `global.waz` - Global underweight
#' * `moderate` - Moderate underweight
#' * `severe` - Severe underweight
#' * `gam.whz` - Global wasting by weight-for-height z-score
#' * `mam.whz` - Moderate wasting by weight-for-height z-score
#' * `sam.whz` - Severe wasting by weight-for-height z-score
#' * `gam.muac` - Global wasting by MUAC
#' * `mam.muac` - Moderate wasting by MUAC
#' * `sam.muac` - Severe wasting by MUAC
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"anthroDF"


################################################################################
#
#' Community-based Management of Acute Malnutrition (CMAM) coverage indicators
#' Round 2
#'
#' @format A data.frame with 35 columns:
#'
#' * `spid` - Sampling point identifier
#' * `cid` - County identifier. 1 = Urban Montserrado; 2 = Grand Bassa
#' * `did` - District identifier
#' * `eid` - Enumeration area identifier
#' * `motherID` - Mother identifier
#' * `m2` - Mother age
#' * `cin` - SAM case in programme
#' * `cout` - SAM case not in programme
#' * `rin` - Recovering case in programme
#' * `q1` - Is child sick?
#' * `q1a` - Child suffering from: malnutrition
#' * `q1b` - Child suffering from: diarrhoea
#' * `q1c` - Child suffering from: fever
#' * `q1d` - Child suffering from: cough
#' * `q1e` - Child suffering from: malaria
#' * `q1f` - Child suffering from: don't know
#' * `q2` - Do you think your child is too small?
#' * `q3` - Know of treatment
#' * `q4a` - Came to health centre but was not measured
#' * `q4b` - Too far
#' * `q4c` - No time/too busy
#' * `q4d` - Mother/carer is sick
#' * `q4e` - Cannot carry more than one child
#' * `q4f` - Feels ashamed about coming
#' * `q4g` - Security problems
#' * `q4h` - No one else to take care of other siblings
#' * `q4i` - Rejected by programme
#' * `q4j` - Other parent's children have been rejected
#' * `q4k` - Husband refused
#' * `q4l` - Thought necessary to be enrolled in hospital first
#' * `q4m` - Does not think programme can help children
#' * `q4n` - Got diarrhoea
#' * `q4o` - Ration has worms
#' * `q4p` - Out of stock
#' * `q4q` - Lack of money to pay for transport
#' * `q4r` - SAM case in SFP
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"cmamDF"


################################################################################
#
#' Greater Monrovia hexagonal grid map
#'
#' @format A SpatialPolygonsDataFrame of 8663 hexagons across Monrovia
#'
#'
#
################################################################################
"gmHexGrid"


################################################################################
#
#' Grand Bassa hexagonal grid map
#'
#' @format A SpatialPolygonsDataFrame of 8670 hexagons across Grand Bassa
#'
#'
#
################################################################################
"gbHexGrid"


################################################################################
#
#' Nutrition screening coverage indicators
#'
#' @format A data.frame with 10 columns:
#'
#' * `spid` - Sampling point identifier
#' * `cid` - County identifier. 1 = Urban Montserrado; 2 = Grand Bassa
#' * `did` - District identifier
#' * `eid` - Enumeration area identifier
#' * `motherID` - Mother identifier
#' * `m2` - Mother age
#' * `muac.screen` - Has child been measured with a MUAC tape in past month?
#' * `oedema.screen` - Has child been checked for oedema in the past month?
#' * `weight.screen` - Has child's weight been measured in the past month?
#' * `height.screen` - Has child's height been measured in the past month?
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"screenDF"
