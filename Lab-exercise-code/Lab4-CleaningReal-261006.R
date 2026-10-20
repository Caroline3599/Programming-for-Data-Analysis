# brewhaus <- read.csv("Brewhaus_dataset.csv",readAs)

brewhaus <- read.csv("Brewhaus_dataset.csv", fileEncoding = "UTF-8-BOM")
nrow(brewhaus)

names(brewhaus)
summary(brewhaus)
str(brewhaus)
colSums(is.na(brewhaus))
sum(is.na(brewhaus$Revenue..RM.))
sum(is.na(brewhaus$Transaction.ID))
head(brewhaus)
setwd("D:/APU/9-code")


pattern <- "^BH[0-9]{6}$"
valid_ids <- brewhaus$Transaction.ID[
  !is.na(brewhaus$Transaction.ID) & brewhaus$Transaction.ID != ""
]
count <- sum(!grepl(pattern, valid_ids))
count


# Identify character columns
char_cols <- names(brewhaus)[sapply(brewhaus, is.character)]

# Find which contain blank strings
blank_cols <- char_cols[sapply(brewhaus[char_cols], function(x) any(x == ""))]
blank_cols
sum(blan)

blank_ids <- char_cols[sapply(brewhaus$Transaction.ID, function(x) any(x == ""))]
sum(brewhaus$Transaction.ID == "")


sum(duplicated(brewhaus))

valid_ids
sum(duplicated(valid_ids))

id_counts <- table(valid_ids)
repeat_ids <- names(id_counts[id_counts > 1])
rows_in_repeat <- sum(valid_ids %in% repeat_ids)
rows_in_repeat
distinct_ids <- sum(id_counts > 1)
distinct_ids

# Count rows with leading or trailing whitespace
sum(grepl("^\\s|\\s$", brewhaus$Payment.Method))

cols = c(
  "Payment.Method", 
  "Outlet.Name", 
  "Customer.Type", 
  "Product.Category"
)

ws_counts <- sapply(brewhaus[cols], function(x) sum(grepl("^\\s|\\s$", x)))
ws_counts

# Define the columns of interest
cols <- c("Payment.Method", "Outlet.Name", "Customer.Type", "Product.Category")

# For each column, count how many cells have leading or trailing whitespace
ws_counts <- sapply(brewhaus[cols], function(x) sum(grepl("^\\s|\\s$", x)))

# Show counts per column
ws_counts

# Total sum across all four columns
total_ws <- sum(ws_counts)
total_ws

unique(brewhaus$Product.Category)


#-----------view-----------
ls() # variable list
class(brewhaus) # output: data type
str(brewhaus) # entire df type with rows
nrow(brewhaus) # no. of rows
ncol(brewhaus) # no. of cols
length(brewhaus) # no. of elements
dim(brewhaus)
names(brewhaus) # column names
head(brewhaus) # first 6 rows
tail(brewhaus) # last 6 rows
summary(brewhaus) # math for each row
unique(brewhaus$Product.Category)
# input: table(x), x is a vector; output: 2D df
table(brewhaus$Transaction.ID)
# input: table(x, y), x and y with condition; output: 2x2 df frequency
table(brewhaus$Product.Category == "coffee", brewhaus$Transaction.ID == "") 
# input: a table; output: proportion
prop.table(table(brewhaus$Transaction.ID == ""))
# aggregate(x~y, data = , FUN = )
aggregate(Revenue..RM.~Product.Category, data = brewhaus, FUN = sum) # grouping
# input: 2d df, output: sums of each colum
colSums(brewhaus[,c("Revenue..RM.","Waiting.Minutes")], na.rm = TRUE) # column sum
colSums(cbind(brewhaus$Revenue..RM., brewhaus$Waiting.Minutes), na.rm = TRUE) # cbind()
num_col <- brewhaus[, c("Revenue..RM.","Waiting.Minutes")]
num_col 
colSums(num_col)

