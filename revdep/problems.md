# haven

<details>

* Version: 2.2.0
* Source code: https://github.com/cran/haven
* URL: http://haven.tidyverse.org, https://github.com/tidyverse/haven, https://github.com/WizardMac/ReadStat
* BugReports: https://github.com/tidyverse/haven/issues
* Date/Publication: 2019-11-08 06:20:22 UTC
* Number of recursive dependencies: 59

Run `revdep_details(,"haven")` for more info

</details>

## Newly broken

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
      > library(testthat)
      > library(haven)
      > 
      > test_check("haven")
      [31m──[39m [31m1. Failure: leaves factors unchanged (@test-as-factor.R#7) [39m [31m────────────────────────────────────────────────────[39m
      as_factor(f) not equal to `f`.
      Attributes: < Component "class": Lengths (1, 2) differ (string compare on first 1) >
      Attributes: < Component "class": 1 string mismatch >
      
      ══ testthat results  ══════════════════════════════════════════════════════════════════════════════════════════════
      [ OK: 269 | SKIPPED: 0 | WARNINGS: 0 | FAILED: 1 ]
      1. Failure: leaves factors unchanged (@test-as-factor.R#7) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘dplyr’
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

