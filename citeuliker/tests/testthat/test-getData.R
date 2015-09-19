library(citeuliker)
context("Fetching")

test_that("getting grouping data", {
  data = getData(group=19781)
  expect_that(length(names(data)), not(equals(0)))
})

test_that("getting account data", {
  data = getData(user="egonw", paging=c(1,10))
  expect_that(length(names(data)), not(equals(0)))
})

test_that("unfolding of the publication date", {
  data = getData(user="egonw", paging=c(1,10))
  expect_that(length(na.omit(data["year"])), not(equals(0)))
})
