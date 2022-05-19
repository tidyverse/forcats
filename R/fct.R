#' Create a factor
#'
#' `fct()` is a stricter version of [factor()] that errors if your
#' specification of `levels` is inconsistent with the values in `x`.
#'
#' @param x A character vector. Values must occur in either `levels` or `na`.
#' @param levels A character vector of known levels. If not supplied, will
#'   be computed from the unique values of `x`, in the order in which they
#'   occur.
#' @param na A character vector of values that should become missing values.
#' @return A factor.
#' @export
#' @examples
#' # Use factors when you know the set of possible values a variable might take
#' x <- c("A", "O", "O", "AB", "A")
#' fct(x, levels = c("O", "A", "B", "AB"))
#'
#' # If you don't specify the levels, fct will create from the data
#' # in the order that they're seen
#' fct(x)
#'
#'
#' # Differences with base R -----------------------------------------------
#' # factor() silently generates NAs
#' x <- c("a", "b", "c")
#' factor(x, levels = c("a", "b"))
#' # fct() errors
#' try(fct(x, levels = c("a", "b")))
#' # Unless you explicitly supply NA:
#' fct(x, levels = c("a", "b"), na = "c")
#'
#' # factor() sorts default levels:
#' factor(c("y", "x"))
#' # fct() uses in order of appearance:
#' fct(c("y", "x"))
fct <- function(x = character(), levels = NULL, na = character()) {
  if (!is.character(x)) {
    cli::cli_abort("{.arg x} must be a character vector")
  }
  if (!is.character(na)) {
    cli::cli_abort("{.arg na} must be a character vector")
  }

  x[x %in% na] <- NA

  if (is.null(levels)) {
    levels <- unique(x)
    levels <- levels[!is.na(levels)]
  } else if (!is.character(levels)) {
    cli::cli_abort("{.arg levels} must be a character vector")
  }

  invalid <- setdiff(x, c(levels, NA))
  if (length(invalid) > 0 ) {
    cli::cli_abort(c(
      "All values of {.arg x} must appear in {.arg levels} or {.arg na}",
      i = "Missing level{?s}: {.str {invalid}}"
    ))
  }

  factor(x, levels = levels, exclude = NULL)
}
