context("Check die arguments")

test_that("die works",{
  expect_is(die(), "die")
  expect_length(die(), 2)
  expect_named(die(), c("sides", "prob"))
})

test_that("check_sides works with ok vectors", {
  expect_true(check_sides(c(1, 2, 3, 4, 5, 6)))
  expect_true(check_sides(c('a', 'b', 'c', 'd', 'e', 'f')))
}
)

test_that("check_sides fails with invalid lengths", {
  expect_error(check_sides(c('one', 'two', 'three')))
  expect_error(check_sides(c('one')))
  expect_error(check_sides(1:5))
  expect_error(check_sides(1))
})

test_that("check_prob works with ok vectors", {
  expect_true(check_prob(c(rep(1/6, 6))))
  expect_true(check_prob(c(1, 0, 0, 0, 0, 0)))
})

test_that("check_prob fails with invalid lengths", {
  expect_error(check_prob(1:5))
  expect_error(check_prob(1))
})

test_that("check_prob fails with invalid numbers", {
  expect_error(check_prob(0.333, 0.666, 0.23, 0.4, 0.1111, 0.5959))
  expect_error(check_prob(NA, NA, NA, NA, NA, NA))
})

