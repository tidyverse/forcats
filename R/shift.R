#' Shift the order of levels of a factor
#'
#' This is useful when the levels of an ordered factor are actually cyclical,
#' with different conventions on the starting point.
#'
#' @param f A factor.
#' @param left_by A numeric indicating the amount that the levels will be
#' shifted left by. Negative values shift the levels to the right.
#' @export
#' @examples
#' x <- factor(weekdays(Sys.Date()), levels = c("Sunday", "Monday", "Tuesday",
#'             "Wednesday", "Thursday", "Friday", "Saturday"), ordered = TRUE)
#' fct_shift(x)
#' fct_shift(x, left_by = 1)    # The same
fct_shift <- function(f, left_by = 1L) {
  stopifnot(length(left_by) == 1L)
  mark <- left_by %% nlevels(f)
  new_levels <- levels(f)[c(seq(mark + 1, nlevels(f)), seq_len(mark))]
  factor(f, levels = new_levels, ordered = TRUE)
}
