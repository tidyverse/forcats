#' Automatically sort factor levels according to a user-defined function
#'
#' @param .f A factor (or character vector).
#' @param .fun A function that will sort or permute the existing factor levels.
#'   It must accept one character argument and return a character argument of
#'   the same length as it's input.
#'
#' @param ... Additional arguments to `.fun`.
#' @export
#' @examples
#' chromosomes <- c("chr2", "chr1", "chr10")
#' chr_fac <- factor(chromosomes, levels = chromosomes)
#' chr_fac
#'
#' # naive alphanumeric sorting "1" < "10" < "2"
#' fct_sort(chr_fac, sort)
#'
#'  # number-based alphanumeric sorting "1" < "2" < "10"
#'  parse_number <- function(x){
#'    as.numeric(gsub(".*?([[:digit:]]+).*", "\\1", x))
#'  }
#'  sort_numeric <- function(x){
#'    x[order(parse_number(x))]
#'  }
#'  fct_sort(chr_fac, sort_numeric)
#'
fct_sort <- function(.f, .fun, ...) {
  f <- check_factor(.f)
  .fun <- rlang::as_function(.fun)

  old_levels <- levels(f)
  new_levels <- .fun(old_levels, ...)
  stopifnot(
    length(old_levels) == length(new_levels) &&
      all(new_levels %in% old_levels)
  )
  fct_relevel(f, new_levels)
}