#---------------cleaning--------------
# null value
null_ids <- is.na(brewhaus$Product.Category) 
sum(null_ids)
# duplicates
duplicated(brewhaus) # output: 1d df with boolean
sum(duplicated(brewhaus)) # by rows
sum(duplicated(brewhaus$Transaction.ID)) # by columns
# grouping
brewhaus[, c("Transaction.ID", "Revenue..RM.")] # filter by columns
brewhaus[brewhaus$Revenue..RM. < 100,] # filter by rows
brewhaus$Transaction.ID[
  !is.na(brewhaus$Revenue..RM.) 
  & brewhaus$Revenue..RM. < 100
]
names(brewhaus)
brewhaus$Transaction.ID[order(brewhaus$Revenue..RM., decreasing = TRUE)]
brewhaus[order(-brewhaus$Revenue..RM.),]
names(brewhaus)

#----------data structure-------------
# vector
student_ids <- c("S001", "S002", "S003", "S004", "S005", "S006")
study_hours <- c(5, 8, 3, 10, 6, 7)
attendance <- c(88, 95, 72, 98, 84, 90)
passed <- c(TRUE, TRUE, FALSE, TRUE, TRUE, TRUE)

# list
module_info <- list(
  code = "CT127-3-2",
  title = "Programming for Data Analysis",
  week = 2,
  tools = c("R", "RStudio"),
  labe_completed = FALSE
)
module_info
# factor
satisfaction <- factor(
  c("Medium", "High", "Low", "High", "Medium", "High"),
  levels=c("Low","Medium","High"),
  ordered=TRUE
)
satisfaction
# data frame
preferred_device <- c("Laptop", "Laptop", "Tablet", "Laptop", "Tablet", "Laptop")
student_survey <- data.frame(
  StudentID = student_ids,
  StudyHours = study_hours,
  Attendance = attendance,
  PreferredDevice = preferred_device,
  Satisfaction = satisfaction,
  Passed = passed,
  stringsAsFactors = FALSE
)
student_survey

#---------------import----------------
read.csv()
write.csv()

#---------------format----------------
print(brewhaus)
paste(pattern, 1) # variable with string
cat("hello~\n", "ss")
trimws(" hello guys ", which = "left")
#---------------math------------------
mean(c(10, 20, 30))
sqrt(64)
max(1,2,3,4) 
round(3.1415926, 4)
100 >= 20
x <- c(12, 11, 14)
y <- c(33, 55, 44)
cor(x, y)

cbind(c(1,2), c(3,4))
rbind(c(1,2), c(3,4))

#---------------apply------------------
apply(brewhaus[,c("Revenue..RM.", "Waiting.Minutes")], 2, mean, na.rm = TRUE)
# apply: 按列求平均
m <- matrix(1:9, nrow=3)
m
apply(m, 2, mean)   # 每列平均值
# lapply: 返回列表
lapply(1:3, function(x) x^2)
# sapply: 返回向量
sapply(1:3, function(x) x^2)
# vapply: 强制返回数值型
vapply(1:3, function(x) x^2, numeric(1))
# tapply: 按组求平均
tapply(iris$Sepal.Length, iris$Species, mean)
# mapply: 多向量并行
mapply(sum, 1:3, 4:6)  # 1+4, 2+5, 3+6



# read.csv("Brewhaus_dataset.csv", stringsAsFactors = FALSE, check.names = FALSE)
setwd("D:/APU/9-code")
setwd("D:/Users/nihao/Documents/Programming-for-Data-Analysis")
brewhaus <- read.csv(
  "Brewhaus_dataset.csv", 
  fileEncoding = "UTF-8-BOM"
)
head(brewhaus)

# 1. How many rows are in the dataset?
nrow(brewhaus)
tail(brewhaus)
dim(brewhaus)


# 2. which columns are numeric in R? 
str(brewhaus)
class(brewhaus$Transaction.ID)
names(brewhaus)[sapply(brewhaus, is.numeric)]


# 3. Which columns contain one or more `NA` values
names(which(colSums(is.na(brewhaus)) > 0))
?which

