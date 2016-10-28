#' Shift factor levels to left or right, wrapping around at end
#'
#' This is useful when the levels of an ordered factor are actually cyclical,
#' with different conventions on the starting point.
#'
#' @param f A factor.
#' @param n Positive values shift to the left; negative values shift to
#'   the right.
#' @export
#' @examples
#' x <- factor(
#'   c("Mon", "Tue", "Wed"),
#'   levels = c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"),
#'   ordered = TRUE
#' )
#' x
#' fct_shift(x)
#' fct_shift(x, 2)
#' fct_shift(x, -1)
fct_shift <- function(f, n = 1L) {
  lvls_reorder(f, shift(nlevels(f), n))
}

shift <- function(m, n) {
  stopifnot(is.numeric(m), length(m) == 1L)
  stopifnot(is.numeric(n), length(n) == 1L)

  ((seq_len(m) - 1) + n) %% m + 1
}
