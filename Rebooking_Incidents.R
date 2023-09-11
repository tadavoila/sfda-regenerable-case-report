library(readr)
library(dplyr)
rstudioapi::writeRStudioPreference("data_viewer_max_columns", 1000L)

incident_locations <- read_csv("Outputs/combined_data.csv")
incident_locations$INCIDENT_NO <- as.character(incident_locations$INCIDENT_NO)

rebooking_cases <- read_csv("Data/Rebooking Case Level.csv")

rebooking_incidents <- inner_join(incident_locations, 
                                  rebooking_cases, 
                                  by = c("INCIDENT_NO" = "Incident.Number"),
                                  multiple = "all")
rebooking_incidents$ADDRESS <- paste(rebooking_incidents$HOUSE_NO, rebooking_incidents$STREET_NAME)

rebooking_incidents <- cbind(rebooking_incidents[, 1:6], ADDRESS = rebooking_incidents$ADDRESS, rebooking_incidents[, 7:ncol(rebooking_incidents)-1])

write.csv(rebooking_incidents, file = "Outputs/rebooking_incidents.csv", row.names = FALSE)
