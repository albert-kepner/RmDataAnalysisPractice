install.packages("devtools")
devtools::install_github("jhudsl/collegeIncome")
library(collegeIncome)
data(college)

devtools::install_github("jhudsl/matahari")
library(matahari)

dance_start(value = FALSE, contents = FALSE)


## dance_save("~/Desktop/college_major_analysis.rds")

library(dplyr)

glimpse(college)

str(college)

summary(college)

?college

c <- college

college %>% select(major_category,median, sample_size) %>%
  group_by(major_category) %>% 
  summarize(count=n(), avg_median = mean(median), total_sample = sum(sample_size))

college %>% select(major_category,median, sample_size) %>%
  group_by(major_category) %>% 
  summarize(count=n(), avg_median = mean(median), total_sample = sum(sample_size)) %>%
  arrange(desc(avg_median))


college %>% select(major_category,median, p25th, p75th, sample_size) %>%
  group_by(major_category) %>% 
  summarize(count=n(), avg_median = mean(median),
            avg_p25th = mean(p25th), avg_p75th = mean(p75th),
            total_sample = sum(sample_size)) %>%
  arrange(desc(avg_median))

dance_save("college_major_analysis.rds")

