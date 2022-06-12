Sys.setlocale("LC_ALL", "English")
Sys.setenv(LANG = "en_US.UTF")

library(rsample)
library(recipes)
library(h2o)

ames <- AmesHousing::make_ames()
set.seed(123) 
split <- initial_split(ames, strata = "Sale_Price")
ames_train <- training(split)
ames_test <- testing(split)

h2o.no_progress()
h2o.init(max_mem_size = "10g")

blueprint <- recipe(Sale_Price ~ ., data = ames_train) %>%
  step_other(all_nominal(), threshold = 0.005)

train_h2o <- prep(blueprint, training = ames_train, retain = T) %>%
  juice() %>%
  as.h2o()
test_h2o <- prep(blueprint, training = ames_test) %>%
  juice() %>%
  as.h2o()
Y <- "Sale_Price" ; X <- setdiff(names(ames_train), Y)

(n_features <- length(setdiff(names(ames_train), "Sale_Price")))


best_glm <- h2o.glm(
  x = X, y = Y, 
  training_frame = train_h2o, alpha = 0.1,
  remove_collinear_columns = TRUE, nfolds = 10, 
  fold_assignment = "Modulo",
  keep_cross_validation_predictions = TRUE, 
  seed = 123
)

best_rf <- h2o.randomForest(
  x = X, y = Y, training_frame = train_h2o, 
  ntrees = 1000, mtries = 20,
  max_depth = 30, min_rows = 1, sample_rate = 0.8, nfolds = 10,
  fold_assignment = "Modulo", keep_cross_validation_predictions = TRUE,
  seed = 123, 
  stopping_rounds = 50, stopping_metric = "RMSE", stopping_tolerance = 0.01
)

best_gbm <- h2o.gbm(
  x = X, y = Y, training_frame = train_h2o, 
  ntrees = 5000, learn_rate = 0.01,
  max_depth = 7, min_rows = 5, sample_rate = 0.8, nfolds = 10,
  fold_assignment = "Modulo", keep_cross_validation_predictions = TRUE,
  seed = 123, 
  stopping_rounds = 50, stopping_metric = "RMSE", stopping_tolerance = 0.01
)

best_xgb <- h2o.xgboost(
  x = X, y = Y, training_frame = train_h2o, ntrees = 5000, learn_rate = 0.05,
  max_depth = 3, min_rows = 3, sample_rate = 0.8, categorical_encoding = "Enum",
  nfolds = 10, fold_assignment = "Modulo", 
  keep_cross_validation_predictions = TRUE, 
  seed = 123, 
  stopping_rounds = 50, stopping_metric = "RMSE", stopping_tolerance = 0.01
)

install.packages("caretEnsemble")
?caretEnsemble::caretEnsemble
