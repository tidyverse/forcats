#' Make missing values explicit
#'
#' This gives missing value an explicit factor level, ensuring that they
#' appear in summaries and on plots.
#'
#' @param f A factor.
#' @param na_level Level to use for missing values.
#' @export
#' @examples
#' f1 <- factor(c("a", "a", NA, NA, "a", "b", NA, "c", "a", "c", "b"))
#' table(f1)
#'
#' f2 <- fct_explicit_na(f1)
#' table(f2)
fct_explicit_na <- function(f, na_level = "(Missing)") {
  f <- check_factor(f)

  is_missing <- is.na(f)
  if (!any(is_missing)) {
    return(f)
  }

  f <- fct_expand(f, na_level)
  f[is_missing] <- na_level

  f
}

has_level <- function(f, level) {
  level %in% levels(f)
}