# 4. How many `NA` values are present in `Revenue (RM)`?
sum(is.na(brewhaus$Revenue..RM.))


# 5. Which character columns contain one or more blank strings (`""`)?
# method 1
str(brewhaus)
char_col <-  c("Transaction.ID", 
               "Transaction.Date",
               "Outlet.Name",
               "Day.Type",
               "Customer.Type",
               "Payment.Method",
               "Product.Category",
               "Revenue.Raw")
char_col[sapply(brewhaus[char_col], function(x) any(x == ""))]

# method 2
names(brewhaus)[sapply(brewhaus, function(x) is.character(x) && any(x == ""))]

# method 3
char_col <- names(brewhaus)[sapply(brewhaus, is.character)]
blank_counts <- colSums(brewhaus[char_col] == "", na.rm = TRUE)
names(blank_counts[blank_counts > 0])


# 6. How many Transaction ID values are missing or blank?
sum(sapply(brewhaus$Transaction.ID, function(x) any(x == "") | is.na(x)))

# method 2
id <- brewhaus$Transaction.ID
sum(id == "" | is.na(id))
str(id)

# 7. Ignoring missing/blank IDs, how many Transaction ID values 
# do not match the required pattern `BH` followed by exactly six digits?
pattern = "^BH[0-9]{6}$"
valid_ids = brewhaus$Transaction.ID[!is.na(brewhaus$Transaction.ID) &
                                      brewhaus$Transaction.ID != ""]

invalid_ids <- sum(!grepl(pattern, valid_ids))
invalid_ids


# method 2
id <- brewhaus$Transaction.ID
sum(!is.na(id) & id != "" & !grepl("^BH[0-9]{6}$", id))


# 8. How many additional exact duplicate rows are present?
sum(duplicated(brewhaus))


# 9. How many rows are involved in repeated nonblank Transaction IDs? 
# Count all rows belonging to a repeated-ID group, including the first occurrence.
id_counts <- table(valid_ids)
repeated_ids <- names(id_counts[id_counts > 1])
sum(brewhaus$Transaction.ID %in% repeated_ids, na.rm = TRUE)

# method 2
id <- brewhaus$Transaction.ID
nonblank <- id[!is.na(id) | id != ""]
sum(nonblank %in% nonblank[duplicated(nonblank)])



# 10. How many distinct nonblank Transaction IDs are repeated?
length(unique(repeated_ids))

# method 2
length(unique(nonblank[duplicated(nonblank)]))


# 11. How many `Payment Method` records contain leading or trailing whitespace?
pattern2 = "^\\s|\\s$"
sum(grepl(pattern2, brewhaus$Payment.Method))

# method 2
pm <- brewhaus$Payment.Method
sum(pm != trimws(pm), na.rm = TRUE)



# 12. Check `Payment Method`, `Outlet Name`, `Customer Type`, and `Product Category` 
# for leading/trailing whitespace. 
# What is the sum of whitespace-affected occurrences across these four columns? 
# Count affected cells, not unique rows.
names(brewhaus)
pattern2 <- "^\\s|\\s$"
num12 <- c("Payment.Method",
           "Outlet.Name",
           "Customer.Type",
           "Product.Category")
sum(sapply(brewhaus[num12], function(x) sum(grepl(pattern2, x))))

num12 <- c("Payment.Method", "Outlet.Name", "Customer.Type", "Product.Category")


# method 2
pm <- brewhaus$Payment.Method
sum(pm != trimws(pm), na.rm = TRUE)
on <- brewhaus$Outlet.Name
ct <- brewhaus$Customer.Type
pc <- brewhaus$Product.Category

# 13. Why can inconsistent categorical labels cause problems in analysis? 
sort(table(pm, useNA = "ifany"), decreasing = TRUE)


# 14.  Report three examples of categorical representation variants and explain one 
# possible impact.
table(on, useNA = "ifany")
table(pm, useNA = "ifany")
table(ct, useNA = "ifany")
table(pc, useNA = "ifany")



