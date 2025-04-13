# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
# * https://testthat.r-lib.org/articles/special-files.html

library(testthat)
library(Rmoji)
library(mockery)
library(shiny)

test_that("insert_emoji returns correct emoji for valid keyword", {
  mockery::stub(insert_emoji, "rstudioapi::insertText", function(text) NULL)
  expect_equal(insert_emoji("smile"), "😄")
  expect_equal(insert_emoji("heart"), "❤️")
})

test_that("insert_emoji handles unknown keywords gracefully", {
  mockery::stub(insert_emoji, "rstudioapi::insertText", function(text) NULL)
  expect_equal(insert_emoji("unknown_keyword", default = "❓"), "❓")
})

test_that("insert_emoji handles case-insensitive input", {
  mockery::stub(insert_emoji, "rstudioapi::insertText", function(text) NULL)
  expect_equal(insert_emoji("Smile"), "😄")
  expect_equal(insert_emoji("HEART"), "❤️")
})

test_that("insert_emoji throws error when no default provided", {
  mockery::stub(insert_emoji, "rstudioapi::insertText", function(text) NULL)
  expect_error(insert_emoji("nonexistent"))
})

test_that("insert_emoji_addin returns correct emoji for valid input", {
  expect_equal(insert_emoji_addin("smile"), "😄")
  expect_equal(insert_emoji_addin("heart"), "❤️")
})

test_that("insert_emoji_addin returns NULL for invalid input", {
  expect_null(insert_emoji_addin("not_a_real_emoji"))
  expect_null(insert_emoji_addin(""))
})
