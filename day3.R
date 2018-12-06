## Data Visualization with ggplot2
library(tidyverse)
tips <- read.csv('http://www.ggobi.org/book/data/tips.csv') # tips on a restaurant dataset
head(tips)

# Let's make our first plot, a scatter plot of tip vs. totbill
ggplot(data =tips, aes(x =totbill, y=tip)) + geom_point() + theme(aspect.ratio = 1)

# It is a bit messy, let's smooth it out a bit bit making the points (semi)transparent.
ggplot(data =tips, aes(x =totbill, y=tip)) + geom_point( alpha = 1/3) + theme(aspect.ratio = 1)

# We can include more variables in aes
ggplot(data =tips, aes(x =totbill, y=tip, color =sex)) + geom_point() + theme(aspect.ratio = 1)

ggplot(data =tips, aes(x =totbill, y=tip, shape =sex)) + geom_point(alpha = 1/3) + theme(aspect.ratio = 1)

# Not advised to use size for discrete variables, better for continuous ones
ggplot(data =tips, aes(x =totbill, y=tip, size =sex)) + geom_point(alpha = 1/3) + theme(aspect.ratio = 1)

# to change the size of points
ggplot(data =tips, aes(x =totbill, y=tip)) + geom_point(size =4, alpha = 1/3) + theme(aspect.ratio = 1)

# say we want to fix the color
ggplot(data =tips, aes(x =totbill, y=tip)) + geom_point(color='blue', alpha = 1/3) + theme(aspect.ratio = 1)
ggplot(data =tips, aes(x =totbill, y=tip)) + geom_point(color = 'red', alpha = 1/3) + theme(aspect.ratio = 1)

# FACETS
# We can display additional categorical variables in a graph subseting the graphical display.
ggplot(data =tips, aes(x =totbill, y=tip)) + geom_point(color='blue', alpha = 1/3) + theme(aspect.ratio = 1) + 
    facet_wrap(smoker~sex) 

ggplot(data =tips, aes(x =totbill, y=tip)) + geom_point(color='blue', alpha = 1/3) + theme(aspect.ratio = 1) + 
  facet_grid(smoker~sex) 

# If we substitute geom_pont() with another geom we get a different visualization .
ggplot(data =tips, aes(x =totbill, y=tip)) + geom_smooth( alpha = 1/3) + theme(aspect.ratio = 1)
ggplot(data =tips, aes(x =totbill, y=tip)) + geom_boxplot( alpha = 1/3) + theme(aspect.ratio = 1)
ggplot(data =tips, aes(x =totbill)) + geom_histogram( alpha = 1/3) + theme(aspect.ratio = 1)
# and so on...


### Always include labels !!!!!!

ggplot(data =tips, aes(x =totbill, y=tip, color =sex)) + geom_point() + theme(aspect.ratio = 1) +
  labs(x=' Total bill in dollars', y='Tip in dollars', color = 'Sex')
# See how layers work
p <- ggplot(tips, aes(x =  day, y = tip))
p
p1 <- p + geom_point()
p2 <- p + geom_boxplot()
p3 <- p+ geom_violin()

# how to put them all together

library(patchwork)
p + p1 + p2 + p3 + plot_layout(ncol = 4)
 

# geom_bar example
q <- ggplot(tips, aes(x = day, 
                      fill = smoker))
q + geom_bar()
q1 <- q + geom_bar(position = 'stack')
q2 <- q + geom_bar(position = 'dodge')
q3 <- q + geom_bar(position = 'fill')
rm(round)
q/q1 + q2/q3
# explore the RColorBrewer package
display.brewer.all()
 q <- ggplot(data = tips) + geom_bar(aes(factor(round(tip)), 
                                         fill = factor(round(tip)))) +
    scale_fill_brewer(palette = 'Set1') + labs(x= "Tip in USD", fill = "Tip")
 q
 
 #Lets say we want to interpolate the colors in Set1 (with 9 colors) 
 # to use it to graph a dataframe with more cats than 9
getPalette = colorRampPalette(brewer.pal(9, "Set1"))
 p <- ggplot(data = tips) + geom_bar(aes(factor(round(tip)), 
                                         fill = factor(round(tip)))) +
   scale_fill_manual(values = getPalette(10)) + labs(x= "Tip in USD", fill = "Tip")
 p
 
 
 # Change the labels the long way, using scale options 
 # Notice that scale_<x> where x could whatever you defined in aes() inside ggplot
 ggplot(data =tips, aes(x =totbill, y=tip, shape = day)) + 
   geom_point() + theme(aspect.ratio = 1) +
   scale_x_continuous(name = "Total Bill in USD") +
   scale_y_continuous(name= "Tip on USD")
   scale_shape(name = "Day")
 
   
### To save the image (export), you can do it by the GUI or:
   
   gsave("ppt123.png") # png (pixelated raster image) 
   ggsave("ppt123.pdf") # pdf (scalable vector image)

   
## How to change the details of the graph in theme()... lots of things can be done !
ggplot(data =tips, aes(x =totbill, y=tip, color =sex)) + geom_point() +
    theme(aspect.ratio = 1) + theme(panel.background = element_rect(fill = 'white', color ='black'  ),
                                    panel.grid = element_line(color = 'grey92'),
                                    legend.position = 'bottom', 
                                    legend.key = element_rect(fill = 'White'),
                                    axis.title.x = element_text(size=20),
                                    axis.title.y = element_text(size=20),
                                    axis.text.x = element_text(size=15),
                                    axis.text.y = element_text(size = 15),
                                    legend.text = element_text(size =15),
                                    legend.title = element_text(size = 20))
   
