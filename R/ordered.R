#' Add/Remove the ordered attribute to factors.
#'
#' @param f A factor
#' @export
#' @examples
#' x <- factor(c("Gold", "Bronze", "Silver", "Silver", "Gold", "Gold"),
#'                      levels = c("Bronze", "Silver", "Gold"))
#' ordered_x <- fct_make_ordered(x)
#' ordered_x
#
#' fct_remove_ordered(ordered_x)
fct_remove_ordered <- function(f) {
  f <- check_ordered_factor(f)

  old_levels <- levels(f)

  factor(f, levels = old_levels, ordered = FALSE)
}

#' @export
#' @rdname fct_remove_ordered
fct_make_ordered <- function(f) {
  f <- check_factor(f)

  old_levels <- levels(f)

  factor(f, levels = old_levels, ordered = TRUE)
}
