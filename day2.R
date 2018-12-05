install.packages("gapminder")

library(gapminder)

setwd("~/Desktop/dataSaoPaulo2018/data-r")

# Read a csv into a dataframe

cats <- data.frame(coat = c("calico", "black", "tabby"), 
                   weight = c(2.1, 5.0, 3.2), 
                   likes_string = c(1, 0, 1))

head(cats)
# Writing data into a csv
cats
write.csv(x= cats, file= '~/Desktop/feline-data.csv', row.names = FALSE)

# Removing cats dataframe
rm(cats)

##############################
####### Challenge 1 ##########
##############################

# which read option is the best for our data ?

cats <- read.table(file = 'feline-data.csv')
cats <- read.csv(file = 'feline-data.csv') # <------ this is the correct one
cats <- read.delim(file = 'feline-data.csv')


#To select columns using the $ operation
cats$weight

# you can add a number to each element on a column in the foll way
cats$weight + 2 

# paste concatenate vectors after converting to characters
paste('My cat is', cats$coat)

# not the same as
print('My cat is', cats$coat)

# It is not possible to add numbers and factors
cats$weight + cats$coat

# to know data types

typeof(cats$weight)

# to force the number to be an integer
typeof(1L)
# otherwise is a double
typeof(1)
# it knows complex number
typeof(1+1i)
# Booleans
typeof(TRUE)
#characters
typeof('banana')
# add another row to the dataframe
cats[4,] <- list('tabby','2,3 or 2,4',1)
# now weight is a character 
typeof(cats$weight)
# then you cannot add anymore
cats$weight + 2

##### Vectors and type coercion

quiz_vector <- c(2, 6, '3')
quiz_vector
typeof(quiz_vector)

coercion_vector <- c('a', TRUE)
typeof(coercion_vector)

# This is called Type Coercion, when R encounters to be combined into a single vector,
# it will force them all to be the same type.
# Coercion rules: logical -> integer -> numeric -> complex -> character

character_vector_example <- c('0', '2', '4')
character_vector_example
character_to_numeric <- as.numeric(character_vector_example)
character_to_numeric

# numeric coerced to logical
numeric_to_logical <- as.logical(character_to_numeric)
numeric_to_logical


##############################
####### Challenge 2 ##########
##############################

## Convert the likes_string column as logical in the cats dataframe

cats$likes_string <- as.logical(cats$likes_string)
cats

sequence_example <- seq(10)

head(sequence_example, n=2)
tail(sequence_example, n=4)
length(sequence_example)

#### You can give names to elements in your vector
my_example <- 5:8
names(my_example) <- c('a','b','c','d') 
my_example

##############################
####### Challenge 3 ##########
##############################

vec <- 1:26
vec
vec <- vec * 2
vec
LETTERS
names(vec) <- LETTERS
vec

################################
# we said that columns in data.frames were vectors
str(cats$weight) # str stands for structure NOT string !!!! (its not python unfortunately)

str(cats$likes_string)


##############################
####### Challenge 4 ##########
##############################

# Use ?read.csv to figure out how to keep text columns as character vectors instead of
# factors; then write a command or two to do it
str(cats$coat)

cats <- read.csv(file='feline-data.csv', stringsAsFactors = FALSE)

str(cats$coat) #solved


my_data <- c('case', 'control','control','case')
factor_ordering_example <- factor(my_data)




###########LISTS
list_ex <- list(1,'a', TRUE, 1+4i)
list_ex 


typeof(cats)
# a dataframe is a list of vectors and factors 
# It's a special list in which all the vectors must have the same length





##############################
####### Challenge 5 ##########
##############################

# There are several subtly different ways to call variables,
# observations and elements from data.frames
# Try out these examples and explain what is returned by each one.

cats[1]
cats[[1]]
cats$coat
cats[1, 1]

# Hint: Use the function typeof() to examine what is returned in each case.
typeof(cats[1])
typeof(cats[[1]])
typeof(cats$coat)
typeof(cats[1,1])



######### Matrices


matrix_example <- matrix(0, ncol=6, nrow=3)
matrix_example
class(matrix_example)

typeof(matrix_example)

dim(matrix_example)
nrow(matrix_example)
ncol(matrix_example)


#################
## Challenge 6 ##
#################

# What do you think will be the result of length(matrix_example)? 
# Try it. Were you right? Why / why not?

length(matrix_example)

#################
## Challenge 7 ##
#################

