setwd("~/Documents/R Studio/Prog_3350")
sink("./Group_R_Project.log")
#R PROJECT
#Ben Chima & Dongkai Xu & Jeremy Burke



#DATA IMPORT
project_dta <- read.csv("Advertising.csv")
#test
print(project_dta)


#CLEANING PROCESS

data_new <- na.omit(project_dta)

print(data_new) 
#All NA's omitted

data_new <- data_new[!data_new$X == "", ]
data_new <- data_new[!data_new$TV == "", ]
data_new <- data_new[!data_new$radio == "", ]
data_new <- data_new[!data_new$newspaper == "", ]
data_new <- data_new[!data_new$sales == "", ]


data_new

#All "" data points have been omitted

#Now need to take out X column from data
data_new$X <- NULL

data_new

#X collum omitted


#SUMMARY PROCESS
#Here is the summary
summary(data_new)

#Creating a histogram for each data value

par(mfrow = c(2, 2))
for (i in 1:ncol(data_new)) {
  hist(data_new[, i], main = paste0("Histogram of ", names(data_new)[i]), xlab = names(data_new)[i])
}
par(mfrow = c(1, 1))

#Displaying first 10 values
data_new[1:9, ]

#DATA SPLIT

#Our first attempt, for some reason this gives a different data split than the createDataPartition funtion 
#even though we used the same seed for both. It didn't change the intepretation in the next section.


set.seed(0)
randrows <- sample(1:nrow(data_new), 0.8 * nrow(data_new))
data_train <- data_new[randrows, ]
data_test <- data_new[-randrows, ]

#Then we got the function to work for us and used this to interpret the results in the next section
library(caret)
set.seed(0)
train_index <- createDataPartition(data_new$TV,
                                   times = 1,
                                   p = 0.8,
                                   list = FALSE)

data_train2 <- data_sales[train_index, ]
data_test2 <- data_sales[-train_index, ]

nrow(data_train2)
nrow(data_test2)


#CREATING MODELS

model_1 <- lm(sales ~ TV + newspaper + radio, data = data_train2)
summary(model_1)

model_2 <- lm(sales ~ TV + radio + TV * radio, data = data_train2)
summary(model_2)

model_3 <- lm(sales ~ TV + radio + TV * radio + TV^2, data = data_train2 )
summary(model_3)

#After running all three regresions we believe that the third model fits the data the best and 
#therefore is the best model to pick.


#PREDICTIONS

#First making the predicitons for the models that we created.
model_1_prediction <- predict(model_1, newdata = data_test2)
model_2_prediction <- predict(model_2, newdata = data_test2)
model_3_prediction <- predict(model_3, newdata = data_test2)

#Next finding the RMSE for each
RMSE(data_test2$sales, model_1_prediction)
RMSE(data_test2$sales, model_2_prediction)
RMSE(data_test2$sales, model_3_prediction)

#We were right in our prediction since the third model has the smallest root mean standard error,
#and thus is the best fit


#THIS IS THE END OF OUR PROJECT#

sink()

