
library(ggplot2)
library(ggmap)
us <- map_data("state")
dfMerged$state <- tolower(state.name)
str(dfMerged)

"Create a simple Map of the United States"
map.simple <- ggplot(dfMerged, aes(map_id = state))
map.simple <- map.simple + geom_map(map = us, fill="white", color="black")
map.simple <- map.simple + expand_limits(x=us$long, y =us$lat)
map.simple <- map.simple + coord_map() + ggtitle("Basic Map of continental USA")

"Create a color coded map, based on the area of the state"
map.popColor <- ggplot(dfMerged, aes(map_id= state))
map.popColor <- map.popColor + geom_map(map = us, aes(fill= population))
map.popColor <- map.popColor + expand_limits(x=us$long, y=us$lat)
map.popColor <- map.popColor + coord_map() + ggtitle("State Population")

"Create a color coded map, based on the murderrate of the state"
map.popMurder <- ggplot(dfMerged, aes(map_id= state))
map.popMurder <- map.popMurder + geom_map(map = us, aes(fill= Murder))
map.popMurder <- map.popMurder + expand_limits(x=us$long, y=us$lat)
map.popMurder <- map.popMurder + coord_map() + ggtitle("State Murderrate")

map.popCircle <- map.simple + geom_point(data=dfMerged, aes(x=dfMerged$x, y=dfMerged$y), shape = 1)
