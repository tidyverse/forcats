#' Reorder the levels of a function according to another variable
#'
#' \code{fct_reorder} is useful for 1d displays where the factor is mapped to
#' position; \code{fct_reorder2} for 2d displays where the factor is mapped to
#' a non-position aesthetic.
#'
#' @param f A factor
#' @param x,y fun The levels of \code{f} will be reordered so that \code{fun}
#'    apply to each group is in ascending order.
#' @param fun An summary function. It should take one vector for
#'   \code{fct_reorder}, and two vectors for \code{fct_reorder2}.
#' @param ... Other arguments passed on to \code{fun}. A common argument is
#'   \code{na.rm = TRUE}.
#' @param .desc Order in descending order? Note the default is different
#'   between \code{fct_reorder} and \code{fct_reorder2}, in order to
#'   match the default ordering of factors in the legend.
#' @importFrom stats median
#' @export
#' @examples
#' boxplot(Sepal.Width ~ Species, data = iris)
#' boxplot(Sepal.Width ~ fct_reorder(Species, Sepal.Width), data = iris)
#' boxplot(Sepal.Width ~ fct_reorder(Species, Sepal.Width, .desc = TRUE), data = iris)
#'
#' chks <- subset(ChickWeight, as.integer(Chick) < 10)
#' chks <- transform(chks, Chick = fct_shuffle(Chick))
#'
#' if (require("ggplot2")) {
#' ggplot(chks, aes(Time, weight, colour = Chick)) +
#'   geom_point() +
#'   geom_line()
#'
#' # Note that lines match order in legend
#' ggplot(chks, aes(Time, weight, colour = fct_reorder2(Chick, Time, weight))) +
#'   geom_point() +
#'   geom_line() +
#'   labs(colour = "Chick")
#' }
fct_reorder <- function(f, x, fun = median, ..., .desc = FALSE) {
  f <- check_factor(f)
  stopifnot(length(f) == length(x))

  summary <- tapply(x, f, fun, ...)
  if (!is.numeric(summary)) {
    stop("`fun` must return a single number per group", call. = FALSE)
  }

  lvls_reorder(f, order(summary, decreasing = .desc))
}

#' @export
#' @rdname fct_reorder
fct_reorder2 <- function(f, x, y, fun = last2, ..., .desc = TRUE) {
  f <- check_factor(f)
  stopifnot(length(f) == length(x), length(x) == length(y))

  summary <- tapply(seq_along(x), f, function(i) fun(x[i], y[i], ...))
  if (!is.numeric(summary)) {
    stop("`fun` must return a single number per group", call. = FALSE)
  }

  lvls_reorder(f, order(summary, decreasing = .desc))
}

last2 <- function(x, y) {
  y[order(x, na.last = FALSE)][length(y)]
}


#' Reorders levels in order of first appearance or frequency.
#'
#' @param f A factor
#' @export
#' @examples
#' f <- factor(c("b", "b", "a", "c", "c", "c"))
#' f
#' fct_inorder(f)
#' fct_infreq(f)
fct_inorder <- function(f) {
  f <- check_factor(f)

  lvls_reorder(f, as.integer(f)[!duplicated(f)])
}

#' @export
#' @rdname fct_inorder
fct_infreq <- function(f) {
  f <- check_factor(f)

  lvls_reorder(f, order(table(f), decreasing = TRUE))
}