# 15.After separating representation variants from genuinely invalid categories, 
# how many genuinely invalid `Payment Method` occurrences are present?
pm <- brewhaus$Payment.Method
pm_raw <- unique(pm)
pm_clean <- trimws(tolower(gsub("[- _]", "", pm)))
pm_clean[pm_clean == "cc"] <- "creditcard"

pm_temp <- unique(pm_clean[!is.na(pm_clean)])
keep <- sapply(pm_temp, function(x) sum(grepl(x, u, fixed = TRUE)) == 1)
pm_valid_names <- pm_temp[keep]

pm_raw
pm_valid_names
length(pm_raw)
length(pm_temp[keep])


# method 2
nonblank_pm <- pm[!is.na(pm) & pm != ""]
pm <- tolower(trimws(nonblank_pm))
table(pm_clean, useNA = "ifany")
pm_clean <- gsub(" ", "", gsub("[ -_]", " ", pm))
valid_pm <- c("card", "cash", "cc", "creditcard", "ewallet", "wallet", "qr", "qrpay")

sum(!(pm_clean %in% valid_pm))


# 16. How many genuinely invalid `Product Category` occurrences are present?
pc <- brewhaus$Product.Category
pc
unique(pc)
table(pc)
table(pc_norm)
pc_norm <- tolower(trimws(gsub("[- _]", "", pc)))
unique(pc_norm)
pc_blank <- pc[pc == ""]
pc_invalid_nums <- (length(unique(pc)) 
                    - length(unique(pc_norm)) 
                    + length(unique(pc_blank)) 
                    + 1)
pc_invalid_nums


# method 2
pc <- brewhaus$Product.Category
nonblank_pc <- pc[!is.na(pc) & pc != ""]
table(pc_clean)
pc_clean <- gsub("[ -_]", "" ,tolower(trimws(nonblank_pc)))
valid_pc <- c("coffee", "dessert", "desserts", "merchandise", "pastry", "sandwich", "tea")
sum(!(pc_clean %in% valid_pc))

# pc_desserts <- brewhaus[pc == "Desserts",]
# pc_invalid <- (length(pc)
#                 - length(pc_norm)
#                 + length(pc_blank)
#                 + length(pc_desserts))
# pc_invalid

# 45, 43, 119

# 17. Across `Payment Method`, `Outlet Name`, `Customer Type`, `Product Category`, 
# and `Day Type`, what is the total number of genuinely invalid category occurrences? 
# Sum occurrences across columns, not unique rows.
names(brewhaus)
num17 <- c("Payment.Method",
           "Outlet.Name",
           "Customer.Type",
           "Product.Category",
           "Day.Type")
invalid_ca <- "Credit Card|QR Pay|e-wallet|E Wallet|Cash|E-Wallet| CASH|CARD|cc|Credit_Card|QRPay"
sum(sapply(num17$Product.Category, function(x) x == invalid_ca), na.rm = TRUE)





# 18. How many Transaction Date strings match a slash-date pattern 
# such as `DD/MM/YYYY` or `MM/DD/YYYY`?
names(brewhaus)
dy <- brewhaus$Transaction.Date
head(dy, 10)
pattern3 <- "^[0-9]{2}/[0-9]{2}/[0-9]{4}$|^[0-9]{2}-[0-9]{2}-[0-9]{4}$"
dy_slash <- grepl(pattern3, dy)
sum(dy_slash)


# 19. How many Transaction Date strings use a text-month format such as `15 Mar 2026`?
pattern4 <- "^[0-9]{2} [A-Za-z]{3} [0-9]{4}$"
dy_char <- grepl(pattern4, dy)
sum(dy_char)


# 20. How many Transaction Date strings look like ISO dates in the form `YYYY-MM-DD`?
pattern5 <- "^[0-9]{4}-[0-9]{2}-[0-9]{2}$"
dy_ISO <- grepl(pattern5, dy)
sum(dy_ISO)

