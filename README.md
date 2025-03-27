# bibby

<div class="logos">

<img src="https://github.com/user-attachments/assets/0fd4be1b-8dd3-4625-9c3f-98b407394107" width="120px" align="right">

</div>

<!-- badges: start -->

[![R-CMD-check](https://github.com/dark-peak-analytics/bibby/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/dark-peak-analytics/bibby/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

## Purpose

This R package is designed to work with bibtex in automated reporting - constructing .bib files from 
dataframes of references, and extracting references from .bib files into dataframes.


## Installation

The development version of assertHE can be installed from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dark-peak-analytics/bibby")

library(bibby)
```

## Use

Hopefully simple to use. Just specify the bibtex entry and the output type required.
For example...

``` r

extract_bibtex_tag(
  bibtex_entry =  "@article{smith2020making,
                            title={Making health economic models Shiny: A tutorial},
                            author={Smith, Robert and Schneider, Paul},
                            journal={Wellcome open research},
                            volume={5},
                            pages={69},
                            year={2020}}",
  output = "markdown_long")

```

If you have a list of bibtex entries, you can then use the `update_bib_file_from_vector`
function to update a .bib file with the new entries. For example the code below
will update the file `bibby_refs.bib` with the new entries (creating it if the file
doesn't exist). The `verbose` argument will print the new entries to the console.
The function also returns the bibtex tags of all entries for use in other functions.


``` r

update_bib_file_from_vector(path = "bibby_refs.bib",
                            v_bibtex_entries = v_example_refs,
                            verbose = TRUE, 
                            output_type = "markdown_short"
                            )
                            
```




## Get in contact

To get in contact about this project or other collaborations please feel
free to email me at <rsmith@darkpeakanalytics.com>.
