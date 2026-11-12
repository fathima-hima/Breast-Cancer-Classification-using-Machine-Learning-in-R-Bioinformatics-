# Breast Cancer Classification Using Support Vector Machine (SVM)

## 1. Project Overview

Breast cancer is one of the major health challenges worldwide. Early identification and accurate classification of breast tumours are important for supporting medical decision-making. Machine learning techniques can analyse medical datasets and identify patterns that may help distinguish between benign and malignant tumours.

This project develops a supervised machine learning classification model using the **Wisconsin Diagnostic Breast Cancer (WDBC) dataset**. The main objective is to classify breast tumours into two categories: Benign and Malignant, based on numerical features extracted from digitised images of fine needle aspirates of breast masses.

The project uses the Support Vector Machine (SVM) algorithm with a Radial Basis Function (RBF) kernel. All data processing, exploratory data analysis, model development and evaluation are performed using R.

The model achieved an accuracy of **98.23%** and an Area Under the ROC Curve (AUC) of **0.9997** on the held-out testing dataset.

## 2. Problem Statement

Distinguishing between benign and malignant breast tumours is an important biomedical classification problem. Manual examination and interpretation of tumour characteristics can be challenging.

This project investigates how machine learning can classify breast tumour records using numerical diagnostic features. A Support Vector Machine model is developed and evaluated to determine its classification performance.

## 3. Aim and Objectives

### Aim

To develop and evaluate a Support Vector Machine classification model for predicting whether breast tumours are benign or malignant using the Wisconsin Diagnostic Breast Cancer dataset.

### Objectives

- Obtain a publicly available breast cancer diagnostic dataset.
- Import, clean and preprocess the dataset using R.
- Perform exploratory data analysis to understand the dataset.
- Visualise the distribution of diagnosis categories and selected numerical features.
- Develop an SVM classification model using an RBF kernel.
- Evaluate the model using appropriate classification metrics.
- Interpret the results and identify the limitations of the approach.

## 4. Dataset Description

This project uses the Wisconsin Diagnostic Breast Cancer (WDBC) dataset obtained from the UCI Machine Learning Repository.

**Dataset source:**  
https://archive.ics.uci.edu/dataset/17/breast+cancer+wisconsin+diagnostic

### Dataset characteristics

| Description | Value |
|---|---:|
| Total observations | 569 |
| Original columns | 32 |
| Identification column | 1 |
| Diagnosis column | 1 |
| Numerical features | 30 |
| Benign records | 357 |
| Malignant records | 212 |

The dataset contains measurements describing characteristics of cell nuclei, including:

- Radius
- Texture
- Perimeter
- Area
- Smoothness
- Compactness
- Concavity
- Concave points
- Symmetry
- Fractal dimension

The diagnosis variable is the target variable used for classification.

- **B – Benign:** Non-cancerous tumour.
- **M – Malignant:** Cancerous tumour.

The identification column was removed during preprocessing because it does not provide meaningful diagnostic information for the classification task.

## 5. Methodology

The project follows a supervised machine learning workflow consisting of dataset collection, preprocessing, exploratory data analysis, model development and evaluation.

### 5.1 Data Collection

The WDBC dataset was obtained from the UCI Machine Learning Repository and imported into R for analysis.

### 5.2 Data Cleaning

The original dataset contained 569 observations and 32 columns. The identification column was removed, leaving 31 columns consisting of the diagnosis variable and 30 numerical predictor features.

The dataset was checked for missing values and duplicate records. The analysis identified no missing values or duplicate rows.

The cleaned dataset was saved as a CSV file for subsequent analysis.

### 5.3 Exploratory Data Analysis

Exploratory Data Analysis (EDA) was performed to understand the distribution and characteristics of the dataset.

The following visualisations were generated:

1. Diagnosis distribution showing the number of benign and malignant observations.
2. Mean radius comparison between benign and malignant tumour records.

These visualisations help explore the distribution of the target variable and differences in selected tumour measurements.

### 5.4 Data Preprocessing

The diagnosis variable was converted into a categorical factor with two classes: Benign and Malignant.

The dataset was divided into training and testing datasets using an 80:20 split with stratified sampling.

| Dataset | Observations |
|---|---:|
| Training | 456 |
| Testing | 113 |
| Total | 569 |

Feature scaling was performed using centering and standardisation. The scaling parameters were calculated using only the training dataset and then applied to both training and testing datasets. This helps prevent data leakage.

### 5.5 Support Vector Machine Model

Support Vector Machine (SVM) is a supervised machine learning algorithm used for classification and regression tasks.

The algorithm identifies a decision boundary that separates observations belonging to different classes. The observations closest to the decision boundary are known as support vectors.

This project uses an SVM with a Radial Basis Function (RBF) kernel. The RBF kernel can model nonlinear relationships between numerical features.

The model was developed using the following configuration:

| Parameter | Setting |
|---|---|
| Classification type | C-classification |
| Kernel | Radial |
| Cost | 1 |
| Gamma | 1/30 |
| Probability estimation | Enabled |

The model was trained using the training dataset and evaluated using predictions on the held-out testing dataset.

## 6. Model Evaluation

The trained SVM model was evaluated using the testing dataset containing 113 observations.

A confusion matrix and several classification metrics were used to assess its performance.

### 6.1 Confusion Matrix

| Actual / Predicted | Benign | Malignant |
|---|---:|---:|
| Benign | 69 | 2 |
| Malignant | 0 | 42 |

