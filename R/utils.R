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
    not <- obj_desc(x)
    cli::cli_abort("{.arg {arg}} must be a factor or character vector, not {not}", call = call)
  }
}

check_factor_list <- function(x, arg = caller_arg(x), call = caller_env()) {
  if (!is.list(x)) {
    not <- obj_desc(x)
    cli::cli_abort("{.arg {arg}} must be a list, not {not}", call = call)
  }

  is_factor <- vapply(x, is.factor, logical(1))
  if (any(!is_factor)) {
    cli::cli_abort("All elements of {.arg {arg}} must be factors", call = call)
  }

  x
}

obj_desc <- function(x) {
  if (isS4(x)) {
    paste0("an S4 object with class ", class(x)[[1]])
  } else if (is.object(x)) {
    if (is.data.frame(x)) {
      "a data frame"
    } else if (is.factor(x)) {
      "a factor"
    } else {
      paste0("an S3 object with class ", paste(class(x), collapse = "/"))
    }
  } else {
    switch(typeof(x),
      "NULL" = "a NULL",
      character = "a character vector",
      integer = "an integer vector",
      logical = "a logical vector",
      double = "a numeric vector",
      list = "a list",
      closure = "a function",
      paste0("a base object of type", typeof(x))
    )
  }
}
