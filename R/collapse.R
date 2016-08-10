#' Collapse least/most common levels into "other".
#'
#' @param f A factor.
#' @param n,prop Use either \code{n} or \code{prop}.
#'
#'   Positive \code{n} preserves the most common \code{n} values.
#'   Negative \code{n} preserves the least common \code{-n} values.
#'   It there are ties, you will get at least \code{abs(n)} values.
#'
#'   Positive \code{prop}, preserves values that appear at least
#'   \code{prop} of the time. Negative \code{prop}, preserves values that
#'   appear at most \code{-prop} of the time.
#' @param other_level Value of level used for "other" values.
#' @export
#' @examples
#' x <- factor(letters[rpois(100, 5)])
#' x
#' table(x)
#'
#' # Use positive values to collapse the rarest
#' fct_collapse(x, n = 3)
#' fct_collapse(x, prop = 0.1)
#'
#' # Use negative values to collapse the most common
#' fct_collapse(x, n = -3)
#' fct_collapse(x, prop = -0.1)
fct_collapse <- function(f, n, prop, other_level = "Other") {
  f <- check_factor(f)

  count <- fct_count(f)

  if (!xor(missing(n), missing(prop))) {
    stop("You must specify one of `n` or `prop`", call = FALSE)
  } else if (!missing(n)) {
    if (n < 0) {
      rank <- rank(count$n, ties = "first")
      n <- -n
    } else {
      rank <- rank(-count$n, ties = "first")
    }

    new_levels <- ifelse(rank <= n, count$level, other_level)

  } else if (!missing(prop)) {
    count$prop <- count$n / sum(count$n)
    if (prop < 0) {
      new_levels <- ifelse(count$prop <= -prop, count$level, other_level)
    } else {
      new_levels <- ifelse(count$prop > prop, count$level, other_level)
    }
  }

  lvls_revalue(f, new_levels)
}

fct_count <- function(f) {
  f <- check_factor(f)

  tibble::tibble(
    level = levels(f),
    n = tabulate(f, nbins = nlevels(f))
  )
}
