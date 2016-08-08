#' Collapse rare levels into "other".
#'
#' @param x A factor.
#' @param threshold Values with less than this proportion of entries will
#'   be collpased
#' @param other_level Value of level used for "other" values.
#' @export
#' @examples
#' x <- factor(letters[rpois(100, 5)])
#' x
#' fct_collapse(x)
fct_collapse <- function(x, threshold = 0.1, other_level = "Other") {

  count <- fct_count(x)
  count$prop <- count$n / sum(count$n)

  new_levels <- ifelse(count$prop > threshold, count$level, other_level)
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
