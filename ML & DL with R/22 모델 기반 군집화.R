Sys.setlocale("LC_ALL", "English")
Sys.setenv(LANG = "en_US.UTF")

library(tidyverse)
library(mclust)
library(readr)

data(geyser, package = "MASS")
setwd(readClipboard())
getwd()
my_basket <- read.csv("my_basket.csv")

geyser_mc <- Mclust(geyser, G = 3)

par(mfrow = c(1, 2))
plot(geyser_mc, what = "density")
plot(geyser_mc, what = "uncertainty")

geyser_mc
summary(geyser_mc)

sort(geyser_mc$uncertainty, decreasing = TRUE) %>% head() %>% print

geyser_optimal_mc <- Mclust(geyser)
summary(geyser_optimal_mc)

attributes(geyser_optimal_mc)


legend_args <- list(x = "bottomright", ncol = 5)
plot(geyser_optimal_mc, what = 'BIC')
plot(geyser_optimal_mc, what = 'classification')
plot(geyser_optimal_mc, what = 'uncertainty')

my_basket_mc <- Mclust(my_basket, 1:20)
summary(my_basket_mc)

plot(my_basket_mc, what = "BIC")

attributes(my_basket_mc)


probabilities <- my_basket_mc$z 
probabilities %>% head
colnames(probabilities) <- paste0('C', 1:6)

probabilities <- probabilities %>%
  as.data.frame() %>%
  mutate(id = row_number()) %>%
  tidyr::gather(cluster, probability, -id)

ggplot(probabilities, aes(probability)) +
  geom_histogram() +
  facet_wrap(~ cluster, nrow = 2)

uncertainty <- data.frame(
  id = 1:nrow(my_basket),
  cluster = my_basket_mc$classification,
  uncertainty = my_basket_mc$uncertainty
)

uncertainty %>%
  group_by(cluster) %>%
  filter(uncertainty > 0.25) %>%
  ggplot(aes(uncertainty, reorder(id, uncertainty))) +
  geom_point() +
  facet_wrap(~ cluster, scales = 'free_y', nrow = 1)


cluster2 <- my_basket %>%
  scale() %>%
  as.data.frame() %>%
  mutate(cluster = my_basket_mc$classification) %>%
  filter(cluster == 2) %>% 
  select(-cluster)
cluster2 %>% head

cluster2 %>%
  tidyr::gather(product, std_count) %>% 
  group_by(product) %>%
  summarize(avg = mean(std_count)) %>% 
  arrange(desc(avg)) %>% 
  ggplot(aes(avg, reorder(product, avg))) +
  geom_point() +
  labs(x = "Average standardized consumption", y = NULL)
