test_that("with two ? throws an error", {
  expect_error(
    gum_query("a?", "b?")
  )
})

test_that("can take ? in position 1", {
  expect_equal(
    sort(gum_query(c("b", "c"), "a?", rev = TRUE)),
    sort(c("b", "a b", "c", "a c"))
  )
})

test_that("with no ? works ok", {
  expect_equal(
    gum_query("a", "b"),
    "a b"
  )
})

test_that("needs two now one term", {
  expect_error(
    gum_query("R")
  )
})
