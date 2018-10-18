
library(ggplot2)
library(ggmap)
library(RColorBrewer)
us <- map_data("state")
dfMerged$state <- tolower(state.name)


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

"Take out the dots of Alaska and Hawai as they dont appear on the Map"
newMerged <- dfMerged[dfMerged$x > -125, ]

"Create Maps with circle in state center and circle sized based on population"
map.popCircle <- map.simple + geom_point(data=newMerged, aes(x=newMerged$x, y=newMerged$y, size=population, color="red", fill="red"), shape = 1)

"Query long and lat of center of New York"
NY <- newMerged$state[30]
NYClat <- newMerged$x[30]- 10
NYClong <- newMerged$y[30]- 10

"Create a Map of the North East with Circles based on population size"
map.northeast <- ggplot(newMerged, aes(map_id = state))
map.northeast <- map.northeast + geom_map(map = us, fill="white", color="black")
map.northeast <- map.northeast + expand_limits(x=us$long, y=us$lat)
map.northeast <- map.northeast + coord_map() + ggtitle("Map of Northeast") + xlim(NYClat,-60) + ylim(NYClong,50)
map.northeastcircle <- map.northeast + geom_point(data=newMerged, aes(x=newMerged$x, y=newMerged$y, size=population, color="red", fill="red"), shape = 1)



