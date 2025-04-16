setwd("~/Documents/R Studio") 
#set working directory
sink("./Ratings_&_Revenue.log") 
#log data in file


#CLEANING AND FIXING DATA#
library(readxl)
R_data <- read_excel("2024 Top Distributors Ratings and Revenue.xlsx")

print(R_data) 
#test data

#Need new column in data for avg revenue per movie release for each distributor, since we have avg rating but worldwide revenue totals

R_data$Avg_Revenue <- R_data$`$Worldwide`/R_data$`# of Releases` #
#this code adds a new column to R_data that divides the worldwide revenue for each distributor by the number of releases
R_data

library(tidyverse)
R_data <- R_data |> mutate(NameRevenue=map2(Distributors, Avg_Revenue, c))
#Added a new column
#Where Name of the distibutor and average revenue are combine into one variable for labeling purposes later on while graphing

R_data

#TESTING MODELS & LINEAR REGRESSION#


library(ggplot2)
library(dplyr)
library(broom)
library(car)
library(ggpubr)

summary(R_data)


#Making 3 models in order to determine which is best to fit the data
model_1 <- lm(`Avg Rating` ~ Avg_Revenue, data = R_data)
summary(model_1)
summary(model_1)$r.squared

#This might be better because it accounts for variation in the number of releases
model_2 <- lm(`Avg Rating` ~ Avg_Revenue + `# of Releases`, data = R_data)
summary(model_2)
summary(model_2)$r.squared


#This one accounts for number of releases and variation in worldwide revenue
model_3 <- lm(`Avg Rating` ~ Avg_Revenue + `# of Releases` + `$Worldwide`, data = R_data)
summary(model_3)
summary(model_3)$r.squared


R2data <- R_data[ , c("Avg_Revenue", "Avg Rating")]

R2data

plot(R2data, main = "Revenue vs Rating (Profit on Quality)")

#Plot doesn't really reveal too much correlation between quality of the movie and average earned revenue.
#The R-squared for all three models was also very low indicating that the line of best fit really didn't line up with much of the data
#Most of the points on the graph don't show one singular trend

#~
#One big takeaway could bea that all of these top distributors typically produce very high ranking and well received pictures
#Maybe running a regression on films with a wider margin for viewer rating would show a greater trend

R3data <- R_data[ , c("$Worldwide", "Avg Rating")]

plot(R3data, main = "Revenue vs Rating (Profit on Quality)")


#Even when changing to Worldwide revenue still the data shows the same story. Quality DOES NOT drive higher revenue in the box office!!!
#Perhaps there's another mechanism at play. Looking into marketing budgets and IP recognition data could lead to better insights.
#Maybe using data of different liscencing IP's and their profits throughout the years....



#ONE LAST TEST ON EVERY MOVIE FROM TOP 200 LIST TO SEE IF THERE'S CORRELATION#

full_data <- read_csv("Box Office Top 200 Movies 2024 Dataset (1).csv")

new_full <- na.omit(full_data)

library(tidyverse)

#First model accounting for "Vote_Count" since it varries from movie to movie
model_4 <- lm(Rating ~ `$Worldwide` + Vote_Count, data = full_data)
summary(model_4)
summary(model_4)$r.squared

#Next model accounting for Domestic and Foreign percentage
model_5 <- lm(Rating ~ `$Worldwide` + Vote_Count + `Domestic %` + `Foreign %`, data = full_data)
summary(model_5)
summary(model_5)$r.squared



#Wanted to test with all NA's Ommitted
#To see if I would get a different result

new_full <- na.omit(full_data)


model_6 <- lm(Rating ~ `$Worldwide` + Vote_Count, data = new_full)
summary(model_6)
summary(model_6)$r.squared

model_7 <- lm(Rating ~ `$Worldwide` + Vote_Count + `Domestic %` + `Foreign %`, data = new_full)
summary(model_7)
print(summary(model_7)$r.squared)


#Now time to plot!

new2full <- new_full[ , c("$Worldwide", "Rating")]

new2full

#None of this worked to fix the error I was receiving for the Worldwide column's data appearing as NA in the plot
#x <- as.numeric(new2full$`$Worldwide`)
#y <- as.numeric(new2full$Rating)
library(dplyr)
#new2full %>%
  #mutate(across(starts_with("$Worldwide"), ~gsub("\\$", "", .) %>% as.numeric))
#plot(x,y, type = "l", main = "Revenue vs Rating (Profit on Quality)")

#So we quickly made a new data set in excel and changed the formatting of the variables there

library(readxl)
Rev_World <- read_excel("Rating and Worldwide Revenue Each Movie.xlsx")

las_model <- lm(Rating ~ `$Worldwide`, data = Rev_World)
summary(las_model)

plot(Rev_World, main = "Revenue vs Rating (Profit on Quality) ~ Each Movie")
abline(a=coef(las_model)[1], b=coef(las_model)[2])

#As we can see there is some upward trend within the data, as also shown by the coefficient of 7.7 we got when running different linear regression models
#Meaning there is at least some positive correlation to the revenue a film receives in the box office and the actually quality or general perception of the film for the year 2024.


#library(ggplot2)
#ggplot(Rev_World, method = "lm", se=F)

sink()