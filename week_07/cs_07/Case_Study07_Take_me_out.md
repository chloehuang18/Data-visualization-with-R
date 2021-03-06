---
title: 'Case Study 7 : Take me out to the ball game'
author: "Chloe Huang"
date: "7/5/2021"
output: 
  html_document: 
    keep_md: TRUE
    code_folding: hide
---





# Import the data

```r
players <- Lahman::People
colleges <- Lahman::CollegePlaying
salary <- Lahman::Salaries
schools <- Lahman::Schools
```

# Data Wrangling

```r
inf <- inflation_adjust(2020) %>% 
  rename("yearID" = year) %>% 
  mutate(yearID = as.numeric(yearID))

salary <- salary %>% 
  left_join(inf, by = "yearID") %>% 
  mutate(salary = salary / adj_value) %>% 
  select(c(playerID, salary))

total <- players %>% 
  left_join(salary, by = "playerID") %>% 
  left_join(colleges, by = "playerID") %>% 
  left_join(schools, by = "schoolID") %>% 
  select(c(nameFirst, nameLast, name_full, salary, state))

utah <- total %>% 
  filter(state == "UT") %>% 
  drop_na() %>% 
  group_by(name_full) %>% 
  mutate(avgSalary = mean(salary)) %>% 
  ungroup() %>% 
  group_by(name_full) %>% 
  slice_head() %>% 
  mutate(school_name = factor(name_full, levels = c("Southern Utah University",
                                                  "Salt Lake Community College",
                                                  "Snow College",
                                                  "College of Eastern Utah",
                                                  "Utah Valley State University",
                                                  "University of Utah",
                                                  "Dixie State College of Utah",
                                                  "Brigham Young University"), ordered = T))
```

# Data Visualization

```r
ggplot(utah) +
  geom_bar(aes(y = school_name, x = avgSalary, fill = school_name), stat = "identity") +
  labs(x = "Average Salary",
       y = "college") +
  scale_x_continuous(labels = scales::comma) +
  theme_light() +
  theme(axis.title.y = element_blank())
```

![](Case_Study07_Take_me_out_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

# Summary
Based on this chart, BYU has the best average baseball salary in Utah, followed by the Dixie State. Other college only have less than 1/3 average salary of BYU. 
