library(tidyverse)
library(cluster)
library(factoextra)

ames_scale <- AmesHousing::make_ames() %>%
  select_if(is.numeric) %>%  # select numeric columns
  select(-Sale_Price) %>%    # remove target column
  mutate_all(as.double) %>%  # coerce to double type
  scale()   

set.seed(123)
d <- dist(ames_scale, method = "euclidean")
hc1 <- hclust(d, method = "complete" )

plot(hc1)

set.seed(123)
hc2 <- agnes(ames_scale, method = "complete")
hc2$ac

m <- c( "average", "single", "complete", "ward")
acs <- vector()
for (i in 1:length(m)) {
  agness <- agnes(ames_scale, method = m[i])
  acs[i] <- agness$ac
}
names(acs) <- c( "average", "single", "complete", "ward")
acs 
which.max(acs)


hc4 <- diana(ames_scale)
hc4$dc

p1 <- fviz_nbclust(ames_scale, 
                   FUN = hcut, 
                   method = "wss", 
                   k.max = 10) +
  ggtitle("(A) Elbow method")

p2 <- fviz_nbclust(ames_scale, 
                   FUN = hcut, 
                   method = "silhouette", 
                   k.max = 10) +
  ggtitle("(B) Silhouette method")

p3 <- fviz_nbclust(ames_scale, 
                   FUN = hcut, 
                   method = "gap_stat", 
                   k.max = 10) +
  ggtitle("(C) Gap statistic")

gridExtra::grid.arrange(p1, p2, p3, nrow = 1)

set.seed(123)
d <- dist(ames_scale, method = "euclidean")
hc5 <- hclust(d, method = "ward.D2")

fviz_dend(
  hc5,
  k = 8,
  horiz = TRUE,
  rect = TRUE,
  rect_fill = TRUE,
  rect_border = "jco",
  k_colors = "jco",
  cex = 0.1
)

sub_grp <- cutree(hc5, k = 8)
table(sub_grp)

df <- data.frame(
  x1 = c(-1.5, -1.3, -.9, -.6, .1, .1, .6, 1.2, 1.4),
  x2 = c(-.4, -1.5, -1.2, -1, -1.1, .6, -.2, -.5, -.3),
  label = c(3, 4, 6, 1, 2, 9, 8, 5, 7),
  row.names = c(3, 4, 6, 1, 2, 9, 8, 5, 7)
)
highlight <- filter(df, label %in% c(2 ,9))

p1 <- ggplot(df, aes(x1, x2, label = label)) +
  geom_label() +
  geom_label(data = highlight, fill = 'yellow')

df1 <- df %>% select(-label)

p2 <- factoextra::fviz_dend(hclust(dist(df1)))
gridExtra::grid.arrange(p1, p2, nrow = 1)


dend_plot <- fviz_dend(hc5)
dend_data <- attr(dend_plot, "dendrogram")
dend_cuts <- cut(dend_data, h = 8)
fviz_dend(dend_cuts$lower[[2]])

dend_plot <- fviz_dend(hc5)             
dend_data <- attr(dend_plot, "dendrogram")
dend_cuts <- cut(dend_data, h = 70.5)  

p1 <- fviz_dend(dend_cuts$lower[[1]])
p2 <- fviz_dend(dend_cuts$lower[[1]], type = 'circular')
p3 <- fviz_dend(dend_cuts$lower[[1]], type = 'rectangle')
p4 <- fviz_dend(dend_cuts$lower[[1]], type = 'phylogenic')

gridExtra::grid.arrange(p1, p2, p4, p5, nrow = 2)

