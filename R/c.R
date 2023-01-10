#' Concatenate factors, combining levels
#'
#' This is a useful way of patching together factors from multiple sources
#' that really should have the same levels but don't.
#'
#' @param ... <[`dynamic-dots`][rlang::dyn-dots]> Individual
#'   factors. Uses tidy dots, so you can splice in a list of factors
#'   with `!!!`.
#' @export
#' @examples
#' fa <- factor("a")
#' fb <- factor("b")
#' fab <- factor(c("a", "b"))
#'
#' c(fa, fb, fab)
#' fct_c(fa, fb, fab)
#'
#' # You can also pass a list of factors with !!!
#' fs <- list(fa, fb, fab)
#' fct_c(!!!fs)
fct_c <- function(...) {
  fs <- list2(...)
  fs <- check_factor_list(fs, "...")

  if (length(fs) == 0) {
    return(factor())
  }

  levels <- lvls_union(fs)
  all <- unlist(fct_unify(fs, levels), use.names = FALSE)
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
  check_character(levels)

  lapply(fs, lvls_expand, new_levels = levels)
}
