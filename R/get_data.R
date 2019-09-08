###IMPORTS
library(dplyr)
library(readxl)

##Get GIAS location data
gias <- "Data/edubasealldata20190908.csv" %>%
  read.csv(stringsAsFactors = FALSE) %>%
  select(URN,
         Name = EstablishmentName,
         Status = EstablishmentStatus..code.,
         Phase_name = PhaseOfEducation..name.,
         Phase_code = PhaseOfEducation..code.,
         Easting,
         Northing) %>%
  filter(Status %in% c(1,3) & Phase_code == 2)

##Get Ofsted data
ofsted <- "Data/Management_information_-_schools_-_31_July_2019.xlsx" %>%
  read_xlsx(sheet = "Most recent inspections",
            skip = 1) %>%
  select(URN,
         Ofsted_rating = `Overall effectiveness`)


#Join
primaries <- gias %>%
  left_join(ofsted, by = "URN")
