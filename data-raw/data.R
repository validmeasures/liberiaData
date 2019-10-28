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

## Clean-up Grand Bassa data

## 914011022 - Norwein EA
coverageData[[1]][coverageData[[1]]$eid == 914011022, "sdate"]
coverageData[[1]][coverageData[[1]]$eid == 914011022 & coverageData[[1]]$sdate == "Sep 17, 2019", "eid"] <- 914011032

## 914012032 - Gbaniee EA
coverageData[[1]][coverageData[[1]]$eid == 914012032, c("SubmissionDate", "sdate")]
## no change needed

## 914002012 - Glow EA
coverageData[[1]][coverageData[[1]]$eid == 914002012, c("SubmissionDate", "sdate")]

## 904006042 - Sayawein EA
coverageData[[1]][coverageData[[1]]$eid == 904006042, c("SubmissionDate", "sdate")]
coverageData[[1]][coverageData[[1]]$eid == 904006042 & coverageData[[1]]$sdate == "Sep 23, 2019", "eid"] <- 904006012

## 916005012 - Kpogblen EA
coverageData[[1]][coverageData[[1]]$eid == 916005012, c("SubmissionDate", "sdate")]
coverageData[[1]][coverageData[[1]]$eid == 916005012 & coverageData[[1]]$sdate == "Sep 20, 2019", "eid"] <- 916005022
coverageData[[1]][coverageData[[1]]$eid == 916005012 & coverageData[[1]]$sdate == "Sep 14, 2019", "eid"] <- 916005032

## 916009112
coverageData[[1]][coverageData[[1]]$eid == 916009112, c("SubmissionDate", "sdate")]
coverageData[[1]][coverageData[[1]]$eid == 916009112 & coverageData[[1]]$sdate == "Sep 12, 2019", "eid"] <- 916009052

## 916006052
coverageData[[1]][coverageData[[1]]$eid == 916006052, c("SubmissionDate", "sdate")]
coverageData[[1]][coverageData[[1]]$eid == 916006052 & coverageData[[1]]$sdate == "Sep 14, 2019", "eid"] <- 916009042

## 910007251
coverageData[[1]][coverageData[[1]]$eid == 910007251, c("SubmissionDate", "sdate")]

## 916011042 - LAC Plantation
coverageData[[1]][coverageData[[1]]$eid == 916011042, c("SubmissionDate", "sdate")]
coverageData[[1]][coverageData[[1]]$eid == 916011042 & coverageData[[1]]$sdate == "Sep 21, 2019", "eid"] <- 914001042

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
coverageData[[1]][644, "m1"] <- 1
coverageData[[1]][645, "m1"] <- 2
coverageData[[1]][646, "m1"] <- 1
coverageData[[1]][647, "m1"] <- 2

## 3004561041
coverageData[[1]][coverageData[[1]]$eid == 3004561041, c("hh", "m1")]
#coverageData[[1]][1897, "m1"] <- 1
#coverageData[[1]][1898, "m1"] <- 2
coverageData[[1]][1899, "m1"] <- 1
coverageData[[1]][1900, "m1"] <- 2

## 3004565191
coverageData[[1]][coverageData[[1]]$eid == 3004565191, c("hh", "m1")]
coverageData[[1]][2142, "hh"] <- 29
coverageData[[1]][2142, "m1"] <- 29

## 3004565251
coverageData[[1]][coverageData[[1]]$eid == 3004565251, c("hh", "m1")]
coverageData[[1]][2195, "hh"] <- 25
coverageData[[1]][2195, "m1"] <- 25
coverageData[[1]][2197, "h1"] <- 26
coverageData[[1]][2197, "m1"] <- 26

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
coverageData[[1]][864, "eid"] <- 3004575171

## 3004576171
coverageData[[1]][coverageData[[1]]$eid == 3004576171, c("hh", "m1")]
coverageData[[1]][3070, "m1"] <- 2
coverageData[[1]][3099, "m1"] <- 2
coverageData[[1]][3094, "m1"] <- 1

## 3004580181
coverageData[[1]][coverageData[[1]]$eid == 3004580181, c("hh", "m1")]
coverageData[[1]][1130, "m1"] <- 2

