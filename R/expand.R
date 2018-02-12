#' Add additional levels to a factor
#'
#' @param f A factor (or character vector).
#' @param ... Additional levels to add to the factor.  Levels that already
#'    exist will be silently ignored.
#' @export
#' @examples
#' f <- factor(sample(letters[1:3], 20, replace = TRUE))
#' f
#' fct_expand(f, "d", "e", "f")
#' fct_expand(f, letters[1:6])
fct_expand <- function(f, ...) {
  f <- check_factor(f)

  new_levels <- rlang::chr(...)
  lvls_expand(f, union(levels(f), new_levels))
}
