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


