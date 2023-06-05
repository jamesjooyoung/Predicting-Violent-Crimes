Linear Regression

set.seed(1)
trainIndex <- createDataPartition(crime_data_subset_imputed$ViolentCrimesPerPop, p = 0.6, list = FALSE)
train <- crime_data_subset_imputed[trainIndex, ]
test <- crime_data_subset_imputed[-trainIndex, ]

#define train_x and train_y
train_y <- train$ViolentCrimesPerPop
train_x <- as.matrix(train[,-1])
#defining test_y and test_x
test_y <- test$ViolentCrimesPerPop
test_x <- as.matrix(test[,-1])
train.control <- trainControl(method = "cv", number = 5)
fit <- train(ViolentCrimesPerPop ~., data = train_x, method = "lm",
             trControl = train.control)
summary(fit)
mse <- mean(residuals(fit)^2)
rmse <- sqrt(mse)


set.seed(2)
trainIndex <- createDataPartition(crime_data_subset_imputed$ViolentCrimesPerPop, p = 0.6, list = FALSE)
train <- crime_data_subset_imputed[trainIndex, ]
test <- crime_data_subset_imputed[-trainIndex, ]

#define train_x and train_y
train_y <- train$ViolentCrimesPerPop
train_x <- as.matrix(train[,-1])
#defining test_y and test_x
test_y <- test$ViolentCrimesPerPop
test_x <- as.matrix(test[,-1])
train.control <- trainControl(method = "cv", number = 5)
fit <- train(ViolentCrimesPerPop ~., data = train_x, method = "lm",
             trControl = train.control)
summary(fit)
mse <- mean(residuals(fit)^2)
rmse <- sqrt(mse)


set.seed(3)
trainIndex <- createDataPartition(crime_data_subset_imputed$ViolentCrimesPerPop, p = 0.6, list = FALSE)
train <- crime_data_subset_imputed[trainIndex, ]
test <- crime_data_subset_imputed[-trainIndex, ]

#define train_x and train_y
train_y <- train$ViolentCrimesPerPop
train_x <- as.matrix(train[,-1])
#defining test_y and test_x
test_y <- test$ViolentCrimesPerPop
test_x <- as.matrix(test[,-1])
train.control <- trainControl(method = "cv", number = 5)
fit <- train(ViolentCrimesPerPop ~., data = train_x, method = "lm",
             trControl = train.control)
summary(fit)
mse <- mean(residuals(fit)^2)
rmse <- sqrt(mse)


set.seed(4)
trainIndex <- createDataPartition(crime_data_subset_imputed$ViolentCrimesPerPop, p = 0.6, list = FALSE)
train <- crime_data_subset_imputed[trainIndex, ]
test <- crime_data_subset_imputed[-trainIndex, ]

#define train_x and train_y
train_y <- train$ViolentCrimesPerPop
train_x <- as.matrix(train[,-1])
#defining test_y and test_x
test_y <- test$ViolentCrimesPerPop
test_x <- as.matrix(test[,-1])
train.control <- trainControl(method = "cv", number = 5)
fit <- train(ViolentCrimesPerPop ~., data = train_x, method = "lm",
             trControl = train.control)
summary(fit)
mse <- mean(residuals(fit)^2)
rmse <- sqrt(mse)


set.seed(5)
trainIndex <- createDataPartition(crime_data_subset_imputed$ViolentCrimesPerPop, p = 0.6, list = FALSE)
train <- crime_data_subset_imputed[trainIndex, ]
test <- crime_data_subset_imputed[-trainIndex, ]

#define train_x and train_y
train_y <- train$ViolentCrimesPerPop
train_x <- as.matrix(train[,-1])
#defining test_y and test_x
test_y <- test$ViolentCrimesPerPop
test_x <- as.matrix(test[,-1])
train.control <- trainControl(method = "cv", number = 5)
fit <- train(ViolentCrimesPerPop ~., data = train_x, method = "lm",
             trControl = train.control)
summary(fit)
mse <- mean(residuals(fit)^2)
rmse <- sqrt(mse)