## 3004607041
coverageData[[1]][coverageData[[1]]$eid == 3004607041, c("hh", "m1")]
#coverageData[[1]][1751:1755, "m1"] <- 1
#coverageData[[1]][1808:1812, "m1"] <- 24:49
coverageData[[1]][1776, "eid"] <- 3004607051
coverageData[[1]][1780, "eid"] <- 3004607051

coverageData[[1]][coverageData[[1]]$eid == 3004607041, c("hh", "m1")]
#coverageData[[1]][1808:1833, "hh"] <- 22:45
coverageData[[1]][1808:1833, "m1"] <- 22:47

## 3004901051
coverageData[[1]][coverageData[[1]]$eid == 3004901051, c("hh", "m1")]
coverageData[[1]][486:487, "m1"] <- 3:4

## 3004901061
coverageData[[1]][coverageData[[1]]$eid == 3004901061, c("hh", "m1")]
coverageData[[1]][506:508, "m1"] <- 1:3
coverageData[[1]][510:512, "m1"] <- 1:3

## 3004955061
coverageData[[1]][coverageData[[1]]$eid == 3004955061, c("hh", "m1")]
coverageData[[1]][575, "m1"] <- 1
coverageData[[1]][626, "m1"] <- 2

## 3004958011
coverageData[[1]][coverageData[[1]]$eid == 3004958011, c("hh", "m1")]
coverageData[[1]][1045:1050, "m1"] <- 1:6

## 3004960011
coverageData[[1]][coverageData[[1]]$eid == 3004960011, c("hh", "m1")]
coverageData[[1]][2410:2412, "m1"] <- 2
coverageData[[1]][2414:2415, "m1"] <- 2

## 3004960021
coverageData[[1]][coverageData[[1]]$eid == 3004960021, c("hh", "m1")]
coverageData[[1]][2417, "m1"] <- 2

## 902003062
coverageData[[1]][coverageData[[1]]$eid == 902003062, c("hh", "m1")]
coverageData[[1]][4031:4059, "h1"] <- 22:50
coverageData[[1]][4031:4059, "m1"] <- 22:50

############################## Grand Bassa #####################################

## 904006042
coverageData[[1]][coverageData[[1]]$eid == 904006042, c("hh", "m1")]
coverageData[[1]][5367, "eid"] <- 904006012

## 904009012
coverageData[[1]][coverageData[[1]]$eid == 904009012, c("hh", "m1")]
coverageData[[1]][5360, "hh"] <- 13
coverageData[[1]][5360, "m1"] <- 13
coverageData[[1]][5364, "hh"] <- 15
coverageData[[1]][5364, "m1"] <- 15
coverageData[[1]][5365, "hh"] <- 16
coverageData[[1]][5365, "m1"] <- 16
coverageData[[1]][5368, "hh"] <- 17
coverageData[[1]][5368, "m1"] <- 17

## 906010012
coverageData[[1]][coverageData[[1]]$eid == 906010012, c("hh", "m1")]
coverageData[[1]][5440:5442, "m1"] <- 2

## 908009022
coverageData[[1]][coverageData[[1]]$eid == 908009022, c("hh", "m1")]
coverageData[[1]][5143, "hh"] <- 11
coverageData[[1]][5143, "m1"] <- 11

## 914001202
coverageData[[1]][coverageData[[1]]$eid == 914001202, c("hh", "m1")]
coverageData[[1]][4060:4074, "hh"] <- 1:15
coverageData[[1]][4060:4074, "m1"] <- 1
coverageData[[1]][4277:4294, "hh"] <- 16:33
coverageData[[1]][5403, "m1"] <- 2

## 914005012
coverageData[[1]][coverageData[[1]]$eid == 914005012, c("hh", "m1")]
coverageData[[1]][4295:4313, "hh"] <- 22 + coverageData[[1]][4295:4313, "hh"]
coverageData[[1]][4295:4313, "m1"] <- 22 + coverageData[[1]][4295:4313, "m1"]

## 914007012
coverageData[[1]][coverageData[[1]]$eid == 914007012, c("hh", "m1")]
#coverageData[[1]][4314:4339, "hh"] <- 70 + coverageData[[1]][4314:4339, "hh"]
#coverageData[[1]][4314:4339, "hh"] <- 69 + coverageData[[1]][4314:4339, "m1"]
#coverageData[[1]][4413, "m1"] <- 73
coverageData[[1]][4337, "m1"] <- 24
coverageData[[1]][4338, "m1"] <- 25
coverageData[[1]][4339, "m1"] <- 26

