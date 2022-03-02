#' Collapse factor levels into manually defined groups
#'
#' @param .f A factor (or character vector).
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> A series of named character vectors. The levels in
#'   each vector will be replaced with the name.
#' @inheritParams fct_other
#' @param group_other Deprecated. Replace all levels not named in `...` with "Other"?
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
fct_collapse <- function(.f, ..., other_level = NULL, group_other = "DEPRECATED") {
  f <- check_factor(.f)

  if (!missing(group_other)) {
    lifecycle::deprecate_warn(
      when = "0.5.0",
      what = "fct_collapse(group_other)",
      with = "fct_collapse(other_level)"
    )
    if (isTRUE(group_other) && is.null(other_level)) {
      other_level <- "Other"
    }
  }

  new <- rlang::list2(...)
  levs <- as.list(unlist(new, use.names = FALSE))

  if (!is.null(other_level)) {
    levels <- levels(f)
    new[[other_level]] <- levels[!levels %in% levs]
    levs <- c(levs, new[[other_level]])
  }

  names(levs) <- names(new)[rep(seq_along(new), vapply(new, length, integer(1)))]
  out <- fct_recode(.f, !!!levs)

  if (any(levels(out) == other_level)) {
    fct_relevel(out, other_level, after = Inf)
  } else {
    out
  }
}
