library(citeuliker)
context("Fetching")

test_that("getting grouping data", {
  data = getData(group=19781)
  expect_equal(length(names(data)), 28)
})


