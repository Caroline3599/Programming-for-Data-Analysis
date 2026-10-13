# Practice 2
student_name <- "DYQ"
week_number <- 1
course_fee <- 125.5
number_of_students <- 28

total_fee <- course_fee * number_of_students
average_fee <- mean(c(120, 125.5, 130, 124.5))

student_name
total_fee # total fee of all enrolled student
average_fee
class(student_name) # check data type
class(week_number)
class(course_fee)

help(c)

module_code <- "CT127-3-2"
is_lab_session <- TRUE
class(module_code)
class(is_lab_session)


# R is a case sensitive language, e.g.abc != ABC
# character(string), numeric(float/int), logical(boolean), vector(list/array)
ls()


# Practice 3
morning_sales <- 850
afternoon_sales <- 1120
evening_sales <- 940
online_sales <- 430

total_sales <- morning_sales + afternoon_sales + evening_sales + online_sales
average_sales <- total_sales / 4

total_sales
average_sales

online_percent <- (online_sales / total_sales)* 100 
higher_afternoon <- afternoon_sales - morning_sales
paste(round(online_percent,2), "%")
higher_afternoon

total_sales > 3000

# Practice 4
total_cost <- 500+250
studentName <- "Kulothunkan"
mean(c(10, 20, 30))
sqrt(64)
TotalSales <- 3000
TotalSales


Monday_sales <- 120
Tuesday_sales <- 170
Wednesday_sales <- 333
Thursday_sales <- 555
total <- Monday_sales + Tuesday_sales + Wednesday_sales + Thursday_sales
MEAN <- mean(c(Monday_sales, Tuesday_sales, Wednesday_sales, Thursday_sales))
MAX <- max(Monday_sales, Tuesday_sales, Wednesday_sales,Thursday_sales)
MIN <- min(Monday_sales, Tuesday_sales, Wednesday_sales,Thursday_sales)
difference <- MAX - MIN
difference
MEAN >= 1000

100 -> hello
hello # sign direction is important

# Collect, Store, Clean, Analyze, Visiualization, Decision, Govern
length(ls())
names(table(ls()))
head(table(ls()))
summary(ls())
table(ls())
prop.table(table(ls()))
cor(MAX, MIN)