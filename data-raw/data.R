## Libraries
library(liberiaData)

## Read data fro ONA
coverageData <- get_liberia_data(id = "liberiaCoverageRound2",
                                 username = "cadnihead",
                                 password = "kEv-hAB-Arb-6Cn",
                                 start = "2019-08-27",
                                 end = Sys.Date(),
                                 filename = "coverageData",
                                 rep = TRUE,
                                 rep.name = "child_repeat")

############################ Data clean-up #####################################

## Correct enumeration area for team 1 - Pipeline B; change team to team 4
coverageData[[1]][coverageData[[1]]$eid == 3004580181 & coverageData[[1]]$team == 1, "team"] <- 4

## Correct enumeration area 3004609011 and 3004958011
coverageData[[1]][coverageData[[1]]$eid == 3004609011 & coverageData[[1]]$team == 2, "eid"] <- 3004575171
coverageData[[1]][coverageData[[1]]$eid == 3004958011 & coverageData[[1]]$team == 2, "team"] <- 3

## Correct enumeration area 3004956051
coverageData[[1]][coverageData[[1]]$eid == 3004956051 & coverageData[[1]]$team == 4, "team"] <- 3

## Edit duplicate motherIDs

motherID <- paste(coverageData[[1]]$eid, coverageData[[1]]$hh, coverageData[[1]]$m1, sep = "-")
xx <- data.frame(table(motherID))
xx[which(xx$Freq > 1), ]

## 3004103061
coverageData[[1]][coverageData[[1]]$eid == 3004103061, c("hh", "m1")]
coverageData[[1]][125, "hh"] <- 40
coverageData[[1]][128, "hh"] <- 41
coverageData[[1]][128, "m1"] <- 1
coverageData[[1]][137, "hh"] <- 42
coverageData[[1]][137, "m1"] <- 1
coverageData[[1]][150, "m1"] <- 1

## 3004103071
coverageData[[1]][coverageData[[1]]$eid == 3004103071, c("hh", "m1")]
coverageData[[1]][132, "m1"] <- 1
coverageData[[1]][133, "m1"] <- 2
coverageData[[1]][c(134:136, 138:141), "m1"] <- 1:7

## 3004557141
coverageData[[1]][coverageData[[1]]$eid == 3004557141, c("hh", "m1")]
coverageData[[1]][643, "m1"] <- 1
coverageData[[1]][644, "m1"] <- 2
coverageData[[1]][645, "m1"] <- 1
coverageData[[1]][646, "m1"] <- 2

## 3004561041
coverageData[[1]][coverageData[[1]]$eid == 3004561041, c("hh", "m1")]
coverageData[[1]][1896, "m1"] <- 1
coverageData[[1]][1897, "m1"] <- 2

## 3004565191
coverageData[[1]][coverageData[[1]]$eid == 3004565191, c("hh", "m1")]
coverageData[[1]][2139, "m1"] <- 1

## 3004565251
coverageData[[1]][coverageData[[1]]$eid == 3004565251, c("hh", "m1")]
coverageData[[1]][2190, "m1"] <- 1
coverageData[[1]][2192, "m1"] <- 2
coverageData[[1]][2191, "m1"] <- 1
coverageData[[1]][2194, "m1"] <- 2

## 3004566131
coverageData[[1]][coverageData[[1]]$eid == 3004566131, c("hh", "m1")]
coverageData[[1]][1, "m1"] <- 1
coverageData[[1]][15, "m1"] <- 1
coverageData[[1]][19, "m1"] <- 2

## 3004566141
coverageData[[1]][coverageData[[1]]$eid == 3004566141, c("hh", "m1")]
coverageData[[1]][27, "m1"] <- 1

## 3004575161
coverageData[[1]][coverageData[[1]]$eid == 3004575161, c("hh", "m1")]
coverageData[[1]][863, "m1"] <- 1
coverageData[[1]][894, "m1"] <- 2

