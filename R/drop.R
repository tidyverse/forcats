#' Drop unnused levels
#'
#' Same as \code{\link{droplevels}()}, but with consistent name scheme.
#'
#' @param f A factor
#' @export
#' @examples
#' f <- factor(c("a", "b"), levels = c("a", "b", "c"))
#' f
#' fct_drop(f)
fct_drop <- function(f) {
  f <- check_factor(f)

  factor(f, exclude = NULL)
}
