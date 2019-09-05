################################################################################
#
#' Function to recode age variable and convert to age in days
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#'
#' @return A vector of recoded ages based on any re-testing done
#'
#' @examples
#'
#' recode_age(df = coverageData.r2)
#'
#' @export
#'
#
################################################################################

recode_age <- function(df) {
  age <- vector(mode = "numeric", length = nrow(df))
  ## Keep NAs
  age[is.na(df$age)] <- NA
  ##
  age[is.na(df$age1) & is.na(df$age2)] <- df$age
  ##
  age[!is.na(df$age1)] <- df$age1
  ##
  age[!is.na(df$age2)] <- df$age2
  ## Convert to days
  age <- age * (365.25 / 12)
  ##
  return(age)
}


################################################################################
#
#' Function to recode sex variable
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#'
#' @return A vector of recoded sex based on any re-testing done
#'
#' @examples
#'
#' recode_sex(df = coverageData.r2)
#'
#' @export
#'
#
################################################################################

recode_sex <- function(df) {
  sex <- vector(mode = "numeric", length = nrow(df))
  ## Keep NAs
  sex[is.na(df$sex)] <- NA
  ##
  sex[is.na(df$sex1) & is.na(df$sex2)] <- df$sex
  ##
  sex[!is.na(df$sex1)] <- df$sex1
  ##
  sex[!is.na(df$sex2)] <- df$sex2
  return(sex)
}


################################################################################
#
#' Function to recode weight variable
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#'
#' @return A vector of recoded weights based on any re-testing done
#'
#' @examples
#'
#' recode_weight(df = coverageData.r2)
#'
#' @export
#'
#
################################################################################

recode_weight <- function(df) {
  weight <- vector(mode = "numeric", length = nrow(df))
  ## Keep NAs
  weight[is.na(df$weight1)] <- NA
  ##
  weight[is.na(df$weight2) & is.na(df$weigth3)] <- df$weight1
  ##
  weight[!is.na(df$weight2)] <- df$weight2
  ##
  weight[!is.na(df$weight3)] <- df$weight3
  return(weight)
}


################################################################################
#
#' Function to recode height variable
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#'
#' @return A vector of recoded heights based on any re-testing done
#'
#' @examples
#'
#' recode_height(df = coverageData.r2)
#'
#' @export
#'
#
################################################################################

recode_height <- function(df) {
  height <- vector(mode = "numeric", length = nrow(df))
  ## Keep NAs
  height[is.na(df$height1)] <- NA
  ##
  height[is.na(df$height2) & is.na(df$height3)] <- df$height1
  ##
  height[!is.na(df$height2)] <- df$height2
  ##
  height[!is.na(df$height3)] <- df$height3
  return(height)
}


################################################################################
#
#' Function to recode MUAC variable
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#'
#' @return A vector of recoded MUACs based on any re-testing done
#'
#' @examples
#'
#' recode_muac(df = coverageData.r2)
#'
#' @export
#'
#
################################################################################

recode_muac <- function(df) {
  muac <- vector(mode = "numeric", length = nrow(df))
  ## Keep NAs
  muac[is.na(df$muac1)] <- NA
  ##
  muac[is.na(df$muac2) & is.na(df$muac3)] <- df$muac1
  ##
  muac[!is.na(df$muac2)] <- df$muac2
  ##
  muac[!is.na(df$muac3)] <- df$muac3
  return(muac)
}


################################################################################
#
#' Function to recode oedema variable
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#'
#' @return A vector of recoded oedema results based on any re-testing done
#'
#' @examples
#'
#' recode_oedema(df = coverageData.r2)
#'
#' @export
#'
#
################################################################################

recode_oedema <- function(df) {
  oedema <- vector(mode = "numeric", length = nrow(df))
  ## Keep NAs
  oedema[is.na(df$oedema1)] <- NA
  ##
  oedema[is.na(df$oedema2) & is.na(df$oedema3)] <- df$oedema1
  ##
  oedema[!is.na(df$oedema2)] <- df$oedema2
  ##
  oedema[!is.na(df$oedema3)] <- df$oedema3
  return(oedema)
}


################################################################################
#
#' Function to recode position of height measurements variable
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#'
#' @return A vector of recoded position of height measurements based on any
#' re-testing done
#'
#' @examples
#'
#' recode_position(df = coverageData.r2)
#'
#' @export
#'
#
################################################################################

recode_position <- function(df) {
  position <- vector(mode = "numeric", length = nrow(df))
  ## Keep NAs
  position[is.na(df$position)] <- NA
  ##
  position[is.na(df$position2) & is.na(df$position3)] <- df$position1
  ##
  position[!is.na(df$position2)] <- df$position2
  ##
  position[!is.na(df$position3)] <- df$position3
  return(position)
}


################################################################################
#
#' Function to recode child anthropometric indicators and calculate
#' anthropometric z-scores
#'
#' @param df A coverage data.frame collected for the Liberia Coverage Survey
#' @param core.columns A vector of variable names to include in resulting
#'   data.frame
#'
#' @return A data.frame of recoded anthropometric measurements and z-scores
#'
#' @examples
#' recode_anthro(df = coverageData.r2)
#'
#' @export
#'
#
################################################################################

recode_anthro <- function(df,
                          core.columns = c("cid", "did", "eid",
                                           "motherID", "m2")) {
  ## Recode anthro measurements
  age <- recode_age(df = df)
  sex <- recode_age(df = df)
  muac <- recode_muac(df = df)
  height <- recode_height(df = df)
  weight <- recode_weight(df = df)
  oedema <- recode_oedema(df = df)
  position <- recode_position(df = df)

  anthroDF <- data.frame(age, sex, muac, height, weight, oedema, position)

  ## Get z-scores weight-for-age
  zscorer::addWGSR(data = anthroDF, sex = "sex",
                   firstPart = "weight", secondPart = "age",
                   index = "wfa", output = "waz")

  ## Get z-scores height-for-age
  zscorer::addWGSR(data = anthroDF, sex = "sex",
                   firstPart = "height", secondPart = "age",
                   index = "hfa", standing = "position", output = "haz")

  ## Get z-scores weight-for-height
  zscorer::addWGSR(data = anthroDF, sex = "sex",
                   firstPart = "weight", secondPart = "height",
                   index = "wfh", standing = "position", output = "whz")

  return(anthroDF)
}
