# Predicting-Violent-Crimes

## Introduction

With the motivation of helping communities identify certain features that may influence their crime rates and better manage violent crimes, this project utilizes data on socio-economic conditions, police, and households to discover the best supervised learning model that predicts violent crime rates with least error and analyze the three most statistically significant factors. The dataset from UCI’s Machine Learning Repository contains data on 1994 U.S. counties and 128 feature attributes. Previous research have built predictive models (clustering, KNN, etc.) for better crime prediction and hotspot identification and have found population age and police presence as key predictors.

## Methods

Overall, the dataset had cases of multicollinearity and missing data which prompted the use of techniques like MICE and dropping features based on pairwise/global correlation. 5KFold was utilized to identify the best model with the bias-variance trade off in mind. Less folds equates to higher bias and lower variance, while more folds results in lower bias and higher variance.

## Results

With the lowest RMSE value of 0.125, linear regression was the best model as chosen by 5-Fold CV. For linear regression, we constructed H0 that βi = 0 and H1 that βi ≠ 0, where i represents NumStreet, PctIlleg, and PctKids2Par. With all three p-values being <0.05, we reject H0 at the 5% significance level and conclude that these covariates are significant in predicting violent crime rates in communities. With varying methods of calculating global importances, it was surprising that PctIlleg was important in all regressions. Additionally, it was unexpected that the simplest model ended up being the best performing.
