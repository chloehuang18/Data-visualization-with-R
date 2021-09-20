# Data Transformation Notes

[Resource](https://r4ds.had.co.nz/transform.html)
 
 
## Prerequisites
 
 1. Google the error message of the prerequisite
 2. Make sure you have the prerequisite install or run once
 
 
## Types of the variable
- int stands for integers.
- dbl stands for doubles, or real numbers.
- chr stands for character vectors, or strings.
- dttm stands for date-times (a date + a time).


## Dplyr

### Major functions
- filter(): Pick observations by their values
- arrange(): Reorder the rows
- select(): Pick variables by their names

- mutate(): Create new variables with functions of existing variables
- transmute(): Keep the new variables 

- summarise(): Collapse many values down to a single summary, always pair with group_by
- group_by(): Operate on group by group

- Pipe %>%: https://uc-r.github.io/pipe

-- na.rm

