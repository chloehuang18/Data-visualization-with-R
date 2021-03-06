---
title: "Task 5: The Great British Bake Off"
author: "Chloe Huang"
date: "June 07, 2021"
output: 
  html_document: 
    keep_md: TRUE
    code_folding: hide
---






## Chart 1



```r
only_first_last <- ratings %>% 
  # group episodes by series
  group_by(series) %>% 
  
  # take first and last episode, n() returns the length
  slice(1, n()) %>% 
  
  # create the which_episode column that selects the first and last episode of the episode
  mutate(which_episode = ifelse(episode == 1, "First", "Last")) %>% 
  
  #Need to ungroup it after the group command to prevent errors. Ungroup the series created earlier. 
  ungroup() %>% 
  
  # create series_f column with the same series numbers as factors 
  mutate(series_f = as.factor(series))

#view the only_first_last dataset
View(only_first_last)

# create a ggplot to display each series and its first and last episode 
ggplot(data = only_first_last, 
       mapping = aes(x = which_episode, # which_episode as x value
                     y = viewers_7day, # numbers of views as y value
                     group = series_f, # group it
                     color = series_f)) + # color by series factors
  # display lines of the points
  geom_line() +
  # make each chart entry a point of size 5
  geom_point(size = 5)
```

![](Task5_Great_British_Bake_Off_files/figure-html/unnamed-chunk-1-1.png)<!-- -->




## Chart 2-1 Trend of total viewers

#### Summary

This chart displays the trend of total viewers for each series. This show wasn't very popular when it first came out. However, the total number of viewers soar after series 3 and declined since series 8 was out. We can see that series 6 and 7 have the highest number of viewers while the last three series remained constant.



```r
bakeshow <- ratings %>%
  group_by(series) %>%
  mutate(sumvalue = viewers_7day + viewers_28day)

ggplot(bakeshow, aes(x=episode, y=sumvalue, group = series , color=series))+
  geom_line()+
  facet_grid(cols = vars(series))+
  theme_bw()
```

![](Task5_Great_British_Bake_Off_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

```r
  ggsave("Baking_Show.png", width= 15)
```

```
## Saving 15 x 5 in image
```


## Chart 2-2 7 Day ratings for each episode

#### Summary

This chart displays the 7 day ratings for each episode per series


```r
seasons <- ratings %>%
  filter(episode %in% (1:10))
```


```r
ggplot(data = seasons, mapping = aes(x = episode, y = viewers_7day, color = episode))+
  labs(x = "Episode", y = "7 Days Rating", title = "7 Day Rating per Episode") +
  facet_wrap(~series)+
  geom_boxplot()
```

![](Task5_Great_British_Bake_Off_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

## Chart 2-3 Mean Rating

#### Summary

This chart displays how mean ratings changed across series.


```r
mean_rating <- ratings %>%
  group_by(series) %>%
  summarise(SAR = mean(viewers_7day))

mean_rating %>%
  ggplot(aes(x = factor(series) , y= SAR)) +
  geom_col() +
  geom_text(aes(label = SAR)) +
  labs(x = "Series", y = "AVG Network Rating", title = "Mean 7 Day Rating ") 
```

![](Task5_Great_British_Bake_Off_files/figure-html/unnamed-chunk-5-1.png)<!-- -->
