test_that("append_bibtex_entry works as intended", {

  v_bibtex_entries <-
    append_bibtex_entry(bibtex_entry = v_example_refs[2],
                        existing_content = v_example_refs[1])

  # basic check to ensure the length of the bibtex strings is 3 (two refs and a blank line)
  expect_length(object = v_bibtex_entries, n = 3)

  result <- v_bibtex_entries[2] == " "

  # check the second line is blank
  expect_true(object = result)

})


test_that("append_bibtex_entry_vec works as intended", {

  v_bibtex_entries <- append_bibtex_entry_vec(v_bibtex_entries = v_example_refs[2:5],
                                              existing_content = v_example_refs[1])

  # basic check to ensure the length of the bibtex strings is 3 (two refs and a blank line)
  expect_length(object = v_bibtex_entries, n = 5 + 4)

  # check the second line is blank
  expect_true(object = all(v_bibtex_entries[(1:4)*2] == " "))

})