## 3004580181
coverageData[[1]][coverageData[[1]]$eid == 3004580181, c("hh", "m1")]
coverageData[[1]][1128, "m1"] <- 2

## 3004607041
coverageData[[1]][coverageData[[1]]$eid == 3004607041, c("hh", "m1")]
coverageData[[1]][1751:1755, "m1"] <- 1
coverageData[[1]][1805:1809, "m1"] <- 2

## 3004901051
coverageData[[1]][coverageData[[1]]$eid == 3004901051, c("hh", "m1")]
coverageData[[1]][485:486, "m1"] <- 3:4

## 3004901061
coverageData[[1]][coverageData[[1]]$eid == 3004901061, c("hh", "m1")]
coverageData[[1]][505:507, "m1"] <- 1:3
coverageData[[1]][509:511, "m1"] <- 1:3

## 3004955061
coverageData[[1]][coverageData[[1]]$eid == 3004955061, c("hh", "m1")]
coverageData[[1]][574, "m1"] <- 1
coverageData[[1]][625, "m1"] <- 2

## 3004958011
coverageData[[1]][coverageData[[1]]$eid == 3004958011, c("hh", "m1")]
coverageData[[1]][1043:1048, "m1"] <- 1:6

################################ Create data.frames ############################

## Create motherID
motherID <- paste(coverageData[[1]]$eid, coverageData[[1]]$hh, coverageData[[1]]$m1, sep = "-")

coverageData[[1]] <- data.frame(motherID, coverageData[[1]])
coverageData1 <- coverageData[[1]]

columns1 <- c("motherID", "sdate", "cid", "did", "eid", "team", "consent2",
              "m2", "ch", "mcheck1", "ifa1", "ifa2", "ifa3", "ifa3a.1",
              "ifa3a.2", "ifa3a.3", "ifa3a.88", "ifa3a_other", "ifa4",
              "ifa4a.1", "ifa4a.2", "ifa4a.3", "ifa4a.4", "ifa4a.88",
              "ifa4a_other","ifa5", "icf1", "icf2", "icf2a.1", "icf2a.2",
              "icf2a.3", "icf2a.4", "icf2a.88", "icf2a_other", "icf3", "c2",
              "cage", "csex", "mnp1", "mnp2", "mnp2a.1", "mnp2a.2", "mnp2a.3",
              "mnp2a.4", "mnp2a.5", "mnp2a.88", "mnp2a_other", "mnp3",
              "mnp3a.1", "mnp3a.2", "mnp3a.3", "mnp3a.4", "mnp3a.5", "mnp3a.6",
              "mnp3a.7", "mnp3a.8", "mnp3a.9", "mnp3a.88", "mnp3a_other",
              "mnp4", "vit1", "vit1a.1", "vit1a.2", "vit1a.3", "vit1a.4",
              "vit1a.88", "vit1a_other", "vit2", "vit3")

## Create childID
childID <- rep(NA, nrow(coverageData[[2]]))
childID[!is.na(coverageData[[2]]$c1)] <- 1:length(childID[!is.na(coverageData[[2]]$c1)])
coverageData[[2]] <- data.frame(childID, coverageData[[2]])
coverageData2 <- coverageData[[2]]

columns2 <- c("childID", "card", "know_dob", "dob", "age_report",
              "sex", "sex1", "sex2",
              "age", "age_check", "age1", "age_check1", "age2", "age_check2",
              "muac1", "muac_screen", "muac2", "muac3",
              "weight1", "weight_screen", "weight2", "weight3",
              "height1", "height_screen", "height2", "height3",
              "oedema1", "oedema_screen", "oedema_check",
              "oedema2", "oedema_check2", "oedema3", "oedema_check3",
              "position", "position2", "position3",
              "sam", "sam1a", "sam1b",
              "nut_status", "cov_status",
              "in.", "recovering", "out", "q1", "q1a.1", "q1a.2", "q1a.3",
              "q1a.4", "q1a.5", "q1a.6", "q2", "q3", "q4.q4a", "q4.q4b",
              "q4.q4c", "q4.q4d", "q4.q4e", "q4.q4f", "q4.q4g", "q4.q4h",
              "q4.q4i", "q4.q4j", "q4.q4k", "q4.q4l", "q4.q4m", "q4.q4n",
              "q4.q4o", "q4.q4p", "q4.q4q", "q4.q4r", "q4.q4s", "q4t", "q5",
              "q6.q6a", "q6.q6b", "q6.q6c", "q6.q6d", "q6e")

