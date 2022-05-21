
## Installing packages 
install.packages(tidyverse)
library(tidyverse)

## Importing my data set
olympic_medals <- read.csv("Summer-Olympic-medals-1976-to-2008.csv")
View(olympic_medals)

## Cleaning my data and selecting specific data needed for this analysis
str(olympic_medals)
glimpse(olympic_medals)
new_oly_medal <- olympic_medals %>%
  select(Country, Medal)
View (new_oly_medal)

## Analyzing the Data to find the country with the highest GOLD medals overall

newdata2 <- new_oly_medal %>% 
 arrange(Country, Medal) %>%
  drop_na() %>% 
  filter(Medal == "Gold") %>% 
  count(Country) %>%
  rename('gold_medals'= "n") %>%
  arrange(-gold_medals)
View(newdata2)  

##Visualizing the top five countries with highest gold medals

newdata3 <- slice(newdata2, 1:5)
View(newdata3)
ggplot(newdata3, aes(x= Country, y= gold_medals)) +geom_col(fill= "Blue") +
  labs(title = "Highest Olympics Gold Medalist Countries", subtitle = "1976 - 2008")

        