 # Chapter 4 Reading Notes
 
 ##Tibble Package ==============================================================
 
 * Prerequisites
 ```r
 library(tidyverse)
 ```
 
 * What are tibbles?
  - Tibbles are data frames
  
  ```r
  tibble(
  x = 1:5, 
  y = 1, 
  z = x ^ 2 + y
)

#> # A tibble: 5 x 3
#>       x     y     z
#>   <int> <dbl> <dbl>
#> 1     1     1     2
#> 2     2     1     5
#> 3     3     1    10
#> 4     4     1    17
#> 5     5     1    26
  ```
* Tibble features
  - Have column names that are not valid R variable names, aka non-syntactic names. 
  - Use tribble() to create tibble
  ```r
  tribble(
  ~x, ~y, ~z,
  #--|--|----
  "a", 2, 3.6,
  "b", 1, 8.5
)
#> # A tibble: 2 x 3
#>   x         y     z
#>   <chr> <dbl> <dbl>
#> 1 a         2   3.6
#> 2 b         1   8.5
  ```
  - Only prints first 10 rows (use <print n = 10, width = Inf>) n = number of rows
  - Can use data viewer 
  
  
## Data Import ==================================================================

* read_cvs(): Reads comma delimited files
* read_log(): Reads apache style log files
* read_fwf(): Reads fix width files

* guess_encoding()
* guess_parser()
* parse_guess()
  
