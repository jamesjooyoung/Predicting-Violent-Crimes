## Conducting linear regression / L1 Norm (ridge)

#load packages
library(glmnet)
library(caret)
library(reshape2)
library(plyr)
library(tidyr)
library(ggplot2)


#create data.frame to store results
results <- data.frame(State = rep(1:5, each = 2), Metric = rep(c("MAE", "RMSE"), times = 5), Value = NA)

#looping through each seed
for (i in 1:5) {
  #setting seed
  set.seed(i)
  trainIndex <- createDataPartition(crime_data_subset_imputed$ViolentCrimesPerPop, p = 0.6, list = FALSE)
  train <- crime_data_subset_imputed[trainIndex, ]
  test <- crime_data_subset_imputed[-trainIndex, ]
  
  #define train_x and train_y
  train_y <- train$ViolentCrimesPerPop
  train_x <- as.matrix(train[, names(train) != "ViolentCrimesPerPop"])
  #defining test_y and test_x
  test_y <- test$ViolentCrimesPerPop
  test_x <- as.matrix(test[, names(test) != "ViolentCrimesPerPop"])
  
  # fitting the model
  fit <- cv.glmnet(train_x, train_y, alpha = 0, nfolds = 5, type.measure = "mse", 
                   lambda = seq(0.001, 0.1, by = 0.001), parallel = TRUE)
  # finding best lambda
  lambda_opt <- fit$lambda.min
  # creating best ridge regression object w/ train_data
  ridge <- glmnet(train_x, train_y, alpha = 0, lambda = lambda_opt)
  # finding predictions on test data (for Rsquared calculation)
  y_pred <- predict(ridge, newx = test_x)
  MAE <- mean(abs(y_pred - test$ViolentCrimesPerPop))
  RMSE <- sqrt(mean((y_pred - test$ViolentCrimesPerPop)^2))
  
  #inputting results into a table
  results[(i-1)*2+1, "Value"] <- MAE
  results[(i-1)*2+2, "Value"] <- RMSE
}

#finding mean of MAE, RMSE, R_squared for model comparison
unmelted_df <- dcast(results, State ~ Metric, value.var = "Value")

#create data.frame to store avg results
avg_results_ridge <- data.frame(avg_mae = numeric(),
                                avg_rmse = numeric())

#store results
avg_results_ridge[1,1] <- mean(unmelted_df$MAE)
avg_results_ridge[1,2] <- mean(unmelted_df$RMSE)

avg_results_ridge

#calculating best coefficient of the best model
print(coef(ridge))

coef_values <- coef(ridge)[-1]
largest_three <- coef_values[order(abs(coef_values), decreasing = TRUE)[1:3]]
feature_names <- names(largest_three)

# Print the results
cat("The three largest coefficient values are:", largest_three, "\n")
cat("The corresponding feature names are:", feature_names, "\n")


###############################################################################################################################
###############################################################################################################################
###############################################################################################################################
#separating df into an x and y
y <- crime_data_subset_imputed$ViolentCrimesPerPop
x <- as.matrix(crime_data_subset_imputed[, names(crime_data_subset_imputed) != "ViolentCrimesPerPop"])

# creating ridge coefficient dataframe
ridge.mod =glmnet(x,y, alpha =0, lambda = seq(0.001, 0.1, by = 0.001))#this will give 80 values of lambda
beta=coef(ridge.mod)
beta


##ridge Coefficients DataFrame

coefficients_df <- data.frame()
# loop through values of lambda
for (i in 1:length(ridge.mod$lambda)) {
  
  # extract coefficients for current lambda value
  coef_i <- as.data.frame(t(ridge.mod$beta[, i]))
  
  # add lambda value to coefficients dataframe
  coef_i$lambda <- ridge.mod$lambda[i]
  
  # append current coefficients to dataframe
  coefficients_df <- rbind(coefficients_df, coef_i)
}

# view the resulting dataframe
coefficients_df

# creating coefficient plot
plot(ridge, xvar = "lambda", label = TRUE)


