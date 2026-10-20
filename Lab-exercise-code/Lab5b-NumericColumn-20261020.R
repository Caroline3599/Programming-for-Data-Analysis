# Load your previously saved work from Lab 5A using the command below:
clean <- readRDS("brewhaus_cleaned_5a.rds")


# Q1-------------------------------
# Write R code to count the missing values (NA) in the numeric columns
num_col <- sapply(clean, is.numeric)
colSums(is.na(clean[,num_col]))


# Q2-------------------------------
# i) R code to flag revenue_rm values that are zero or negative, then set them to NA:
re <- clean$Revenue__RM_
invalid_re <- re <= 0
re[invalid_re] <- NA
sum(is.na(re))


# ii) R code to flag waiting_minutes values that are zero or negative, then set them to NA:
wm <- clean$Waiting_Minutes
invalid_wait <- wm <= 0
wm[invalid_wait] <- NA
sum(is.na(wm))


# iii) R code to flag satisfaction_score values outside the 1 to 5 scale, then set them to NA:
ss <- clean$Satisfaction_Score
invalid_ss <- ss < 1 | ss > 5
ss[invalid_ss] <- NA
sum(is.na(ss))

# iv) R code to flag no_customers values that are zero or negative, then set them to NA:
nc <- clean$No__Customers
invalid_nc <- nc <= 0
nc[invalid_nc] <- NA
sum(is.na(nc))

clean$Waiting_Minutes <- wm
clean$Revenue__RM_ <- re
clean$Satisfaction_Score <- ss
clean$No__Customers <- nc

colSums(is.na(clean))
names(clean)


# Q3------------------------
# i) R code to flag fractional customer counts 
# (for example 2.5 customers and then set them to NA)
frac_nc <- clean$No__Customers %% 1 != 0
clean$No__Customers[frac_nc] <- NA
sum(is.na(clean$No__Customers))


# ii) R code to calculate the upper fence for no_customers (1.5 x IQR) 
# and flag the extreme values as flag_cust_outlier without changing them
nc <- clean$No__Customers
Q1 <- quantile(nc, 0.25, na.rm = TRUE)
Q3 <- quantile(nc, 0.75, na.rm = TRUE)
IQR1.5 <- 1.5*(Q3 - Q1)
upper <- Q3 + IQR1.5
flag_cust_outlier <- nc > upper
clean$No__Customers <- nc
sum(flag_cust_outlier, na.rm = TRUE)


# Q4--------------------------
# i) R code to replace text placeholders such as "unknown" and "?" in revenue_raw with NA
rr <- clean$Revenue_Raw
rr_clean <- tolower(trimws(rr))
placeholders <- c("unknown", "?", "-", "not recorded", "na", "n/a", "null", "rm -")
is_placeholder <- rr_clean %in% placeholders
clean$Revenue_Raw[is_placeholder] <- NA
sum(is.na(clean$Revenue_Raw))
rr_clean <- clean$Revenue_Raw

# ii) R code to detect the "K" abbreviation (for example 0.2K means 200)
k_index <- grepl("k$", rr_clean)
numeric_k_values <- as.numeric(gsub("k$", "", rr_clean[k_index])) * 1000
rr_clean[k_index] <- numeric_k_values
clean$Revenue_Raw <- rr_clean

# iii) R code to remove the currency symbol and commas, then store the result as revenue_raw_parsed
revenue_raw_parsed <- gsub("[^0-9.]", "", rr_clean)

# Q5---------------------------
# i) R code to find rows where revenue_rm and revenue_raw_parsed differ by more than RM 0.005
re_num <- as.numeric(revenue_raw_parsed)

diff <- abs(re_num - clean$Revenue__RM_)

# ii) R code to flag these rows as flag_revenue_conflict
flag_revenue_conflict <- !is.na(diff) & diff > 0.005
sum(flag_revenue_conflict)


# iii) R code to set revenue_rm to NA for the conflicting rows
clean$Revenue__RM_[flag_revenue_conflict == TRUE] <- NA

# Q6----------------------------
# i) R code to calculate the lower and upper IQR fences for revenue_rm
rr <- clean$Revenue__RM_
Q1 <- quantile(rr, 0.25, na.rm = TRUE)
Q3 <- quantile(rr, 0.75, na.rm = TRUE)
iqr <- Q3 - Q1
lower_rr <- Q1 -1.5*iqr
upper_rr <- Q3 +1.5*iqr

# ii) R code to flag the outliers as flag_revenue_outlier without removing them
rr_outliers <- rr < lower_rr | rr > upper_rr

# iii) R code to compare the mean and SD with the median, IQR and MAD
revenue_stats <- data.frame(
  Metric = c("Mean", "SD", "Median", "IQR", "MAD"),
  Value = c(
    mean(rr, na.rm = TRUE),
    sd(rr, na.rm = TRUE),
    median(rr, na.rm = TRUE),
    IQR(rr, na.rm = TRUE),
    mad(rr, na.rm = TRUE)
  )
)

print(revenue_stats)

#i Q7---------------------------
# i) R code to calculate the upper IQR fence for waiting_minutes
wm <- clean$Waiting_Minutes
iqr <- quantile(wm, 0.75, na.rm = TRUE) - quantile(wm, 0.25, na.rm = TRUE)
upper_wm <- quantile(wm, 0.75, na.rm = TRUE) + iqr*1.5

# ii) R code to keep the original values in waiting_minutes_uncapped and flag the extreme values as flag_wait_capped
waiting_minutes_uncapped <- wm > upper_wm
sum(is.na(waiting_minutes_uncapped))

# iii) R code to cap the extreme waiting times at the upper fence
waiting_minutes_capped <- wm
clean$Waiting_Minutes[waiting_minutes_uncapped] <- upper_wm
max(clean$Waiting_Minutes, na.rm = TRUE)


# Q7-----------------------------
# i) R code to replace missing satisfaction_score values with the median 
# and flag them as flag_score_imputed
ss <- clean$Satisfaction_Score
flag_score_imputed <- is.na(ss)
ss[flag_score_imputed] <- median(ss, na.rm = TRUE)
clean$Satisfaction_Score <- ss


# ii) R code to replace missing no_customers values with the rounded 
# mean of the same day type and flag them as flag_cust_imputed
nc <- clean$No__Customers
flag_cust_imputed <- is.na(nc)
mean_by_day <- ave(nc, clean$Day_Type, FUN = function(x) round(mean(x, na.rm = TRUE)))
nc[mean_by_day] <- 

# iii) R code to count the missing values left in transaction_date_clean, payment_method and customer_type (these are never imputed)
clean$Day_Type