# Make another matrix, this time containing the numbers 1:50, 
# with 5 columns and 10 rows. Did the matrix function fill your 
# matrix by column, or by row, as its default behaviour? 
# See if you can figure out how to change this. 
# (hint: read the documentation for matrix!)
matrix(1:50, ncol = 5, nrow=10, byrow = TRUE)


#################
## Challenge 8 ##
#################

# Consider the R output of the matrix below:

[,1] [,2]
[1,]    4    1
[2,]    9    5
[3,]   10    7

matrix(,ncol=2, nrow= 3)

# What was the correct command used to write this matrix? 
# Examine each command and try to figure out the correct one 
# before typing them. 
# Think about what matrices the other commands will produce.

#1 matrix(c(4, 1, 9, 5, 10, 7), nrow = 3)
#2 matrix(c(4, 9, 10, 1, 5, 7), ncol = 2, byrow = TRUE)
#3 matrix(c(4, 9, 10, 1, 5, 7), nrow = 2)
#4 matrix(c(4, 1, 9, 5, 10, 7), ncol = 2, byrow = TRUE)




x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
x


#################
## Challenge 9 ##
#################


#################
## Challenge 9 ##
#################

# Given the following code:
x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)

# Come up with at least 2 different commands that will produce the following output:
b   c   d 
6.2 7.1 4.8 

# After you find 2 different commands, compare notes with your neighbour. 
# Did you have different strategies?
print(x[2:4])
print(x[-c(1,5)])

# Subsetting scenarios
x[c(FALSE, FALSE, TRUE, FALSE, TRUE)]
x[x>7]
x[names(x)=='a']

##################
## Challenge 10 ##
##################

x <- c(5.4, 6.2, 7.1, 4.8, 7.5)
names(x) <- c('a', 'b', 'c', 'd', 'e')
print(x)

x[x>4 & x<7]

x
##################
## Challenge 11 ##
##################
# To get R to do what we really want we use th %in% operator that goes through each 
# element of its argument, then we compare it to c('a','c') using the not operator ! 
# since we want to exclde the elements that match those of c('a','c')

x[! names(x) %in% c("a","c") ]

### Handling special values
is.na    # returns all positions in a vector, matrix or data.frame with NA (not available)
is.nan   # returns NaN
is.infinite()  
is.finite()
na.omit   # filter out all missing values 

# To think about
pi/0
1/0 + 1/0
1/0 - 1/0 
0/0

### Factor subsetting ###
f <- factor(c())
### matrix subsetting
set.seed(1)
m <- matrix(rnorm(6*4), ncol=4, nrow=6)
m[3:4, c(3,1)]
m[, c(3,4)]
m[,3]
m[3, , drop = FALSE]

##################
## Challenge 12 ##
##################
m <- matrix(1:18, nrow=3, ncol=6)
print(m)
m[2,c(4,5)]

df <-gapminder
df

head(gapminder[3])
head(gapminder[['lifeExp']])
head(gapminder$year)
head(gapminder[1:3,])


##################
## Challenge 13 ##
##################

# Fix each of the following common data frame subsetting errors:

#1 Extract observations collected for the year 1957
gapminder[gapminder$year == 1957,]

#2 Extract all columns except 1 through to 4
gapminder[,-(1:4)]

#3 Extract the rows where the life expectancy is longer the 80 years
gapminder[gapminder$lifeExp > 80,]



##################
## Challenge 14 ##
##################

#1 Why does gapminder[1:20] return an error? 
#2 Create a new data.frame called gapminder_small that only contains rows 1 
# through 9 and 19 through 23. You can do this in one or two steps.
gapminder[1:20,]

#########################################################################
######################## Afternoon Session ##############################
#########################################################################


gapminder_small <- gapminder[c(1:9,13:23),]
gapminder_small

library(dplyr)
library(gapminder)
head(gapminder)

mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])
mean(gapminder[gapminder$continent == "Africa", "gdpPercap"])
gapminder
rm(list = ls(all.names = TRUE))
df <- data.frame(gapminder)
df
mean(df[df$continent=="Africa", "gdpPercap"])
mean(df[df$continent == "Americas", "gdpPercap"])
mean(df[df$continent == "Asia", "gdpPercap"])


year_country <- select(df, year,country, gdpPercap)
year_country
# This can be done using the operator "pipe" %>%
year_country_gdp <- gapminder %>% select(year,country,gdpPercap)
year_country_gdp == year_country
year_country_gdp_euro <- gapminder %>%
  filter(continent=="Europe") %>%
  select(year,country,gdpPercap)
