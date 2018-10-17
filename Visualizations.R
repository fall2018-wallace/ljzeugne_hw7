
library(ggplot2)
library(ggmap)
us <- map_data("state")
dfMerged$state <- tolower(state.name)
dfMerged$area <- NULL
str(dfMerged)
