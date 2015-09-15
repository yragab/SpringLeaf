
library(evaluation.utils)
library(hydroGOF)

# Split the data
data.set = split_data(mtcars,0.8)
train.set = data.set$train 
test.set = data.set$test

# Train LR model
am.lr = glm(formula = am ~ hp + wt, data = train.set, family = binomial(logit))

# Test LR model
raw.prediction = predict(am.lr, test.set, type = "response")

# Threshold predicted values
threshold = 0.3
processed.prediction = round(raw.prediction - threshold + 0.5)

# Compute error
rmse = rmse(processed.prediction, test.set$am, na.rm = "TRUE")
print(rmse)

# Investigate output
output.comparison = data.frame(test.set$am, processed.prediction) 
plot(test.set$am, col = "green"); points(processed.prediction, col = "red")

# Look at the significance of the model
summary(am.lr)
# turns out Pr(>|z|) < 0.05 therefore significant



