#' Unique values of a factor, as a factor
#'
#' @description
#' `fct_unique()` extracts the complete set of possible values from the
#' levels of the factor, rather than looking at the actual values, like
#' [unique()].
#'
#' `fct_unique()` only uses the values of `f` in one way: it looks for
#' implicit missing values so that they can be included in the result.
#'
#' @param f A factor.
#' @return A factor.
#' @export
#' @examples
#' f <- fct(letters[rpois(100, 10)])
#' unique(f)     # in order of appearance
#' fct_unique(f) # in order of levels
#'
#' f <- fct(letters[rpois(100, 2)], letters[1:20])
#' unique(f)     # levels that appear in data
#' fct_unique(f) # all possible levels
fct_unique <- function(f) {
  f <- check_factor(f)

  levels <- levels(f)
  out <- seq_along(levels)

  # Ensure out includes any implicit missings
  if (anyNA(f)) {
    out <- c(out, NA_integer_)
  }

  structure(
    out,
    levels = levels,
    class = c(if (is.ordered(f)) "ordered", "factor")
  )
}
