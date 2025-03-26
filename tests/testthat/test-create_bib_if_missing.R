# test_that("create_bib_if_missing works", {
#     # create a temporary directory
#     temp_dir <- tempfile()
#     dir.create(temp_dir)
#
#     # create a temporary file path
#     bib_path <- file.path(temp_dir, "output.bib")
#
#     # run the code to create the empty bib file & expect message to console.
#     msg <- capture_message(code = create_bib_if_missing(path = bib_path))
#
#     msg$message %>% expect_contains("Empty .bib file created at: ")
#
#     # check that the file exists
#     expect_true(file.exists(bib_path))
#
#     # unlink the temporary directory
#     unlink(temp_dir, recursive = TRUE)
#
#
#   })
