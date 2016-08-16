#' A sample of categorical variables from the General Social survey
#'
#' @source Downloaded from \url{https://gssdataexplorer.norc.org/}.
#' @format
#' \describe{
#'  \item{year}{year of survey, 2000--2014}
#'  \item{age}{age. Maximum age truncated to 89.}
#'  \item{marital}{marital status}
#'  \item{race}{race}
#'  \item{rincome}{reported income}
#'  \item{partyid}{party affiliation}
#'  \item{relig}{religion}
#'  \item{denom}{denomination}
#'  \item{tvhours}{hours per day watching tv}
#' }
#' @examples
#' gss_cat
#'
#' fct_count(gss_cat$relig)
#' fct_count(fct_lump(gss_cat$relig))
"gss_cat"
