test_that("multiplication works", {
  convert_tag_format(x = "@smith2020making", to = "tag") |>
    expect_equal("smith2020making")
  convert_tag_format(x = "@smith2020making", to = "markdown_short") |>
    expect_equal("[@smith2020making]")
  convert_tag_format(x = "smith2020making", to = "markdown_long") |>
    expect_equal("@smith2020making")
  convert_tag_format(x = "smith2020making", to = "markdown_short") |>
    expect_equal("[@smith2020making]")
  convert_tag_format(x = "[@smith2020making]", to = "tag") |>
    expect_equal("smith2020making")
  convert_tag_format(x = "[@smith2020making]", to = "markdown_long") |>
    expect_equal("@smith2020making")
})
