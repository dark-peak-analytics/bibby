test_that("create_bib_if_missing works as intended", {
    # create a temporary directory
    temp_dir <- tempfile()
    dir.create(temp_dir)

    # create a temporary file path
    bib_path <- file.path(temp_dir, "output.bib")

    # we should expect the file doesn't currently exist
    expect_false(file.exists(bib_path))

    # create the bib file
    create_bib_if_missing(bib_path)

    # check that the file exists
    expect_true(file.exists(bib_path))

    # unlink the temporary directory
    on.exit(unlink(temp_dir, recursive = TRUE))

  })
