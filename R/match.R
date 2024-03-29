#' Test for presence of levels in a factor
#'
#' Do any of `lvls` occur in `f`? Compared to [%in%], this function validates
#' `lvls` to ensure that they're actually present in `f`. In other words,
#' `x %in% "not present"` will return `FALSE`, but `fct_match(x, "not present")`
#' will throw an error.
#'
#' @rdname fct_match
#' @param f A factor (or character vector).
#' @param lvls A character vector specifying levels to look for.
#' @return A logical vector
#' @export
#' @examples
#' table(fct_match(gss_cat$marital, c("Married", "Divorced")))
#'
#' # Compare to %in%, misspelled levels throw an error
#' table(gss_cat$marital %in% c("Maried", "Davorced"))
#' \dontrun{
#' table(fct_match(gss_cat$marital, c("Maried", "Davorced")))
#' }
fct_match <- function(f, lvls) {
  f <- check_factor(f)
  if (identical(lvls, NA)) {
    lvls <- NA_character_
  }
  check_character(lvls)

  bad_lvls <- setdiff(lvls, levels(f))
  bad_lvls <- bad_lvls[!is.na(bad_lvls)]
  if (length(bad_lvls) > 0) {
    missing <- encodeString(bad_lvls, quote = '"')
    cli::cli_abort(c(
      "All {.arg lvls} must be present in {.arg f}.",
      i = "Missing levels: {missing}"
    ))
  }

  f %in% lvls
}
