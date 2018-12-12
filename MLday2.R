######################################################
##################  Neural Networks ##################
######################################################

setwd('~/Desktop/codata2018_git/')

### Example 1: 
# we use the standard neuralnet (try Keras @ home)

library(neuralnet)

train_input <- data.frame(runif(50,min=0,max=100))

train_label <- sqrt(train_input)
trainingData <- cbind(train_input, train_label)
colnames(trainingData) <- c("input", "output")
net.sqrt <- neuralnet(output ~ input, data = trainingData, hidden  = c(10,5), rep = 5)
summary(net.sqrt)
?neuralnet

print(net.sqrt)

plot(net.sqrt, rep = "best")

test_data <- data.frame((1:10)^2)
test_data
net.results <- compute(net.sqrt, test_data)
net.results
net.results$neurons


cleanOutput <- cbind(test_data,sqrt(test_data), data.frame(net.results$net.result))
cleanOutput



################# Example 2: Iris Dataset

head(iris)
iris.dataset <- iris
iris.dataset$setosa <- iris.dataset$Species == "setosa"
iris.dataset$versicolor <- iris.dataset$Species == "versicolor"
iris.dataset$virginica <- iris.dataset$Species == "virginica"

unique(iris.dataset$Species)

head(iris.dataset)

train <- sample(x = nrow(iris.dataset), size = nrow(iris.dataset) * .5 )
iris.train <- iris.dataset[train,]
iris.test <- iris.dataset[-train, c(1,2)]
iris.test
# Build the neural network

nn <- neuralnet(setosa+versicolor+virginica ~ Sepal.Length + Sepal.Width, data = iris.train, 
                hidden = 5, rep = 2, linear.output = FALSE, stepmax = 100000, lifesign = 'minimal')
plot(nn, rep = 'best')
nn.predictions <- compute(nn, iris.test)
nn.predictions
iris.train

iris.test2 <- iris.dataset[-train, -c(5:8)]
nn2 <- neuralnet(setosa+versicolor+virginica ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data = iris.train, 
                hidden = 5, rep = 2, linear.output = FALSE, stepmax = 100000, lifesign = 'minimal')
plot(nn2,  rep = 'best')
nn2.predictions <- compute(nn2, iris.test2)
nn2.predictions  
idx <- apply(nn2.predictions) # finish this line, it is supposed to convert the probabilities into 
# the actual classes 