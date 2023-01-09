#' Convert between `NA` values and `NA` levels
#'
#' @description
#' There are two ways to represent missing values in factors: in the values
#' and in the levels. `NA`s in the values are most useful for data analysis
#' (since [is.na()] returns what you expect), but because the `NA` is not
#' explicitly recorded in the levels, there's no way to control its position
#' (it's almost always displayed last or not at all). Putting the `NA`s in the levels allows
#' you to control its display, at the cost of losing accurate `is.na()`
#' reporting.
#'
#' (It is possible to have a factor with missing values in both the values
#' and the levels but it requires some explicit gymnastics and we don't
#' recommend it.)
#'
#' @param f A factor (or character vector).
#' @export
#' @examples
#' # Most factors store NAs in the values:
#' f1 <- fct(c("a", "b", NA, "c", "b", NA))
#' levels(f1)
#' as.integer(f1)
#' is.na(f1)
#'
#' # But it's also possible to store them in the levels
#' f2 <- fct_na_value_to_level(f1)
#' levels(f2)
#' as.integer(f2)
#' is.na(f2)
#'
#' # If needed, you can convert back to NAs in the values:
#' f3 <- fct_na_level_to_value(f2)
#' levels(f3)
#' as.integer(f3)
#' is.na(f3)
fct_na_value_to_level <- function(f) {
  f <- check_factor(f)

  f <- fct_expand(f, NA)
  f[is.na(f)] <- NA

  f
}

#' @export
#' @rdname fct_na_value_to_level
fct_na_level_to_value <- function(f) {
  f <- check_factor(f)

  new_levels <- setdiff(levels(f), NA)
  idx <- match(new_levels, levels(f))

  out <- idx[f]
  attributes(out) <- attributes(f)
  attr(out, "levels") <- new_levels
  out
}