## Merge main form and repeats
coverageData <- merge_repeats(x = coverageData, rep.name = "child_repeat")

coverageData1.r2 <- coverageData1[ , columns1]
coverageData2.r2 <- coverageData2[ , columns2]
coverageData.r2 <- coverageData[ , c(columns1, columns2)]

## Get spid
coverageData1.r2 <- get_spid(df = coverageData1.r2, splist = sampleList.r2)
#coverageData2.r2 <- get_spid(df = coverageData2.r2, splist = sampleList.r2)
coverageData.r2 <- get_spid(df = coverageData.r2, splist = sampleList.r2)


########################### Create internal datasets ###########################

usethis::use_data(coverageData1.r2, compress = "xz", overwrite = TRUE)
usethis::use_data(coverageData2.r2, compress = "xz", overwrite = TRUE)
usethis::use_data(coverageData.r2, compress = "xz", overwrite = TRUE)

########################### Read village data ##################################

villageData <- get_liberia_data(id = "liberiaVillageFormRound2",
                                 username = "cadnihead",
                                 password = "kEv-hAB-Arb-6Cn",
                                 start = "2019-08-27",
                                 end = Sys.Date(),
                                 filename = "villageData")

villageData.r2 <- villageData[ , c("cid", "county", "did", "eid", "lat", "lon", "pop",
                                   "coords.Latitude", "coords.Longitude",
                                   "coords.Altitude", "coords.Accuracy")]

usethis::use_data(villageData.r2, compress = "xz", overwrite = TRUE)

################################# Read sample list #############################

## Round 2 sample list
sampleList.r2 <- read.csv("data-raw/sample/sampleList.csv", stringsAsFactors = FALSE)
usethis::use_data(sampleList.r2, compress = "xz", overwrite = TRUE)

########################### Recode IFA indicators ##############################

## Create list of recode for ifa3a others
ifa3d <- c("delivery", "hospital", "constantly") # Did not go to hospital
ifa3e <- c("know") # Don't know about the tablets
ifa3f <- c("any", "go") # Didn't get any tablets
ifa3g <- c("given") # Was given but never took it
ifa3h <- c("interest", "interested", "Not") # Not interested
ifa3i <- c("Reasons") # No reasons

ls1 <- list(ifa3d, ifa3e, ifa3f, ifa3g, ifa3h, ifa3i)
names(ls1) <- paste("ifa3", letters[4:9], sep = "")

ls2 <- NULL

## Recode IFA indicators
ifaDF <- recode_ifa(df = coverageData1.r2, ls1 = ls1, ls2 = ls2)
usethis::use_data(ifaDF, compress = "xz", overwrite = TRUE)

########################### Recode IYCF indicators #############################

## Create list of recode for icf2a others
icf2e <- c("delivery", "health", "hospital") # Did not go to hospital
icf2f <- c("Doctor", "invited", "talk", "counselling") # No one told me about it/not invited
icf2g <- c("time") # No time

ls <- list(icf2e, icf2f, icf2g)
names(ls) <- paste("icf2", letters[5:7], sep = "")

## Recode IYCF indicators
iycfDF <- recode_iycf(df = coverageData1.r2, ls = ls)
usethis::use_data(iycfDF, compress = "xz", overwrite = TRUE)

########################### Recode MNP indicators ##############################

