library(tidyverse)

cats_data <- read_csv("data_raw/final_project/Domestic Cats in the Albany Pine Bush, New York.csv") %>% 
  rename(`tag-id` = `tag-local-identifier`,
        `animal-id` =  `individual-local-identifier`,
        `animal-taxon` = `individual-taxon-canonical-name`)
cats_ref <- read_csv("data_raw/final_project/Domestic Cats in the Albany Pine Bush, New York-reference-data.csv")

cats_full <- cats_data %>% 
  full_join(cats_ref)

hunt <- cats_full %>% 
  filter(`behavioural-classification` == "Hunt")
