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
