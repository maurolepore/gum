test_that("gum()", {
  expect_equal(
    gum("a", "b"),
    "a b"
  )

  expect_equal(
    gum(c("a", "b"), c("c", "d")),
    "a b c d"
  )
})

test_that("gum_group()", {
  expect_equal(
    gum_group("a b", "c d"),
    c("(a b)", "(c d)")
  )

  expect_equal(
    gum_group("a b", "c d"),
    gum_group(c("a b", "c d"))
  )
})

test_that("gum_and()", {
  expect_equal(
    gum_and("a b", "c d"),
    c("a b AND c d")
  )

  expect_equal(
    gum_and("a b", "c d"),
    gum_and(c("a b", "c d"))
  )
})

test_that("gum_or()", {
  expect_equal(
    gum_or("a b", "c d"),
    c("a b OR c d")
  )

  expect_equal(
    gum_or("a b", "c d"),
    gum_or(c("a b", "c d"))
  )
})

test_that("gum_not()", {
  expect_equal(
    gum_not("a b", "c d"),
    c("a b NOT c d")
  )

  expect_equal(
    gum_not("a b", "c d"),
    gum_not(c("a b", "c d"))
  )
})

test_that("gum_not() takes ...", {
  expect_equal(
    gum_not("a", "b"),
    "a NOT b"
  )
})

test_that("gum_phrase()", {
  expect_equal(
    gum_phrase("a b", "c d"),
    c('"a b"', '"c d"')
  )

  expect_equal(
    gum_phrase("a b", "c d"),
    gum_phrase(c("a b", "c d"))
  )
})
