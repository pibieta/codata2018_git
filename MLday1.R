setwd('~/Desktop/dataSaoPaulo2018/')


############## TO DO LIST:
##############  * Convert the plots to the ggplot2 ting
# Use the mtcars dataset, alredy mounted in R
mtcars
str(mtcars)
summary(mtcars)
head(mtcars)
# Efficiency of the engine by miles per gallon (mpg)

barplot(mtcars$mpg, names.arg = row.names(mtcars))

# Statistical Analysis:
## Correlation between pairs of variables, by plotting pairs

pairs(mtcars) # plots everything it can be messy, so we eleiminate the lower panel:

pairs(mtcars, lower.panel = NULL)

### identify possibly correlated variables and look in detail
 # disp = volume of the engine
plot(y = ,mtcars$mpg, x= mtcars$wt)
plot(y = ,mtcars$mpg, x= mtcars$disp)
plot(y = ,mtcars$mpg, x= mtcars$hp)

## Perform multivariate regression analysis

formula <-  mtcars$mpg ~ mtcars$disp   # it says to express mpg as function of disp
model <- lm(formula)    # fits a linear regression to the formula
coef(model)
mpg = -0.041 * disp + 29.6
plot(y = ,mtcars$mpg, x= mtcars$disp)
abline(a = coef(model)[1], b = coef(model)[2])


### on another variable
form2 <- mtcars$mpg ~ mtcars$wt
model2 <- lm(form2)
plot(y = mtcars$mpg, x= mtcars$wt)
abline(model2)
coef(model2)
summary(model2)


### put everything together
fit <- lm(mtcars$mpg ~ mtcars$wt + mtcars$disp + mtcars$hp + mtcars$drat)
# you can get info by just calling plot on fit
plot(fit)
# get the coefficients
coef(fit)
# get the summary
summary(fit)
# get the covariance matrix, whose i,j element is the covariance between variables i and j
vcov(fit)

########################### Part 2  ####################################

adv <- read.csv('Advertising.csv' )
head(adv)
adv.lm <- lm(adv$sales ~ adv$TV)
summary(adv.lm)

adv.lm2 <- lm(adv$sales ~ adv$newspaper)
summary(adv.lm2)
plot(y = adv$sales, x= adv$newspaper)
abline(adv.lm2)

adv.lm3 <- lm(adv$sales ~ adv$TV + adv$radio + adv$newspaper)
summary(adv.lm3)

# note that the coefficient of newspaper is very close to zero -> drop it!

adv.lm4 <- lm(adv$sales ~ adv$TV + adv$radio)
summary(adv.lm3)


#######################################
library(car)
df <- Prestige
pairs(df) #### it suggests using only income and education to fit the model
# Defining some models
prestige.edfit <- lm(df$prestige ~  df$education )
prestige.incfit <- lm(df$prestige ~ df$income)
prestige.fit <- lm(df$prestige ~  df$education + df$income )
##----------------------------------------------------
coef(prestige.edfit)
coef(prestige.incfit) # <---- from here you can see that income is not that important
coef(prestige.fit)  # also by looking at the income coefficient of this line, very close to 0

summary(prestige.edfit)
summary(prestige.incfit) # <---- here as well, R^2 is too low, income is not important
summary(prestige.fit)

plot(y = df$prestige, x= df$education )
abline(prestige.fit)

plot(prestige.fit)


#####################################
####  Polynomial Regression #########
#####################################

pop <- data.frame(uspop)

# Dataset is a little bit confusing, let's deal with that
dim(pop)
pop$year <- seq(from = 1790, to = 1970, by =10)
head(pop)
unique(pop$year)

plot(x = pop$year, y = pop$uspop)

### Build a linear model and watch it fail

linpop <- lm(pop$uspop ~ pop$year)

plot(x = pop$year, y = pop$uspop)
abline(linpop)
### good way to see that the linear model doesn't fit well
plot(residuals(linpop), x=fitted(linpop)) 

### Clearly, this is not the best approach, let's go poly()

polypop <- lm(pop$uspop ~ poly(pop$year, degree = 2))
plot(x = pop$year, y = pop$uspop)
lines(sort(pop$year), fitted(polypop), col = 'blue', lty=2)

## way better, let's see the residuals
plot(residuals(polypop), x=fitted(polypop)) ### good way to see that the linear model doesn't fit well


coef(polypop)

################################ Part 3 #############################

###################################
#### Binary Classification ########
###################################
#### a.k.a.  Logistic Regression###
###################################

# Example: perform logistic regression to relate am = mpg+ wt in the mtcars dataset
cars.log <- glm(mtcars$am ~ mtcars$mpg + mtcars$wt, family = 'binomial')
summary(cars.log)
coef(cars.log)[1]
# z= ax+ by +c
a = coef(cars.log)[1]
b = coef(cars.log)[2]
c = coef(cars.log)[3]

int.cars <- -(a/c)
slope.cars <- -(b/c)
int.cars
plot(wt ~ mpg, data = mtcars, pch = am)
abline(a=int.cars, b= slope.cars)
plot(y = mtcars$mpg, x = mtcars$wt)

#########################################
######### Decision Trees ##############33
#########################################

library(party)

tree <- ctree(mpg ~ . , data = mtcars)
plot(tree)
### It builds classes of the mpg data and relates them with intervals of the statistically
### significant variables for mpg, At node 1, there is a split for cars that weigh less 
### than 2.32 tons and those that weigh more. For the cars that weigh more, we split 
### further on the engine displacement. For engine displacements that are less than 258 
### cubic inches in volume, we go to node 4. For engine displacements that have more 
### than 258 cubic inches, we go to node 5. Notice that for each feature there is a 
### statistical p-value, which determines how statis‐ tically relevant it is. 
### The closer the p-value is to 0.05 or greater, the less useful or rele‐ vant it is. 
### In this case, a p-value of almost exactly 0 is very good. Likewise, you can see how 
### many data points make up each class at the bottom of the tree.

### it might be worthy to take a look at how this clustering looks
### like by plotting mpg vs wt and disp

head(iris)


iris.tree <- ctree(Species ~ . , data=iris)
plot(iris.tree)
unique(iris$Species)



##############################################
###### Support Vector Machines  ##############
##############################################
### To find dividing hypersurfaces in data
iris
library(e1071)
col <- c("Petal.Length", "Petal.Width", "Species")
s <- sample(150, 100)
iris_train <- iris[s, col]
iris_test <- iris[-s, col]
summary(iris_train)

plot(iris$Petal.Length, iris$Petal.Width , col= iris$Species)
### fitting of the model

svmfit <- svm(Species ~ ., data = iris_train, kernel= 'linear')
plot(svmfit, iris_train[, col])




########################################
########## K - Means ###################
########################################

# Drop the label (species) and try to perform clustering
iris.new <- iris[,c(1,2,3,4)]
head(iris.new)

?kmeans

iris.kmeans <- kmeans(iris.new, centers = 3)

plot(iris.new[,c(1,2)], col = iris.kmeans$cluster)