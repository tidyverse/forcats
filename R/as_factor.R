#' Convert input to a factor.
#'
#' Compared to base R, this function creates levels in the order in which
#' they appear, which will be the same on every platform. (Base R sorts in
#' the current locale which can vary from place to place.)
#'
#' This is a generic function.
#'
#' @param x Object to coerce to a factor.
#' @param ... Other arguments passed down to method.
#' @export
#' @examples
#' x <- c("a", "z", "g")
#' as_factor(x)
#' as.factor(x)
#' y <- c("1.1", "11", "2.2", "22")
#' as_factor(y)
#' as.factor(y)
as_factor <- function(x, ...) {
  ellipsis::check_dots_used()
  UseMethod("as_factor")
}

#' @rdname as_factor
#' @export
as_factor.factor <- function(x, ...) {
  x
}

#' @rdname as_factor
#' @export
as_factor.character <- function(x, ...) {
  # Preserve label for future haven compatibility
  structure(
    fct_inorder(x),
    label = attr(x, "label", exact = TRUE)
  )
}

#' @rdname as_factor
#' @export
as_factor.numeric <- function(x, ...) {
  factor(x)
}
