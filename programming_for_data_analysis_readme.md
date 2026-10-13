# Programming for Data Analysis (R) 📊

Welcome to my repository for **Programming for Data Analysis**! This repository serves as my personal study hub, containing code snippets, assignment notes, labs, and projects focused on mastering data manipulation, cleaning, and analysis using the **R programming language**.

---

## 📚 Course Overview

This course emphasizes practical programming skills for handling real-world datasets. The primary focus is on writing clean, reproducible, and efficient R code to clean messy data, perform exploratory data analysis (EDA), and draw meaningful insights.

---

## 🗂️ Repository Structure

The repository is organized by topics and weekly modules:

```text
Programming-for-Data-Analysis/
│
├── 01_R_Basics/              # Introduction to R syntax, data structures (vectors, data frames)
├── 02_Data_Cleaning/         # Handling missing values, filtering, reshaping (tidyr, dplyr)
├── 03_Data_Visualization/    # Exploratory plotting with ggplot2
├── 04_Statistical_Analysis/  # Basic statistics, hypothesis testing in R
├── 05_Projects/              # Mini-projects and end-of-term case studies
└── README.md
```

---

## 🛠️ Tech Stack & Key Libraries

* **Language:** R (Version 4.x+)
* **IDE:** RStudio
* **Key Packages & Ecosystem (`tidyverse`):**
  * `dplyr`: Data manipulation and transformation
  * `tidyr`: Data tidying and reshaping
  * `ggplot2`: Data visualization
  * `stringr` & `lubridate`: String manipulation and date-time handling
  * `readr`: Fast and friendly data import

---

## 📝 Key Topics & Study Notes

### 1. Data Cleaning & Preparation
* Identifying and handling missing or corrupt data (`is.na()`, `na.omit()`).
* Reshaping data frames between wide and long formats (`pivot_longer()`, `pivot_wider()`).
* Merging and joining multiple datasets (`inner_join()`, `left_join()`, etc.).
* Cleaning text strings and parsing dates.

### 2. Exploratory Data Analysis (EDA)
* Summarizing distributions using descriptive statistics (`mean()`, `median()`, `sd()`, `quantile()`).
* Grouping and aggregating data efficiently (`group_by()` and `summarize()`).
* Visualizing trends, outliers, and correlations using `ggplot2`.

---

## 🚀 How to Use This Repo

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/your-username/Programming-for-Data-Analysis.git
   ```
2. Open the project in RStudio by clicking the `.Rproj` file.
3. Install any required dependencies:
   ```R
   install.packages("tidyverse")
   ```

---

*Happy coding and analyzing! Feel free to explore the scripts and notes.*