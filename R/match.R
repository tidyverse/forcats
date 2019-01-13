#' Test for presence of certain groups/levels in a vector
#'
#' A validated version of `%in%` intended for use with logical subsetting.
#' Performs matching between a factor and a set of levels to pose the question
#' "which of the elements of a factor match these levels?"
#'
#' @md
#' @rdname fct_match
#' @param f A factor (or character vector).
#' @param lvls A vector of characters for which the test "are these levels in
#'   `f`?" should be performed.
#' @param allow_missing (logical) if `TRUE`, allow matching to empty levels in
#'   f
#'
#' @details Unlike `%in%`, which performs a basic yes/no test, this function
#'   performs validation on the input vector to ensure that the levels tested
#'   for are all present before creating a logical vector. If a tested level is
#'   not present, then an error is thrown rather than producing a silent
#'   `FALSE`.
#'
#'   Since a distinction can be made between `levels(f)` and `unique(f)` (the
#'   latter excludes empty levels) the argument `allow_missing` can be
#'   specified.
#'
#'   This is intended to replace the common pattern
#'
#'   `filter(d, l %in% c("x", "y"))`
#'
#'   with the validated
#'
#'   `filter(d, fct_match(l, c("x", "y")))`
#'
#'   where an error will be generated if `"x"` or `"y"` are not levels in `d$l`.
#'
#' @return A logical vector
#'
#' @export
#'
#' @examples
#' gss_cat$marital %>% fct_match(c("Married", "Divorced"))
#' # importantly, misspelled levels throw an error
#' \dontrun{gss_cat$marital %>% fct_match(c("Married", "Davorced"))}
#' # match to levels()
#' gss_cat$race %>% fct_match(c("Other", "Not applicable"))
#' # match to unique()
#' gss_cat$race %>% fct_match(c("Other", "Not applicable"), allow_missing = TRUE)
fct_match <- function(f, lvls, allow_missing = TRUE) {
  f <- check_factor(f)

  stopifnot(is.logical(allow_missing))

  if (allow_missing) {
    all <- levels(f)
  } else {
    all <- unique(f)
  }

  validate_level_inputs(all, lvls)

  return(f %in% lvls)

}


#' Validate levels are present at all in a factor
#' @keywords internal
#' @noRd
validate_level_inputs <- function(factor, check) {
  levels_present <- check %in% factor
  if (all(levels_present)) {
    return(NULL)
  }
  stop(
    paste0(
      "Level(s) not present in factor: \"",
      encodeString(check[which(!levels_present)]),
      "\""
    ),
    call. = FALSE
  )
}