mnp2f <- c("done", "know", "seen", "heard", "herd") # Don't know/not seen/not hear
mnp2g <- c("gone") # Have not gone to hospital
mnp2h <- c("receive") # Have not received any
mnp2i <- c("tell") # Hospital didn't tell me about it

ls1 <- list(mnp2f, mnp2g, mnp2h, mnp2i)
names(ls1) <- paste("mnp2", letters[6:9], sep = "")

mnp3j <- c("refused") # Child refused to take it
ls2 <- list(mnp3j)
names(ls2) <- paste("mnp3", letters[10], sep = "")

## Recode MNP indicators
mnpDF <- recode_mnp(df = coverageData1.r2, ls1 = ls1, ls2 = ls2)
usethis::use_data(mnpDF, compress = "xz", overwrite = TRUE)


##################### Recode Vitamin A indicators ##############################

vit1e <- c("age", "small") # Child too young during last campaign
vit1f <- c("see", "missed", "Liberia", "around", "home") # Not around during last campaign
vit1g <- c("hear", "about", "know") # Didn't hear/know about it
vit1h <- c("hospital") # Never been to hospital
vit1i <- c("community", "team", "reach", "received") # Vaccine team didn't come/didn't reach
vit1j <- c("interest") # Not interested

ls <- list(vit1e, vit1f, vit1g, vit1h, vit1i, vit1j)
names(ls) <- paste("vit1", letters[5:10], sep = "")

## Recode vitamin A indicators
vitDF <- recode_vita(df = coverageData1.r2, ls = ls)
usethis::use_data(vitDF, compress = "xz", overwrite = TRUE)

##################### Recode anthropometric indicators #########################

anthroDF <- recode_anthro(df = coverageData.r2)
usethis::use_data(anthroDF, compress = "xz", overwrite = TRUE)

##################### Recode CMAM indicators ###################################

cmamDF <- recode_cmam(df = coverageData.r2)
usethis::use_data(cmamDF, compress = "xz", overwrite = TRUE)

##################### Recode CMAM indicators ###################################

screenDF <- recode_screening(df = coverageData.r2)
usethis::use_data(screenDF, compress = "xz", overwrite = TRUE)

############################### Interpolation ##################################

intResults <- interpolate_indicators(indicator = c("ifaDF", "iycfDF",
                                                   "mnpDF", "vitDF",
                                                   "screenDF", "anthroDF",
                                                   "cmamDF"),
                                     coords = sampleList.r2,
                                     hexgrid = gmHexGrid)

ifaInt <- intResults[["ifaDF"]]
usethis::use_data(ifaInt, compress = "xz", overwrite = TRUE)

iycfInt <- intResults[["iycfDF"]]
usethis::use_data(iycfInt, compress = "xz", overwrite = TRUE)

mnpInt <- intResults[["mnpDF"]]
usethis::use_data(mnpInt, compress = "xz", overwrite = TRUE)

vitInt <- intResults[["vitDF"]]
usethis::use_data(vitInt, compress = "xz", overwrite = TRUE)

screenInt <- intResults[["screenDF"]]
usethis::use_data(screenInt, compress = "xz", overwrite = TRUE)

anthroInt <- intResults[["anthroDF"]]
usethis::use_data(anthroInt, compress = "xz", overwrite = TRUE)

cmamInt <- intResults[["cmamDF"]]
usethis::use_data(cmamInt, compress = "xz", overwrite = TRUE)

################################## Population Data #############################

psuData <- sampleList.r2[ , c("EFEACODE", "TOTAL")]
names(psuData) <- c("psu", "pop")
psuDataGM <- psuData[sampleList.r2$CCNAME == "Montserrado", ]
usethis::use_data(psuDataGM, compress = "xz", overwrite = TRUE)

psuDataGB <- psuData[sampleList.r2$CCNAME == "Grand Bassa", ]
usethis::use_data(psuDataGB, compress = "xz", overwrite = TRUE)

################################################################################

core.columns <- c("spid", "cid", "did", "eid", "motherID", "m2")

