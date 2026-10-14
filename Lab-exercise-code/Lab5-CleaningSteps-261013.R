# question one
# i) R code to import Brewhaus_dataset.csv :
brewhaus <- read.csv("Brewhaus_dataset.csv")
dim(brewhaus)
  
# ii) R code to create an independent working copy called brewhaus_clean:
brewhaus_clean <- brewhaus


# iii) R code to assign standard snake_case column names:
names(brewhaus_clean)
gsub("\\.", "_", names(brewhaus_clean))

  
# iv) Updated column names:
names(brewhaus_clean) <- gsub("\\.", "_", names(brewhaus_clean))


# question 2
# i) Original row and column counts:
dim(brewhaus_clean)
  
# ii) R Code to remove exact duplicates:
sum(duplicated(brewhaus_clean))
dim(unique(brewhaus_clean))
brewhaus_clean <- unique(brewhaus_clean)

# iii) Remaining row and column counts:
dim(brewhaus_clean)
  
# iv) Count of duplicate rows removed:
sum(duplicated(brewhaus))


# Question 3

# i) R code to extract character columns:
str(brewhaus_clean)
char_col_temp <- sapply(brewhaus_clean, is.character)
char_col <- names(brewhaus_clean)[char_col_temp]

# ii) R code to trim leading/trailing whitespace across all text columns 
# and convert all empty strings to explicit NA:
char_df <- brewhaus_clean[,char_col]
char_df <- as.data.frame(lapply(char_df, function(x) {
  x <- trimws(x)
  x[x == ""] <- NA
  x
}))
class(char_df)

# iii) R code to verify no more blank character columns:
colSums(sapply(char_df, function(x) x == ""), na.rm = TRUE)


# Question 4
# i)R code to identify missing, malformed, and repeated transaction IDs:
id <- brewhaus_clean$Transaction_ID
blank_id <- id == "" | is.na(id)
invalid_id <- blank_id| !grepl("^BH[0-9]{6}$", id)

  
# ii) R code to flag them as id_unresolved:
unresolved_id <- invalid_id

  
# iii)R code to set the unresolved ids to NA:
id[unresolved_id] <- NA


# Question 5

# i) R code to count unique values for Payment Method and Customer Type values 
# before standardisation:
pm <- brewhaus_clean$Payment_Method
ct <- brewhaus_clean$Customer_Type
length(unique(pm))
length(unique(ct))

  
# ii) R code to standardise Payment Method values:
library(dplyr)
table(pm)
pm_clean <- unique(gsub("[ -_]", "",trimws(tolower(pm))))


  
# iii) R code to standardise Customer Type values:

  
# iv) R code to count unique values for Payment Method and Customer Type values 
# after standardisation:


# Question 6
# i)R code to set invalid payment methods to NA:

  
# ii) R code to set invalid customer types to NA:


# Question 7
# Write R code to clean the transaction date column


# Quesiton 8
# Write R code to derive Day Type from non NA dates from the cleaned dates
