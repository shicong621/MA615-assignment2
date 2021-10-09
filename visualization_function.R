# set function for plotting mother fertility trend from 1800 to 2100
plot1 <- function(t){
  t %>%
    ggplot(aes(x = years, y = fertility_group, color = Continent)) +
    geom_line(size = 1) + 
    geom_point(size = 0.5)
  
}

# set function for plotting life expectancy trend from 1800 to 2100
plot2 <- function(t2){
  t2 %>%
    ggplot(aes(x = years, y = life_group, color = Continent)) +
    geom_line(size = 1) + 
    geom_point(size = 0.5)
}