The model correctly classified 111 out of 113 observations. Two benign observations were incorrectly classified as malignant, while all 42 malignant observations were correctly classified.

### 6.2 Performance Metrics

| Metric | Result |
|---|---:|
| Accuracy | 98.23% |
| Precision | 95.45% |
| Recall (Sensitivity) | 100.00% |
| Specificity | 97.18% |
| F1-Score | 97.67% |
| AUC | 0.9997 |

### 6.3 Interpretation

**Accuracy – 98.23%**

The model correctly classified approximately 98.23% of all observations in the testing dataset.

**Precision – 95.45%**

Among the observations predicted as malignant, approximately 95.45% were actually malignant.

**Recall – 100%**

The model correctly identified all malignant observations in the testing dataset. This is an important measure for a classification problem involving malignant cases.

**Specificity – 97.18%**

The model correctly identified approximately 97.18% of the benign observations.

**F1-Score – 97.67%**

The F1-score represents the balance between precision and recall. The result indicates strong performance in identifying the malignant class.

**AUC – 0.9997**

The Area Under the ROC Curve indicates excellent discrimination between benign and malignant observations on the testing dataset.

Overall, the evaluation demonstrates strong classification performance for this particular train-test split.

## 7. Technologies and Tools

The following tools and technologies were used:

- **R:** Programming language used for data analysis and machine learning.
- **RStudio:** Development environment used to write and execute R scripts.
- **Support Vector Machine:** Classification algorithm.
- **tidyverse:** Data manipulation and analysis.
- **e1071:** SVM implementation.
- **caret:** Data preprocessing, partitioning and evaluation.
- **ggplot2:** Data visualisation.
- **corrplot:** Correlation visualisation.
- **pROC:** ROC curve and AUC analysis.
- **Git and GitHub:** Version control and project hosting.

## 8. Project Structure

The repository is organised as follows:

```text
Breast_Cancer_Classification/
│
├── code/
│   ├── analysis.R
│   ├── eda.R
│   └── svm_model.R
│
├── data/
│   ├── wdbc.data
│   └── cleaned_breast_cancer.csv
│
├── figures/
│   ├── diagnosis_distribution.png
│   ├── radius_comparison.png
│   ├── svm_roc_curve.png
│   └── svm_performance_metrics.csv
│
├── report/
│   ├── Breast_Cancer_Classification_Report.Rmd
│   └── Breast_Cancer_Classification_Report.html
│
└── README.md
```

## 9. How to Run the Project

Follow these steps to reproduce the analysis.

### Step 1: Clone the repository

```bash
git clone https://github.com/fathima-hima/Breast-Cancer-Classification-using-Machine-Learning-in-R-Bioinformatics-.git
```

### Step 2: Open the project

Open the downloaded project folder in RStudio.

Ensure that the working directory is the project root folder.

### Step 3: Install the required packages

Run the following command in the RStudio Console:

```r
install.packages(c(
  "tidyverse",
  "e1071",
  "caret",
  "corrplot",
  "pROC",
  "ggplot2"
))
```

### Step 4: Execute the R scripts

Run the scripts in the following order:

1. `code/analysis.R` – Imports and cleans the original dataset.
2. `code/eda.R` – Performs exploratory data analysis and generates visualisations.
3. `code/svm_model.R` – Trains the SVM model and evaluates its performance.

### Step 5: View the report

Open `report/Breast_Cancer_Classification_Report.html` in a web browser to view the final project report.

The R Markdown source file is also available in the report folder.

## 10. Limitations and Future Improvements

Although the SVM model achieved strong performance, the project has several limitations.

- The analysis uses only one publicly available dataset.
- The evaluation is based on a single 80:20 train-test split.
- The model has not been validated using an independent clinical dataset.
- The dataset may not represent every patient population or real-world clinical condition.
- The model should not replace professional medical diagnosis.

Future improvements could include cross-validation, hyperparameter optimisation, comparisons with additional classification algorithms and testing on independent datasets.

## 11. Conclusion

This project developed a Support Vector Machine classification model to distinguish benign and malignant breast tumours using the Wisconsin Diagnostic Breast Cancer dataset.

Data cleaning, preprocessing and exploratory data analysis were performed using R. An SVM model with an RBF kernel was trained and evaluated using a held-out testing dataset.

The model achieved 98.23% accuracy, 95.45% precision, 100% recall, 97.18% specificity, 97.67% F1-score and an AUC of 0.9997.

These findings demonstrate that the SVM model performed effectively on the selected dataset. However, further validation using additional datasets is necessary before considering real-world clinical applications.

## 12. References

1. Wolberg, W. H., Street, W. N., & Mangasarian, O. L. (1995). Wisconsin Diagnostic Breast Cancer Dataset. UCI Machine Learning Repository. https://archive.ics.uci.edu/dataset/17/breast+cancer+wisconsin+diagnostic

2. Cortes, C., & Vapnik, V. (1995). Support-vector networks. *Machine Learning, 20*, 273–297.

3. R Core Team. R: A language and environment for statistical computing. R Foundation for Statistical Computing. https://www.r-project.org/

4. Meyer, D., Dimitriadou, E., Hornik, K., Weingessel, A., & Leisch, F. e1071: Misc Functions of the Department of Statistics, Probability Theory Group. R package.

---

**Author:** Fathima Hima

**GitHub Repository:**  
https://github.com/fathima-hima/Breast-Cancer-Classification-using-Machine-Learning-in-R-Bioinformatics-