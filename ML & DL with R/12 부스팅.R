Sys.setlocale("LC_ALL", "English")
Sys.setenv(LANG = "en_US.UTF")

library(tidyverse)

library(gbm)
library(h2o)
library(xgboost)

ames <- ames <- AmesHousing::make_ames()
index <- sample(1:dim(ames)[1], 0.7*dim(ames)[1])
ames_train <- ames[index,]
ames_test <- ames[-index,]

h2o.no_progress()
h2o.init(max_mem_size = "10g")

train_h2o <- as.h2o(ames_train)
test_h2o <- as.h2o(ames_test)

response <- "Sale_Price"
predictors <- setdiff(colnames(ames_train), response)


hyper_grid <- list(
  sample_rate = c(0.5, 0.75, 1),              # ?–‰ ?ž¬?‘œë³¸ì¶”ì¶?
  col_sample_rate = c(0.5, 0.75, 1),          # ê°? ë¶„í• ë§ˆë‹¤ ?—´ ?ž¬?‘œë³¸ì¶”ì¶?
  col_sample_rate_per_tree = c(0.5, 0.75, 1)  # ê°? ?‚˜ë¬´ë§ˆ?‹¤ ?—´ ?ž¬?‘œë³¸ì¶”ì¶?
)

search_criteria <- list(
  strategy = "RandomDiscrete",
  stopping_metric = "mse",
  stopping_tolerance = 0.001,   
  stopping_rounds = 10,         
  max_runtime_secs = 60*10      
)


grid <- h2o.grid(
  algorithm = "gbm",
  grid_id = "gbm_grid",
  x = predictors, 
  y = response,
  training_frame = train_h2o,
  hyper_params = hyper_grid,
  ntrees = 6000,
  learn_rate = 0.01,
  max_depth = 7,
  min_rows = 5,
  nfolds = 10,
  stopping_rounds = 10,
  stopping_tolerance = 0,
  search_criteria = search_criteria, # ê·¸ë¦¬?“œ?„œì¹˜ì˜ ì¡°ê¸°ì¢…ë£Œ ?˜µ?…˜
  seed = 123
)

grid_perf <- h2o.getGrid(
  grid_id = "gbm_grid", 
  sort_by = "mse", 
  decreasing = FALSE
)

grid_perf


grid_perf@summary_table %>% head

best_model_id <- grid_perf@model_ids[[1]]
best_model <- h2o.getModel(best_model_id)

h2o.performance(model = best_model, xval = TRUE)

perf <- h2o.performance(model = best_model, newdata = test_h2o)
perf
h2o.r2(perf)

h2o.varimp(best_model)

vip::vip(best_model)


