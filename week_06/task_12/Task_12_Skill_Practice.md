---
title: "Task 12 SKill Practice"
author: "Chloe Huang"
date: "6/30/2021"
output: 
  html_document: 
    keep_md: TRUE
    code_folding: hide
---





## Question 1
 What are the differences between facet wrap, facet_wrap, group and summarize? When to use these functions?
 
 [Resource](https://www.guru99.com/r-aggregate-function.html)
 
 * Summarise: The syntax of summarise() is basic and consistent with the other verbs included in the dplyr library.Summarise(data, mean_run = mean(R)): Creates a variable named mean_run which is the average of the column run from the dataset data.
 
```
summarise(df, variable_name=condition) 
arguments: 
- `df`: Dataset used to construct the summary statistics 
- `variable_name=condition`: Formula to create the new variable

summarise(data, mean_run =mean(R))

summarise(data, mean_run = mean(R)): Creates a variable named mean_run which is the average of the column run from the dataset data.


You can add as many variables as you want. You return the average games played and the average sacrifice hits.


summarise(data, mean_games = mean(G),
    mean_SH = mean(SH, na.rm = TRUE))
```

* Group_by: The function summerise() without group_by() does not make any sense. It creates summary statistic by group. The library dplyr applies a function automatically to the group you passed inside the verb group_by.

```
data % > %
	group_by(lgID) % > %
	summarise(mean_run = mean(HR))
	
- data: Dataset used to construct the summary statistics
- group_by(lgID): Compute the summary by grouping the variable `lgID
- summarise(mean_run = mean(HR)): Compute the average homerun

```


## Question 2
  How do you know a good way to order the ggplot?
```
You will do the following step:

Step 1: Select data frame
Step 2: Group data
Step 3: Summarize the data
Step 4: Plot the summary statistics


library(ggplot2)
# Step 1
data % > % 
#Step 2
group_by(lgID) % > % 
#Step 3
summarise(mean_home_run = mean(HR)) % > % 
#Step 4
ggplot(aes(x = lgID, y = mean_home_run, fill = lgID)) +
    geom_bar(stat = "identity") +
    theme_classic() +
    labs(
        x = "baseball league",
        y = "Average home run",
        title = paste(
            "Example group_by() with summarise()"
        )
    )
```

## Question 3
  What process did you have do when it comes to data wrangling?
  
  [Source](https://www.elderresearch.com/blog/what-is-data-wrangling-and-why-does-it-take-so-long/)
```
1. Clarifying the use case
2. Obtaining access to the data
3. Resolving key entitiesng  
4. Identifying the extent and relationships of source data
5. Securing relevant treatment data
6. Avoiding selection bias
7. Feature engineering
8. Exploring the data
```

