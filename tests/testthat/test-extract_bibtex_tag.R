test_that("extract_bibtex_tag", {

  bib_tag <- extract_bibtex_tag(bibtex_entry = v_example_refs[1],
                                output = "markdown_long")

  expect_equal(object = bib_tag, expected = "@smith2020making")


  #========================================================================#

  bib_tag <- extract_bibtex_tag(bibtex_entry = v_example_refs[1],
                                output = "markdown_short")

  expect_equal(object = bib_tag, expected = "[@smith2020making]")

  #========================================================================#

  bib_tag <- extract_bibtex_tag(bibtex_entry = v_example_refs[1],
                                output = "tag")

  expect_equal(object = bib_tag, expected = "smith2020making")


  #========================================================================#
  # try looping through a list of examples
  v_bib_tag <- sapply(X = v_example_refs,
                      FUN = extract_bibtex_tag,
                      output = "markdown_short") |> unname()

  expect_equal(object = v_bib_tag,
               expected = c("[@smith2020making]", "[@tordrup2022global]", "[@xie2015]",
                   "[@baio2017bceaweb]",   "[@gmailr]", "[@baio2017bceaweb2]",
                   "[@hart2020r]",  "(Assumption)" ))

})




test_that("extract_bibtex_tag works with multiple bibtex entries in the string", {

  multiple_bibtex_entries <- extract_bibtex_tag(bibtex_entry = paste0(v_example_refs[1:3], collapse = "\n"),
                                                output = "markdown_short")

  expect_true(multiple_bibtex_entries == "[@smith2020making; tordrup2022global; xie2015]")

})
