library(tidyverse)
library(RColorBrewer)

tips <- read_csv("http://www.ggobi.org/book/data/tips.csv")


# compare the with the graph obtained by putting color = smoker in the ggplot(, aes(<color>))
# that gives you two regression lines! 
#Create a scatterplot: aesthetic components x totbill, y tip, color smoker
p <- ggplot(data = tips, aes(totbill, tip)) + geom_point(aes(color = smoker)) 
p
#Change the axis title: x = "Total bill in dollars, y = "Tip in dollars"
p1 <- p + theme(aspect.ratio = 1)

#Change the name of the legend label to "Smoker" 
p2 <- p1 + labs(x=' Total bill in dollars', y='Tip in dollars', color = 'Smoker')
p2
#Change the legend position in the bottom of the plot using theme
p3<- p2 + theme(legend.position = 'bottom') 
p3
# Change the color pallete to Dark2 using scale_color_brewer ( library(RColorBrewer)) 
p4 <- p3 + scale_color_brewer(palette = "Dark2")
p4

# Include a linear smooth using geom_smooth
p5 <- p4 + geom_smooth(method =  'lm')
p5

# Change the axis text size to 20 and  the axis title to 15
p6 <- p5 + theme(axis.text.x = element_text(size=20),
                axis.text.y = element_text(size = 20),
                axis.title.x = element_text(size=15),
                axis.title.y = element_text(size = 15))
p6
str(p6)

######################
###### Part 2 ########
######################

#Create a 100% stacked bar graph for day by sex and ORder the x axis using fct_relevel

q <- ggplot(data = tips, aes(x=fct_relevel(day, "Thu","Fri","Sat", "Sun"), fill = sex)) + geom_bar(position = 'fill')
q
#Change the color palette to Dark2 using scale_fill_discrete 

q1 <- q  + scale_fill_brewer(palette = "Dark2")
q1

q2 <- q1 + scale_x_discrete(labels = c("Fri"= "Friday", "Sat" = "Saturday", 
                                   "Sun"= "Sunday", "Thu" = "Thursday"))
q2
# 
q3 <- q2 + labs(x = "Days", y = "Frequency")
q3

########################################################
#################  Activity 2   ########################
########################################################

data("ChickWeight")

df <- ChickWeight

# Use the dplyr package to identify how many chicks have a complete set of weight 
# measurements and how many measurements there are in the incomplete cases. 
head(df)
# dfna <- df %>% group_by(Chick) %>% summarise(sum(is.na(weight)))

dfa <- df %>% group_by(Chick) %>% summarise(nobs=n())

incomplete <- df %>% group_by(Chick) %>% mutate(nobs=n()) %>% filter(nobs != 12)
incomplete <- incomplete %>% group_by(Chick) %>% summarise(n())
incomplete

# Then we observe that there 12 is the total nobs and we select those that have them all
complete <- df %>% group_by(Chick) %>% mutate(nobs = n()) %>% filter(nobs == 12)
head(complete)
dim(complete)
45 *12


# In the complete data set introduce a new variable that measures the current weight difference 
# compared to day 0. Name this variable weightgain. 
complete
complete %>% group_by(Chick) %>% mutate(weightgain = weight )
df3 <- complete %>% group_by(Chick) %>% spread(Chick, weight) 
df3

df3 <- complete %>% group_by(Chick) %>% mutate(weightgain = weight - min(weight))
df3
df4 <- df3 %>% group_by(Chick) %>% summarize(max(weightgain))
df4                                             