## 914007052
coverageData[[1]][coverageData[[1]]$eid == 914007052, c("hh", "m1")]
coverageData[[1]][4133, "eid"] <- 914007012
coverageData[[1]][4639, "m1"] <- 2

## 914008012
coverageData[[1]][coverageData[[1]]$eid == 914008012, c("hh", "m1")]
coverageData[[1]][5307, "eid"] <- 914008012
coverageData[[1]][5306:5326, "hh"] <- 1:nrow(coverageData[[1]][5306:5326, ])
coverageData[[1]][5306:5326, "m1"] <- 1:nrow(coverageData[[1]][5306:5326, ])

## 914010012
coverageData[[1]][coverageData[[1]]$eid == 914010012, c("hh", "m1")]
coverageData[[1]][4136:4150, "hh"] <- 1:nrow(coverageData[[1]][4136:4150, ])

## 914010022
coverageData[[1]][coverageData[[1]]$eid == 914010022, c("hh", "m1")]
coverageData[[1]][4151:4155, "hh"] <- 1:nrow(coverageData[[1]][4151:4155, ])
coverageData[[1]][5105:5124, "hh"] <- 6 + 1:nrow(coverageData[[1]][5105:5124, ])

## 914011022
coverageData[[1]][coverageData[[1]]$eid == 914011022, c("hh", "m1")]
coverageData[[1]][4790:4839, "hh"] <- 1:nrow(coverageData[[1]][4790:4839, ])

## 914011032
coverageData[[1]][coverageData[[1]]$eid == 914011032, c("hh", "m1")]
coverageData[[1]][4134:4135, "hh"] <- 1:nrow(coverageData[[1]][4134:4135, ])
coverageData[[1]][4467:4509, "hh"] <- 2 + 1:nrow(coverageData[[1]][4467:4509, ])

## 914012032
coverageData[[1]][coverageData[[1]]$eid == 914012032, c("hh", "m1")]
coverageData[[1]][4370:4466, "hh"] <- 1:nrow(coverageData[[1]][4370:4466, ])
coverageData[[1]][4514, "hh"] <- 98

## 914012042
coverageData[[1]][coverageData[[1]]$eid == 914012042, c("hh", "m1")]
coverageData[[1]][4510:4524, "hh"] <- 3 + 1:nrow(coverageData[[1]][4510:4524, ])
coverageData[[1]][5091:5104, "hh"] <- 18 + 1:nrow(coverageData[[1]][5091:5104, ])

## 916005012
coverageData[[1]][coverageData[[1]]$eid == 916005012, c("hh", "m1")]
coverageData[[1]][4877, "m1"] <- 2
coverageData[[1]][4881, "m1"] <- 2

## 916009032
coverageData[[1]][coverageData[[1]]$eid == 916009032, c("hh", "m1")]
coverageData[[1]][3660, "m1"] <- 2

## 916009112
coverageData[[1]][coverageData[[1]]$eid == 916009112, c("hh", "m1")]
coverageData[[1]][3615, "m1"] <- 2

## 916011042
coverageData[[1]][coverageData[[1]]$eid == 916011042, c("hh", "m1")]
coverageData[[1]][5203, "m1"] <- 1
coverageData[[1]][5266, "m1"] <- 2
coverageData[[1]][5280, "m1"] <- 2
coverageData[[1]][5299, "m1"] <- 2

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
ifa3g <- c("never took") # Was given but never took it
ifa3h <- c("interest", "interested", "Not") # Not interested
ifa3i <- c("Reasons") # No reasons
ifa3j <- c("money", "Money") # no money
ifa3k <- c("good") # Not good for me
ifa3l <- c("far") # far from health centre
ifa3m <- c("never given", "didn't go") # Not given
ifa3n <- c("time") # No time
ifa3o <- c("medicine") # Don't like medicine

ls1 <- list(ifa3d, ifa3e, ifa3f, ifa3g, ifa3h, ifa3i, ifa3j, ifa3k, ifa3l, ifa3m, ifa3n, ifa3o)
names(ls1) <- paste("ifa3", letters[4:15], sep = "")

ls2 <- NULL

## Recode IFA indicators
ifaDF <- recode_ifa(df = coverageData1.r2, ls1 = ls1, ls2 = ls2)
usethis::use_data(ifaDF, compress = "xz", overwrite = TRUE)

