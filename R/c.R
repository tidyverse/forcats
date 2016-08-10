#' Concatenate factors, unioning levels.
#'
#' This is useful way of patching together factors from multiple sources
#' that really should have the same levels but don't.
#'
#' @param fs A list of factors
#' @export
#' @examples
#' fs <- list(factor("a"), factor("b"), factor(c("a", "b")))
#' fct_c(fs)
fct_c <- function(fs) {
  fs <- check_factor_list(fs)

  if (length(fs) == 0) {
    return(factor())
  }

  levels <- lvls_union(fs)
  all <- unlist(fct_unify(fs, levels))
  factor(all, levels = levels, exclude = NULL)
}

#' Unify the levels in a list of factors
#'
#' @param fs A list of factors
#' @param levels Set of levels to apply to every factor. Default to
#'   union of all factor levels
#' @export
#' @examples
#' fs <- list(factor("a"), factor("b"), factor(c("a", "b")))
#' fct_unify(fs)
fct_unify <- function(fs, levels = lvls_union(fs)) {
  fs <- check_factor_list(fs)

  lapply(fs, lvls_expand, new_levels = levels)
}
