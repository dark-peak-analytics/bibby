# Example bib files
example_ref1 <- "@article{smith2020making,
  title={Making health economic models Shiny: A tutorial},
  author={Smith, Robert and Schneider, Paul},
  journal={Wellcome open research},
  volume={5},
  pages={69},
  year={2020}
}"

example_ref2 <- "@article{tordrup2022global,
  title={Global return on investment and cost-effectiveness of WHO's HEAR interventions for hearing loss: a modelling study},
  author={Tordrup, David and Smith, Robert and Kamenov, Kaloyan and Bertram, Melanie Y and Green, Nathan and Chadha, Shelly},
  journal={The Lancet Global Health},
  volume={10},
  number={1},
  pages={e52--e62},
  year={2022},
  publisher={Elsevier}
}"

example_ref3 <- "@Book{xie2015,
  title = {Dynamic Documents with {R} and knitr},
  author = {Yihui Xie},
  publisher = {Chapman and Hall/CRC},
  address = {Boca Raton, Florida},
  year = {2015},
  edition = {2nd},
  note = {ISBN 978-1498716963},
  url = {http://yihui.name/knitr/},
}"

example_ref4 <- "@incollection{baio2017bceaweb,
  title={BCEAweb: A User-Friendly Web-App to Use BCEA},
  author={Baio, Gianluca and Berardi, Andrea and Heath, Anna},
  booktitle={Bayesian Cost-Effectiveness Analysis with the R package BCEA},
  pages={153--166},
  year={2017},
  publisher={Springer}
}"

example_ref5 <- "@Manual{gmailr,
  title = {gmailr: Access the 'Gmail' 'RESTful' API},
  author = {Jim Hester},
  year = {2019},
  note = {R package version 1.0.0},
  url = {https://CRAN.R-project.org/package=gmailr},}"

example_ref6 <- "Assumption"

example_ref7 <- "@incollection{baio2017bceaweb2,
  title={BCEAweb: A User-Friendly Web-App to Use BCEA - version 2},
  author={Baio, Gianluca and Berardi, Andrea and Heath, Anna},
  booktitle={Bayesian Cost-Effectiveness Analysis with the R package BCEA},
  pages={153--166},
  year={2017},
  publisher={Springer}
}"

example_ref8 <- "@article{hart2020r,
  title={R and Shiny for cost-effectiveness analyses: why and when? A hypothetical case study},
  author={Hart, Rose and Burns, Darren and Ramaekers, Bram and Ren, Shijie and Gladwell, Daniel and Sullivan, Will and Davison, Niall and Saunders, Owain and Sly, Indeg and Cain, Theresa and others},
  journal={Pharmacoeconomics},
  volume={38},
  pages={765--776},
  year={2020},
  publisher={Springer}
}"

# create vector of references
v_example_refs <- c(example_ref1,
                    example_ref2,
                    example_ref3,
                    example_ref4,
                    example_ref5,
                    example_ref7,
                    example_ref8,
                    "Assumption")

usethis::use_data(v_example_refs, overwrite = TRUE)
