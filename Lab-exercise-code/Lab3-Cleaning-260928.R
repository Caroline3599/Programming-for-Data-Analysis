# practice 1
data(package = "datesets")
?iris
data("iris")
head(iris)
head(iris)
str(iris)

data("iris")
head(iris)
dim(iris)
names(iris)
str(iris)
table(iris$Species)
help(iris)

tail(iris, 6) # # last six rows
head(iris, 10) # first ten rows

nrow(iris) # num of rows
ncol(iris) # number of columns
names(iris) # number of names
rownames(iris)[6] # first six row names[,6]

class(iris)  # dataset is a file, dataframe is a table
sapply(iris, class) # class of column
str(iris) # structure
summary(iris) # summary

sepal_length <- iris$Sepal.Length # extract sepal.Length as vector
class(sepal_length) # class
typeof(sepal_length) # storage type
length(sepal_length) # length

class(iris$Species) # class
typeof(iris$Species) # storage type
levels(iris$Species) # levels
unique(iris$Species) # unique value
table(iris$Species) # frequency
prop.table(table(iris$Species)) #proportions for species

iris[1:8, c("Sepal.Length", "Petal.Length", "Species")]  # rows 1 to 8

min(sepal_length) # minimum
max(sepal_length) # maximum
range(sepal_length) # range
mean(sepal_length) # mean
median(sepal_length) # median
sd(sepal_length) # standard deviation
var(sepal_length) # variance
quantile(sepal_length) # quartiles
IQR(sepal_length) # itnerquartile range

# histogram of sepal.length
hist(
  sepal_length,
  main = "Histogram of Sepal Length",
  xlab = "Sepal Length",
  ylab = "Frequency",
  col = "lightblue"
)

# Boxplot of Sepal.Length grouped by Species
boxplot(
  Sepal.Length ~ Species,
  data = iris,
  main = "Sepal Length by Species",
  xlab = "Species",
  ylab = "Sepal Length",
  col = c("pink", "lightgreen", "lightblue")
)

# practice 2
data("airquality")
head(airquality)
colSums(is.na(airquality))
mean(airquality$Ozone,na.rm=TRUE)

?airquality
head(airquality, 6)
tail(airquality, 6)
dim(airquality)
names(airquality)
str(airquality)
summary(airquality)

is.na(airquality[1:10,])
any(is.na(airquality))

sum(is.na(airquality)) # count of all missing cells
colSums(is.na(airquality)) # count of all missing cells in columns
sum(complete.cases(airquality))
sum(!complete.cases(airquality))
100 * mean(complete.cases(airquality)) # proportion of complete rows

sum(is.na(airquality$Ozone)) # Ozone missing values
sum(airquality$Ozone == 0, na.rm = TRUE) # Ozone zero values

# summary excludingmissing values
mean(airquality$Ozone, na.rm = TRUE)
median(airquality$Ozone, na.rm = TRUE)
min(airquality$Ozone, na.rm = TRUE)
max(airquality$Ozone, na.rm = TRUE)
range(airquality$Ozone, na.rm = TRUE)
sd(airquality$Ozone, na.rm = TRUE)
fivenum(airquality$Ozone, na.rm = TRUE)

# quantiles
quantile(
  airquality$Temp,
  probs = c(0, 0.25, 0.50, 0.75, 1)
)

# count duplicates
sum(duplicated(airquality))
anyDuplicated(airquality)
sum(duplicated(airquality[, c("Month", "Day")]))
anyDuplicated(airquality[, c("Month", "Day")])

# list unique months and count records for month
names(airquality)
unique(airquality$Month)
table(airquality$Month)

hist(
  airquality$Ozone,
  main = "Histogram of Ozone",
  xlab = "Ozone",
  ylab = "Frequency",
  col = "lightblue"
)

boxplot(
  airquality$Ozone,
  main = "Boxplot of Ozone",
  ylab = "Ozone",
  col = "lightgreen"
)


# practice 3
data("mtcars")
table(mtcars$cyl)
?mtcars

names(mtcars)
dim(mtcars)
head(mtcars, 6)
str(mtcars)
summary(mtcars)

unique(mtcars$cyl)
table(mtcars$cyl,mtcars$am)
table(mtcars$cyl)

tt <- table(mtcars$cyl,mtcars$am)
tt
prop.table(tt, margin = 1)

pro.table(table(mtcars$cy1, mtcars$am), 1)


subset(
  mtcars,
  cyl == 4,
  select = c(mpg, hp, am)
)

which(mtcars$mpg > 30)
mtcars[
  mtcars$mpg > 30,
  c("mpg", "cyl","am")
]

sort(mtcars$mpg, decreasing = TRUE)
mtcars[order(mtcars$mpg, decreasing = TRUE)[1:5],c("mpg", "cyl", "am")]

aggregate(mpg ~ cyl, data = mtcars, FUN = mean) # grouping together
aggregate(mpg ~ am, data = mtcars, FUN = median) # aggerate with mpg group by am
tapply(mtcars$mpg, mtcars$cyl, mean)
?tapply

cor(mtcars$mpg, mtcars$wt)



