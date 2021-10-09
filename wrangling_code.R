# MA678 Assignment 2

#setwd(dir = "/Users/shicongwang/Desktop")
library(tidyverse)
library(tidyr)
library(dplyr)

# read data
data_1<-read.csv("children_per_woman_total_fertility.csv")
data_2<-read.csv("life_expectancy_years.csv")

# tidy data
data_1_new <- data_1 %>%
  pivot_longer(-country, names_to = "years", values_to = "mother fertility", values_drop_na = TRUE)
data_2_new <- data_2 %>%
  pivot_longer(-country, names_to = "years", values_to = "life expectancy", values_drop_na = TRUE)

# combine two datasets into one  
data <- merge(data_1_new, data_2_new, by = c("country", "years"), all=TRUE)

data$years <- substring(data$years, 2)

# export data 
write.csv(data, file="/Users/shicongwang/Desktop/assignment 2.csv")

# read data
data<- read.csv("assignment 2.csv")
data<- data[,-1]
data_t<- as.tibble(data)

# remove NA in the data_t
data_new<- na.omit(data_t)
sum(is.na(data_new))
data_new$years <- as.integer(data_new$years)

# Due to the large number of countries, it is difficult to distinguish so many colors directly with images。
# Group data by continent
library(countrycode)
data_new1<- data_new %>%
  #add a column having corresponding continent name in 'Continent' column
  mutate(Continent = countrycode(country, 'country.name', 'continent')) %>%
  group_by(Continent, years) %>%
  mutate(fertility_group = mean(mother.fertility)) %>%
  select(c(years, fertility_group, Continent)) 

data_new2<- data_new %>%
  #add a column having corresponding continent name in 'Continent' column
  mutate(Continent = countrycode(country, 'country.name', 'continent')) %>%
  group_by(Continent, years) %>%
  mutate(life_group = mean(life.expectancy)) %>%
  select(c(years, life_group, Continent)) 

source("visualization_function.R")

plot1(data_new1)
plot2(data_new2)

