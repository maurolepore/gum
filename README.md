
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

not <- gum_phrase("R&D", "R/D") |>
  gum_or() |>
  gum_group()
not |> cat()
#> ("R&D" OR "R/D")
```

``` r

and1 <- gum_query("package?", "developer")
and2 <- gum_query(c("developer", "engineer"), "software?", rev = TRUE)
and3 <- c("programmer", "data scientist", "analyst")
and <- c(and1, and2, and3) |>
  gum_phrase() |>
  gum_or() |>
  gum_group()
and |> cat()
#> ("developer" OR "package developer" OR "developer" OR "software developer" OR "engineer" OR "software engineer" OR "programmer" OR "data scientist" OR "analyst")
```

``` r

search <- yes |> 
  gum_not(not) |> 
  gum_and(and)
search |> cat()
#> ("R" OR "R/Pyton" OR "Pyton/R") NOT ("R&D" OR "R/D") AND ("developer" OR "package developer" OR "developer" OR "software developer" OR "engineer" OR "software engineer" OR "programmer" OR "data scientist" OR "analyst")
```

## GUIs

- <https://www.linkedin.com/jobs/>
- On Google’s search bar type “jobs”
