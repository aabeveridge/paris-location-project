############################################
## R file for Scrubbing Data for Analysis ##
############################################
library(pdftools)
library(tm)
library(stringi)

#Set the working directory for the project
setwd("/home/aaron/Desktop/kayla_R/pdf-texts")

#Read in the files and convert PDFs to text and then create two vectors of text data and book titles
files <- list.files(full.names=TRUE)
text_files <- numeric(0)
text_names <- numeric(0)
for (i in 1:length(files)){
  text1 <- pdf_text(files[i])
  text1 <- stri_flatten(text1)
  text_files <- append(text_files, text1)
  text_names <- append(text_names, paste0(files[i]))
  print(files[i])
  rm(text1)
}

corpus1 <- text_files

#Clean the text and remove punctuation, remove special characters, remove numbers, and make it all lowercase
corpus1 <- tolower(corpus1)
corpus1 <- gsub("\n", " ", corpus1, fixed = TRUE)
corpus1 <- gsub("-", " ", corpus1, fixed = TRUE)
corpus1 <- removePunctuation(corpus1, preserve_intra_word_dashes = TRUE)
corpus1 <- stripWhitespace(corpus1)

#Create data frame from txt files and file names
project_data <- data.frame(corpus1, text_names)
names(project_data) <- c("text", "title")

#Write to file the cleaned project_data
write.csv(project_data, file="/home/aaron/Desktop/kayla_R/project_data.csv")