year_country_gdp_euro



##################
## Challenge  1 ##
##################
#Write a single command (which can span multiple lines and includes pipes)
# that will produce a dataframe that has the African values for lifeExp, 
# country and year, but not for other Continents. How many rows does your 
# dataframe have and why?
year_country_lifeExp_Afr <- gapminder %>% filter(continent == "Africa") %>%  
  select(lifeExp,country, gdpPercap )
year_country_lifeExp_Afr


#### Group by


str(gapminder %>% group_by(continent))

#### Summarize, it creates a new feature by summarizing the actual data using some
#### criteria

gdp_bycontinents <- gapminder %>%  group_by(continent) %>%
  summarize(mean_gdpPercap=mean(gdpPercap))
gdp_bycontinents

##################
## Challenge  2 ##
##################
# Calculate the average life expectancy per country. Which has the longest 
# average life expectancy and which has the shortest average life expectancy?
avg_life_exp <- gapminder %>% group_by(country) %>% summarize(avg_life = mean(lifeExp))
avg_life_exp %>% filter(avg_life == min(avg_life) | avg_life == max(avg_life))
avg_life_exp
avg_life_exp %>%  arrange(avg_life) %>%  head(1)
avg_life_exp %>%  desc(arrange(avg_life)) %>%  head(1)
###################################3

gdp_bycontinents_byyear <- gapminder %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap=mean(gdpPercap))

gdp_bycontinents_byyear

###
### more variables can be defined in the summarize part at once
###

gdp_pop_bycontinents_byyear <- gapminder %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap=mean(gdpPercap),
            sd_gdpPercap=sd(gdpPercap),
            mean_pop=mean(pop),
            sd_pop=sd(pop))
gdp_pop_bycontinents_byyear



##### filter and count
gapminder %>%
  filter(year == 2002) %>%
  count(continent, sort = TRUE)


##### If we need to use the number of observations in calculations, 
## the n() function is useful. For instance, if we wanted to get the 
## standard error of the life expectency per continent:

gapminder %>%
  group_by(continent) %>%
  summarize(se_le = sd(lifeExp)/sqrt(n()))

## You can also chain together several summary operations; in this 
## case calculating the minimum, maximum, mean and se of each continent’s
## per-country life-expectancy:

gapminder %>%
  group_by(continent) %>%
  summarize(
    mean_le = mean(lifeExp),
    min_le = min(lifeExp),
    max_le = max(lifeExp),
    se_le = sd(lifeExp)/sqrt(n()))

## We can also create new variables prior to (or even after) 
## summarizing information using mutate(). (It adds a column to the dataframe)

gdp_pop_bycontinents_byyear <- gapminder %>%
  mutate(gdp_billion=gdpPercap*pop/10^9) %>%
  group_by(continent,year) %>%
  summarize(mean_gdpPercap=mean(gdpPercap),
            sd_gdpPercap=sd(gdpPercap),
            mean_pop=mean(pop),
            sd_pop=sd(pop),
            mean_gdp_billion=mean(gdp_billion),
            sd_gdp_billion=sd(gdp_billion))

gdp_pop_bycontinents_byyear

## keeping all data but "filtering" after a certain condition
# calculate GDP only for people with a life expectation above 25
gdp_pop_bycontinents_byyear_above25 <- gapminder %>%
  mutate(gdp_billion = ifelse(lifeExp > 25, gdpPercap * pop / 10^9, NA)) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            sd_gdpPercap = sd(gdpPercap),
            mean_pop = mean(pop),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdp_billion),
            sd_gdp_billion = sd(gdp_billion))
gdp_pop_bycontinents_byyear_above25
## updating only if certain condition is fullfilled
# for life expectations above 40 years, the gpd to be expected in the future is scaled
gdp_future_bycontinents_byyear_high_lifeExp <- gapminder %>%
  mutate(gdp_futureExpectation = ifelse(lifeExp > 40, gdpPercap * 1.5, gdpPercap)) %>%
  group_by(continent, year) %>%
  summarize(mean_gdpPercap = mean(gdpPercap),
            mean_gdpPercap_expected = mean(gdp_futureExpectation))


