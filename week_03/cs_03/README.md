#Case Study Notes


## Pipe =====================================

*Normal Function

function(data)
data %>% function

*Function takes arguments

function(data, arg)
data %>% function(arg)

* Other
three(two(one(data, a),b),b)
data %>%
  one(a) %>%
  two(b) %>%
  three(c)
  
## Colors
?color
color()

?palette
palette()
