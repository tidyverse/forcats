#' Add additional levels to a factor
#'
#' @param f A factor (or character vector).
#' @param ... Additional levels to add to the factor. Levels that already
#'    exist will be silently ignored.
#' @inheritParams fct_relevel
#' @export
#' @seealso [fct_drop()] to drop unused factor levels.
#' @examples
#' f <- factor(sample(letters[1:3], 20, replace = TRUE))
#' f
#' fct_expand(f, "d", "e", "f")
#' fct_expand(f, letters[1:6])
#' fct_expand(f, "Z", after = 0)
fct_expand <- function(f, ..., after = Inf) {
  f <- check_factor(f)
  check_dots_unnamed()
  check_number_decimal(after, min = 0)

  old_levels <- levels(f)
  new_levels <- chr(...)

  new_levels <- append(
    old_levels,
    setdiff(new_levels, old_levels),
    after = after
  )
  lvls_expand(f, new_levels)
}
