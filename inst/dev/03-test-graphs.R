library(scales)
library(ggplot2)
library(reshape2)

## colors
## .. discrete
show_col(pal_twrite("default")(7))
show_col(pal_twrite("sex")(3))
show_col(pal_twrite("region")(4))

## .. continuous
show_col(rgb_twrite_c("red"))
show_col(rgb_twrite_c("red", n = 30, alpha = 0.6, reverse = TRUE))

## charts
data("diamonds")

## .. example 1
ggplot(
  subset(diamonds, carat >= 2.2),
  aes(x = table, y = price, colour = cut)
) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "loess", alpha = 0.1, size = 1, span = 1) +
  theme_bw() + scale_color_twrite()

## .. example 2
ggplot(
  subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
  aes(x = depth, fill = cut)
) +
  geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
  theme_bw() + scale_fill_twrite()

## .. example 3
data("mtcars")

cor <- abs(cor(mtcars))
cor_melt <- melt(cor)

ggplot(
  cor_melt,
  aes(x = Var1, y = Var2, fill = value)
) +
  geom_tile(colour = "black", size = 0.3) +
  theme_bw() + scale_fill_twrite_c("red-yellow-green")

## .. example 4
ggplot(
  subset(diamonds, carat > 2.2 & depth > 55 & depth < 70),
  aes(x = depth, fill = cut)
) +
  geom_histogram(colour = "black", binwidth = 1, position = "dodge") +
  twrite_style() + scale_fill_twrite()
