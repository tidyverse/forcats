#' Add additional levels to a factor
#'
#' @param f A factor.
#' @param ... Additional levels to add to the factor.  Levels that already
#'    exist will be silently ignored.
#' @export
#' @examples
#' f <- factor(sample(letters[1:3], 20, replace = TRUE))
#' f
#' fct_expand(f, "d", "e", "f")
#' fct_expand(f, letters[1:6])
fct_expand <- function(f, ...) {
  new_levels <- c(..., character())
  stopifnot(is.character(new_levels))

  lvls_expand(f, union(levels(f), new_levels))
}
