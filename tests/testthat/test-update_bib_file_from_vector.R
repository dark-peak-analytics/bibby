test_that("Test writing to file works", {
  v_expectations <-
    c(
      "[@smith2020making]",
      "[@tordrup2022global]",
      "[@xie2015]",
      "[@baio2017bceaweb]",
      "[@gmailr]",
      "[@baio2017bceaweb2]",
      "[@hart2020r]",
      "Assumption"
    )

  v_expectations_tag <-
    c(
      "smith2020making",
      "tordrup2022global",
      "xie2015",
      "baio2017bceaweb",
      "gmailr",
      "baio2017bceaweb2",
      "hart2020r",
      "Assumption"
    )

  # create a temporary directory
  temp_dir <- tempfile()
  dir.create(temp_dir)
  path <- file.path(temp_dir, "output.bib")


  # update a bib file with a vector of bibtex strings and output/return the bibtex tags
  update_bib_file_from_vector(path = path,
                              v_bibtex_entries = v_example_refs,
                              output_type = "markdown_short") |>
    expect_equal(expected = v_expectations)

  update_bib_file_from_vector(path = path,
                              v_bibtex_entries = v_example_refs,
                              output_type = "tag") |>
    expect_equal(v_expectations_tag)



  # check that the file was created
  expect_true(file.exists(path))

  # read in the file as a vector of strings
  v_bibfilestrings <- readLines(con = path)

  # check that the file contains the expected strings
  lapply(
    X = v_expectations_tag[v_expectations_tag != "Assumption"],
    FUN = function(x) {
      grepl(x = v_bibfilestrings,
            pattern = x) |> any()
    }
  ) |> unlist() |> all() |> expect_true()

})
