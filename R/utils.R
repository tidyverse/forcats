#' Pipe operator
#'
#' See \code{\link[magrittr]{\%>\%}} for more details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL


check_factor <- function(f) {
  if (is.character(f)) {
    factor(f)
  } else if (is.factor(f)) {
    f
  } else {
    stop("`f` must be a factor (or character vector or numeric vector).", call. = FALSE)
  }
}

check_factor_list <- function(fs, arg_name = "fs") {
  if (!is.list(fs)) {
    stop("`fs` must be a list", call. = FALSE)
  }

  is_factor <- vapply(fs, is.factor, logical(1))
  if (any(!is_factor)) {
    stop("All elements of `", arg_name, "` must be factors", call. = FALSE)
  }

  fs
}