# Combining dplyr and ggplot2
library(ggplot2)
# Get the start letter of each country
starts.with <- substr(gapminder$country, start = 1, stop = 1)
# Filter countries that start with "A" or "Z"
az.countries <- gapminder[starts.with %in% c("A", "Z"), ]
# Make the plot
ggplot(data = az.countries, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() + facet_wrap( ~ country)

gapminder %>%
  # Get the start letter of each country
  mutate(startsWith = substr(country, start = 1, stop = 1)) %>%
  # Filter countries that start with "A" or "Z"
  filter(startsWith %in% c("A", "Z")) %>%
  # Make the plot
  ggplot(aes(x = year, y = lifeExp, color = continent)) +
  geom_line() +
  facet_wrap( ~ country)

head(gapminder)
challenge <- gapminder %>%  filter(year == 2002)
            %>% group_by(continent) %>% sample_n(2) 
            %>%  summarize(mean_lifeExp = mean(lifeExp)) 
            # creates a new column 'mean_lifeExp'
            %>% arrange(desc(mean_lifeExp))
challenge

lifeExp_2countries_bycontinents <- gapminder %>%
  filter(year==2002) %>%
  group_by(continent) %>%
  sample_n(2) %>%
  summarize(mean_lifeExp=mean(lifeExp)) %>%
  arrange(desc(mean_lifeExp))

lifeExp_2countries_bycontinents


### Challenge
#1 Extract observations collected the year 1957
year_2007 <- gapminder %>% filter(year == 1957)
year_2007

#2 Extract all columns except 1 through 4
first_4 <- gapminder %>% select(country, continent, year, lifeExp)
first_4

#3  Extract the rows where the life expectancy is longer than 70 years

more_than_70 <- gapminder %>% filter(lifeExp > 70)
more_than_70

#all at once

gapminder %>% filter(year == 1957 & lifeExp >70) %>% select(-c(1:4))

library("tidyr")
str(gapminder)
gap_wide <- read.csv("~/Desktop/dataSaoPaulo2018/data-r/gapminder_wide.csv", stringsAsFactors = FALSE)
str(gap_wide)

head(gap_wide)
head(gap_long)

# gather takes the columns and group by obstype_year given by all the starts_with() shit
gap_long <- gap_wide %>%
  gather(obstype_year, obs_values, starts_with('pop'),
         starts_with('lifeExp'), starts_with('gdpPercap'))
str(gap_long)
head(gap_long)


#another way of doing the same
gap_long <- gap_wide %>% gather(obstype_year,obs_values,-continent,-country)
str(gap_long)

gap_long <- gap_long %>% separate(obstype_year,into=c('obs_type','year'),sep="_")
gap_long$year <- as.integer(gap_long$year)
gap_long

# Beautiful!!!. look at the following piece of code

gap_long %>% group_by(continent, obs_type) %>%  summarize(means = mean(obs_values))


# From long to intermediate format with spread() (wow!)
gap_normal <- gap_long %>% spread(obs_type,obs_values)
dim(gap_normal)
head(gap_normal)
names(gap_normal)


gap_normal <- gap_normal[,names(gapminder)]
all.equal(gap_normal,gapminder)

head(gap_normal)
head(gapminder)

gap_normal <- gap_normal %>% arrange(country,continent,year)
all.equal(gap_normal,gapminder)


gap_temp <- gap_long %>% unite(var_ID,continent,country,sep="_")
str(gap_temp)
head(gap_temp)

gap_temp <- gap_long %>%
  unite(ID_var,continent,country,sep="_") %>%
  unite(var_names,obs_type,year,sep="_")
str(gap_temp)

gap_temp

gap_wide_new <- gap_long %>%
  unite(ID_var,continent,country,sep="_") %>%
  unite(var_names,obs_type,year,sep="_") %>%
  spread(var_names,obs_values)
str(gap_wide_new)
head(gap_wide_new)

####Challenge 3######

gap_ultra_wide <- gap_long %>%
  unite(var_names,obs_type,year,country,sep="_") %>%
  spread(var_names,obs_values)
str(gap_ultra_wide)
head(gap_ultra_wide)

#####

gap_wide_betterID <- separate(gap_wide_new,ID_var,c("continent","country"),sep="_")
gap_wide_betterID <- gap_long %>%
  unite(ID_var, continent,country,sep="_") %>%
  unite(var_names, obs_type,year,sep="_") %>%
  spread(var_names, obs_values) %>%
  separate(ID_var, c("continent","country"),sep="_")
str(gap_wide_betterID)
head(gap_wide_betterID)

all.equal(gap_wide, gap_wide_betterID)

