# Breast Cancer Classification
# SVM Model Implementation

# 1. Load required libraries
library(e1071)
library(caret)
library(pROC)

# 2. Load cleaned dataset
clean_data <- read.csv("data/cleaned_breast_cancer.csv")

# 3. Convert Diagnosis into a factor
clean_data$Diagnosis <- factor(
  clean_data$Diagnosis,
  levels = c("B", "M"),
  labels = c("Benign", "Malignant")
)

# 4. Check the dataset
cat("Dataset Dimensions:\n")
print(dim(clean_data))

cat("\nDiagnosis Distribution:\n")
print(table(clean_data$Diagnosis))

# 5. Separate features and target variable
X <- clean_data[, setdiff(names(clean_data), "Diagnosis")]
y <- clean_data$Diagnosis

# 6. Split dataset into 80% training and 20% testing
set.seed(123)

train_index <- createDataPartition(
  y,
  p = 0.80,
  list = FALSE
)

X_train <- X[train_index, ]
X_test  <- X[-train_index, ]

y_train <- y[train_index]
y_test  <- y[-train_index]

# 7. Display training and testing dimensions

cat("\nTraining dataset:\n")
print(dim(X_train))

cat("\nTesting dataset:\n")
print(dim(X_test))

cat("\nTraining diagnosis distribution:\n")
print(table(y_train))

cat("\nTesting diagnosis distribution:\n")
print(table(y_test))


# 8. Feature Scaling


# Calculate scaling parameters using training data only
scaling_model <- preProcess(
  X_train,
  method = c("center", "scale")
)

# Apply scaling to training and testing data
X_train_scaled <- predict(scaling_model, X_train)
X_test_scaled  <- predict(scaling_model, X_test)

# Check scaled data
cat("\nScaled Training Data:\n")
print(summary(X_train_scaled$radius_mean))

cat("\nScaled Testing Data:\n")
print(summary(X_test_scaled$radius_mean))

cat("\nFeature Scaling Completed Successfully!\n")


# 9. Train the SVM Classification Model

# Train SVM using the scaled training dataset
svm_model <- svm(
  x = X_train_scaled,
  y = y_train,
  type = "C-classification",
  kernel = "radial",
  cost = 1,
  gamma = 1 / ncol(X_train_scaled),
  scale = FALSE,
  probability = TRUE
)

# Display model details
cat("\nSVM Model Details:\n")
print(svm_model)

cat("\nSVM Model Training Completed Successfully!\n")


# 10. Make Predictions Using SVM

# Predict diagnosis for testing dataset
svm_predictions <- predict(
  svm_model,
  X_test_scaled
)

# Display actual and predicted diagnoses
cat("\nActual Diagnoses:\n")
print(y_test)

cat("\nPredicted Diagnoses:\n")
print(svm_predictions)

# Compare actual and predicted values
prediction_results <- data.frame(
  Actual = y_test,
  Predicted = svm_predictions
)

cat("\nPrediction Results:\n")
print(prediction_results)

cat("\nSVM Prediction Completed Successfully!\n")

# 11. Evaluate SVM Model

# Generate confusion matrix
conf_matrix <- confusionMatrix(
  data = svm_predictions,
  reference = y_test,
  positive = "Malignant"
)

cat("\nConfusion Matrix:\n")
print(conf_matrix)

# Extract performance metrics
accuracy <- conf_matrix$overall["Accuracy"]
precision <- conf_matrix$byClass["Precision"]
recall <- conf_matrix$byClass["Sensitivity"]
specificity <- conf_matrix$byClass["Specificity"]
f1_score <- conf_matrix$byClass["F1"]

# Display performance metrics
cat("\nSVM Performance Metrics:\n")

cat("Accuracy:", round(accuracy * 100, 2), "%\n")
cat("Precision:", round(precision * 100, 2), "%\n")
cat("Recall:", round(recall * 100, 2), "%\n")
cat("Specificity:", round(specificity * 100, 2), "%\n")
cat("F1-Score:", round(f1_score * 100, 2), "%\n")


# 12. ROC Curve and AUC

# Generate probability predictions
prob_predictions <- predict(
  svm_model,
  X_test_scaled,
  probability = TRUE
)

# Extract probability of Malignant class
malignant_prob <- attr(
  prob_predictions,
  "probabilities"
)[, "Malignant"]

# Calculate ROC curve
roc_result <- roc(
  response = y_test,
  predictor = malignant_prob,
  levels = c("Benign", "Malignant"),
  direction = "<"
)

# Calculate AUC
auc_value <- auc(roc_result)

cat("\nAUC:", round(as.numeric(auc_value), 4), "\n")

# Plot ROC curve
plot(
  roc_result,
  main = "ROC Curve - SVM Breast Cancer Classification",
  col = "blue",
  lwd = 2
)

# Save ROC curve
ggsave(
  "figures/svm_roc_curve.png",
  width = 7,
  height = 5
)

cat("\nSVM Model Evaluation Completed Successfully!\n")


