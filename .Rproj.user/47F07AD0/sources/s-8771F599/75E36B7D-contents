context("Check roll arguments")

test_that("roll works",{
  fair_die <- die()
  expect_is(roll(fair_die), "roll")
  expect_length(roll(fair_die), 4)
  expect_named(roll(fair_die), c("rolls", "sides", "prob", "total"))
})

test_that("check_times works with ok values", {
  expect_true(check_times(1))
  expect_true(check_times(100))
}
)

test_that("check_times fails with invalid values", {
  expect_error(check_times(c('one', 'two', 'three')))
  expect_error(check_times(c('one')))
  expect_error(check_times(c(NA)))
})

