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
update_bib_file_from_vector <-
  function (path,
            v_bibtex_entries,
            output_type = "markdown_short",
            verbose = FALSE) {
    if (!is.character(path) | !grepl(x = path, pattern = ".bib$")) {
      stop("path_to_bib must be a string ending in .bib")
    }
    create_bib_if_missing(path = path, verbose = verbose)
    existing_content <- readLines(path)
    v_bibtex_entries_ALL <-
      append_bibtex_entry_vec(
        v_bibtex_entries = v_bibtex_entries,
        existing_content = existing_content,
        verbose = verbose
      )

    lines_to_write <- remove_consecutive_spaces(v_bibtex_entries_ALL)
    writeLines(text = lines_to_write, con = path)
    v_bib_tags <-
      sapply(X = v_bibtex_entries,
             FUN = extract_bibtex_tag,
             output = output_type)
    v_bib_tags <- unname(v_bib_tags)
    return(v_bib_tags)
  }





remove_consecutive_spaces <- function(x) {
  # find all the spaces
  v_spaces <- grep(pattern = "^\\s*$",
                   x = x)
  # identify consecutive spaces
  consecutive_space_index <- v_spaces[c(FALSE, diff(v_spaces) == 1)]
  # create a logical vector to identify consecutive spaces
  are_consecutive_spaces <- rep(FALSE, length(x))
  # mark the consecutive spaces as TRUE
  are_consecutive_spaces[consecutive_space_index] <- TRUE
  # only return the non-consecutive spaces
  return(x[!are_consecutive_spaces])

}
