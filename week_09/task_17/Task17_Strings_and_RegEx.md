---
title: 'Task 17: Strings and regular expressions'
author: "Chloe Huang"
date: "7/13/2021"
output:
  html_document: 
    keep_md: TRUE
    code_folding: hide
---







```r
# import the data
rl <- readr::read_lines("https://byuistats.github.io/M335/data/randomletters.txt")
rl2 <- read_lines("https://byuistats.github.io/M335/data/randomletters_wnumbers.txt")
```

# Question 1:

With the randomletters.txt file, pull out every 1700 letter and find the quote that is hidden. The quote ends with a period (there may be some extra letters at the end). You should be pulling out the 1st letter, then the 1700th, then the 3400th, and then continue to count by 1700. 

```r
index <- c(1, seq(1700, str_length(rl), 1700))
string_vec <- str_split(rl, "") %>% 
  unlist()
quote1 <- string_vec[index] %>% 
  paste(collapse = "")
quote1
```

```
## [1] "the plural of anecdote is not data.z anfra"
```

# Question 2
With the randomletters_wnumbers.txt file, find all the numbers hidden and convert those numbers to letters using the letters order in the alphabet to decipher the message. The message starts with "experts".

```r
num_hidden <- rl2 %>% 
  str_extract_all("\\d+") %>% 
  unlist() %>% 
  as.numeric()
quote2 <- letters[num_hidden] %>% 
  paste(collapse = "")
quote2
```

```
## [1] "expertsoftenpossessmoredatathanjudgment"
```

# Question 3
With the randomletters.txt file, remove all the spaces and periods from the string then find the longest sequence of vowels.

```r
rl %>%
  str_replace_all(" ", "") %>%
  str_replace_all("\\.", "") %>%
  str_extract_all("[aeiou]+") %>%
  unlist() %>%
  .[which.max(str_length(.))]
```

```
## [1] "oaaoooo"
```
