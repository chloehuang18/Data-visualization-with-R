
# the two packages you need (or load the tidyverse)
library(readr)
library(ggplot2)



# load the data
rcw <- read_csv("https://byuistats.github.io/M335/data/rcw.csv", 
                col_types = cols(Semester_Date = col_date(format = "%m/%d/%y"), 
                                 Semester = col_factor(levels = c("Winter", "Spring", "Fall"))))


# different ways to view your data
head(rcw)
View(rcw)



# My own chart to show R$CW attendance trends over time
# Short Description: This displays each department's attendance each year

ggplot(data = rcw) + 
  geom_point(mapping = aes(x = Year , y = Count)) +
  facet_wrap(~ Department) 

# Short Description: It shows the trend of the attendance over the years
ggplot(data = rcw, mapping = aes(x = Year , y = Count)) +
  geom_point() +
  geom_smooth()

# Short Description: 
ggplot(data = rcw) +
  geom_smooth(mapping = aes(x= Semester, y = Count, group = Department))

ggsave("rcw.png")

# Practice using the help file
?geom_line()
?geom_col()
?ggsave()
           