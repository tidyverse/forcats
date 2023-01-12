# autostats

<details>

* Version: 0.4.0
* GitHub: https://github.com/Harrison4192/autostats
* Source code: https://github.com/cran/autostats
* Date/Publication: 2022-11-07 10:20:06 UTC
* Number of recursive dependencies: 233

Run `revdepcheck::cloud_details(, "autostats")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘autostats-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: auto_anova
    > ### Title: auto anova
    > ### Aliases: auto_anova
    > 
    > ### ** Examples
    > 
    > 
    ...
     18. ├─framecleaner:::fct_or_prob(., ...)
     19. │ └─... %>% ...
     20. └─forcats::fct_lump(., n = max_levels, ties.method = "first")
     21.   └─forcats::fct_lump_n(n = n)
     22.     └─forcats:::check_number_whole(n)
     23.       └─forcats:::.rlang_types_check_number(...)
     24.         └─forcats (local) .stop(x, what, ...)
     25.           └─forcats:::stop_input_type(...)
     26.             └─rlang::abort(message, ..., call = call, arg = arg)
    Execution halted
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    Error(s) in re-building vignettes:
      ...
    --- re-building ‘autostats.Rmd’ using rmarkdown
    Quitting from lines 97-99 (autostats.Rmd) 
    Error: processing vignette 'autostats.Rmd' failed with diagnostics:
    Problem while computing `..1 = dplyr::across(...)`.
    Caused by error in `across()`:
    ! Problem while computing column `Species`.
    Caused by error in `fct_lump_n()`:
    ! `n` must be a whole number, not `Inf`.
    ...
    --- failed re-building ‘autostats.Rmd’
    
    --- re-building ‘tidyXgboost.Rmd’ using rmarkdown
    --- finished re-building ‘tidyXgboost.Rmd’
    
    SUMMARY: processing the following file failed:
      ‘autostats.Rmd’
    
    Error: Vignette re-building failed.
    Execution halted
    ```

# epikit

<details>

* Version: 0.1.2
* GitHub: https://github.com/R4EPI/epikit
* Source code: https://github.com/cran/epikit
* Date/Publication: 2020-09-07 21:40:03 UTC
* Number of recursive dependencies: 74

Run `revdepcheck::cloud_details(, "epikit")` for more info

</details>

## Newly broken

*   checking tests ... ERROR
    ```
      Running ‘testthat.R’
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      
      ══ Failed tests ════════════════════════════════════════════════════════════════
      ── Error ('test-age-categories.R:179'): years alone give years ─────────────────
      Error in `forcats::fct_drop(res, droppings)`: `only` must be a character vector or `NULL`, not a logical vector.
      Backtrace:
          ▆
       1. └─epikit::group_age_categories(df, years = years, one_column = FALSE) at test-age-categories.R:179:2
       2.   └─forcats::fct_drop(only = droppings)
       3.     └─forcats:::check_character(only, allow_null = TRUE)
       4.       └─forcats:::stop_input_type(...)
       5.         └─rlang::abort(message, ..., call = call, arg = arg)
      
      [ FAIL 1 | WARN 1 | SKIP 1 | PASS 111 ]
      Error: Test failures
      Execution halted
    ```

## In both

*   checking LazyData ... NOTE
    ```
      'LazyData' is specified without a 'data' directory
    ```

# framecleaner

<details>

* Version: 0.2.0
* GitHub: https://github.com/Harrison4192/framecleaner
* Source code: https://github.com/cran/framecleaner
* Date/Publication: 2021-11-17 05:40:02 UTC
* Number of recursive dependencies: 105

Run `revdepcheck::cloud_details(, "framecleaner")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘framecleaner-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: set_fct
    > ### Title: set factor
    > ### Aliases: set_fct set_fct.data.frame set_fct.default
    > 
    > ### ** Examples
    > 
    > 
    ...
     16. ├─framecleaner:::fct_or_prob(., ...)
     17. │ └─... %>% ...
     18. └─forcats::fct_lump(., n = max_levels, ties.method = "first")
     19.   └─forcats::fct_lump_n(n = n)
     20.     └─forcats:::check_number_whole(n)
     21.       └─forcats:::.rlang_types_check_number(...)
     22.         └─forcats (local) .stop(x, what, ...)
     23.           └─forcats:::stop_input_type(...)
     24.             └─rlang::abort(message, ..., call = call, arg = arg)
    Execution halted
    ```

# stevemisc

<details>

* Version: 1.4.1
* GitHub: https://github.com/svmiller/stevemisc
* Source code: https://github.com/cran/stevemisc
* Date/Publication: 2022-04-12 14:00:02 UTC
* Number of recursive dependencies: 102

Run `revdepcheck::cloud_details(, "stevemisc")` for more info

</details>

## Newly broken

*   checking examples ... ERROR
    ```
    Running examples in ‘stevemisc-Ex.R’ failed
    The error most likely occurred in:
    
    > ### Name: fct_reorg
    > ### Title: Reorganize a factor after "re-leveling" it
    > ### Aliases: fct_reorg
    > 
    > ### ** Examples
    > 
    > 
    ...
        ▆
     1. └─stevemisc::fct_reorg(x, B = "b", C = "c")
     2.   ├─forcats::fct_recode(fct_relevel(fac, ...), ...)
     3.   │ └─forcats:::check_factor(.f)
     4.   └─forcats::fct_relevel(fac, ...)
     5.     └─rlang::check_dots_unnamed()
     6.       └─rlang:::action_dots(...)
     7.         ├─base (local) try_dots(...)
     8.         └─rlang (local) action(...)
    Execution halted
    ```

