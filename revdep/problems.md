# ggridges

Version: 0.4.1

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6242 marked UTF-8 strings
    ```

# haven

Version: 1.1.1

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘hms’
      All declared Imports should be used.
    ```

*   checking for GNU extensions in Makefiles ... NOTE
    ```
    GNU make is a SystemRequirements.
    ```

# MetamapsDB

Version: 0.0.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘Matrix’ ‘shiny’
      All declared Imports should be used.
    ```

# naniar

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrrlyr’
      All declared Imports should be used.
    ```

# noaastormevents

Version: 0.1.0

## In both

*   checking package dependencies ... NOTE
    ```
    Package suggested but not available for checking: ‘hurricaneexposuredata’
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘RColorBrewer’ ‘XML’ ‘choroplethr’ ‘choroplethrMaps’ ‘data.table’
      ‘forcats’ ‘hurricaneexposure’ ‘plyr’
      All declared Imports should be used.
    ```

# nzelect

Version: 0.4.0

## In both

*   checking installed package size ... NOTE
    ```
      installed size is  5.1Mb
      sub-directories of 1Mb or more:
        data   4.8Mb
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 6409 marked UTF-8 strings
    ```

# questionr

Version: 0.6.2

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘Hmisc’
    ```

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 4145 marked UTF-8 strings
    ```

# railtrails

Version: 0.0.3

## In both

*   checking data for non-ASCII characters ... NOTE
    ```
      Note: found 1583 marked UTF-8 strings
    ```

# sjPlot

Version: 2.4.1

## In both

*   checking Rd cross-references ... NOTE
    ```
    Package unavailable to check Rd xrefs: ‘plm’
    ```

# sweep

Version: 0.2.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘lazyeval’ ‘lubridate’ ‘tidyr’
      All declared Imports should be used.
    ```

# tidyLPA

Version: 0.1.2

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespace in Imports field not imported from: ‘purrr’
      All declared Imports should be used.
    ```

# tidyquant

Version: 0.5.3

## In both

*   checking tests ...
    ```
     ERROR
    Running the tests in ‘tests/testthat.R’ failed.
    Last 13 lines of output:
         })
      9: expr_type_of(.x)
      10: typeof(x)
      11: duplicate(quo)
      
      ══ testthat results  ═══════════════════════════════════════════════════════════════════════════════════════
      OK: 149 SKIPPED: 2 FAILED: 5
      1. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#15) 
      2. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#17) 
      3. Failure: Test returns tibble with correct rows and columns. (@test_tq_get_key_stats.R#19) 
      4. Error: Test error on invalid data inputs. (@test_tq_mutate.R#142) 
      5. Error: Test error on invalid data inputs. (@test_tq_transmute.R#121) 
      
      Error: testthat unit tests failed
      Execution halted
    ```

*   checking whether package ‘tidyquant’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘lubridate’ was built under R version 3.4.3
      Warning: package ‘zoo’ was built under R version 3.4.3
      Warning: package ‘quantmod’ was built under R version 3.4.3
      Warning: package ‘TTR’ was built under R version 3.4.3
      Warning: package ‘tibble’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidyverse/forcats/revdep/checks.noindex/tidyquant/new/tidyquant.Rcheck/00install.out’ for details.
    ```

*   checking re-building of vignette outputs ... WARNING
    ```
    ...
    
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': status was 'Couldn't resolve host name'
    Warning: x = 'AAPL', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
    
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': status was 'Couldn't resolve host name'
    Warning: x = 'AAPL', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
     Removing AAPL.
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      URL 'http://download.finance.yahoo.com/d/quotes.csv?s=FB&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': status was 'Couldn't resolve host name'
    Warning: x = 'FB', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=FB&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
     Removing FB.
    Warning in download.file(url, destfile = tmp, quiet = TRUE) :
      URL 'http://download.finance.yahoo.com/d/quotes.csv?s=GOOG&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv': status was 'Couldn't resolve host name'
    Warning: x = 'GOOG', get = 'key.stats': Error in download.file(url, destfile = tmp, quiet = TRUE): cannot open URL 'http://download.finance.yahoo.com/d/quotes.csv?s=GOOG&f=aa2a5bb4b6c1c4dd1ee7e8e9f6ghjj1j2j4j5j6kk3k4k5ll1mm3m4m5m6m7m8nopp2p5p6qrr1r5r6r7s6s7t8vwxy&e=.csv'
     Removing GOOG.
    Quitting from lines 211-214 (TQ01-core-functions-in-tidyquant.Rmd) 
    Error: processing vignette 'TQ01-core-functions-in-tidyquant.Rmd' failed with diagnostics:
    object 'Ask' not found
    Execution halted
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘broom’ ‘curl’ ‘devtools’ ‘rvest’ ‘timeSeries’ ‘tseries’ ‘zoo’
      All declared Imports should be used.
    ```

# tidyverse

Version: 1.2.1

## In both

*   checking whether package ‘tidyverse’ can be installed ... WARNING
    ```
    Found the following significant warnings:
      Warning: package ‘tibble’ was built under R version 3.4.3
    See ‘/Users/hadley/Documents/tidyverse/forcats/revdep/checks.noindex/tidyverse/new/tidyverse.Rcheck/00install.out’ for details.
    ```

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘dbplyr’ ‘reprex’ ‘rlang’
      All declared Imports should be used.
    ```

# timetk

Version: 0.1.0

## In both

*   checking dependencies in R code ... NOTE
    ```
    Namespaces in Imports field not imported from:
      ‘devtools’ ‘forecast’
      All declared Imports should be used.
    ```

