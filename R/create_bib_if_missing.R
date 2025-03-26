#' Create empty bib file if it is missing
#'
#' @param path path to file. Must end with .bib
#'
#' @return empty
#' @export
#'
#' @examples
#' create_bib_if_missing("refs.bib")
create_bib_if_missing <- function(path){
  # Check if the file exists in the path
  if (!file.exists(path)) {
    file.create(path)

    # Confirm creation
    if (!file.exists(path)){stop("Failed to create .bib file.")}
    else message("Empty .bib file created at: ", path)
  } else {
    message(".bib file already exists at: ", path, " - using this file")
  }
}
