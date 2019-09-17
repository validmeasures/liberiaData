######################### Read IFA data.frame ##################################

options(stringsAsFactors = FALSE)

ifaDF.r1 <- read.csv("data-raw/dataRound1/ifaBoot.csv")

ifaBoot.r1 <- read.csv("data-raw/dataRound1/ifaEst.csv")

## Restructure ifaBoot.r1 to match structure of ifaBoot

x <- ifaBoot.r1[ifaBoot.r1$county == "Monrovia", ]
y <- ifaBoot.r1[ifaBoot.r1$county == "Grand Bassa", ]
