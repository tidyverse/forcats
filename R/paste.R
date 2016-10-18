#' Paste operation for factors while preserving sequence
#' via cartesian product
#' 
#' This is sometimes useful when plotting a factor
#'
#' @param ... Factors to be united
#' @param sep Separtor to use
#' @export
#' @examples
#' f <- factor(c("a", "b", "c"))
#' g <- factor(c("x", "y", "z"))
#' fct_paste(f, g, sep="-")
fct_paste <- function(..., sep=" ") {
  Map(check_factor, list(...))
  
  my_paste <- function(...) do.call(paste, append(list(...), list(sep=sep)))
   
  fcts <- Map(function(fct) as.character(levels(fct)),list(...))
  
  new_factor_lvls <- do.call( my_paste , do.call(expand.grid, fcts) )
  
  factor(my_paste(...), levels=new_factor_lvls)
}
