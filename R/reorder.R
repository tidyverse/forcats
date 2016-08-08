#' Reorder the levels of a function according to another variable
#'
#' \code{fct_reorder} is useful for 1d displays where the factor is mapped to
#' position; \code{fct_reorder2} for 2d displays where the factor is mapped to
#' a non-position aesthetic.
#'
#' \code{fct_reorder} is currently an almost exact copy of
#' \code{\link[stats]{reorder}} but it may change in the future.
#'
#' @param x A factor
#' @param y,fun fun The levels of \code{x} will be reordered so that \code{fun}
#'    apply to each group is in ascending order.
#' @param ... Other arguments passed on to \code{fun}. A common argument is
#'   \code{na.rm = TRUE}.
#' @importFrom stats median
#' @export
#' @examples
#' boxplot(Sepal.Width ~ Species, data = iris)
#' boxplot(Sepal.Width ~ fct_reorder(Species, Sepal.Width), data = iris)
fct_reorder <- function(x, y, fun = median, ...) {

  summary <- tapply(y, x, fun, ...)
  if (!is.numeric(summary) || length(summary) != nlevels(x)) {
    stop("`fun` must return a single number per group", call. = FALSE)
  }

  factor(x, levels = levels(x)[order(summary)])
}
