#' Expand '?' to 0 or one occurrance of a term
#'
#' @param x,y Character. It can contain one 'word?'.
#' @param rev Revert the order of `x` and `y`.
#'
#' @return Character. A collapsed version of `x` and `y` where `?` is expanded
#' to 0 or one occurrance of a term.
#'
#' @export
#'
#' @examples
#' gum_query(c("a", "b"), "c?")
gum_query <- function(x, y, rev = FALSE) {
  if (sum(endsWith(c(x, y), "?")) > 1) {
    stop("Only one query '?' is allowed.")
  }

  if (rev) {
    query_impl(y, x, rev = TRUE)
  } else {
    query_impl(x, y, rev = FALSE)
  }
}

query_impl <- function(x, y, rev = FALSE) {
  if (rev) {
    tmp <- x
    x <- y
    y <- tmp
  }

  out <- x |>
    unlist() |>
    lapply(\(x) c(x, y))

  if (rev) {
    out <- out |> lapply(rev)
  }

  out |>
    lapply(map_query) |>
    unlist() |>
    unique()
}

map_query <- function(x) {
  gum_map(include_exclude(x))
}

include_exclude <- function(x) {
  has_wild <- endsWith(x, "?")

  list(
    x[!has_wild],
    gsub("\\?$", "", x)
  )
}

gum_map <- function(...) {
  c(...) |> lapply(paste, collapse = " ")
}
