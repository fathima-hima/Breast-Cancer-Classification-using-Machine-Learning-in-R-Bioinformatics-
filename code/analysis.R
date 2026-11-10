
# ==========================================
# BREAST CANCER CLASSIFICATION PROJECT
# Step 1: Download and Import Dataset
# ==========================================

# Dataset URL
url <- "https://archive.ics.uci.edu/ml/machine-learning-databases/breast-cancer-wisconsin/wdbc.data"

# Download dataset
download.file(
  url,
  destfile = "data/wdbc.data",
  mode = "wb"
)

# Define column names
column_names <- c(
  "ID", "Diagnosis",
  "radius_mean", "texture_mean",
  "perimeter_mean", "area_mean",
  "smoothness_mean", "compactness_mean",
  "concavity_mean", "concave_points_mean",
  "symmetry_mean", "fractal_dimension_mean",
  "radius_se", "texture_se",
  "perimeter_se", "area_se",
  "smoothness_se", "compactness_se",
  "concavity_se", "concave_points_se",
  "symmetry_se", "fractal_dimension_se",
  "radius_worst", "texture_worst",
  "perimeter_worst", "area_worst",
  "smoothness_worst", "compactness_worst",
  "concavity_worst", "concave_points_worst",
  "symmetry_worst", "fractal_dimension_worst"
)

# Import dataset
data <- read.csv(
  "data/wdbc.data",
  header = FALSE,
  col.names = column_names
)

# Convert diagnosis into a factor
data$Diagnosis <- factor(data$Diagnosis)

# Display first six records
head(data)

# Check dataset dimensions
dim(data)

# Check column data types
str(data)

# Count benign and malignant samples
table(data$Diagnosis)

# Check missing values in each column
colSums(is.na(data))

# Check duplicate rows
sum(duplicated(data))

# Check duplicate IDs
sum(duplicated(data$ID))

# Create a copy of the dataset
clean_data <- data

# Remove ID column
clean_data$ID <- NULL

# Check the cleaned dataset
head(clean_data)

# Check dimensions
dim(clean_data)

# Check structure
str(clean_data)

# Save cleaned dataset
write.csv(
  clean_data,
  "data/cleaned_breast_cancer.csv",
  row.names = FALSE
)

file.exists("data/cleaned_breast_cancer.csv")