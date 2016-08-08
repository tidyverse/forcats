#' Collapse rare levels into "other".
#'
#' @param x A factor.
#' @param n,prop Either specify \code{n} or \code{prop}.
#'
#'   If you specify \code{n}, only the most common \code{n} values will be kept
#'   (unless there are ties, in which case it will keep more).
#'
#'   If you specify \code{prop}, only values that appear at least that
#'   commonly will be kept.
#' @param other_level Value of level used for "other" values.
#' @export
#' @examples
#' x <- factor(letters[rpois(100, 5)])
#' x
#' fct_collapse(x, n = 3)
#' fct_collapse(x, prop = 0.1)
fct_collapse <- function(x, n, prop, other_level = "Other") {

  count <- fct_count(x)

  if (!xor(missing(n), missing(prop))) {
    stop("You must specify one of `n` or `prop`", call = FALSE)
  } else if (!missing(n)) {
    rank <- rank(-count$n, ties = "first")
    new_levels <- ifelse(rank <= n, count$level, other_level)
  } else if (!missing(prop)) {
    count$prop <- count$n / sum(count$n)
    new_levels <- ifelse(count$prop > prop, count$level, other_level)
  }

  levels(x) <- new_levels
  x
}

fct_count <- function(x) {
  stopifnot(is.factor(x))

  tibble::tibble(
    level = levels(x),
    n = tabulate(x, nbins = nlevels(x))
  )
}
