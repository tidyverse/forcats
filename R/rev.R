#' Reverse the levels of a factor
#'
#' This is sometimes useful when plotting a factor
#'
#' @param f A factor
#' @export
#' @examples
#' f <- factor(c("a", "b", "c"))
#' fct_rev(f)
fct_rev <- function(f) {
  factor(f, levels = rev(levels(f)))
}
