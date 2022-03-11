library(CausalImpact)
library(wikipediatrend)

aa <- wp_trend("Ukraine", from = "2022-01-01")
bb <- wp_trend("Russia", from = "2022-01-01")

x1 <- 100 + arima.sim(model = list(ar = 0.999), n = 100)
y <- 1.2 * x1 + rnorm(100)
y[71:100] <- y[71:100] + 10
data <- cbind(aa, bb)

pre.period <- c(1, 70)
post.period <- c(71, 100)

impact <- CausalImpact(data, pre.period, post.period)

plot(impact)

summary(impact)

summary(impact, "report")
