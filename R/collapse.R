#' Collapse factor levels into manually defined groups
#'
#' @param .f A factor (or character vector).
#' @param ... A series of named character vectors. The levels in
#'   each vector will be replaced with the name.
#' @param group_other Replace all levels not named in `...` with "Other"?
#' @export
#' @examples
#' fct_count(gss_cat$partyid)
#'
#' partyid2 <- fct_collapse(gss_cat$partyid,
#'   missing = c("No answer", "Don't know"),
#'   other = "Other party",
#'   rep = c("Strong republican", "Not str republican"),
#'   ind = c("Ind,near rep", "Independent", "Ind,near dem"),
#'   dem = c("Not str democrat", "Strong democrat")
#' )
#' fct_count(partyid2)
fct_collapse <- function(.f, ..., group_other = FALSE) {
  new <- rlang::dots_list(...)
  levs <- as.list(unlist(new, use.names = FALSE))
  if (group_other){
    f <- check_factor(.f)
    levels <- levels(f)
    new[["Other"]] <- levels[!levels %in% levs]
    levs <- levels
  }

  names(levs) <- names(new)[rep(seq_along(new), vapply(new, length, integer(1)))]

  fct_recode(.f, !!!levs)
}