df <- c(rep("ifaDF", ncol(ifaDF) - 6),
        rep("iycfDF", ncol(iycfDF) - 6),
        rep("mnpDF", ncol(mnpDF) - 6),
        rep("vitDF", ncol(vitDF) - 6),
        rep("screenDF", ncol(screenDF) - 6),
        rep("cmamDF", ncol(cmamDF) - 4),
        rep("anthroDF", ncol(anthroDF) - 10))

varLabel <- c(names(ifaDF)[!names(ifaDF) %in% core.columns],
              names(iycfDF)[!names(iycfDF) %in% core.columns],
              names(mnpDF)[!names(mnpDF) %in% core.columns],
              names(vitDF)[!names(vitDF) %in% core.columns],
              names(screenDF)[!names(screenDF) %in% core.columns],
              names(cmamDF)[!names(cmamDF) %in% c("spid", "cin", "cout", "rin")],
              names(anthroDF)[!names(anthroDF) %in% c(core.columns, "age", "sex", "position", "flag")])

varNames <- c("At least one ANC visit",
              "Know/heard about iron-folic acid",
              "Received/purchased iron-folic acid",
              "Health centre ran out",
              "Took too long to get tablets",
              "Too expensive",
              "Did not go to hospital",
              "Don't know about iron-folic acid",
              "Didn't get any iron-folic acid",
              "Received but did not take",
              "Not interested",
              "No reason",
              "Consumed iron-folic acid",
              "Concerns about side-effects",
              "Don't need it",
              "Told not to take it",
              "Don't think it helps",
              "Mean number of days of iron-folic acid consumption",
              "Consumed iron-folic acid for at least 90 days",
              "Consumed iron-folic acid for 180 days",
              "Know/heard about IYCF counselling",
              "Attended IYCF counselling",
              "Timing not convenient",
              "Not interested",
              "Do not trust counsellor",
              "Don't think I need it",
              "Did not go to hospital",
              "No one told me about it/not invited",
              "No time",
              "Mean number of times attended IYCF counselling",
              "Heard about micronutrient powder",
              "Received/purchased micronutrient powder",
              "Health centre ran out",
              "Took too long to get micronutrient powder",
              "Too expensive",
              "Child doesn't need it",
              "Heard it doesn't work/help",
              "Don't know/not seen/not heard of micronutrient powder",
              "Have not gone to hospital",
              "Have not received any from hospital/centre",
              "Hospital didn't tell me about it",
              "Child consumed micronutrient powder",
              "Too expensive",
              "Not available in the market",
              "Do not need micronutrient powder",
              "Heard other's bad experience",
              "Advised not to use it",
              "Not seen other mothers use it",
              "Don't trust the product",
              "Using another product",
              "Haven't seen it",
              "Child refused to take it",
              "Mean number of times micronutrient powder is eaten by child in a week",
              "Received vitamin A in the past 6 months",
              "Health centre ran out",
              "Took too long to get drops",
              "Child doesn't need it",
              "Heard it doesn't work/help",
              "Child too young during last campaign",
              "Not around during last campaign",
              "Didn't hear/know about it",
              "Never been to hospital",
              "Vaccine team didn't come/reach",
              "Not interested",
              "Child MUAC measured in the past month",
              "Child checked for oedema in the past month",
              "Child weight measured in the past month",
              "Child height measured in the past month",
              "Mother/carer does not think child to be sick",
              "Mother/carer thinks child has malnutrition",
              "Mother/carer thinks child has diarrhoea",
              "Mother/carer thinks child has fever",
              "Mother/carer thinks child has cough",
              "Mother/carer thinks child has malaria",
              "Mother/carer doesn't know child's illness",
              "Mother/carer does not think child is too small/thin",
              "Mother/carer does not know of any treatment",
              "Came to health centre but was not measured",
              "Too far",
              "No time/too busy",
              "Mother/carer is sick",
              "Cannot carry more than one child",
              "Feels ashamed about coming",
              "Security problems",
              "No one else to take care of other siblings",
              "Rejected by programme",
              "Other parents' children have been rejected",
              "Husband refused",
              "Though necessary to be enrolled in hospital first",
              "Does not think programme can help children",
              "Got diarrhoea from RUTF",
              "Ration has worms",
              "Out of stock",
              "Lack of money to pay for transport",
              "SAM case in SFP",
              "Case-finding effectiveness",
              "Treatment coverage",
              "Mean mid-upper arm circumference (cms)",
              "Mean height (cms)",
              "Mean weight (kgs)",
              "Oedema prevalence",
              "Mean weight-for-age z-score",
              "Mean height-for-age z-score",
              "Mean weight-for-height z-score",
              "Global stunting prevalence",
              "Moderate stunting prevalence",
              "Severe stunting prevalence",
              "Global underweight prevalence",
              "Moderate underweight prevalence",
              "Severe underweight prevalence",
              "Global acute malnutrition by weight-for-height z-score prevalence",
              "Moderate acute malnutrition by weight-for-height z-score prevalence",
              "Severe acute malnutrition by weight-for-height z-score prevalence",
              "Global acute malnutrition by MUAC prevalence",
              "Moderate acute malnutrition by MUAC prevalence",
              "Severe acute malnutrition by MUAC prevalence")

