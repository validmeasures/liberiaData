######################### Read IFA data.frame ##################################

options(stringsAsFactors = FALSE)

ifaDF.r1 <- read.csv("data-raw/dataRound1/ifaBoot.csv")

ifaBoot.r1 <- read.csv("data-raw/dataRound1/ifaEst.csv")
usethis::use_data(ifaBoot.r1, overwrite = TRUE)

icfBoot.r1 <- read.csv("data-raw/dataRound1/icfEst.csv")
usethis::use_data()

vitBoot.r1 <- read.csv("data-raw/dataRound1/vitEst.csv")
screenBoot.r1 <- read.csv("data-raw/dataRound1/screenEst.csv")
cmamBoot.r1 <- read.csv("data-raw/dataRound1/coverageEst.csv")
anthroBoot.r1 <- read.csv("data-raw/dataRound1/nutEst.csv")



## Restructure ifaBoot.r1 to match structure of ifaBoot


