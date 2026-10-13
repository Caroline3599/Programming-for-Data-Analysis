## practice 1-vector
student_ids <- c("S001", "S002", "S003", "S004", "S005", "S006")
study_hours <- c(5, 8, 3, 10, 6, 7)
attendance <- c(88, 95, 72, 98, 84, 90)
passed <- c(TRUE, TRUE, FALSE, TRUE, TRUE, TRUE)

length(student_ids)
class(study_hours)
study_hours[1]
study_hours[c(2, 4, 6)]  # position based filtering
study_hours[study_hours >= 7]   #logical based filtering
mean(study_hours)
max(attendance)

student_ids[3]
attendance[attendance <= 85]
median(study_hours)
round(mean(passed),4)*100

high_attendance <- c(90, 95, 98)

## practice 2-list
module_info <- list(
  code = "CT127-3-2",
  title = "Programming for Data Analysis",
  week = 2,
  tools = c("R", "RStudio"),
  labe_completed = FALSE
)

module_info$code
module_info$tools
str(module_info)

satisfaction <- factor(
  c("Medium", "High", "Low", "High", "Medium", "High"),
  levels=c("Low","Medium","High"),
  ordered=TRUE
)

satisfaction
levels(satisfaction)
table(satisfaction)

module_info[5] <- TRUE
module_info[5]
module_info$student_name <- "Caroline"

as.integer(satisfaction)

## practice 3-data frame
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
str(student_survey)
dim(student_survey)
names(student_survey)
head(student_survey)


student_survey[c(1, 3)]
student_survey[2][student_survey[2] >= 7]
student_survey[1][student_survey[6] == TRUE & student_survey[3] >= 90]

# filter by columns
student_survey[, c("StudentID", "Attendance")]
# filter by rows
student_survey[student_survey$StudyHours >= 7,]

student_survey$EngagementScore <- (student_survey$StudyHours + student_survey$Attendance)/10
student_survey$EngagementScore

student_survey$Attendance[order(student_survey$Attendance, decreasing = TRUE)]
student_survey[order(-student_survey$Attendance)]

## Practice 4-import csv
write.csv(student_survey,"student_survey.csv",row.names=FALSE)
imported_survey<-read.csv("student_survey.csv",stringsAsFactors=FALSE)
head(imported_survey)
str(imported_survey)
dim(imported_survey)
names(imported_survey)
sum(is.na(imported_survey))
anyDuplicated(imported_survey$StudentID)
nrow(student_survey)
ncol(student_survey)
summary(student_survey)


getwd() # get work directly
setwd("C:\\Users\....")
write.csv(dataframe, "file name", row.names = FALSE)


## Independent task
new_students <- data.frame(
  StudentID = c("S007", "S008", "S009", "S010"),
  StudyHours = c(4, 9, 6, 8),
  Attendance = c(75, 92, 85, 96),
  PreferredDevice = c("Tablet", "Laptop", "Laptop", "Tablet"),
  Satisfaction = factor(c("Low", "High", "Medium", "High"), levels = c("Low", "Medium", "High"), ordered = TRUE),
  Passed = c(FALSE, TRUE, TRUE, TRUE),
  stringsAsFactors = FALSE
  
)

base_student_survey <- student_survey[,1:6]

student_survey_extended <- rbind(base_student_survey, new_students)
student_survey_extended$EngagementScore <- student_survey_extended$StudyHours + (student_survey_extended$Attendance / 10)
print(student_survey_extended)

duplicated_check <- anyDuplicated(student_survey_extended$StudentID)
cat("duplicates?", duplicated_check, "\n")

help(all)
