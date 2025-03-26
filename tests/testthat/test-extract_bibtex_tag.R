test_that("extract_bibtex_tag", {

  bib_tag <- extract_bibtex_tag(bibtex_string = "@article{smith2020making,
  title={Making health economic models Shiny: A tutorial},
  author={Smith, Robert and Schneider, Paul},
  journal={Wellcome open research},
  volume={5},
  pages={69},
  year={2020}
  }", output = "markdown_long")

  expect_equal(object = bib_tag, expected = "@smith2020making")


  #========================================================================#

  bib_tag <- extract_bibtex_tag(bibtex_string = "@article{smith2020making,
  title={Making health economic models Shiny: A tutorial},
  author={Smith, Robert and Schneider, Paul},
  journal={Wellcome open research},
  volume={5},
  pages={69},
  year={2020}
  }", output = "markdown_short")

  expect_equal(object = bib_tag, expected = "[@smith2020making]")

  #========================================================================#

  bib_tag <- extract_bibtex_tag(bibtex_string = "@article{smith2020making,
  title={Making health economic models Shiny: A tutorial},
  author={Smith, Robert and Schneider, Paul},
  journal={Wellcome open research},
  volume={5},
  pages={69},
  year={2020}
  }", output = "tag")

  expect_equal(object = bib_tag, expected = "smith2020making")


  #========================================================================#
  # try looping through a list of examples
  v_bib_tag <- sapply(X = v_example_refs,
                      FUN = extract_bibtex_tag,
                      output = "markdown_short") |> unname()

  expect_equal(object = v_bib_tag,
               expected = c("[@smith2020making]", "[@tordrup2022global]", "[@xie2015]",
                   "[@baio2017bceaweb]",   "[@gmailr]", "[@baio2017bceaweb2]",
                   "[@hart2020r]",  "Assumption" ))

})
