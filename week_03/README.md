 # Chapter 3 Reading Notes
 
 ## Array =================================================================
Give data, then dimensions(rows, columns, tables)
```r
a1 <- array(c(1:24), c(4,3,2))
a1

```

 
 ## Facets =================================================================
 
 ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)
  
  
## Arrange() =================================================================
arrange() works similarly to filter() except that instead of selecting rows, it changes their order.
arrange(flights, year, month, day)

## Desc() =================================================================
to reorder by in descending order

## Mutate() =================================================================
add new column that are functions of existing colimns

## Transmutate()=================================================================
if want to keep the new variables, use transmute


## Reminder=================================================================
%/% (integer division) and %% (remainder)

## Grouped Summaries with Summarize=================================================================
- summarize() is not terribly useful unless we pair it with group_by()


## Pipe



## na.rm =================================================================
na.rm argument, which removes the missing values prior to computation

 count (n())
 
 count of nonmissing values (sum(!is.na(x)))
 

## filter()


## Tricks 
 To comment: Shift + command + c 
 
## Clean UP  =================================================================

Clear environment
rm(list = ls()) 

Clear console
cat("\014")  # ctrl+L

