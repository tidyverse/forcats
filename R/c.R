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

  levels <- lvl_union(fs)
  all <- unlist(fct_unify(fs, levels))
  factor(all, levels = levels)
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
fct_unify <- function(fs, levels = lvl_union(fs)) {
  fs <- check_factor_list(fs)

  lapply(fs, factor, levels = levels)
}

#' Find all levels in a list of factors
#'
#' @param fs A list of factors.
#' @export
#' @examples
#' fs <- list(factor("a"), factor("b"), factor(c("a", "b")))
#' lvl_union(fs)
lvl_union <- function(fs) {
  fs <- check_factor_list(fs)
  Reduce(function(x, y) union(x, levels(y)), fs, init = character())
}
