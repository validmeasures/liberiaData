################################################################################
#
# Prepare codebook
#
################################################################################

library(readxl)
library(openxlsx)

## Read survey sheet of xlsform
survey <- read_xlsx(path = "data-raw/formsRound2/liberiaCoverage.xlsx", sheet = "survey")

## Select rows with type that contains data
survey <- survey[!survey$type %in% c("begin group", "begin repeat",
                                     "end group", "end repeat", "note"), ]

survey <- survey[!is.na(survey$type), ]

## Read choices sheet of xlsform
choices <- read_xlsx(path = "data-raw/formsRound2/liberiaCoverage.xlsx", sheet = "choices")

## Remove blanks
choices <- choices[!is.na(choices$`list name`), ]

get_choices <- function(survey, choices) {

  responses <- vector(mode = "character", length = nrow(survey))

  for(i in 1:nrow(survey)) {

    if(stringr::str_detect(string = survey$type[i], pattern = "select_one ")) {
      choice.set <- stringr::str_remove_all(string = survey$type[i],
                                            pattern = "select_one ")

      responses[i] <- paste(choices$name[choices$`list name` == choice.set],
                            choices$label[choices$`list name` == choice.set],
                            sep = "=",
                            collapse = "; ")
    }

    if(stringr::str_detect(string = survey$type[i],
                           pattern = "select_multiple ")) {
      choice.set <- stringr::str_remove_all(string = survey$type[i],
                                            pattern = "select_multiple ")

      responses[i] <- paste(choices$name[choices$`list name` == choice.set],
                            choices$label[choices$`list name` == choice.set],
                            sep = "=",
                            collapse = "; ")
    }
  }
  return(responses)
}

responses <- get_choices(survey = survey, choices = choices)

codebook <- data.frame(variable = as.character(survey$name),
                       question = as.character(survey$label),
                       choices = as.character(responses))

codebook <- tibble::as_tibble(codebook)
usethis::use_data(codebook, compress = "xz", overwrite = TRUE)
