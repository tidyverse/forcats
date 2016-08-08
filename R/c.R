#' Concatenate factors, unioning levels.
#'
#' This is useful way of patching together factors from multiple sources
#' that really should have the same levels but don't.
#'
#' @param fs A list of factors
#' @export
#' @examples
#' fs <- list(factor("a"), factor("b"), factor(c("a", "b")))
#' fct_c(fs)
fct_c <- function(fs) {
  levs <- Reduce(function(x, y) union(x, levels(y)), fs, init = character())

  all <- unlist(lapply(fs, factor, levels = levs))
  factor(all, levels = levs)
}
