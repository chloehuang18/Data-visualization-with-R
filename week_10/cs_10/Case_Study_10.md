---
title: "Case Study 10"
author: "Chloe Huang"
date: "7/20/2021"
output: 
  html_document: 
    keep_md: TRUE
    code_folding: hide
---





# Import the data

```r
sales <- read_csv("https://byuistats.github.io/M335/data/sales.csv")

sales <- sales %>%
  mutate(Time = with_tz(Time, "US/Mountain"),
         Hour = hour(ceiling_date(Time, "hour"))) %>%
  filter(Name != "Missing")

view(sales)
```

# 1.gross revenue

```r
sales1 <- sales %>%
  filter(Amount > 0) %>% 
  mutate(Week = week(floor_date(Time, "week"))) %>%
  group_by(Name, Week) %>%
  mutate(Weekly_total = sum(Amount))

sales1 %>% 
  ggplot(aes(x = as.factor(Week),
             y = Weekly_total)) +
  geom_col(aes(fill = Name)) +
  facet_wrap(~ Name) +
  scale_y_continuous(label = comma) +
  labs(title = "Gross Sales by Week",
       x = "Week of Year",
       y = "Gross Sales") +
  theme_bw() +
  theme(legend.position = "none")
```

![](Case_Study_10_files/figure-html/unnamed-chunk-2-1.png)<!-- -->


# 2.hours of operation

```r
sales2 <- sales %>% 
  group_by(Name, Hour) %>% 
  mutate(Hourly_total = sum(Amount))

sales2 %>%
  ggplot(aes(x = Hour,
             y = Hourly_total,
             color = Name)) +
  geom_line() +
  facet_wrap(~ Name) +
  theme_bw() +
  labs(title = "Peak Hours of Business",
       x = "Hour of Day",
       y = "Total Sales") +
  theme(legend.position = "none")
```

![](Case_Study_10_files/figure-html/unnamed-chunk-3-1.png)<!-- -->

# 3.customer traffic

```r
sales3 <- sales %>%
  group_by(Name) %>%
  mutate(Name_total = sum(Amount))
sales3 %>%
  ggplot(aes(x = Name,
             y = Name_total,
             fill = Name)) +
  geom_col() +
  scale_y_continuous(label = comma) +
  labs(title = "Customer Traffic",
       x = "Company",
       y = "Net Sales") +
  theme_bw() +
  theme(legend.position = "none")
```

![](Case_Study_10_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

# Summary
Based on the three graphs above, HotDiggity and Tacontento appears to be the most worthwhile investments among all other companies. 
