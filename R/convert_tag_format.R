#' Convert between different tag formats
#'
#' @param x a single string containing a tag, markdown_long or markdown_short tag
#' @param to the format to convert to
#'
#' @return a character vector of the tags in the new format
#' @export
#'
#' @examples
#' convert_tag_format(x = "@smith2020making", to = "tag")
#' convert_tag_format(x = "@smith2020making", to = "markdown_short")
#' convert_tag_format(x = "smith2020making", to = "markdown_long")
#'
convert_tag_format <- function(x,
                               to = c("markdown_long", "markdown_short" , "tag")){

  # ensure x is character
  x <- as.character(x)

  # check the to arguments are valid
  to <- match.arg(to)

  # identify which type of input x is (long, short or tag)
  if(grepl(x = x, pattern = "\\[@(.*?)\\]")){
    from <- "markdown_short"
  } else if(grepl(x = x, pattern = "@(.*?)")){
    from <- "markdown_long"
  } else {
    from <- "tag"
  }

  # if from = to, return the input
  if(from == to){
    return(x)
  }

  # regardless of input type convert to tag, so remove @[] or @
  tag <- gsub(pattern = "@|\\[|\\]",
              replacement = "",
              x = x)

  if(to == "tag"){
    return(tag)
  }

  if(to == "markdown_long"){
    return(paste0("@", tag))
  }

  if(to == "markdown_short"){
    return(paste0("[@", tag, "]"))
  }

}