indicatorList <- data.frame(df, varNames, varLabel)
usethis::use_data(indicatorList, compress = "xz", overwrite = TRUE)

############################### Get bootstrap results ##########################

bootResults <- boot_estimate(w = psuDataGM)

##
ifaBoot <- bootResults[["ifaDF"]]
ifaBoot <- merge(indicatorList, ifaBoot, by = "varLabel", all.y = TRUE)
usethis::use_data(ifaBoot, compress = "xz", overwrite = TRUE)

##
iycfBoot <- bootResults[["iycfDF"]]
iycfBoot <- merge(indicatorList, iycfBoot, by = "varLabel", all.y = TRUE)
usethis::use_data(iycfBoot, compress = "xz", overwrite = TRUE)

##
mnpBoot <- bootResults[["mnpDF"]]
mnpBoot <- merge(indicatorList, mnpBoot, by = "varLabel", all.y = TRUE)
usethis::use_data(mnpBoot, compress = "xz", overwrite = TRUE)

##
vitBoot <- bootResults[["vitDF"]]
vitBoot <- merge(indicatorList, vitBoot, by = "varLabel", all.y = TRUE)
usethis::use_data(vitBoot, compress = "xz", overwrite = TRUE)

##
screenBoot <- bootResults[["screenDF"]]
screenBoot <- merge(indicatorList, screenBoot, by = "varLabel", all.y = TRUE)
usethis::use_data(screenBoot, compress = "xz", overwrite = TRUE)

##
anthroBoot <- bootResults[["anthroDF"]]
anthroBoot <- merge(indicatorList, anthroBoot, by = "varLabel", all.y = TRUE)
usethis::use_data(anthroBoot, compress = "xz", overwrite = TRUE)

############################# CMAM Coverage ####################################

samCases <- colSums(cmamDF[ , c("cin", "cout", "rin")])
rout <- squeacr::calculate_rout(cin = samCases[1], cout = samCases[2], rin = samCases[3])

cf <- estimate_classic(x = samCases[1], n = samCases[1] + samCases[2])
tc <- estimate_classic(x = samCases[1] + samCases[3], n = samCases[1] + samCases[2] + samCases[3] + rout)

cmamEst <- data.frame(
  varLabel = c("cf", "tc"),
  df = "cmamDF",
  varNames = c("Case-finding effectiveness", "Treatment coverage"),
  estimate = c(cf[[1]], tc[[1]]),
  lcl = c(cf[[2]][1], tc[[2]][1]),
  ucl = c(cf[[2]][2], tc[[2]][2])
)

usethis::use_data(cmamEst, compress = "xz", overwrite = TRUE)

