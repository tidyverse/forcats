#' Make missing values explicit
#'
#' @description
#' `r lifecycle::badge("deprecated")`
#'
#' This function is deprecated because the terminology is confusing;
#' please use [fct_na_value_to_level()] instead.
#'
#' This gives missing values an explicit factor level, ensuring that they
#' appear in summaries and on plots.
#'
#' @param f A factor (or character vector).
#' @param na_level Level to use for missing values: this is what `NA`s will be
#'   changed to.
#' @export
#' @keywords internal
#' @examples
#' f1 <- factor(c("a", "a", NA, NA, "a", "b", NA, "c", "a", "c", "b"))
#' fct_count(f1)
#' table(f1)
#' sum(is.na(f1))
#'
#' # previously
#' f2 <- fct_explicit_na(f1)
#' # now
#' f2 <- fct_na_value_to_level(f1)
#'
#' fct_count(f2)
#' table(f2)
#' sum(is.na(f2))
fct_explicit_na <- function(f, na_level = "(Missing)") {
  lifecycle::deprecate_warn(
    when = "1.0.0",
    what = "fct_explicit_na()",
    with = "fct_na_value_to_level()"
  )

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
