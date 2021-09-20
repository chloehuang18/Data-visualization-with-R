---
title: 'Task 14: Data to answer questions'
author: "Chloe Huang"
date: "6/30/2021"
output: 
  html_document: 
    keep_md: TRUE
    code_folding: hide
---




## Q & A

1. What is the percentage of education rate over the past 100 years?
2. What countries have the most education rate and lowest education rate?
3. What is the education rate for different race?
4. What is the education rate between different genders?
5. Which country has the biggest gap for enrollment rate and graduation rate?
6. what is the relationship between education and finance? 


## Data Sources

[1](https://ourworldindata.org/global-education)
[2](https://datacatalog.worldbank.org/dataset/education-statistics)
[3](https://data.worldbank.org/topic/4)
[4](https://www.oecd-ilibrary.org/education/data/education-at-a-glance_eag-data-en)

## Read the data and visualizes the data


```r
data0 <- read_csv("~/Desktop/EAG_FIN_RATIO.csv")
```

```
## Warning: Duplicated column names deduplicated: 'ISC11' => 'ISC11_1' [4],
## 'REF_SECTOR' => 'REF_SECTOR_1' [6], 'COUNTERPART_SECTOR' =>
## 'COUNTERPART_SECTOR_1' [8], 'EXPENDITURE_TYPE' => 'EXPENDITURE_TYPE_1' [10],
## 'UNIT_MEASURE' => 'UNIT_MEASURE_1' [12]
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   COUNTRY = col_character(),
##   Country = col_character(),
##   ISC11 = col_character(),
##   ISC11_1 = col_character(),
##   REF_SECTOR = col_character(),
##   REF_SECTOR_1 = col_character(),
##   COUNTERPART_SECTOR = col_character(),
##   COUNTERPART_SECTOR_1 = col_character(),
##   EXPENDITURE_TYPE = col_character(),
##   EXPENDITURE_TYPE_1 = col_character(),
##   UNIT_MEASURE = col_character(),
##   UNIT_MEASURE_1 = col_character(),
##   INDICATOR = col_character(),
##   Indicator = col_character(),
##   YEAR = col_double(),
##   Year = col_character(),
##   Value = col_double(),
##   `Flag Codes` = col_character(),
##   Flags = col_character()
## )
```

```r
data1 <- read_csv("~/Desktop/Edstats_csv/EdStatsData.csv")
```

```
## Warning: Missing column names filled in: 'X70' [70]
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   .default = col_double(),
##   `Country Name` = col_character(),
##   `Country Code` = col_character(),
##   `Indicator Name` = col_character(),
##   `Indicator Code` = col_character(),
##   `2015` = col_logical(),
##   `2016` = col_logical(),
##   `2017` = col_logical(),
##   `2020` = col_logical(),
##   `2025` = col_logical(),
##   `2030` = col_logical(),
##   `2035` = col_logical(),
##   `2040` = col_logical(),
##   `2045` = col_logical(),
##   `2050` = col_logical(),
##   `2055` = col_logical(),
##   `2060` = col_logical(),
##   `2065` = col_logical(),
##   `2070` = col_logical(),
##   `2075` = col_logical(),
##   `2080` = col_logical()
##   # ... with 5 more columns
## )
## ℹ Use `spec()` for the full column specifications.
```

```
## Warning: 876291 parsing failures.
##  row  col           expected           actual                                    file
## 2484 2015 1/0/T/F/TRUE/FALSE 62.4392794473723 '~/Desktop/Edstats_csv/EdStatsData.csv'
## 4908 2015 1/0/T/F/TRUE/FALSE 21057820874350.2 '~/Desktop/Edstats_csv/EdStatsData.csv'
## 4908 2016 1/0/T/F/TRUE/FALSE 21923168354725.3 '~/Desktop/Edstats_csv/EdStatsData.csv'
## 4909 2015 1/0/T/F/TRUE/FALSE 21766948388560.2 '~/Desktop/Edstats_csv/EdStatsData.csv'
## 4909 2016 1/0/T/F/TRUE/FALSE 22480427869996.2 '~/Desktop/Edstats_csv/EdStatsData.csv'
## .... .... .................. ................ .......................................
## See problems(...) for more details.
```

```r
data2 <- read_csv("~/Desktop/Edstats_csv/EdStatsCountry.csv")
```

```
## Warning: Missing column names filled in: 'X32' [32]
```

```
## 
## ── Column specification ────────────────────────────────────────────────────────
## cols(
##   .default = col_character(),
##   `National accounts reference year` = col_double(),
##   `Latest industrial data` = col_double(),
##   `Latest trade data` = col_double(),
##   X32 = col_logical()
## )
## ℹ Use `spec()` for the full column specifications.
```


```r
ed_data <- data0 %>%
  select(c(Country, ISC11, COUNTERPART_SECTOR, Year))

ed_data2 <- data1 %>%
  pivot_longer(cols = starts_with("1970"), names_to = "Year")

ed_data3 <- data2 %>%
  select(c(Region,'Income Group', ))
```

## Summarize 

source 1 : This website provides some overview of the literate and illiterate for the global education. There are different ways to visualized the data by using different graph. 
source 2 & 3: The advantage from this website is that I can get all the data files I need from it. 
source 4: This website can help me to collect the data as well. 

