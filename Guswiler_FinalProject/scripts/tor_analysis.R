library(tidyverse)

# read in data
full_data <- read_csv("Guswiler_FinalProject/data_clean/tor_full_data.csv")

# Create new data frame containing only rats that had sufficient exploration
# Retain only columns relevant to analyses
# Group by sex, age category, and strain
analysis_data <- full_data %>% 
  filter(sufficient_expl == TRUE) %>% 
  select(barnes_id, strain, age_cat, sex,
         disc_rat_2min, disc_rat_total,
         test_first_2min_total_expl_s, test_total_expl_s,
         test_first_visit_obj_4,
         sample_1_east_obj_4_s, sample_1_west_obj_4_s,
         sample_2_east_obj_19_s, sample_2_west_obj_19_s) %>% 
  group_by(sex, age_cat)

# Quick look at group summary data
analysis_data %>%
  # discrimination ratios and percent of group that explored obj 4 first during test
  summarise(n(),
            mean(disc_rat_2min),
            mean(disc_rat_total),
            (sum(test_first_visit_obj_4) / n()) * 100)

analysis_data %>%
  # test first 2min total exploration
  summarise(n(),
            mean(test_first_2min_total_expl_s),
            median(test_first_2min_total_expl_s),
            sd(test_first_2min_total_expl_s))

analysis_data %>%
  # test total exploration
  summarise(n(),
            mean(test_total_expl_s),
            median(test_total_expl_s),
            sd(test_total_expl_s))


# Take a look at the data
analysis_data %>%                     # make these look nicer for the final
  ggplot(aes(age_cat, disc_rat_2min,
             color = sex)) +
  geom_boxplot()

analysis_data %>% 
  ggplot(aes(age_cat, test_total_expl_s,
             color = sex)) +
  geom_col()





# Make a fn for separating into data frames for tests?
for_t_test <- function(Data, Category, Sex) {
  df <- filter(analysis_data,
               age_cat == Category &
                 sex == Sex)
  return(df)
}

# now how to create a for loop with this to get all our dfs...






# separate data frames for age and sex
young_male <- analysis_data %>% 
  filter(age_cat == "young" & sex == "M")

young_female <- full_data_exclusions %>% 
  filter(age_cat == "young" & sex == "F")

old_male <- full_data_exclusions %>% 
  filter(age_cat == "old" & sex == "M")

old_female <- full_data_exclusions %>% 
  filter(age_cat == "old" & sex == "F")


# t tests to compare sex differences, by age cat, in discrimination ratio
# no difference found between sexes
sex_compare_young_disc_rat <- t.test(
  young_male$discrimination_ratio,
  young_female$discrimination_ratio,
  var.equal = TRUE)

sex_compare_old_tdisc_rat <- t.test(
  old_male$discrimination_ratio,
  old_female$discrimination_ratio,
  var.equal = TRUE)

print(sex_compare_young_disc_rat)
print(sex_compare_old_tdisc_rat)


# t tests to compare sex differences, by age cat, in exploration
# no difference found between sexes
sex_compare_young_test_expl <- t.test(
  young_male$test_total_expl,
  young_female$test_total_expl,
  var.equal = TRUE)

sex_compare_old_test_expl <- t.test(
  old_male$test_total_expl,
  old_female$test_total_expl,
  var.equal = TRUE)

print(sex_compare_young_test_expl)
print(sex_compare_old_test_expl)





# separate data frames for age
young <- full_data_exclusions %>% 
  filter(age_cat == "young")

old <- full_data_exclusions %>% 
  filter(age_cat == "old")


# t test to compare sex differences, by age cat, in discrimination ratio
# no difference found between ages
age_compare_disc_rat <- t.test(
  young$discrimination_ratio,
  old$discrimination_ratio,
  var.equal = TRUE)

print(age_compare_disc_rat)

# t tests to compare sex differences, by age cat, in exploration
# P < 0.001
age_compare_test_expl <- t.test(
  young$test_total_expl,
  old$test_total_expl,
  var.equal = TRUE)

print(age_compare_test_expl)

