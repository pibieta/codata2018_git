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

