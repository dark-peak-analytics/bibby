# library(stringdist)
#
# rm(list = ls())
# # Define two strings
# string1 <- "@article{smith2020making,
#   title={Making health economic models Shiny: A tutorial},
#   author={Smith, Robert and Schneider, Paul},
#   journal={Wellcome open research},
#   volume={5},
#   pages={69},
#   year={2020}
# }"
# string2 <- "@article{smith2020making2,
#   title={Making health economic models Shiny: A tutorial [version 2; peer review: 1 approved, 1 approved with reservations]},
#   author={Smith, Robert and Schneider, Paul},
#   journal={Wellcome Open Research},
#   year={2020},
#   publisher={Wellcome Trust Limited}
# }"
#
# string3 <- "@article{kaur2024msr94,
#   title={MSR94 Leveraging Python Dash and R Shiny for Advanced Health Economic Model Development},
#   author={Kaur, R and Singh, B and Pandey, S},
#   journal={Value in Health},
#   volume={27},
#   number={12},
#   pages={S456},
#   year={2024},
#   publisher={Elsevier}
# }"
#
# string4 <- "@article{smith2022living,
#   title={Living HTA: automating health technology assessment with R [version 1; peer review: 1 approved with reservations]},
#   author={Smith, Robert A and Schneider, Paul P and Mohammed, Wael},
#   journal={Wellcome Open Research},
#   volume={7},
#   year={2022},
#   publisher={F1000 Research Ltd}
# }"
#
# bib_text <- string1
#
# # Extract title using a regular expression
# extract_bib_entry_title <- function(bib_text) {
#   title_match <- regmatches(x = bib_text,
#                             regexpr("title=\\{([^}]*)\\}",
#                                     bib_text,
#                                     perl = TRUE))
#
#   title <- sub("title=\\{([^}]*)\\}", "\\1", title_match)
#
#   return(tolower(title))
# }
#
#
# extract_bib_entry_journal <- function(bib_text){
#
#   journal_match <- regmatches(x = bib_text,
#                               regexpr("journal=\\{([^}]*)\\}",
#                                       bib_text,
#                                       perl = TRUE))
#
#   journal <- sub("journal=\\{([^}]*)\\}", "\\1", journal_match)
#
#   return(tolower(journal))
# }
#
# extract_bib_entry_author <- function(bib_text){
#
#   author_match <- regmatches(x = bib_text,
#                              regexpr("author=\\{([^}]*)\\}",
#                                      bib_text,
#                                      perl = TRUE))
#
#   author <- sub("author=\\{([^}]*)\\}", "\\1", author_match)
#
#   return(tolower(author))
# }
#
# calc_simularity_titlejournal <- function(bib_text1, bib_text2){
#   title1 <- extract_bib_entry_title(bib_text1)
#   title2 <- extract_bib_entry_title(bib_text2)
#
#   #==========================#
#   # Title similarity
#
#   lev_dist_title <- stringdist(title1,
#                          title2,
#                          method = "lv")
#
#   norm_lev_dist_title <-
#     1 - (lev_dist_title / max(nchar(title1), nchar(title2))) # Normalize to similarity score
#
#   #==========================#
#   # Journal similarity
#
#   journal1 <- extract_bib_entry_journal(bib_text1)
#   journal2 <- extract_bib_entry_journal(bib_text2)
#
#   lev_dist_journal <- stringdist(journal1,
#                          journal2,
#                          method = "lv")
#
#   norm_lev_dist_journal <-
#     1 - (lev_dist_journal / max(nchar(journal1), nchar(journal2))) # Normalize to similarity score
#
#
#   #==========================#
#   # Author similarity
#
#    author1 <- extract_bib_entry_author(bib_text1)
#    author2 <- extract_bib_entry_author(bib_text2)
#
#    lev_dist_author <- stringdist(author1,
#                                  author2,
#                                  method = "lv")
#
#    norm_lev_dist_author <-
#      1 - (lev_dist_author / max(nchar(author1), nchar(author2))) # Normalize to similarity score
#
#
#   return(c("title" = norm_lev_dist_title,
#            "journal" = norm_lev_dist_journal,
#            "author" = norm_lev_dist_author))
# }
#
#
# calc_simularity_titlejournal(string1, string3)
# calc_simularity_titlejournal(string1, string2)
# calc_simularity_titlejournal(string1, string4)
