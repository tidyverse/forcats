#' "Paste" together factors.
#'
#' Order is cartesian product of all levels.
#'
#' @details
#' This is sometimes useful when plotting a factor
#'
#' @param ... Factors to be united.
#' @param drop if drop is TRUE, unused factor levels are dropped from the result. 
#'   The default is to retain all factor levels.
#' @param sep Separtor to use 
#' @param lex.order if TRUE the resulting factor will be lexically ordered 
#' @export 
#' @examples
#' f <- factor(c("a", "b", "c"))
#' g <- factor(c("x", "y", "z"))
#' fct_paste(f, g, sep="-")
fct_paste <- function(..., drop = FALSE, sep=" ", lex.order = FALSE) {
  interaction(..., drop=drop, sep=sep, lex.order = lex.order)
}
