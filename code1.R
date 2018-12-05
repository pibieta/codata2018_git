# Preaparing R-studio
# set workind directory  ALWAYS DO THIS !!!!!!!!!! 
setwd("~/Desktop")

#to check 
getwd()

#Examples
3+5 * 2
#PEMDAS shit, R works as a calculator
(3+5)*2

1+ # The program got stuck (it is actually waiting), to skip press Esc
   # in Command line, Ctrl+c as usual
  
# R uses scientific notation 
1/10
1/10000

5*10
5*100000


### Built-in Mathematical Functions ####
log(1)

LOG(1) # R is case sensitive

log10(10)

exp(0.5)  # decimal symbol is . not ,

sin(0.5)
#  and so on and so on....

### Compare things ###  (Python-like)

1==1
1!=1
1<2
1>2

###############################
#### Assign Operation <- ######
###############################

x <- 1/40 #to assign

x <- 1/100 #to reassign

#######################
##### Challenge  1 ####
#######################

## The following are examples of variable names
min_height
max.height 
MaxLenght

.mass <- 1  ## To create hidden variables
.mass

### Best practices
# 1) Start variable names with lower case letters
# 2) Separate words in varaible names w underscores
# 3) use only lowercase letters, underscoes
# Make your code human readable

####Managing enviroments

ls() # to list variables

.y <- 100

ls()

ls(all.names = TRUE)  #To list all variables and functions, including hidden variables


rm()  # to remove stored variables and functions, it requires an argument (obviously)
# for example
rm(.y) 

ls(all.names = TRUE)
x <-100
z <- 500
w <- -30
.y <- 200

x <- 100

rm(list = ls())  # will remove everything BUT the hidden stuff
rm(list = ls(all.names = TRUE)) # to remove ALL variables and functions 

ls(all.names = TRUE)  # to check
#### R-packages ####
# they can be found at:
# https://cran.r.project.org/
install.packages('packagename') # to install a package

update.packages('packagename') # to update

remove.packages('packagename') # to remove

installed.packages()  # to see the installed packages
  
library(dplyr) # to enable a(n) (installed) package for use


### Warning and Errors ###

'1'+2 # adding two different types, '1' is a string
# gives an error

n <- c('1',2,'NA')
n <- as.numeric(n)
# warnings appear when the function has run but it has done something 
# else in order to run (it has solved the issue)



#########################
#### Challenge 3 ########
#########################


mass <- 47.5
age <- 122
mass <- mass * 2.3
age <- age -20

#############################

mass
age

#########################
#### Challenge 4 ########
#########################

# compare mass and age, is mass greater than age?

mass > age

#########################
#### Challenge 5 ########
#########################

# clean the enviroment
rm(list = ls(all.names = TRUE))

#########################
#### Challenge 6 ########
#########################

# Ctrl+L to clean the console 
# import a csv file into a variable (dataframe)
df <- read.csv("r-novice-inflammation/data/inflammation-01.csv", header = FALSE)
df
head(df)

### Understanding the dataframe

head(df)
class(df)
dim(df)

### Explore in detail

# R starts counting at 1 !!! Pfffff

df[1,1]

df[30,20]

# a bit more elaborated look
# c(....)  combine function
df[c(1,3,5),c(10,20)]

df[2:5,3:12]  # giving intervals


# R is a vectorized language (what do they mean by that?)
# vector is like a list in which we use all objects of the same type (?)

1:5  # simple vector

2^(1:5) # mapping

x  <- 1:5  # assigning

2^x


#########################
#### Challenge 6 ########
#########################
 
#getting all columns for row 5

df[5,]

# all rows for columns 16 to 18
df[,16:18]

############################

### Addressing columns by Name ###

df$V16
df[, 'V16']

patient_1 <- df[1,]
patient_1

#maximum inflammation for patient_1
max(patient_1)

# max inflammation for patient_2

max(df[2,])

###########################################


#########################
#### Challenge 7 ########
#########################


#Getting some basic stats of the dataframe

min(df[,7])
mean(df[,7])
median(df[,7])
sd(df[,7])
########################################

summary(df[,1:4])

### Subsetting data

animal <- c('m','o','n', 'k', 'e', 'y')

animal[-4] #removes the fourth element of the list



#########################
#### Challenge 8 ########
#########################

# use a slice of animal variable to get the word key, there are many ways

animal[4:6]
animal[-c(1,2,3)]

#2 Suppose you want to deytermine the max infla of patient 5 across days days three to seven

max(df[5,3:7])


# Using the infla dataframe:
# Lets pretend there is sth wrong with the instrument that affected the even patients 
# and across the first five days

seq(2,60,2)
# identify the wrong data rows
wrong <- df[seq(2,60,2),1:5]
wrong
dim(wrong)

# fix them
right <- wrong/2
right
df2<- df
df2[seq(2,60,2),1:5] <- right
df2
