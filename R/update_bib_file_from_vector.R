#' Update or create a bib file with a vector of bibtex strings
#'
#' @param path file path to the bib to create or update
#' @param v_bibtex_entries bibtex strings to add
#' @param output_type the type of output to return. Default is "markdown_short"
#' @param verbose logical for whether to print messages. Default is FALSE
#'
#' @return a vector of the bibtex tags (one per string)
#'
#' @export
#'
#' @examples
#'
#' \donttest{
#' update_bib_file_from_vector(
#' path = "bibby_refs.bib",
#' v_bibtex_entries = v_example_refs,
#' verbose = TRUE
#' )
#' }
#'
#'
update_bib_file_from_vector <- function(
    path,
    v_bibtex_entries,
    output_type = "markdown_short",
    verbose = FALSE) {
  # check that the path_to_bib is a string and that it ends in .bib
  if(!is.character(path) | !grepl(x = path, pattern = ".bib$")){
    stop("path_to_bib must be a string ending in .bib")
  }
  # Create the bib file if missing
  create_bib_if_missing(path = path,
                        verbose = verbose)

  # Read the existing content from the bib-file...
  existing_content <- readLines(path)

  # append the strings with the bibtex
  v_bibtex_entries_ALL <- append_bibtex_entry_vec(
    v_bibtex_entries = v_bibtex_entries,
    existing_content = existing_content,
    verbose = verbose
  )

  # write the lines to the file
  writeLines(text = v_bibtex_entries_ALL,
             con = path)

  # create a vector of the bibtex tags
  v_bib_tags <- sapply(X = v_bibtex_entries,
                       FUN = extract_bibtex_tag,
                       output = output_type)
  # return a vector of the tags
  v_bib_tags <- unname(v_bib_tags)

  return(v_bib_tags)
}