# 21. Ignoring blank dates, how many Transaction Date strings do not match 
# the ISO, slash-date, or text-month patterns?
dy_valid <- dy_slash | dy_char | dy_ISO
dy_missing <- is.na(dy) | dy == "" 
sum(is.na(dy))
sum(dy == "" )
length(dy)-sum(dy_missing)-sum(dy_valid)

# method 2
d <- brewhaus$Transaction.Date
nonblank_dates <- d[d != "" & !is.na(d)]
d_slash <- grepl("^[0-9]{2}/[0-9]{2}/[0-9]{4}$|^[0-9]{2}-[0-9]{2}-[0-9]{4}$", nonblank_dates)
d_char <- grepl("^[0-9]{2} [A-Za-z]{3} [0-9]{4}$", nonblank_dates)
d_iso <- grepl("^[0-9]{4}-[0-9]{2}-[0-9]{2}$", nonblank_dates)
known <- d_slash | d_char | d_iso
sum(!known)
nonblank_dates[d_slash]


# 22. Among the ISO-looking Transaction Date strings, 
# how many are invalid calendar dates when parsed as `YYYY-MM-DD`?
iso_dates <- dy[dy_ISO]
check_format <- as.Date(iso_dates, format = "%Y-%m-%d")
sum(is.na(check_format))


# 23. Among slash-formatted dates, how many fail as valid calendar dates 
# under both `DD/MM/YYYY` and `MM/DD/YYYY` interpretations?
slash_dates <- dy[dy_slash]
check1 <- as.Date(slash_dates, format = "%d/%m/%Y")
check2 <- as.Date(slash_dates, format = "%m/%d/%Y")
invalid_slash <- is.na(check1) | is.na(check2)
sum(invalid_slash)

# 24. Among slash-formatted dates, how many are valid under both `DD/MM/YYYY` 
# and `MM/DD/YYYY` interpretations and are therefore ambiguous 
# without external format information?
ambiguous_slash <- !is.na(check1) & !is.na(check2)
sum(!invalid_slash)


# 25. How many valid ISO dates fall outside the reporting period 
# 1 Jan 2026 to 30 Jun 2026?
start_date <- as.Date("2026-01-01")
end_date <- as.Date("2026-06-30")
check_iso <- as.Date(iso_dates, format = "%Y-%m-%d")
outside <- !is.na(check_iso) & (check_iso < start_date | check_iso > end_date)
sum(outside)


# 26. How many non-missing `Satisfaction Score` values fall 
# outside the valid range 1 to 5 inclusive?
names(brewhaus)
sa <- brewhaus$Satisfaction.Score
check_sa <- (sa > 5) | (sa < 1)
sum(check_sa, na.rm = TRUE)


# 27. How many non-missing `Revenue (RM)` values are zero or negative?
sum(brewhaus$Revenue..RM. <= 0, na.rm = TRUE)


# 28. How many non-missing `No. Customers` values are zero or negative?
sum(brewhaus$No..Customers <= 0, na.rm = TRUE)


# 29. How many non-missing `Waiting Minutes` values are zero or negative?
sum(brewhaus$Waiting.Minutes <= 0, na.rm = TRUE)


# 30. How many non-missing `No. Customers` values are fractional 
# rather than whole numbers?
sum(brewhaus$No..Customers %% 1 != 0, na.rm = TRUE)


# 31. is.numeric(brewhaus[["No. Customers"]])` can return TRUE 
# even though some customer-count values violate the business rule. Explain why.
is.numeric(brewhaus[["No..Customers"]])
class(brewhaus$No..Customers)


# 32. Using the 1.5 × IQR rule for `Revenue (RM)`, 
# what is the upper outlier limit? Enter the value rounded to two decimal places.
rm <- brewhaus$Revenue..RM.
rm <- rm[!is.na(rm)]
rm_Q1 <- quantile(rm, 0.25)
rm_Q3 <- quantile(rm, 0.75)
IQR <- rm_Q3 - rm_Q1
upper_limit <- 1.5 * IQR + rm_Q3
upper_limit


