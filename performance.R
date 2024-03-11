library(performance)
library(performance)
model <- lm(mpg ~ wt + am + gear + vs * cyl, data = mtcars)
model1 <- lm(mpg ~ wt + am + gear, data = mtcars)
check_model(model)
model_performance(model)
compare_performance(model,model1)
r2(model)
# defining a model
model <- lm(mpg ~ wt + am + gear + vs * cyl, data = mtcars)


counts <- c(18, 17, 15, 20, 10, 20, 25, 13, 12)
outcome <- gl(3, 1, 9)
treatment <- gl(3, 3)
m4 <- glm(counts ~ outcome + treatment, family = poisson())
# checking model assumptions
check_model(model)
plot(compare_performance(model,model1,m4))
