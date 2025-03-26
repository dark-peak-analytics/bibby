#' Update or create a bib file with a vector of bibtex strings
#'
#' @param path_to_bib file path to the bib to create or update
#' @param v_bibtex_strings bibtex strings to add
#'
#' @return a vector of the bibtex tags (one per string)
#' @export
#'
#' @examples
update_bib_file_from_vector <- function(
    path_to_bib,
    v_bibtex_strings,
    output_type = "markdown_short") {
  # Create the bib file if missing
  create_bib_if_missing(path = path_to_bib)

  # Read the existing content from the bib-file...
  existing_content <- readLines(path_to_bib)

  # append the strings with the bibtex
  v_bibtex_string <- append_bibtex_string_vec(
    v_bibtex_strings = v_bibtex_strings,
    existing_content = existing_content
  )

  # write the lines to the file
  writeLines(text = v_bibtex_string,
             con = path_to_bib)

  # create a vector of the bibtex tags
  v_bib_tags <- sapply(X = v_bibtex_strings,
                       FUN = extract_bibtex_tag,
                       output = output_type)

  return(unname(v_bib_tags))
}
