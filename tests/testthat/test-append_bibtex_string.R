test_that("append_bibtex_string works as intended", {

  v_bibtex_strings <- append_bibtex_string(bibtex_string = v_example_refs[2],
                       existing_content = v_example_refs[1])

  # basic check to ensure the length of the bibtex strings is 3 (two refs and a blank line)
  v_bibtex_strings |>  expect_length(3)

  result <- v_bibtex_strings[2] == " "

  # check the second line is blank
  expect_true(object = result)

})


test_that("append_bibtex_string_vec works as intended", {

  v_bibtex_strings <- append_bibtex_string_vec(v_bibtex_strings = v_example_refs[2:5],
                                           existing_content = v_example_refs[1])

  # basic check to ensure the length of the bibtex strings is 3 (two refs and a blank line)
  v_bibtex_strings |>  expect_length(5 + 4)

  # check the second line is blank
  expect_true(all(v_bibtex_strings[(1:4)*2] == " "))

})

