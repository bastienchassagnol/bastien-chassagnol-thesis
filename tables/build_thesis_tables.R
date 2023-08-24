## ----setup, include=FALSE------------------------------------------------------------------------------------------------------------
knitr::opts_chunk$set(
	echo = FALSE,
	warning = FALSE, 
	message = FALSE,
	out.width = "100%",
	fig.fullwidth=TRUE,
	fig.pos = "h")


library(dplyr)
library(kableExtra)
library(stringr)

options(dplyr.summarise.inform = FALSE) # remove the override .groups argument



## ----generate-immune-table-----------------------------------------------------------------------------------------------------------
# immune_dataset <- readr::read_delim("./tables/innate_vs_adaptive.csv", delim=";", show_col_types = F) %>%
#   dplyr::mutate(Feature=stringr::str_to_sentence(Feature),
#                 across(.cols = everything(),kableExtra::linebreak, linebreaker = "\\\\n")) 
# immune_dataset[1, 1] <- cell_spec(immune_dataset[1, 1], format= "latex", bold = T) 
# immune_dataset[2, 1] <- cell_spec(immune_dataset[2, 1], format= "latex", bold = T) 
# 
# immune_dataset %>% 
#   kbl(booktabs=T, caption = "The meain features of the adpative response, distinguishing it from the innate response", escape=F) %>%
#   kable_styling(latex_options=c("hold_position")) %>%
#   row_spec(0,bold=T) %>%
#   row_spec(0:6, align = "c") 


# Feature;Signification
# specificity;Each epitope of an antigen \\n is associated to its own immune response and lymphocyte. 
# memory;In case of second exposure with \\n the same pathogen, heightened response over a longer range of time
# diversity;Enables to fend off a large repertoire \\n of pahtogens, including newly encountered antigens. 
# clonal expansion;Increase of the very lymphocyte \\n targetting the epitopes of the intruder. 
# specialisation;Optimal pathway in relation \\n with the nature of the vector \\n (oversimplified, plasma cells target directly bacterias, \\n while TCD8 kill cells hosting virus or tumoral cells).
# nonreactivity to self;The adaptive immunity induces \\n mechanisms of tolerance to innocuous foreign substances. \\n Besides, their unwanted side effects against heathy \\n tissues are considerably alleviated compared to innate cells. 



immune_dataset <- readr::read_delim("./tables/innate_vs_adaptive.csv", delim=";", show_col_types = F) %>%
  dplyr::mutate(Feature=stringr::str_to_sentence(Feature), 
                Signification= stringr::str_wrap(Signification, width = 60),
                across(.cols = everything(),kableExtra::linebreak, align="c")) 
immune_dataset[1, 1] <- cell_spec(immune_dataset[1, 1], format= "latex", bold = T) 
immune_dataset[2, 1] <- cell_spec(immune_dataset[2, 1], format= "latex", bold = T) 

immune_dataset %>% 
  kbl(booktabs=T, caption = "The meain features of the adpative response, distinguishing it from the innate response", escape=F) %>%
  kable_styling(latex_options=c("hold_position")) %>%
  row_spec(0,bold=T, align = "c") %>%
  row_spec(1:5, align = "c", hline_after = TRUE) 

