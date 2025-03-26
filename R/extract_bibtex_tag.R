#' Extracts the tag from the bibtex reference
#'
#' Exists after the first braket and before the first comma.
#'
#' @param bibtex_string the bibtex string to use
#' @param output type of tag to output (e.g. markdown short ref e.g. [1], or long reference or just the tag string)
#'
#' @return a bibtex tag, or pre-formatted for markdown
#' @export
#'
#' @examples
#'
#' extract_bibtex_tag("@article{smith2020making,
#' title={Making health economic models Shiny: A tutorial},
#' author={Smith, Robert and Schneider, Paul},
#' journal={Wellcome open research},
#' volume={5},
#' pages={69},
#' year={2020}
#' }", "markdown_long"
#'   )
#'
#' extract_bibtex_tag("Assumption")
extract_bibtex_tag <- function(
    bibtex_string,
    output = c("tag", "markdown_short", "markdown_long")) {
  # Check the bibtex_string argument contains an @, an opening and closing bracket
  # and a tag
  if(!grepl(pattern = "^@.*?\\{([^,]+),.*", x = bibtex_string))
    return(bibtex_string)

  # check the output argument provided.
  output <- match.arg(output)

  # Remove newlines and extra spaces to handle multi-line entries
  bibtex_string <- gsub("\\s+", " ", bibtex_string)

  # Extract the tag using a more flexible regex
  tag <- sub("^@.*?\\{([^,]+),.*", "\\1", bibtex_string)

  if(output == "tag") return(tag)
  if(output == "markdown_short") return(paste0("[@",tag,"]"))
  if(output == "markdown_long") return(paste0("@",tag))
}
