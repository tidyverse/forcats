#' Reorder the levels of a function according to another variable
#'
#' \code{fct_reorder} is useful for 1d displays where the factor is mapped to
#' position; \code{fct_reorder2} for 2d displays where the factor is mapped to
#' a non-position aesthetic.
#'
#' \code{fct_reorder} is currently an almost exact copy of
#' \code{\link[stats]{reorder}} but it may change in the future.
#'
#' @param f A factor
#' @param x,y fun The levels of \code{f} will be reordered so that \code{fun}
#'    apply to each group is in ascending order.
#' @param fun An summary function. It should take one vector for
#'   \code{fct_reorder}, and two vectors for \code{fct_reorder2}.
#' @param ... Other arguments passed on to \code{fun}. A common argument is
#'   \code{na.rm = TRUE}.
#' @importFrom stats median
#' @export
#' @examples
#' boxplot(Sepal.Width ~ Species, data = iris)
#' boxplot(Sepal.Width ~ fct_reorder(Species, Sepal.Width), data = iris)
#'
#' chks <- subset(ChickWeight, as.integer(Chick) < 20)
#'
#' if (require("ggplot2")) {
#' ggplot(chks, aes(Time, weight, colour = Chick)) +
#'   geom_point() +
#'   geom_line()
#' ggplot(chks, aes(Time, weight, colour = fct_reorder2(Chick, Time, weight))) +
#'   geom_point() +
#'   geom_line()
#' }
fct_reorder <- function(f, x, fun = median, ...) {
  f <- check_factor(f)
  stopifnot(length(f) == length(x))

  summary <- tapply(x, factor(f), fun, ...)
  if (!is.numeric(summary)) {
    stop("`fun` must return a single number per group", call. = FALSE)
  }

  factor(f, levels = levels(f)[order(summary)])
}

#' @export
#' @rdname fct_reorder
fct_reorder2 <- function(f, x, y, fun = last2, ...) {
  f <- check_factor(f)
  stopifnot(length(f) == length(x), length(x) == length(y))

  summary <- tapply(seq_along(x), factor(f), function(i) fun(x[i], y[i], ...))
  if (!is.numeric(summary)) {
    stop("`fun` must return a single number per group", call. = FALSE)
  }

  factor(f, levels = levels(f)[order(summary)])
}

last2 <- function(x, y) {
  y[order(x, na.last = FALSE)][length(y)]
}
