# Tidy Data Reading Notes 

Prerequisites
library(pander) can make tibble a table
```r
library(tidyverse)
library(pander)
```

What makes a dataset tidy?
1. Each variable must have its own column.
2. Each observation must have its own row.
3. Each value must have its own cell.


Longer
When to use: Where some of the column names are not names of variables, but values of a variable.

```r
table4a

tidy4a <- table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")
tidy4b <- table4b %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")
left_join(tidy4a, tidy4b)

```

Wider
When to use: When an observation is scattered across multiple rows.
```r
table2

table2 %>%
    pivot_wider(names_from = type, values_from = count)
```

Separate
```r
table3 %>% 
  separate(rate, into = c("cases", "population"))
  
table3 %>% 
  separate(rate, into = c("cases", "population"), sep = "/")
  
table3 %>% 
  separate(year, into = c("century", "year"), sep = 2)
 
 
??? 
table3 %>% 
  separate(rate, into = c("cases", "population"), convert = TRUE)
```

Unite
```r
table5 %>% 
  unite(new, century, year)

# without underscore
table5 %>% 
  unite(new, century, year, sep = "")
  

```



