#############################################
## R file for converting PDFs and cleaning  #
## text data for the paris-location-project #
#############################################

# Reads in to memory the scrubbed text data produced by janitor.R
corpus1 <- read.csv("../paris-data/project_data.csv")
