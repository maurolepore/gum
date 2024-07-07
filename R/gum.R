#' Wrappers of `paste(collapse = )`
#'
#' @inheritParams base::paste
#'
#' @return String.
#' @export
#'
#' @examples
#' gum("a", "b")
#' gum_and("a", "b")
#' gum_or("a", "b")
#' gum_not("a", "b")
#' gum_group("a", "b")
#' gum_phrase("a", "b")
gum <- function(...) {
  paste(c(...), collapse = " ")
}

#' @export
#' @rdname gum
gum_or <- function(...) {
  paste(c(...), collapse = " OR ")
}

#' @export
#' @rdname gum
gum_and <- function(...) {
  paste(c(...), collapse = " AND ")
}

#' @export
#' @rdname gum
gum_not <- function(...) {
  paste(c(...), collapse = " NOT ")
}

#' @export
#' @rdname gum
gum_group <- function(...) {
  paste0("(", c(...), ")")
}

#' @export
#' @rdname gum
gum_phrase <- function(...) {
  paste0('"', c(...), '"')
}
