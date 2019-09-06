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
coverageData2.r2 <- get_spid(df = coverageData2.r2, splist = sampleList.r2)
coverageData.r2 <- get_spid(df = coverageData.r2, splist = sampleList.r2)


########################### Create internal datasets ###########################

usethis::use_data(coverageData1.r2, overwrite = TRUE)
usethis::use_data(coverageData2.r2, overwrite = TRUE)
usethis::use_data(coverageData.r2, overwrite = TRUE)


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

usethis::use_data(villageData.r2, overwrite = TRUE)

################################# Read sample list #############################

## Round 2 sample list
sampleList.r2 <- read.csv("data-raw/sample/sampleList.csv", stringsAsFactors = FALSE)
usethis::use_data(sampleList.r2, overwrite = TRUE)

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
usethis::use_data(ifaDF, overwrite = TRUE)

########################### Recode IYCF indicators #############################

## Create list of recode for icf2a others
icf2e <- c("delivery", "health", "hospital") # Did not go to hospital
icf2f <- c("Doctor", "invited", "talk", "counselling") # No one told me about it/not invited
icf2g <- c("time") # No time

ls <- list(icf2e, icf2f, icf2g)
names(ls) <- paste("icf2", letters[5:7], sep = "")

## Recode IYCF indicators
iycfDF <- recode_iycf(df = coverageData1.r2, ls = ls)
usethis::use_data(iycfDF, overwrite = TRUE)

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
usethis::use_data(mnpDF, overwrite = TRUE)


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
usethis::use_data(vitDF, overwrite = TRUE)

##################### Recode anthropometric indicators #########################

anthroDF <- recode_anthro(df = coverageData.r2)
usethis::use_data(anthroDF, overwrite = TRUE)

##################### Recode CMAM indicators ###################################

cmamDF <- recode_cmam(df = coverageData.r2)
usethis::use_data(cmamDF, overwrite = TRUE)


##################### Recode CMAM indicators ###################################

screenDF <- recode_screening(df = coverageData.r2)
usethis::use_data(screenDF, overwrite = TRUE)
