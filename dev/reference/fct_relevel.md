# Reorder factor levels by hand

This is a generalisation of
[`stats::relevel()`](https://rdrr.io/r/stats/relevel.html) that allows
you to move any number of levels to any location.

## Usage

``` r
fct_relevel(.f, ..., after = 0L)
```

## Arguments

- .f:

  A factor (or character vector).

- ...:

  Either a function (or formula), or character levels.

  A function will be called with the current levels as input, and the
  return value (which must be a character vector) will be used to
  relevel the factor.

  Any levels not mentioned will be left in their existing order, by
  default after the explicitly mentioned levels. Supports tidy dots.

- after:

  Where should the new values be placed?

## Examples

``` r
f <- factor(c("a", "b", "c", "d"), levels = c("b", "c", "d", "a"))
fct_relevel(f)
#> [1] a b c d
#> Levels: b c d a
fct_relevel(f, "a")
#> [1] a b c d
#> Levels: a b c d
fct_relevel(f, "b", "a")
#> [1] a b c d
#> Levels: b a c d

# Move to the third position
fct_relevel(f, "a", after = 2)
#> [1] a b c d
#> Levels: b c a d

# Relevel to the end
fct_relevel(f, "a", after = Inf)
#> [1] a b c d
#> Levels: b c d a
fct_relevel(f, "a", after = 3)
#> [1] a b c d
#> Levels: b c d a

# Relevel with a function
fct_relevel(f, sort)
#> [1] a b c d
#> Levels: a b c d
fct_relevel(f, sample)
#> [1] a b c d
#> Levels: d b a c
fct_relevel(f, rev)
#> [1] a b c d
#> Levels: a d c b

# Using 'Inf' allows you to relevel to the end when the number
# of levels is unknown or variable (e.g. vectorised operations)
df <- forcats::gss_cat[, c("rincome", "denom")]
lapply(df, levels)
#> $rincome
#>  [1] "No answer"      "Don't know"     "Refused"       
#>  [4] "$25000 or more" "$20000 - 24999" "$15000 - 19999"
#>  [7] "$10000 - 14999" "$8000 to 9999"  "$7000 to 7999" 
#> [10] "$6000 to 6999"  "$5000 to 5999"  "$4000 to 4999" 
#> [13] "$3000 to 3999"  "$1000 to 2999"  "Lt $1000"      
#> [16] "Not applicable"
#> 
#> $denom
#>  [1] "No answer"            "Don't know"          
#>  [3] "No denomination"      "Other"               
#>  [5] "Episcopal"            "Presbyterian-dk wh"  
#>  [7] "Presbyterian, merged" "Other presbyterian"  
#>  [9] "United pres ch in us" "Presbyterian c in us"
#> [11] "Lutheran-dk which"    "Evangelical luth"    
#> [13] "Other lutheran"       "Wi evan luth synod"  
#> [15] "Lutheran-mo synod"    "Luth ch in america"  
#> [17] "Am lutheran"          "Methodist-dk which"  
#> [19] "Other methodist"      "United methodist"    
#> [21] "Afr meth ep zion"     "Afr meth episcopal"  
#> [23] "Baptist-dk which"     "Other baptists"      
#> [25] "Southern baptist"     "Nat bapt conv usa"   
#> [27] "Nat bapt conv of am"  "Am bapt ch in usa"   
#> [29] "Am baptist asso"      "Not applicable"      
#> 

df2 <- lapply(df, fct_relevel, "Don't know", after = Inf)
lapply(df2, levels)
#> $rincome
#>  [1] "No answer"      "Refused"        "$25000 or more"
#>  [4] "$20000 - 24999" "$15000 - 19999" "$10000 - 14999"
#>  [7] "$8000 to 9999"  "$7000 to 7999"  "$6000 to 6999" 
#> [10] "$5000 to 5999"  "$4000 to 4999"  "$3000 to 3999" 
#> [13] "$1000 to 2999"  "Lt $1000"       "Not applicable"
#> [16] "Don't know"    
#> 
#> $denom
#>  [1] "No answer"            "No denomination"     
#>  [3] "Other"                "Episcopal"           
#>  [5] "Presbyterian-dk wh"   "Presbyterian, merged"
#>  [7] "Other presbyterian"   "United pres ch in us"
#>  [9] "Presbyterian c in us" "Lutheran-dk which"   
#> [11] "Evangelical luth"     "Other lutheran"      
#> [13] "Wi evan luth synod"   "Lutheran-mo synod"   
#> [15] "Luth ch in america"   "Am lutheran"         
#> [17] "Methodist-dk which"   "Other methodist"     
#> [19] "United methodist"     "Afr meth ep zion"    
#> [21] "Afr meth episcopal"   "Baptist-dk which"    
#> [23] "Other baptists"       "Southern baptist"    
#> [25] "Nat bapt conv usa"    "Nat bapt conv of am" 
#> [27] "Am bapt ch in usa"    "Am baptist asso"     
#> [29] "Not applicable"       "Don't know"          
#> 

# You'll get a warning if the levels don't exist
fct_relevel(f, "e")
#> Warning: 1 unknown level in `f`: e
#> [1] a b c d
#> Levels: b c d a
```
