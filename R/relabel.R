#' Automatically relabel factor levels, collapse as necessary
#'
#' @param f A factor
#' @param fun A function that is applied to each level. Must accept one
#'   character argument and return a character vector of the same length as its
#'   input.
#' @param ... Additional arguments to `fun`.
#' @export
#' @examples
#' fct_count(gss_cat$rincome)
#'
#' convert_income <- function(x) {
#'   regex <- "^(?:Lt |)[$]([0-9]+).*$"
#'   is_range <- grepl(regex, x)
#'   num_income <- as.numeric(gsub(regex, "\\1", x[is_range]))
#'   num_income <- trunc(num_income / 5000) * 5000
#'   x[is_range] <- paste0("Gt $", num_income)
#'   x
#' }
#'
#' convert_income(levels(gss_cat$rincome))
#'
#' rincome2 <- fct_relabel(gss_cat$rincome, convert_income)
#' fct_count(rincome2)
fct_relabel <- function(f, fun, ...) {
  if (!is.function(fun)) {
    stop("Expected function, got ", class(fun)[[1L]], call. = FALSE)
  }

  old_levels <- levels(f)
  new_levels <- fun(old_levels, ...)

  lvls_revalue(f, new_levels)
}
