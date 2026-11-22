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


check_factor <- function(x, arg = caller_arg(x), call = caller_env()) {
  if (is.character(x)) {
    factor(x)
  } else if (is.factor(x)) {
    x
  } else {
    cli::cli_abort(
      "{.arg {arg}} must be a factor or character vector, not {.obj_type_friendly {x}}.",
      call = call
    )
  }
}

check_factor_list <- function(x, arg = caller_arg(x), call = caller_env()) {
  if (!is.list(x)) {
    cli::cli_abort(
      "{.arg {arg}} must be a list, not {.obj_type_friendly {x}}.",
      call = call
    )
  }

  is_factor <- vapply(x, is.factor, logical(1))
  if (any(!is_factor)) {
    cli::cli_abort(
      "All elements of {.arg {arg}} must be factors.",
      call = call
    )
  }

  x
}
