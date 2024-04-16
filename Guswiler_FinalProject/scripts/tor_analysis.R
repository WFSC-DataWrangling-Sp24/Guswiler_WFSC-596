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
  group_by(age_cat, sex)

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


# Initial visualization of data
# discrimination ratio
analysis_data %>%                     # make these look nicer for the final
  ggplot(aes(age_cat, disc_rat_2min,
             color = sex)) +
  geom_boxplot() +
  geom_abline(slope = 0,
              intercept = 0.0,
              linetype = "dotted")


# total exploration
analysis_data %>% 
  ggplot(aes(age_cat, test_total_expl_s,
             color = sex)) +
  geom_col()
# appears to be similar performance and exploration between sexes, within age categories

# Let's perform some tests to confirm this




## First, we will split up the data to make the process of comparisons among groups easier
# Getting the group names in the correct order
naming <- unite(group_keys(analysis_data), "group", age_cat, sex)

#split into different data frames based on the groups
by_group_data <- analysis_data %>% 
  group_split() %>% 
  # name them based on the vector we created earlier
  set_names(nm = naming$group)

# the separate data frames are now in the environment
list2env(by_group_data, envir = .GlobalEnv)




# t tests to compare sex differences, by age cat
## compare discrimination ratio
t.test(young_F$disc_rat_2min, young_M$disc_rat_2min,
       var.equal = TRUE)
  # t = 0.362, P = 0.721, CI = -0.265 to 0.376
  # on average, disc. rat. of young F (0.147 +/- ) did not differ from young M (0.092 +/-)

t.test(old_F$disc_rat_2min, old_M$disc_rat_2min,
       var.equal = TRUE)
  # t = -0.716, P = 0.485, CI = -0.738 to 0.365
  # on average disc. rat of old F (-0.307 +/-) did not differ from old M (-0.121 +/-)

## compare total test exploration
t.test(young_F$test_total_expl_s,
       young_M$test_total_expl_s,
       var.equal = TRUE)
  # on average, no difference in total time spent exploring during test

t.test(old_F$test_total_expl_s,
       old_M$test_total_expl_s,
       var.equal = TRUE)
  # on average, no difference in total time spent exploring during test


#b/c there is no difference between sexes, we can collapse these groups and make comparisons between age_cat
young <- bind_rows(young_F, young_M)
old <- bind_rows(old_F, old_M)

# compare disc. ratios
t.test(young$disc_rat_2min,
       old$disc_rat_2min,
       var.equal = TRUE)
# diff between performance, young rats unable to determine which object they saw first
#  old rats display preference for most recent object

# compare total exploration
t.test(young$test_total_expl_s,
       old$test_total_expl_s,
       var.equal = TRUE)
# distinct difference between willingness to explore during test

#diff in first obj explored?
t.test(young$test_first_visit_obj_4,
       old$test_first_visit_obj_4,
       var.equal = TRUE)             # young more often visited obj. 4 first

# are the rats exploring one object over another outside of chance?
t.test(young$disc_rat_2min) # no difference between objects
t.test(old$disc_rat_2min)   # no difference between objects, but trends in opposite direction as young

# was the first to visit object outside of chance?
t.test(young$test_first_visit_obj_4)
t.test(old$test_first_visit_obj_4)




# does exploration decrease as the task goes on?

summary_data <- analysis_data %>% 
  group_by(age_cat) %>% 
  mutate(sample_1_total = 
           sample_1_east_obj_4_s + sample_1_west_obj_4_s,
         sample_2_total = 
           sample_2_east_obj_19_s + sample_2_west_obj_19_s) %>% 
  summarise(mean(sample_1_total),
            mean(sample_2_total),
            mean(test_total_expl_s)) %>% 
  rename(avg_sample_1 = "mean(sample_1_total)",
         avg_sample_2 = "mean(sample_2_total)",
         avg_total = "mean(test_total_expl_s)") %>% 
  pivot_longer(c(avg_sample_1,
                 avg_sample_2,
                 avg_total),
               names_to = "task_phase",
               values_to = "expl_seconds")



summary_data %>% ggplot(aes(task_phase,
                            expl_seconds,
                            color = age_cat)) +
  geom_col(position = "dodge") +
  geom_point() +
  facet_wrap(~age_cat)



expl_change <- analysis_data %>%
  mutate(sample_1_total = 
           sample_1_east_obj_4_s + sample_1_west_obj_4_s,
         sample_2_total = 
           sample_2_east_obj_19_s + sample_2_west_obj_19_s) %>% 
  pivot_longer(c(sample_1_total,
                 sample_2_total,
                 test_total_expl_s),
               names_to = "task_phase",
               values_to = "expl_seconds")


expl_change %>% ggplot(aes(task_phase,
                           expl_seconds,
                           color = age_cat)) +
  geom_col(position = "dodge") +
  geom_point() +
  facet_wrap(~age_cat)
