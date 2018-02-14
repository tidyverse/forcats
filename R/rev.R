#' Reverse order of factor levels
#'
#' This is sometimes useful when plotting a factor.
#'
#' @param f A factor (or character vector).
#' @export
#' @examples
#' f <- factor(c("a", "b", "c"))
#' fct_rev(f)
fct_rev <- function(f) {
  f <- check_factor(f)

  lvls_reorder(f, rev(lvls_seq(f)))
}
