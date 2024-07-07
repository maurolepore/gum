
<!-- README.md is generated from README.Rmd. Please edit that file -->

# gum

<!-- badges: start -->
<!-- badges: end -->

The goal of gum is to make it easy to create search queries, e.g. to
search for jobs on LinkedIn or Google Jobs.

## Installation

You can install the development version of gum from Github with:

``` r
# install.packages("pak")
pak::pak("maurolepore/gum")
```

## Example

``` r
library(gum)

yes <- gum_phrase(c("R", "R/Pyton", "Pyton/R")) |>
  gum_or() |>
  gum_group()
yes |> cat()
#> ("R" OR "R/Pyton" OR "Pyton/R")
```

``` r

no <- gum_phrase("R&D", "R/D") |>
  gum_or() |>
  gum_group()
no |> cat()
#> ("R&D" OR "R/D")
```

``` r

lang <- gum_not(yes, no)
lang |> cat()
#> ("R" OR "R/Pyton" OR "Pyton/R") NOT ("R&D" OR "R/D")
```

``` r

title1 <- gum_query("package?", "developer")
title2 <- gum_query(c("developer", "engineer"), "software?", rev = TRUE)
title3 <- c("programmer", "data scientist", "analyst")
title <- c(title1, title2, title3)
title <- title |>
  gum_phrase() |>
  gum_or() |>
  gum_group()
title |> cat()
#> ("developer" OR "package developer" OR "developer" OR "software developer" OR "engineer" OR "software engineer" OR "programmer" OR "data scientist" OR "analyst")
```

``` r

search <- gum_and(lang, title)
search |> cat()
#> ("R" OR "R/Pyton" OR "Pyton/R") NOT ("R&D" OR "R/D") AND ("developer" OR "package developer" OR "developer" OR "software developer" OR "engineer" OR "software engineer" OR "programmer" OR "data scientist" OR "analyst")
```