########################### Recode IYCF indicators #############################

## Create list of recode for icf2a others
icf2e <- c("delivery", "health", "hospital", "Hospital", "health center", "go") # Did not go to hospital
icf2f <- c("Doctor", "invited", "talk", "counselling", "breast feed", "informed") # No one told me about it/not invited
icf2g <- c("time") # No time
icf2h <- c("interest") # No interest
icf2i <- c("know") # Don't know about it
icf2j <- c("too far", "Far", "distance", "near bye", "nearby") # Too far
icf2k <- c("money") # no money
icf2l <- c("around") # Was not around
icf2m <- c("Weak") # Too weak to go
icf2n <- c("medicine") # Don't like medicine

ls <- list(icf2e, icf2f, icf2g, icf2h, icf2i, icf2j, icf2k, icf2l, icf2m, icf2n)
names(ls) <- paste("icf2", letters[5:14], sep = "")

## Recode IYCF indicators
iycfDF <- recode_iycf(df = coverageData1.r2, ls = ls)
usethis::use_data(iycfDF, compress = "xz", overwrite = TRUE)

########################### Recode MNP indicators ##############################

mnp2f <- c("done", "know", "seen", "see",
           "heard", "herd", "idea")                 # Don't know/not seen/not hear
mnp2g <- c("gone")                                  # Have not gone to hospital
mnp2h <- c("receive", "give", "given")              # Have not received any
mnp2i <- c("tell", "talk", "informed")              # Hospital didn't tell me about it
mnp2j <- c("healthy", "not sick", "need")           # Child not sick/healthy/doesn't need it
mnp2k <- c("started", "eating")                     # Child didn't take it yet/doesn't want to take it
mnp2l <- c("far", "clinic", "nearby")               # Far
mnp2m <- c("want", "interest")                      # Don't want it/not interested
mnp2n <- c("have", "lack")                          # Hospital doesn't have it
mnp2o <- c("around")                                # Mother not around
mnp2p <- c("means")                                 # No means
mnp2q <- c("pregnant")                              # Mother pregnant at the time

ls1 <- list(mnp2f, mnp2g, mnp2h, mnp2i, mnp2j, mnp2k,
            mnp2l, mnp2m, mnp2n, mnp2o, mnp2p, mnp2q)
names(ls1) <- paste("mnp2", letters[6:17], sep = "")

mnp3j <- c("refused") # Child refused to take it
ls2 <- list(mnp3j)
names(ls2) <- paste("mnp3", letters[10], sep = "")

## Recode MNP indicators
mnpDF <- recode_mnp(df = coverageData1.r2, ls1 = ls1, ls2 = ls2)
usethis::use_data(mnpDF, compress = "xz", overwrite = TRUE)


##################### Recode Vitamin A indicators ##############################

vit1e <- c("age", "small", "six", "6")    # Child too young during last campaign
vit1f <- c("see", "missed", "Liberia",
           "around", "home", "available") # Not around during last campaign
vit1g <- c("hear", "about", "know")       # Didn't hear/know about it
vit1h <- c("hospital")                    # Never been to hospital
vit1i <- c("community", "team", "reach",
           "received", "vicin", "see",
           "given", "never", "pass",
           "Polo", "Team", "bringing")    # Vaccine team didn't come/didn't reach/not given
vit1j <- c("interest")                    # Not interested
vit1k <- c("far", "Far", "nearbye")       # Far away
vit1l <- c("faciality", "no hospital")    # No facility
vit1m <- c("means")                       # No means/money
vit1n <- c("time")                        # No time
vit1o <- c("Waiting")                     # Waiting for next campaign

ls <- list(vit1e, vit1f, vit1g, vit1h, vit1i, vit1j, vit1k, vit1l, vit1m, vit1n, vit1o)
names(ls) <- paste("vit1", letters[5:15], sep = "")

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

intResultsGM <- interpolate_indicators(indicator = c("ifaDF", "iycfDF",
                                                     "mnpDF", "vitDF",
                                                     "screenDF", "anthroDF",
                                                     "cmamDF"),
                                       county = 1,
                                       coords = sampleList.r2,
                                       hexgrid = gmHexGrid)

