
# ==========================================
# Breast Cancer Classification
# Exploratory Data Analysis (EDA)
# ==========================================

# 1. Load the cleaned dataset
clean_data <- read.csv("data/cleaned_breast_cancer.csv")

# 2. Display dataset dimensions
cat("Dataset Dimensions:\n")
print(dim(clean_data))

# 3. Display column names
cat("\nColumn Names:\n")
print(names(clean_data))

# 4. Check dataset structure
cat("\nDataset Structure:\n")
str(clean_data)

# 5. Check missing values
cat("\nMissing Values:\n")
print(sum(is.na(clean_data)))

# 6. Check duplicate rows
cat("\nDuplicate Rows:\n")
print(sum(duplicated(clean_data)))

# 7. Check diagnosis distribution
cat("\nDiagnosis Distribution:\n")
print(table(clean_data$Diagnosis))

# 8. Calculate summary statistics
cat("\nSummary Statistics:\n")
summary(clean_data)


# ==========================================
# 9. Exploratory Data Visualisations
# ==========================================

# Load required library
library(ggplot2)

# Create figures folder if it does not exist
dir.create("figures", showWarnings = FALSE)

# Convert diagnosis into readable labels
clean_data$Diagnosis <- factor(
  clean_data$Diagnosis,
  levels = c("B", "M"),
  labels = c("Benign", "Malignant")
)

# 9.1 Diagnosis Distribution
diagnosis_plot <- ggplot(
  clean_data,
  aes(x = Diagnosis, fill = Diagnosis)
) +
  geom_bar() +
  labs(
    title = "Distribution of Breast Cancer Diagnoses",
    x = "Diagnosis",
    y = "Number of Cases"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

print(diagnosis_plot)

# Save diagnosis distribution graph
ggsave(
  "figures/diagnosis_distribution.png",
  diagnosis_plot,
  width = 7,
  height = 5
)


# 9.2 Compare Mean Radius by Diagnosis
radius_plot <- ggplot(
  clean_data,
  aes(x = Diagnosis, y = radius_mean, fill = Diagnosis)
) +
  geom_boxplot() +
  labs(
    title = "Mean Radius by Breast Cancer Diagnosis",
    x = "Diagnosis",
    y = "Mean Radius"
  ) +
  theme_minimal() +
  theme(legend.position = "none")

print(radius_plot)

# Save radius comparison graph
ggsave(
  "figures/radius_comparison.png",
  radius_plot,
  width = 7,
  height = 5
)
