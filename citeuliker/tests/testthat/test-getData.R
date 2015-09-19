library(citeuliker)
context("Fetching")

test_that("getting grouping data", {
  data = getData(group=19781)
  expect_equal(length(names(data)), 28)
})

test_that("getting account data", {
  data = getData(user="egonw", paging=c(1,10))
  expect_that(length(names(data)), not(equals(0)))
})
