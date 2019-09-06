################################################################################
#
#' Liberia Coverage Survey Data Round 2
#'
#' @format A data.frame with 134 columns
#' \describe{
#'   \item{\code{sdate}}{Date of data collection}
#'   \item{\code{cid}}{County identifier}
#'   \item{\code{county}}{County name}
#'   \item{\code{did}}{District identifier}
#' }
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
#' \describe{
#'   \item{\code{sdate}}{Date of data collection}
#'   \item{\code{cid}}{County identifier}
#'   \item{\code{county}}{County name}
#'   \item{\code{did}}{District identifier}
#' }
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
#' \describe{
#'   \item{\code{sdate}}{Date of data collection}
#'   \item{\code{cid}}{County identifier}
#'   \item{\code{county}}{County name}
#'   \item{\code{did}}{District identifier}
#' }
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
#' \describe{
#'   \item{\code{cid}}{County identifier}
#'   \item{\code{county}}{County name}
#'   \item{\code{did}}{District identifier}
#'   \item{\code{eid}}{Enumerator identifier}
#'   \item{\code{lat}}{Provided latitude coordinate}
#'   \item{\code{lon}}{Provided longitude coordinate}
#'   \item{\code{pop}}{Population}
#'   \item{\code{coords.Latitude}}{Recorded latitude coordinate}
#'   \item{\code{coords.Longitude}}{Recorded longitude coordinate}
#'   \item{\code{coords.Altitude}}{Recorded altitude}
#'   \item{\code{coords.Accuracy}}{Accuracy of coordinates recording}
#' }
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
#' \describe{
#'   \item{\code{variable}}{Variable name}
#'   \item{\code{question}}{Question or data assigned to \code{variable}}
#'   \item{\code{choices}}{Possible responses for specific \code{variable}}
#'  }
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
#' \describe{
#'   \item{\code{spid}}{Sampling point identifier}
#'   \item{\code{CCNAME}}{County name}
#'   \item{\code{DNAME}}{District name}
#'   \item{\code{CLNAME}}{Clan name}
#'   \item{\code{FEACODE}}{Enumeration area code}
#'   \item{\code{SAREA}}{Sampling area code}
#'   \item{\code{EFEACODE}}{Enumeration area code}
#'   \item{\code{CCODE}}{County code}
#'   \item{\code{DCODE}}{District code}
#'   \item{\code{CLCODE}}{Clan code}
#'   \item{\code{EACODE}}{Enumeration area code}
#'   \item{\code{TOTAL}}{Total population}
#'   \item{\code{MALE}}{Male population}
#'   \item{\code{FEMALE}}{Female population}
#'   \item{\code{HH}}{Number of households}
#'   \item{\code{CCODE1}}{County code}
#'   \item{\code{DCODE1}}{District code}
#'   \item{\code{CLCODE1}}{Clan code}
#'   \item{\code{EACODE1}}{Enumeration area code}
#'   \item{\code{lon}}{Longitude coordinate of centroid of enumeration area}
#'   \item{\code{lat}}{Latitude coordinate of centroid of enumeration area}
#'   \item{\code{d}}{Distance from centroid of grid}
#'   \item{\code{gmap}}{Google maps link}
#' }
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
#' \describe{
#'   \item{\code{spid}}{Sampling point identifier}
#'   \item{\code{cid}}{County identifier. 1 = Urban Montserrado; 2 = Grand Bassa}
#'   \item{\code{did}}{District identifier}
#'   \item{\code{eid}}{Enumeration area identifier}
#'   \item{\code{motherID}}{Mother identifier}
#'   \item{\code{m2}}{Mother age}
#'   \item{\code{ifa1}}{Go to antenatal care?}
#'   \item{\code{ifa2}}{Received information about IFA?}
#'   \item{\code{ifa3}}{Received/purchased IFA?}
#'   \item{\code{ifa3a}}{Reasons: Health centre ran out}
#'   \item{\code{ifa3b}}{Reasons: Took too long to get tablets}
#'   \item{\code{ifa3c}}{Too expensive}
#'   \item{\code{ifa3d}}{Did not go to hospital}
#'   \item{\code{ifa3e}}{Don't know about the tablets}
#'   \item{\code{ifa3f}}{Didn't get any tablets}
#'   \item{\code{ifa3g}}{Was given but never took it}
#'   \item{\code{ifa3h}}{Not interested}
#'   \item{\code{ifa3i}}{No reason}
#'   \item{\code{ifa4}}{Did you take IFA?}
#'   \item{\code{ifa4a}}{Reasons: Concerns about side effects}
#'   \item{\code{ifa4b}}{Reasons: Don't need it}
#'   \item{\code{ifa4c}}{Reasons: I was told not to take it}
#'   \item{\code{ifa4d}}{Reasons: I don't think it helps}
#'   \item{\code{ifa5}}{How many days did you take IFA?}
#'   \item{\code{ifa6}}{Took IFA for at least 90 days}
#'   \item{\code{ifa7}}{Took IFA for 180 days}
#' }
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
#' \describe{
#'   \item{\code{spid}}{Sampling point identifier}
#'   \item{\code{cid}}{County identifier. 1 = Urban Montserrado; 2 = Grand Bassa}
#'   \item{\code{did}}{District identifier}
#'   \item{\code{eid}}{Enumeration area identifier}
#'   \item{\code{motherID}}{Mother identifier}
#'   \item{\code{m2}}{Mother age}
#'   \item{\code{icf1}}{Hear about IYCF counselling?}
#'   \item{\code{icf2}}{Attend IYCF counselling?}
#'   \item{\code{icf2a}}{Reasons: timing not convenient}
#'   \item{\code{icf2b}}{Reasons: Not interested}
#'   \item{\code{icf2c}}{Reasons: Do not trust counsellor}
#'   \item{\code{icf2d}}{Reasons: Don't think I need it}
#'   \item{\code{icf2e}}{Reasons: Did not go to hospital}
#'   \item{\code{icf2f}}{Reasons: No one told me about it/not invited}
#'   \item{\code{icf2g}}{Reasons: No time}
#'   \item{\code{icf3}}{Received/purchased IFA?}
#' }
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
#' \describe{
#'   \item{\code{spid}}{Sampling point identifier}
#'   \item{\code{cid}}{County identifier. 1 = Urban Montserrado; 2 = Grand Bassa}
#'   \item{\code{did}}{District identifier}
#'   \item{\code{eid}}{Enumeration area identifier}
#'   \item{\code{motherID}}{Mother identifier}
#'   \item{\code{m2}}{Mother age}
#'   \item{\code{mnp1}}{Heard about MNP?}
#'   \item{\code{mnp2}}{Received/purchased MNP?}
#'   \item{\code{mnp2a}}{Reasons: Health centre ran out}
#'   \item{\code{mnp2b}}{Reasons: Took too long to get MNP}
#'   \item{\code{mnp2c}}{Reasons: Too expensive}
#'   \item{\code{mnp2d}}{Reasons: Child doesn't need it}
#'   \item{\code{mnp2e}}{Reasons: Heard it doesn't work/help}
#'   \item{\code{mnp2f}}{Reasons: Don't know/not seen/not heard of MNP}
#'   \item{\code{mnp2g}}{Reasons: Have not gone to hospital}
#'   \item{\code{mnp2h}}{Reasons: Have not received any from hospital/centre}
#'   \item{\code{mnp2i}}{Reasons: Hospital didn't tell me about it}
#'   \item{\code{mnp3}}{Take MNP?}
#'   \item{\code{mnp3a}}{Reasons: Too expensive}
#'   \item{\code{mnp3b}}{Reasons: Not available in the market}
#'   \item{\code{mnp3c}}{Reasons: Do not need MNP}
#'   \item{\code{mnp3d}}{Reasons: Heard other's bad experience}
#'   \item{\code{mnp3e}}{Reasons: Advised not to use it}
#'   \item{\code{mnp3f}}{Reasons: Not seen other mothers use it}
#'   \item{\code{mnp3g}}{Reasons: Don't trust the product}
#'   \item{\code{mnp3h}}{Reasons: Using another product}
#'   \item{\code{mnp3i}}{Reasons: Haven't seen it}
#'   \item{\code{mnp3j}}{Reasons: Child refused to take it}
#'   \item{\code{mnp4}}{How many times child ate MNP in the past week?}
#' }
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
#' \describe{
#'   \item{\code{spid}}{Sampling point identifier}
#'   \item{\code{cid}}{County identifier. 1 = Urban Montserrado; 2 = Grand Bassa}
#'   \item{\code{did}}{District identifier}
#'   \item{\code{eid}}{Enumeration area identifier}
#'   \item{\code{motherID}}{Mother identifier}
#'   \item{\code{m2}}{Mother age}
#'   \item{\code{vit1}}{Received vitamin A?}
#'   \item{\code{vit1a}}{Reasons: Health centre ran out}
#'   \item{\code{vit1b}}{Reasons: Took too long to get drops}
#'   \item{\code{vit1c}}{Reasons: Child doesn't need it}
#'   \item{\code{vit1d}}{Reasons: Heard it doesn't work/help}
#'   \item{\code{vit1e}}{Reasons: Child too young during latest campaign}
#'   \item{\code{vit1f}}{Reasons: Not around during last campaign}
#'   \item{\code{vit1g}}{Reasons: Didn't hear/know about it}
#'   \item{\code{vit1h}}{Reasons: Never been to hospital}
#'   \item{\code{vit1i}}{Reasons: Vaccine team didn't come/reach}
#'   \item{\code{vit1j}}{Reasons: Not interested}
#' }
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
#' \describe{
#'   \item{\code{spid}}{Sampling point identifier}
#'   \item{\code{cid}}{County identifier. 1 = Urban Montserrado; 2 = Grand Bassa}
#'   \item{\code{did}}{District identifier}
#'   \item{\code{eid}}{Enumeration area identifier}
#'   \item{\code{motherID}}{Mother identifier}
#'   \item{\code{m2}}{Mother age}
#'   \item{\code{age}}{Age of child in months}
#'   \item{\code{sex}}{Sex of child. 1 = Male; 2 = Female}
#'   \item{\code{muac}}{Mid-upper arm circumference (MUAC) of child in centimetres}
#'   \item{\code{height}}{Height of child in centimetres}
#'   \item{\code{weight}}{Weight of child in kilograms}
#'   \item{\code{oedema}}{Does child have oedema? 1 = Yes; 2 = No}
#'   \item{\code{position}}{Position of child on height measurement. 1 = standing; 2 = supine}
#'   \item{\code{waz}}{Weight-for-age z-score}
#'   \item{\code{haz}}{Height-for-age z-score}
#'   \item{\code{whz}}{Weight-for-height z-score}
#'   \item{\code{flag}}{Flag values based on WHO flagging criteria}
#'   \item{\code{global.haz}}{Global stunting}
#'   \item{\code{moderate.haz}}{Moderate stunting}
#'   \item{\code{severe.haz}}{Severe stunting}
#'   \item{\code{global.waz}}{Global underweight}
#'   \item{\code{moderate}}{Moderate underweight}
#'   \item{\code{severe}}{Severe underweight}
#'   \item{\code{gam.whz}}{Global wasting by weight-for-height z-score}
#'   \item{\code{mam.whz}}{Moderate wasting by weight-for-height z-score}
#'   \item{\code{sam.whz}}{Severe wasting by weight-for-height z-score}
#'   \item{\code{gam.muac}}{Global wasting by MUAC}
#'   \item{\code{mam.muac}}{Moderate wasting by MUAC}
#'   \item{\code{sam.muac}}{Severe wasting by MUAC}
#' }
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
#' \describe{
#'   \item{\code{spid}}{Sampling point identifier}
#'   \item{\code{cid}}{County identifier. 1 = Urban Montserrado; 2 = Grand Bassa}
#'   \item{\code{did}}{District identifier}
#'   \item{\code{eid}}{Enumeration area identifier}
#'   \item{\code{motherID}}{Mother identifier}
#'   \item{\code{m2}}{Mother age}
#'   \item{\code{cin}}{SAM case in programme}
#'   \item{\code{cout}}{SAM case not in programme}
#'   \item{\code{rin}}{Recovering case in programme}
#'   \item{\code{q1}}{Is child sick?}
#'   \item{\code{q1a}}{Child suffering from: malnutrition}
#'   \item{\code{q1b}}{Child suffering from: diarrhoea}
#'   \item{\code{q1c}}{Child suffering from: fever}
#'   \item{\code{q1d}}{Child suffering from: cough}
#'   \item{\code{q1e}}{Child suffering from: malaria}
#'   \item{\code{q1f}}{Child suffering from: don't know}
#'   \item{\code{q2}}{Do you think your child is too small?}
#'   \item{\code{q3}}{Know of treatment}
#'   \item{\code{q4a}}{Came to health centre but was not measured}
#'   \item{\code{q4b}}{Too far}
#'   \item{\code{q4c}}{No time/too busy}
#'   \item{\code{q4d}}{Mother/carer is sick}
#'   \item{\code{q4e}}{Cannot carry more than one child}
#'   \item{\code{q4f}}{Feels ashamed about coming}
#'   \item{\code{q4g}}{Security problems}
#'   \item{\code{q4h}}{No one else to take care of other siblings}
#'   \item{\code{q4i}}{Rejected by programme}
#'   \item{\code{q4j}}{Other parent's children have been rejected}
#'   \item{\code{q4k}}{Husband refused}
#'   \item{\code{q4l}}{Thought necessary to be enrolled in hospital first}
#'   \item{\code{q4m}}{Does not think programme can help children}
#'   \item{\code{q4n}}{Got diarrhoea}
#'   \item{\code{q4o}}{Ration has worms}
#'   \item{\code{q4p}}{Out of stock}
#'   \item{\code{q4q}}{Lack of money to pay for transport}
#'   \item{\code{q4r}}{SAM case in SFP}
#' }
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
#' \describe{
#'   \item{\code{spid}}{Sampling point identifier}
#'   \item{\code{cid}}{County identifier. 1 = Urban Montserrado; 2 = Grand Bassa}
#'   \item{\code{did}}{District identifier}
#'   \item{\code{eid}}{Enumeration area identifier}
#'   \item{\code{motherID}}{Mother identifier}
#'   \item{\code{m2}}{Mother age}
#'   \item{\code{muac.screen}}{Has child been measured with a MUAC tape in past month?}
#'   \item{\code{oedema.screen}}{Has child been checked for oedema in the past month?}
#'   \item{\code{weight.screen}}{Has child's weight been measured in the past month?}
#'   \item{\code{height.screen}}{Has child's height been measured in the past month?}
#' }
#'
#' @source Liberia Coverage Survey Round 2 - 27 August to 30 September 2019
#'
#
################################################################################
"screenDF"
