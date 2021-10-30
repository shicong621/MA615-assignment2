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

#Editor's new visualization function
plot3 <- function(t){
  t%>%
    ggplot(mapping=aes(x=year, y=fertility_group,shape=Continent, color=Continent))+
    geom_point(size=1)+
    scale_color_brewer(palette="Accent")+
    scale_shape_brewer(values=c(2,16))
}

plot4 <-function(t2){
  t2 %>%
    ggplot(mapping=aes(x=year, y=life_group,shape=Continent, color=Continent))+
    geom_point(size=1)+
    scale_color_brewer(palette="Accent")+
    scale_shape_brewer(values=c(2,16))
}

#'Unable to view the presentation

