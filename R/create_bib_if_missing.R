#' Create empty bib file if it is missing
#'
#' @param path path to proposed new file name. Must end with .bib
#' @param verbose logical for whether to print messages. Default is FALSE
#'
#' @return empty
#' @export
#'
#' @examples
#' \donttest{
#' create_bib_if_missing()
#' }
create_bib_if_missing <- function(path = "bibby_refs.bib",
                                  verbose = FALSE) {
  # Check if the file exists in the path
  if (file.exists(path)) {
    if (verbose)
      message(".bib file already exists at: ", path, " - using this file")
    return(NULL)
  }

  # Create the file
  file.create(path)

  # Confirm creation
  if (file.exists(path)) {
    if (verbose)
      message("Empty .bib file created at: ", path)
  } else {
    stop("Failed to create .bib file.")
  }

}