# 33. Using the 1.5 × IQR rule, how many `Revenue (RM)` values 
# are flagged as potential outliers?
lower_limit <- rm_Q1 - 1.5 * IQR 
outliers <- rm[rm > upper_limit | rm < lower_limit]
length(outliers)


# 34. Using the 1.5 × IQR rule, `Waiting Minutes` has 169 flagged values and `
# No. Customers` has its own flagged values. 
# What is the sum of the potential-outlier counts for these two columns? 
# Sum flags across columns, not unique rows.
wm <- brewhaus$Waiting.Minutes
wm <- wm[!is.na(wm)]
wm_Q1 <- quantile(wm, 0.25)
wm_Q3 <- quantile(wm, 0.75)
IQR <- wm_Q3 - wm_Q1
wm_upper_limit <- 1.5 * IQR + wm_Q3
wm_lower_limit <- wm_Q1 - 1.5 * IQR 
wm_flags <- sum(wm[wm> wm_upper_limit | wm<wm_lower_limit])

nc <- brewhaus$No..Customers
nc <- nc[!is.na(nc)]
nc_Q1 <- quantile(nc, 0.25)
nc_Q3 <- quantile(nc, 0.75)
nc_IQR <- nc_Q3 - nc_Q1
nc_upper <- nc_Q3 + 1.5 * nc_IQR
nc_lower <- nc_Q1 - 1.5 * nc_IQR
nc_flags <- sum(nc > nc_upper | nc < nc_lower)

sum(wm_flags + nc_flags)


# 36. How many `Revenue Raw` records contain one of the placeholder values
# `unknown`, `not recorded`, `?`, or `RM -`?
rr = brewhaus$Revenue.Raw
sum(grepl("unknown|not recorde|RM -", rr)+grepl("?",rr))


# 37. How many `Revenue Raw` values use a `K` suffix such as `1.2K`?
sum(grepl("^[0-9]+(\\.[0-9]+)?K$",rr))


# 38. How many `Revenue Raw` values match the strict standard pattern `RM 123.45` 
# (allowing an optional minus sign before the number)?
sum(grepl("^RM -?[0-9]+(\\.[0-9]+)?$", rr))


# 39. For valid ISO dates and valid-looking `Day Type` labels (`Weekday`/`Weekend`), 
# how many rows have a Day Type that disagrees with the calendar date?
iso_dates
names(brewhaus)
dt = brewhaus$Day.Type
head(dt, 20)
dt_valids <- grepl("Weekday|Weekend", dt)
sum(dt_valids)

day <- weekdays(check_format)
expected <- ifelse(day %in% c("Saturday","Sunday"), "Weekend", "Weekday")
sum(dt[iso_dates] != expected[iso_dates], na.rm = TRUE)

# 40. How many rows are directly comparable when `Revenue Raw` matches 
# the strict standard `RM 123.45` pattern and both revenue fields are non-missing?
sum(grepl("^RM \\d+\\.\\d{2}$", rr), na.rm = TRUE)


# 41. Among the directly comparable rows, how many have different numeric values 
# between `Revenue Raw` and `Revenue (RM)`?
r <- c(brewhaus$Revenue..RM.)
rr_num <- is.numeric(sub("^RM ", "", rr))
sum(!is.na(r) & !is.na(rr_num) & r != rr_num)


# 42. Explain why cross-field validation can detect data-quality problems 
# that single-column checks may miss. 
# Use either `Transaction Date` versus `Day Type` 
# or `Revenue Raw` versus `Revenue (RM)` as an example.
str(brewhaus)


# 43. Using the rule that a code-friendly name should contain only 
# letters, digits, and underscores, how many supplied column names contain 
# spaces and/or punctuation?
col_names <- names(brewhaus)
bad_names <- col_names[!grepl("^[A-Za-z0-9_]+$" ,col_names)]
length(bad_names)






