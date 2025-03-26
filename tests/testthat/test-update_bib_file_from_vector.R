test_that("Test writing to file works", {

  v_expectations <- c("[@smith2020making]", "[@tordrup2022global]", "[@xie2015]",
                      "[@baio2017bceaweb]",   "[@gmailr]", "[@baio2017bceaweb2]",
                      "[@hart2020r]",  "Assumption" )

  v_expectations_tag <- c("smith2020making", "tordrup2022global", "xie2015",
                          "baio2017bceaweb",   "gmailr", "baio2017bceaweb2",
                          "hart2020r",  "Assumption" )

  # create a temporary directory
  temp_dir <- tempfile()
  dir.create(temp_dir)

  bib_path <- file.path(temp_dir, "output.bib")


  suppressMessages({

    # update a bib file with a vector of bibtex strings and output/return the bibtex tags
    update_bib_file_from_vector(
    path_to_bib = bib_path,
    v_bibtex_strings = v_example_refs,
    output_type = "markdown_short") |>
    expect_equal(v_expectations)

  update_bib_file_from_vector(
    path_to_bib = bib_path,
    v_bibtex_strings = v_example_refs,
    output_type = "tag") |>
    expect_equal(v_expectations_tag)


  })

  # check that the file was created
  expect_true(file.exists(bib_path))

  # read in the file as a vector of strings
  v_bibfilestrings <- readLines(con = bib_path)

  lapply(X = v_expectations_tag[v_expectations_tag != "Assumption"],
         FUN = function(x) {
           grepl(x = v_bibfilestrings,
                 pattern = x) |> any()
         })

})
