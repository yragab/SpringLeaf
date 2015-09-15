
# Experiment 1: Run logistic regression on mtcars
am.lr = glm(formula = am ~ hp + wt, data = mtcars, family = binomial(logit))
test.data = data.frame(hp = 120, wt = 2.8)
predict(am.lr, test.data, type = "response")

# Look at the significance of the model
summary(am.lr)
# turns out Pr(>|z|) < 0.05 therefore significant
