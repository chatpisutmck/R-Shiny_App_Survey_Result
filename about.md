
#### Data

This data shows the answers toward the survey with the main topic of Star Wars,
in which question mainly range from favorite film ranking to watched films and their demographic data.
The data source is from *"https://github.com/rfordatascience/tidytuesday/tree/master/data/2018/2018-05-14"*


#### Purpose

The purpose of the app is to:

1. show how the number of survey completion and their basic Star Wars involvement,
2. show how the different plots between favorite film and watched films, and 
3. show the different of thoughts between fans and non-fans toward Star Wars films. 


#### Creator

Chatpisut Makornkhan (cmak0010@student.monash.edu)

<details>
<summary>Session information</summary>

```
## ─ Session info ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
##  setting  value
##  version  R version 4.2.1 (2022-06-23 ucrt)
##  os       Windows 10 x64 (build 22000)
##  system   x86_64, mingw32
##  ui       RStudio
##  language (EN)
##  collate  English_United States.utf8
##  ctype    English_United States.utf8
##  tz       Australia/Sydney
##  date     2022-08-23
##  rstudio  2022.07.1+554 Spotted Wakerobin (desktop)
##  pandoc   2.18 @ C:/Program Files/RStudio/bin/quarto/bin/tools/ (via rmarkdown)
## 
## ─ Packages ────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
##  package       * version date (UTC) lib source
##  askpass         1.1     2019-01-13 [1] CRAN (R 4.2.1)
##  assertthat      0.2.1   2019-03-21 [1] CRAN (R 4.2.1)
##  backports       1.4.1   2021-12-13 [1] CRAN (R 4.2.0)
##  bit             4.0.4   2020-08-04 [1] CRAN (R 4.2.1)
##  bit64           4.0.5   2020-08-30 [1] CRAN (R 4.2.1)
##  broom           1.0.0   2022-07-01 [1] CRAN (R 4.2.1)
##  bslib           0.4.0   2022-07-16 [1] CRAN (R 4.2.1)
##  cachem          1.0.6   2021-08-19 [1] CRAN (R 4.2.1)
##  cellranger      1.1.0   2016-07-27 [1] CRAN (R 4.2.1)
##  cli             3.3.0   2022-04-25 [1] CRAN (R 4.2.1)
##  colorspace      2.0-3   2022-02-21 [1] CRAN (R 4.2.1)
##  crayon          1.5.1   2022-03-26 [1] CRAN (R 4.2.1)
##  crosstalk       1.2.0   2021-11-04 [1] CRAN (R 4.2.1)
##  curl            4.3.2   2021-06-23 [1] CRAN (R 4.2.1)
##  data.table    * 1.14.2  2021-09-27 [1] CRAN (R 4.2.1)
##  DBI             1.1.3   2022-06-18 [1] CRAN (R 4.2.1)
##  dbplyr          2.2.1   2022-06-27 [1] CRAN (R 4.2.1)
##  digest          0.6.29  2021-12-01 [1] CRAN (R 4.2.1)
##  dplyr         * 1.0.9   2022-04-28 [1] CRAN (R 4.2.1)
##  DT            * 0.24    2022-08-09 [1] CRAN (R 4.2.1)
##  ellipsis        0.3.2   2021-04-29 [1] CRAN (R 4.2.1)
##  evaluate        0.15    2022-02-18 [1] CRAN (R 4.2.1)
##  fansi           1.0.3   2022-03-24 [1] CRAN (R 4.2.1)
##  farver          2.1.1   2022-07-06 [1] CRAN (R 4.2.1)
##  fastmap         1.1.0   2021-01-25 [1] CRAN (R 4.2.1)
##  fontawesome     0.3.0   2022-07-20 [1] CRAN (R 4.2.1)
##  forcats       * 0.5.1   2021-01-27 [1] CRAN (R 4.2.1)
##  fs              1.5.2   2021-12-08 [1] CRAN (R 4.2.1)
##  gargle          1.2.0   2021-07-02 [1] CRAN (R 4.2.1)
##  generics        0.1.3   2022-07-05 [1] CRAN (R 4.2.1)
##  ggplot2       * 3.3.6   2022-05-03 [1] CRAN (R 4.2.1)
##  glue            1.6.2   2022-02-24 [1] CRAN (R 4.2.1)
##  googledrive     2.0.0   2021-07-08 [1] CRAN (R 4.2.1)
##  googlesheets4   1.0.0   2021-07-21 [1] CRAN (R 4.2.1)
##  gtable          0.3.0   2019-03-25 [1] CRAN (R 4.2.1)
##  haven           2.5.0   2022-04-15 [1] CRAN (R 4.2.1)
##  hms             1.1.1   2021-09-26 [1] CRAN (R 4.2.1)
##  htmltools       0.5.3   2022-07-18 [1] CRAN (R 4.2.1)
##  htmlwidgets     1.5.4   2021-09-08 [1] CRAN (R 4.2.1)
##  httpuv          1.6.5   2022-01-05 [1] CRAN (R 4.2.1)
##  httr            1.4.3   2022-05-04 [1] CRAN (R 4.2.1)
##  jquerylib       0.1.4   2021-04-26 [1] CRAN (R 4.2.1)
##  jsonlite        1.8.0   2022-02-22 [1] CRAN (R 4.2.1)
##  knitr           1.39    2022-04-26 [1] CRAN (R 4.2.1)
##  labeling        0.4.2   2020-10-20 [1] CRAN (R 4.2.0)
##  later           1.3.0   2021-08-18 [1] CRAN (R 4.2.1)
##  lazyeval        0.2.2   2019-03-15 [1] CRAN (R 4.2.1)
##  lifecycle       1.0.1   2021-09-24 [1] CRAN (R 4.2.1)
##  lubridate     * 1.8.0   2021-10-07 [1] CRAN (R 4.2.1)
##  magrittr        2.0.3   2022-03-30 [1] CRAN (R 4.2.1)
##  markdown        1.1     2019-08-07 [1] CRAN (R 4.2.1)
##  memoise         2.0.1   2021-11-26 [1] CRAN (R 4.2.1)
##  mime            0.12    2021-09-28 [1] CRAN (R 4.2.0)
##  modelr          0.1.8   2020-05-19 [1] CRAN (R 4.2.1)
##  munsell         0.5.0   2018-06-12 [1] CRAN (R 4.2.1)
##  openssl         2.0.2   2022-05-24 [1] CRAN (R 4.2.1)
##  pillar          1.8.0   2022-07-18 [1] CRAN (R 4.2.1)
##  pkgconfig       2.0.3   2019-09-22 [1] CRAN (R 4.2.1)
##  plotly        * 4.10.0  2021-10-09 [1] CRAN (R 4.2.1)
##  promises        1.2.0.1 2021-02-11 [1] CRAN (R 4.2.1)
##  purrr         * 0.3.4   2020-04-17 [1] CRAN (R 4.2.1)
##  R6              2.5.1   2021-08-19 [1] CRAN (R 4.2.1)
##  Rcpp            1.0.9   2022-07-08 [1] CRAN (R 4.2.1)
##  readr         * 2.1.2   2022-01-30 [1] CRAN (R 4.2.1)
##  readxl          1.4.0   2022-03-28 [1] CRAN (R 4.2.1)
##  renv          * 0.15.5  2022-05-26 [1] CRAN (R 4.2.1)
##  reprex          2.0.1   2021-08-05 [1] CRAN (R 4.2.1)
##  rlang           1.0.4   2022-07-12 [1] CRAN (R 4.2.1)
##  rmarkdown       2.14    2022-04-25 [1] CRAN (R 4.2.1)
##  rsconnect       0.8.27  2022-07-12 [1] CRAN (R 4.2.1)
##  rstudioapi      0.13    2020-11-12 [1] CRAN (R 4.2.1)
##  rvest           1.0.2   2021-10-16 [1] CRAN (R 4.2.1)
##  sass            0.4.2   2022-07-16 [1] CRAN (R 4.2.1)
##  scales          1.2.0   2022-04-13 [1] CRAN (R 4.2.1)
##  sessioninfo     1.2.2   2021-12-06 [1] CRAN (R 4.2.1)
##  shiny         * 1.7.2   2022-07-19 [1] CRAN (R 4.2.1)
##  shinythemes   * 1.2.0   2021-01-25 [1] CRAN (R 4.2.1)
##  sourcetools     0.1.7   2018-04-25 [1] CRAN (R 4.2.1)
##  stringi         1.7.8   2022-07-11 [1] CRAN (R 4.2.1)
##  stringr       * 1.4.0   2019-02-10 [1] CRAN (R 4.2.1)
##  tibble        * 3.1.8   2022-07-22 [1] CRAN (R 4.2.1)
##  tidyr         * 1.2.0   2022-02-01 [1] CRAN (R 4.2.1)
##  tidyselect      1.1.2   2022-02-21 [1] CRAN (R 4.2.1)
##  tidyverse     * 1.3.2   2022-07-18 [1] CRAN (R 4.2.1)
##  tzdb            0.3.0   2022-03-28 [1] CRAN (R 4.2.1)
##  utf8            1.2.2   2021-07-24 [1] CRAN (R 4.2.1)
##  vctrs           0.4.1   2022-04-13 [1] CRAN (R 4.2.1)
##  viridisLite     0.4.0   2021-04-13 [1] CRAN (R 4.2.1)
##  vroom           1.5.7   2021-11-30 [1] CRAN (R 4.2.1)
##  withr           2.5.0   2022-03-03 [1] CRAN (R 4.2.1)
##  xfun            0.31    2022-05-10 [1] CRAN (R 4.2.1)
##  xml2            1.3.3   2021-11-30 [1] CRAN (R 4.2.1)
##  xtable          1.8-4   2019-04-21 [1] CRAN (R 4.2.1)
##  yaml            2.3.5   2022-02-21 [1] CRAN (R 4.2.0)
## 
##  [1] C:/Users/Magic/AppData/Local/R/win-library/4.2
##  [2] C:/Program Files/R/R-4.2.1/library
## 
## ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```
</details>



              
              
