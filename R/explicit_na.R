#' Make missing values explicit
#'
#' This gives missing values an explicit factor level, ensuring that they
#' appear in summaries and on plots.
#'
#' @param f A factor (or character vector).
#' @param na_level Level to use for missing values: this is what `NA`s will be
#'   changed to.
#' @export
#' @seealso [fct_recode()] to remove levels and recode their values to `NA`.
#' @examples
#' f1 <- factor(c("a", "a", NA, NA, "a", "b", NA, "c", "a", "c", "b"))
#' fct_count(f1)
#' table(is.na(f1))
#'
#' f2 <- fct_explicit_na(f1)
#' fct_count(f2)
#' table(is.na(f2))
#'
#' # use fct_recode() for the reverse operation
#' f3 <- fct_recode(f2, NULL = "(Missing)")
#' fct_count(f3)
fct_explicit_na <- function(f, na_level = "(Missing)") {
  f <- check_factor(f)

  is_missing <- is.na(f)
  is_missing_level <- is.na(levels(f))

  if (any(is_missing)) {
    f <- fct_expand(f, na_level)
    f[is_missing] <- na_level

    f
  } else if (any(is_missing_level)) {
    levs <- levels(f)
    levs[is.na(levs)] <- na_level

    lvls_revalue(f, levs)
  } else {
    f
  }
}
