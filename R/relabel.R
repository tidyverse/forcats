#' Automatically relabel factor levels, collapse as necessary
#'
#' @param f A factor
#' @param fun A function that is applied to each level. Must accept one
#'   character argument and return a character vector of the same length as its
#'   input.
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
#' rincome2 <- fct_relabel(gss_cat$rincome,
#'   convert_income)
#' fct_count(rincome2)
fct_relabel <- function(f, fun) {
  new_levels <- fun(levels(f))
  if (!is.character(new_levels)) {
    stop("levels must be character, got ", class(new_levels), call. = FALSE)
  }
  levels(f) <- new_levels
  f
}
