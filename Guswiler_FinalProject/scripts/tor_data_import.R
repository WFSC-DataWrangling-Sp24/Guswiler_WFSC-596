library(tidyverse)

#### Move all these files over to final project folders, file paths will change, better to do now before you forget

# Load data files into environment
animal_info <- read_csv("Guswiler_FinalProject/data_raw/animal_info.csv")
sample_1 <- read_csv("Guswiler_FinalProject/data_raw/sample_1_obj_4.csv")
sample_2 <- read_csv("Guswiler_FinalProject/data_raw/sample_2_obj_19.csv")
test <- read_csv("Guswiler_FinalProject/data_raw/test.csv")

# Join data frames into one
full_data <- animal_info %>% 
  left_join(sample_1) %>% 
  left_join(sample_2) %>% 
  left_join(test)

# Add age category, young = 6-15 mo, old = 20+ mo
# Calculate total exploration for first 2 min and entire 4 min of test phase
# Calculate discrimination ratios for first 2 min and entire 4 min of test phase
#  discrimination ratio = (exploration sample 1 object - exploration of sample 2 object) / total exploration
full_data <- full_data %>% 
  # add age_cat
  mutate(age_cat =
           case_when(
             age_at_test_mo >= 20 ~ "old",
             age_at_test_mo < 17 ~ "young"),
         .before = "strain") %>% 
  # calculate test total exploration
  mutate(test_total_expl_s = test_expl_obj_4_s + test_expl_obj_19_s,
         .after = test_expl_obj_19_s) %>% 
  # calculate test first 2 min total exploration
  mutate(test_first_2min_total_expl_s =
           test_first_2min_expl_obj_4_s + test_first_2min_expl_obj_19_s,
         .after = test_first_2min_expl_obj_19_s) %>% 
  # calculate total discrimination ratio
  mutate(disc_rat_total =
           (test_expl_obj_4_s - test_expl_obj_19_s) / test_total_expl_s,
         .after = test_total_expl_s) %>% 
  # calculate first 2 min discrimination ratio
  mutate(disc_rat_2min = 
           (test_first_2min_expl_obj_4_s - test_first_2min_expl_obj_19_s) / test_first_2min_total_expl_s,
         .after = test_first_2min_total_expl_s)


# Create functions to indicate rats with insufficient exploration in any of the following ways:
#  sample phases: exploration of any object < 5s 
#  test phase: total exploration (during entire 4min) < 10s
# This ensures that rats included in analyses explored all objects long enough to commit them to memory
######

# Function to indicate T/F for sufficient exploration from sample phases
check_sample_phase_expl <- function(expl_e,   # sample phase 1|2: time rat spent exploring East object
                                    expl_w){  # sample phase 1|2: time rat spent exploring West object
  sufficient_expl <- case_when(expl_e < 5 |
                                 expl_w < 5
                               ~ FALSE,
                               expl_e >= 5 |
                                 expl_w >= 5
                               ~ TRUE)
  return(sufficient_expl)
}

# Function to indicate T/F for sufficient exploration from test phase
check_test_phase_expl <- function(test_total_expl){  # test: total time rat spent exploring both objects
  sufficient_expl <- case_when(test_total_expl < 10
                               ~ FALSE,
                               test_total_expl >= 10
                               ~ TRUE)
  return(sufficient_expl)
}
######

# Apply functions to check for sufficient exploration and merge into a single column
full_data <- full_data %>%
  mutate(.after = disc_rat_total,                       #### will choose a better location for this
         # check sample phase 1 exploration
         sample_1_suff_expl = check_sample_phase_expl(sample_1_east_obj_4_s,
                                                      sample_1_west_obj_4_s),
         # check sample phase 2 exploration
         sample_2_suff_expl = check_sample_phase_expl(sample_2_east_obj_19_s,
                                                      sample_2_west_obj_19_s),
         # check test exploration
         test_suff_expl = check_test_phase_expl(test_total_expl_s)) %>% 
  # merge all T/F columns into one, marking F unless all are T
  mutate(.before = sample_1_suff_expl,
         sufficient_expl = case_when(sample_1_suff_expl == TRUE &
                                       sample_2_suff_expl == TRUE &
                                       test_suff_expl == TRUE
                                     ~ TRUE,
                                     .default = FALSE)) %>% 
  # remove individual T/F columns used to create merged column
  select(!c(sample_1_suff_expl, sample_2_suff_expl, test_suff_expl))


# Save data frame in data_clean/
write_csv(full_data, "Guswiler_FinalProject/data_clean/tor_full_data.csv")
