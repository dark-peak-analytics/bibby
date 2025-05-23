% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extract_bibtex_tag.R
\name{extract_bibtex_tag}
\alias{extract_bibtex_tag}
\title{Extracts the tag from the bibtex reference}
\usage{
extract_bibtex_tag(
  bibtex_entry,
  output = c("tag", "markdown_short", "markdown_long")
)
}
\arguments{
\item{bibtex_entry}{the bibtex string to use}

\item{output}{type of tag to output (e.g. markdown short ref or long reference or just the tag string) defaults to tag.}
}
\value{
a bibtex tag pre-formatted for markdown as required
}
\description{
Exists after the first braket and before the first comma.
}
\examples{

extract_bibtex_tag(
  bibtex_entry =  v_example_refs[1],
  output = "markdown_long"
)

extract_bibtex_tag("@article{smith2020making,
title={Making health economic models Shiny: A tutorial},
author={Smith, Robert and Schneider, Paul},
journal={Wellcome open research},
volume={5},
pages={69},
year={2020}
}", "tag"
  )

extract_bibtex_tag("Assumption")
}
