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

