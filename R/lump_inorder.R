#' Lump together into "other" levels of a factor appearing after the N first (or prior to the N last)
#'
#' @param f A factor (or character vector).
#' @param n
#'   If `n` is missing, `fct_lump_inorder` lumps
#'   together all but the first appearing level into "other".
#'
#'   Positive `n` preserves the first appearing `n` levels.
#'   Negative `n` preserves the last appearing `n` levels.
#'
#' @param other_level Value of level used for "other" values.
#' @export
#' @seealso [fct_other()] to convert specified levels to other.
#' @seealso [fct_lump()] to convert low-frequency levels to other.
#' @examples
#' library(magrittr)
#' library(forcats)
#' f <- c("hello","goodbye","ciao","arrivederci","ciao","hello") %>% fct_inorder
#' f
#' #> [1] hello       goodbye     ciao        arrivederci
#' #> [5] ciao        hello
#' #> Levels: hello goodbye ciao arrivederci
#' # Preserve the first two appearing levels:
#' f %>% fct_lump_inorder(2)
#' #> [1] hello       goodbye     Other       Other
#' #> [5] Other        hello
#' #>Levels: hello goodbye Other
#' # Preserve the last two appearing levels, reversing order of levels:
#' f %>% fct_lump_inorder(-2)
#' #> [1] Other       Other     ciao       arrivederci
#' #> [5] ciao        Other
#' #>Levels: arrivederci ciao Other
#'
fct_lump_inorder <- function(f, n=1, other_level="Other") {
  if (!is.factor(f)) f <- as.factor(f) # levels will be alphabetical
  # if zero n or n is greater than f's levels, no lumping
  if (n==0|(abs(n)>length(levels(f)))) return(f)
  f_io <- fct_inorder(f) # levels ordered by appearance
  if(n>0) {
    levs <- levels(f_io)
    fct_other(f_io,
              keep=levs[1:n],
              other_level=other_level)
  }
  else {
    f_io <- fct_rev(f_io) # reverses level order
    levs <- levels(f_io)
    fct_other(f_io,
              keep=levs[1:abs(n)], # n is negative
              other_level=other_level)
  }
}
