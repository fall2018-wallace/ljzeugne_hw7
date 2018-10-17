
library(ggplot2)
library(ggmap)
us <- map_data("state")
dfMerged$state <- tolower(state.name)
str(dfMerged)

map.simple <- ggplot(dfMerged, aes(map_id = state))
map.simple <- map.simple + geom_map(map = us, fill="white", color="black")
map.simple <- map.simple + expand_limits(x=us$long, y =us$lat)
map.simple <- map.simple + coord_map() + ggtitle("Basic Map of continental USA")

map.popColor <- ggplot(dfMerged, aes(map_id = state))
map.popColor <- map.popColor + geom_map(map = us, aes(fill = state))
map.popColor <- map.popColor + expand_limits(x = us$long, y= us$lat)
map.popColor <- map.popColor + coord_map() + ggtitle("State Population")


map.murder <- ggplot(dfMerged, aes(map_id = state))
map.murder <- map.murder + geom_map(map = us, aes(fill = Murder))
map.murder <- map.murder + expand_limits(x = us$long, y= us$lat)
map.murder <- map.murder + coord_map() + ggtitle("State Murderrate")
