# Chapter 5 Reading Notes 
### Grapgics for Communication

### Prerequisites
dplyr, ggplot2, ggrepel, vrirdis
```r
library(tidyverse)
```


### Label
* add labels with the labs() function
* If you need to add more text...
```r
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(se = FALSE) +
  labs(
    title = "Fuel efficiency generally decreases with engine size",
    subtitle = "Two seaters (sports cars) are an exception because of their light weight",
    caption = "Data from fueleconomy.gov"
  )
```
* If you want to replace the axis and legend titles
```r
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(se = FALSE) +
  labs(
    x = "Engine displacement (L)",
    y = "Highway fuel economy (mpg)",
    colour = "Car type"
  )
```
* For mathematical equations instead of text strings. Just switch "" out for quote()
read about the available options in ?plotmath
```r
df <- tibble(
  x = runif(10),
  y = runif(10)
)
ggplot(df, aes(x, y)) +
  geom_point() +
  labs(
    x = quote(sum(x[i] ^ 2, i == 1, n)),
    y = quote(alpha + beta + frac(delta, theta))
  )
```

### Annotations

* Use geom_text() If you want to labelmore details...
```r
best_in_class <- mpg %>%
  group_by(class) %>%
  filter(row_number(desc(hwy)) == 1)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_text(aes(label = model), data = best_in_class)
```
* theme(legend.position = "none" turns the legend off
* Use +Inf and -Inf to place the label text on the borders of the plot
```r
label <- tibble(
  displ = Inf,
  hwy = Inf,
  label = "Increasing engine size is \nrelated to decreasing fuel economy."
)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_text(aes(label = label), data = label, vjust = "top", hjust = "right")
```

#### The only limit is your imagination (and your patience with positioning annotations to be aesthetically pleasing)!

### Scales

#### Breaks and Labels
*Breaks controls the position of the ticks, or the values associated with the keys. 
```r
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_y_continuous(breaks = seq(15, 40, by = 5))
```
*Labels controls the text label associated with each tick/key. The most common use of breaks is to override the default choice:
*Set it to NULL to suppress the labels altogether
```r
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  scale_x_continuous(labels = NULL) +
  scale_y_continuous(labels = NULL)
```
```r
presidential %>%
  mutate(id = 33 + row_number()) %>%
  ggplot(aes(start, id)) +
    geom_point() +
    geom_segment(aes(xend = end, yend = id)) +
    scale_x_date(NULL, breaks = presidential$start, date_labels = "'%y")
```

Note
1. date_labels takes a format specification, in the same form as parse_datetime().

2. date_breaks (not shown here), takes a string like “2 days” or “1 month”.


### Legend layout

* use a theme() setting to control the overall position of the legend, 
The theme setting legend.position controls where the legend is drawn:
base <- ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class))

base + theme(legend.position = "left")
base + theme(legend.position = "top")
base + theme(legend.position = "bottom")
base + theme(legend.position = "right") # the default

* guides(),guide_legend(), guide_colourbar()
```r
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = class)) +
  geom_smooth(se = FALSE) +
  theme(legend.position = "bottom") +
  guides(colour = guide_legend(nrow = 1, override.aes = list(size = 4)))
#> `geom_smooth()` using method = 'loess' and formula 'y ~ x'
```

*RColorBrewer package




<!-- Question: Seq, breaks, themes --> 
