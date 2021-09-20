---
title: 'Case Study 11: Building the past'
author: "Chloe Huang"
date: "7/21/2021"
output: 
  html_document: 
    keep_md: TRUE
    code_folding: hide
---





## Background
You have been asked to support a story for the local news website that looks back on the housing collapse and the early effects of residential construction. You have data on residential building permits from 1980 through 2010 for each county in the United States. Your colleague that is writing the article would like a few maps and graphics that highlight the single family building permit patterns across your state as well as the patterns in the US.

Remember the big story is the collapse of new building permits at the initial stages of the mortgage crisis (Links to an external site.). Make sure your graphics highlight the collapse in a clear and honest manner.

# Data Wrangling

```r
devtools::install_github("hathawayj/buildings")
devtools::install_github("ropensci/USAboundariesData")

`%!in%` <- Negate(`%in%`)

states_shp <- us_states() %>% 
  mutate(statefp = as.integer(statefp))

# States
states = us_states(resolution = "low") %>% 
  filter(name %!in% c("Puerto Rico")) %>%
  filter(!stusps %in% c('AK', 'HI')) %>%
  mutate(statefp = as.integer(statefp)) 

#view(states)


# Idaho
id_shp <- us_counties(states = 'Idaho') %>% 
  mutate(statefp = as.integer(statefp),
         countyfp = as.integer(countyfp))

id_permits <- buildings::permits %>% 
  filter(StateAbbr == "ID",
         variable == "Single Family")

idaho <- id_permits %>% 
  left_join(id_shp, by = c('county' = 'countyfp'))



# Idaho
Idaho_counties = us_counties(states = "Idaho") %>% 
  mutate(statefp = as.integer(statefp)) %>% 
  mutate(countyfp = as.integer(countyfp))
#view(Idaho_counties)

# Permits
permits = buildings::permits %>% 
  rename(statefp = state, countyfp = county) %>% 
  filter(variable == "Single Family") 
#view(permits)
```



# Data Visualization


1. Create at least one chart that shows trends in single family building permits across the US over time

```r
permits1 <- permits %>%
  group_by(statefp, StateAbbr, year) %>% 
  summarize(year_total = sum(value)) %>% 
  rename(state_abbr = StateAbbr)

ggplot(permits1, aes(x= year, y= year_total)) +
  geom_line() +
  facet_geo(~ state_abbr) +
  scale_x_continuous(breaks= c(1980, 2010)) +
  theme(axis.text.x= element_text(angle= 90, vjust= 0.5, hjust= 1)) +
  labs(x= "Year", y= "Permits Issued", title= "Total Single Family Permits Issued by State") +
  theme_minimal()
```

![](Case_Study_11_files/figure-html/unnamed-chunk-2-1.png)<!-- -->


2. Create at least one chart that shows trends in single family building permits across counties in your state, over time

```r
idaho %>%
  filter(countyname %in% c('Madison County', 'Jefferson County', 'Bonneville County', 'Bingham County', 'Bannock County')) %>% 
  ggplot(aes(x = year, y = value, color = countyname)) +
  geom_line() +
  labs(title = "Southeastern Idaho Single Family Home Permits Between 1980 - 2010", 
       x = 'Year', 
       y = 'Total Permits Issued',
       color = 'Count Name')
```

![](Case_Study_11_files/figure-html/unnamed-chunk-3-1.png)<!-- -->


3. Create at least one additional chart that could be useful for the news article

```r
permits3 <- permits %>% 
  group_by(year) %>% 
  summarize(total_permits = sum(value))

ggplot(permits3, aes(x= year, y= total_permits)) +
  geom_col(aes(fill = total_permits)) +
  geom_line(aes(color ='red'))+
  scale_color_manual(
    values = c("total_permits" = "yellow"),
    labels = c("total_permits" = "")
) +
  labs(x= "Year", y= "Permits Issued", title= "Total Single Family Permits Issued in the  US overtime") 
```

![](Case_Study_11_files/figure-html/unnamed-chunk-4-1.png)<!-- -->

# Summary
If I have more time, I would use a map of the states, and colors to display the chart 1, but I ended up using the facet wraps because it's easier to summarize each states. Although. it could hard to zoom in and see the details. The second graph illustrates the Southeastern Idaho Single Family Home Permits Between 1980 - 2010, Bonneville County has remained the heighest numbers over the years. 

Based on the third graph, I decide to give an overview for the total single family permits issued in the  US from 1980 -2010. The total permits had an increased since 1980 and reached to the top in 2005. After 2015, the total issued permits has drastically decreased.
