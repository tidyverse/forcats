#' Unique values of a factor
#'
#' @param f A factor.
#' @export
#' @examples
#' f <- factor(letters[rpois(100, 10)])
#'
#' unique(f)     # in order of appearance
#' fct_unique(f) # in order of levels
fct_unique <- function(f) {
  factor(levels(f), levels(f), exclude = NULL, ordered = is.ordered(f))
}

