library(caret)
library(tidyverse)
library(rsample)
library(recipes)
library(caretEnsemble)

ames <- AmesHousing::make_ames()
asplit <- initial_split(ames, strata = "Sale_Price")
ames_train <- training(split)
ames_test <- testing(split)

blueprint <- recipe(Sale_Price ~ ., data = ames_train) %>%
  step_other(all_nominal(), threshold = 0.005)

train <- prep(blueprint, training = ames_train, retain = T) %>%
  juice() 
test <- prep(blueprint, training = ames_test, retain = T) %>%
  juice() 

model_list <- caretList(
  Sale_Price ~ .,
  data= train,
  trControl = trainControl(method = "cv", number = 10),
  methodList = c("glm", "rf", "gbm")
)

p <- as.data.frame(predict(model_list))

lm_best <- train(
  Sale_Price ~ .,
  data = train,
  method = "lm",
  trControl = trainControl(method = "cv", number = 10),
  tuneLength = 20
)

rf_best <- train
