##################################
########## Challenge #############
##################################
setwd('~/Desktop/codata2018_git/')
# setwd('~/codata2018_git/') # @ HOME



# Read the dataset on the folder and print the first rows
df <- read.csv('event-0005.csv')
head(df)

# Data exploration
pairs(df[-9])
# From the pairs figure we can tell that a satisfactory clustering (jet)
# must consider all variables but constituent and p (total momentum)
# the pairs figure show how there are three classes of jet and they show different behaviour
# for each variable, eta, phi, px, py and pz
# The train_df does not contain jet as it is the label we're trying to find by clustering


train_df <- df[,-c(1,2,8,9)]
head(train_df)


# Perform k-means with  3 centers, recall that we saw this in the pairs plot

pairs(train_df)
### Look for the most relevant features 
jet.tree <- ctree(df$jet ~ ., data= df)
plot(jet.tree)

### Perform kmeans
 
jet.kmeans <- kmeans(train_df, centers = 3)
plot(train_df, col = jet.kmeans$cluster)
# summary(jet.kmeans)

# get cluster means 
aggregate(train_df,by=list(jet.kmeans$cluster),FUN=mean)

# Cluster Plot against 1st 2 principal components
library(cluster) 
clusplot(train_df, jet.kmeans$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)

# compare the counting with the original dataset (cheating)
table(-jet.kmeans$cluster)
table(df$jet)
# the confusion matrix
table(df$jet, -jet.kmeans$cluster)
#### k-means seems to work pretty well by looking at confusion matrix
