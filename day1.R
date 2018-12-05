## Setting our workspace
setwd("~/Desktop/r-novice-inflammation/")
getwd()

library(dplyr)

fahrenheit_to_kelvin <- function(temp_f) {
  temp_k <- ((temp_f - 32)*(5/9)) +273.15
  return(temp_k)
}

kelvin <- fahrenheit_to_kelvin(6)
kelvin

#### Exercise - 1

fence <- function(original,wrapper) {
  answer <- c(wrapper,original,wrapper)
  return(answer)
}

fence(c(1,2,3),c(4,5,6))
 best_practice <- c('write', 'program', 'for', 'people', 'not', 'computers')
 asterisk <- "***"
 
 fence(best_practice, asterisk)

 
 
 ### Exercise 2
 
 
 outside <- function(vector){
   result <- c(vector[1], vector[length(vector)])
   return(result)
 }
 
 
 dry_principle <- c('dont', 'repeat', 'yourself', 'or', 'others' )
outside(dry_principle) 
dry_principle


##### Nesting functions
## as usual


#### Exercise  3
# trivial, settinf default values for arguments in functions

center <- function(data, desired) {
  new_data <- (data-mean(data))+desired
  return(new_data)
}

z <- c(0,0,0,0)
center(z,3)
head(df)

centered <- center(df[,4])
head(centered)
centered  
length(centered)

min(df[,4])
mean(df[,4])
max(df[,4])

min(centered) 
mean(centered)
max(centered)

sd(df[,4])
sd(centered)

all.equal(sd(df[,4]), sd(centered))

#How to document functions:

center <- function(data, desired) {
  ## Document here
  new_data <- (data-mean(data))+desired
  return(new_data)
}

rescale1 <- function(V){
  L <- min(V)
  U <- max(V)
  result <- (V-L)/(U-L)
  return(result)
}
rescale1(c(1,2,3))
#### Challenge 
# rewrite the re-scale function so that it scales a vector to lie in [0,1] by defaut
# but one can choose the lower and upper boundaries at will


rescale <- function(V, lower = 0, upper =1){
  L <- min(V) 
  U <- max(V) 
  result <- (V-L)/(U-L)* (upper - lower) + lower
  return(result)
}

rescale1(c(1,2,3))
rescale(c(1,2,3), 100, 1000)


####################33


best_practice <- c('Let', 'the', 'computer', 'do', 'the', 'work')
print(best_practice)
for(word in best_practice) {
  print(word)
}

########################
seq(3)

print_N <- function(N){
  for (i in seq(N)){
    print(i)
  }
}

print_N(5)



###############333


ex_vec <- seq(2,22,4)
ex_vec
total <- function(v){
  s <- 0
  for(x in v){
    s <- s + x
    
  }
  return(s)
}

total(ex_vec)
ex_vec


##############################
# Exponentiation

#w/o a loop
expo <- function(base, power){
  return(base^power)
}

expo(10,2)

# with a loop

expo2 <- function(base, power){
  r <- 1
  for(i in seq(power)){
    r <- r * base
  }
  return(r)
}

expo2(10,2)

###################
## 

list.files(path='~/Desktop/r-novice-inflammation/data/', pattern = 'csv')
list.files(path='~/Desktop/r-novice-inflammation/data/', pattern = 'inflammation')
list.files(path='~/Desktop/r-novice-inflammation/data/', pattern = 'csv', full.names = TRUE)

filenames <- list.files(path='~/Desktop/r-novice-inflammation/data/',
                        #Now follows a regular expression
                        pattern = 'inflammation-[0-9]{2}.csv',
                        #               |         |       the standard extension
                        #               |         the variable   
                        )

###### conditionals
n <- 37
if(n > 100) {
  print('greater')
} else {
  print('lesser')
}
print('done')

if(nrow(df)> ncol(df)){
  print('This dataset is long')
} else{
  print('this dataset is wide')
}


#################################
### Challenge Final ##########
#################################
# Find the file that contains the patient (row) with the highest average inflammation
#score
# Print the file name, the patient number and the value of the maximum average

filenames <- list.files(path='~/Desktop/r-novice-inflammation/data/', 
                        pattern = 'inflammation-[0-9]{2}.csv')
df0= read.csv('~/Desktop/r-novice-inflammation/data/inflammation-01.csv', header = FALSE)
#Define a function to find the highest average inflammation patient
filenames
find_max_average <- function(df){
  x <- c()
  for(i in seq(nrow(df))){
    x <- c(x,rowMeans(df[i,]))
  }
  result <- c(as.integer(which(x==max(x))),max(x))
  return(result)
  #return(max(x))
}

find_max_average(df0)
# now that we have the function we need to act with it in every file
find_max_final <- function(){
  filenames <- list.files(path='~/Desktop/r-novice-inflammation/data/', 
                          pattern = 'inflammation-[0-9]{2}.csv')
  x <- data.frame(File = '', patient ='', infla_avg ='')
  for(filename in filenames){
    df = read.csv(filename, header = FALSE)
    #x<- c(x,c(filename, find_max_average(df)))
    #x <- c(x,find_max_average(df))
    x <- insertRo
  }
  return(x)
}
find_max_final()

for(filename in filenames){
  df = read.csv(filename)
}






