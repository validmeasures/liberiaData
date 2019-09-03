## Libraries
library(liberiaData)

coverageData <- get_liberia_data(id = "liberiaCoverageRound2",
                                 username = "cadnihead",
                                 password = "kEv-hAB-Arb-6Cn",
                                 start = "2019-08-27",
                                 end = Sys.Date(),
                                 filename = "coverageData",
                                 rep = TRUE,
                                 rep.name = "child_repeat")

coverageData <- merge_repeats(x = coverageData, rep.name = "child_repeat")

coreColumns <- c("sdate", "cid", "spid", "ea", "consent2", "m2", "ch",
                 "mcheck1")

coverageData2 <- coverageData[ , c("sdate", "cid", "county", "did", "eid", "consent2",
                                   "m2", "ch", "mcheck1", "ifa1", "ifa2", "ifa3",
                                   "ifa3a.1", "ifa3a.2", "ifa3a.3", "ifa3a.88",
                                   "ifa3a_other", "ifa4", "ifa4a.1", "ifa4a.2",
                                   "ifa4a.3", "ifa4a.4", "ifa4a.88",
                                   "ifa4a_other","ifa5", "icf1", "icf2",
                                   "icf2a.1", "icf2a.2", "icf2a.3", "icf2a.4",
                                   "icf2a.88", "icf2a_other", "icf3", "c2",
                                   "cage", "csex", "mnp1", "mnp2", "mnp2a.1",
                                   "mnp2a.2", "mnp2a.3", "mnp2a.4", "mnp2a.5",
                                   "mnp2a.88", "mnp2a_other", "mnp3", "mnp3a.1",
                                   "mnp3a.2", "mnp3a.3", "mnp3a.4", "mnp3a.5",
                                   "mnp3a.6", "mnp3a.7", "mnp3a.8", "mnp3a.9",
                                   "mnp3a.88", "mnp3a_other", "mnp4", "vit1",
                                   "vit1a.1", "vit1a.2", "vit1a.3", "vit1a.4",
                                   "vit1a.88", "vit1a_other", "vit2", "vit3",
                                   "c1", "sex", "card", "know_dob", "dob",
                                   "age_report", "age", "age_check", "muac1",
                                   "muac_screen", "oedema1", "oedema_screen",
                                   "oedema_check", "muac", "sam", "muac2",
                                   "oedema2", "oedema_check2", "muac1a",
                                   "sam1a", "muac3", "oedema3", "oedema_check3",
                                   "muac1b", "sam1b", "nut_status", "cov_status",
                                   "in.", "recovering", "out", "q1", "q1a.1",
                                   "q1a.2", "q1a.3", "q1a.4", "q1a.5", "q1a.6",
                                   "q2", "q3", "q4.q4a", "q4.q4b", "q4.q4c",
                                   "q4.q4d", "q4.q4e", "q4.q4f", "q4.q4g",
                                   "q4.q4h", "q4.q4i", "q4.q4j", "q4.q4k",
                                   "q4.q4l", "q4.q4m", "q4.q4n", "q4.q4o",
                                   "q4.q4p", "q4.q4q", "q4.q4r", "q4.q4s", "q4t",
                                   "q5", "q6.q6a", "q6.q6b", "q6.q6c", "q6.q6d",
                                   "q6e")]

usethis::use_data(coverageData2, overwrite = TRUE)

villageData <- get_liberia_data(id = "liberiaVillageFormRound2",
                                 username = "cadnihead",
                                 password = "kEv-hAB-Arb-6Cn",
                                 start = "2019-08-27",
                                 end = Sys.Date(),
                                 filename = "villageData")

villageData2 <- villageData[ , c("cid", "county", "did", "eid", "lat", "lon", "pop",
                                 "coords.Latitude", "coords.Longitude",
                                 "coords.Altitude", "coords.Accuracy")]

usethis::use_data(villageData2, overwrite = TRUE)

################################################################################

## Recode IFA indicators

calculate_ifa(df = coverageData2)

