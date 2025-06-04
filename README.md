# bibby

<div class="logos">

<img src="https://github.com/user-attachments/assets/60ce1afb-efaa-4fa7-befe-fffeeb2fbf3d" width="120px" align="right">

</div>

<!-- badges: start -->

[![R-CMD-check](https://github.com/dark-peak-analytics/bibby/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/dark-peak-analytics/bibby/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

## Background

A common problem when working with automated or semi-automated reports is the 
need to manage references alongside input parameters and other data. For example
if I have a model that has costs from Williams et al. (2020) and I want to change 
the cost of that intervention to be from Jameson et al. (2024) then I would want 
the value to be updated in the model, but also the reference to be updated in the report.

This package is designed to help with that problem, by allowing users to provide
references in a data frame (likely read in from Excel). This means that users
who are not R programmers can easily update parameter values and references in 
the input tables and re-run the R code (either automated or semi-automated) to
update the report with the new values and references.

## Overview

The `bibby` package provides functions to work with bibtex entries in R. 

It does two things:
1) The BiBTeX entries provided in tables are replaced with tags suitable for .Rmd.
2) The bibtex entries are written to a .bib file which is used by the .Rmd
   document to generate the bibliography.

There is no need to manually edit the .bib file, as the package will
automatically update the .bib file with the new entries. This means that users
can easily update the references in their input tables and re-run the R code to
update the report with the new values and references.

This process can be embedded into automated workflows, shiny or with 
databases such as DuckDB or SQLite. The package is designed to be simple to use
and flexible, allowing users to easily manage their references in R.

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

This is a beta version of the package, so please report any issues or suggestions.
We are using this on several client projects and it is working well, but we are
always looking for ways to improve the package and make it more useful for users.


## Get in contact

To get in contact about this project or other collaborations please feel
free to email me at <rsmith@darkpeakanalytics.com>.
