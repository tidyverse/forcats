#' Collapse factors into groups.
#'
#' @param f A factor
#' @param ... A series of named character vectors. The levels in
#'   each vector will be replaced with the name.
#' @export
#' @examples
#' fct_collapse(gss_cat$partyid,
#'   missing = c("No answer", "Don't know"),
#'   other = "Other party",
#'   rep = c("Strong republican", "Not str republican"),
#'   ind = c("Ind,near rep", "Independent", "Ind,near dem"),
#'   dem = c("Not str democrat", "Strong democrat")
#' )
fct_collapse <- function(f, ...) {
  new <- list(...)

  levs <- as.list(unlist(new, use.names = FALSE))
  names(levs) <- names(new)[rep(seq_along(new), vapply(new, length, integer(1)))]

  do.call(fct_recode, c(list(quote(f)), levs))
}