intResultsGB <- interpolate_indicators(indicator = c("ifaDF", "iycfDF",
                                                     "mnpDF", "vitDF",
                                                     "screenDF", "anthroDF",
                                                     "cmamDF"),
                                       county = 2,
                                       coords = sampleList.r2,
                                       hexgrid = gbHexGrid)

ifaInt <- list(intResultsGM[["ifaDF"]], intResultsGB[["ifaDF"]])
usethis::use_data(ifaInt, compress = "xz", overwrite = TRUE)

iycfInt <- list(intResultsGM[["iycfDF"]], intResultsGB[["iycfDF"]])
usethis::use_data(iycfInt, compress = "xz", overwrite = TRUE)

mnpInt <- list(intResultsGM[["mnpDF"]], intResultsGB[["mnpDF"]])
usethis::use_data(mnpInt, compress = "xz", overwrite = TRUE)

vitInt <- list(intResultsGM[["vitDF"]], intResultsGB[["vitDF"]])
usethis::use_data(vitInt, compress = "xz", overwrite = TRUE)

screenInt <- list(intResultsGM[["screenDF"]], intResultsGB[["screenDF"]])
usethis::use_data(screenInt, compress = "xz", overwrite = TRUE)

anthroInt <- list(intResultsGM[["anthroDF"]], intResultsGB[["anthroDF"]])
usethis::use_data(anthroInt, compress = "xz", overwrite = TRUE)

cmamInt <- list(intResultsGM[["cmamDF"]], intResultsGB[["cmamDF"]])
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
        rep("cmamDF", ncol(cmamDF) - 5),
        rep("anthroDF", ncol(anthroDF) - 10))

varLabel <- c(names(ifaDF)[!names(ifaDF) %in% core.columns],
              names(iycfDF)[!names(iycfDF) %in% core.columns],
              names(mnpDF)[!names(mnpDF) %in% core.columns],
              names(vitDF)[!names(vitDF) %in% core.columns],
              names(screenDF)[!names(screenDF) %in% core.columns],
              names(cmamDF)[!names(cmamDF) %in% c("cid", "spid", "cin", "cout", "rin")],
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
              "No money",
              "Not good",
              "Far from health centre/hospital",
              "Not given tablets",
              "No time",
              "Don't like medicine",
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
              "No interest",
              "Don't know about it",
              "Too far",
              "No money",
              "Carer not around",
              "Too weak to go",
              "Don't like medicine",
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
              "Child not sick/healthy/doesn't need it",
              "Child didn't take it yet/doesn't want to take it",
              "Too far",
              "Don't want it/not interested",
              "Hospital doesn't have it",
              "Mother not around",
              "No means",
              "Mother pregnant at the time",
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
              "Too far",
              "No facility",
              "No means/money",
              "No time",
              "Waiting for next campaign",
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

bootResults <- boot_estimate(county = 1, w = psuDataGM)

##
ifaBoot <- bootResults[["ifaDF"]]
ifaBoot <- merge(indicatorList, ifaBoot, by = "varLabel", all.y = TRUE)
#usethis::use_data(ifaBoot, compress = "xz", overwrite = TRUE)

##
iycfBoot <- bootResults[["iycfDF"]]
iycfBoot <- merge(indicatorList, iycfBoot, by = "varLabel", all.y = TRUE)
#usethis::use_data(iycfBoot, compress = "xz", overwrite = TRUE)

##
mnpBoot <- bootResults[["mnpDF"]]
mnpBoot <- merge(indicatorList, mnpBoot, by = "varLabel", all.y = TRUE)
#usethis::use_data(mnpBoot, compress = "xz", overwrite = TRUE)

##
vitBoot <- bootResults[["vitDF"]]
vitBoot <- merge(indicatorList, vitBoot, by = "varLabel", all.y = TRUE)
#usethis::use_data(vitBoot, compress = "xz", overwrite = TRUE)

##
screenBoot <- bootResults[["screenDF"]]
screenBoot <- merge(indicatorList, screenBoot, by = "varLabel", all.y = TRUE)
#usethis::use_data(screenBoot, compress = "xz", overwrite = TRUE)

##
anthroBoot <- bootResults[["anthroDF"]]
anthroBoot <- merge(indicatorList, anthroBoot, by = "varLabel", all.y = TRUE)
#usethis::use_data(anthroBoot, compress = "xz", overwrite = TRUE)

############################## Grand Bassa #####################################

bootResults <- boot_estimate(county = 2, w = psuDataGB)

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

