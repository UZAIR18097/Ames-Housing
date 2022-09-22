library(tidyverse)
library(modeldata)
library(kableExtra)


dataRaw <- ames

# Plot House Selling Price
ggplot(ames, aes(x = Sale_Price)) + 
  geom_histogram(bins = 50, col= "white")

# Scale Sale Price to log(Bas 10)
ggplot(ames, aes(x = Sale_Price)) + 
  geom_histogram(bins = 50, col= "white") +
  scale_x_log10()

# Make Sale Price log in data
dataTran <- dataRaw %>% mutate(Sale_Price = log10(Sale_Price))

# Make KableExtra Table of Selling Price, Garage Area
dataRaw %>%
  select(Sale_Price, Garage_Area,Neighborhood) %>%
  group_by(Neighborhood) %>%
  summarise(Mean_Sale_Price = mean(Sale_Price),
            Mean_Garage_Area = mean(Garage_Area)) %>%
  kbl() %>%
  kable_paper(bootstrap_options = "striped", full_width = F)

