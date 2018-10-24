
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

"Step B"
"Create a color coded map, based on the area of the state"
map.popColor <- ggplot(dfMerged, aes(map_id= state))
map.popColor <- map.popColor + geom_map(map = us, aes(fill= population))
map.popColor <- map.popColor + expand_limits(x=us$long, y=us$lat)
map.popColor <- map.popColor + coord_map() + ggtitle("United States color-coded by Population")

"Step C"
"Create a color coded map, based on the murderrate of the state"
map.popMurder <- ggplot(dfMerged, aes(map_id= state))
map.popMurder <- map.popMurder + geom_map(map = us, aes(fill= Murder))
map.popMurder <- map.popMurder + expand_limits(x=us$long, y=us$lat)
map.popMurder <- map.popMurder + coord_map() + ggtitle("United States color-coded by Murderrate")

"Take out the dots of Alaska and Hawai as they dont appear on the Map"
newMerged <- dfMerged[dfMerged$x > -125, ]

"Step C"
"Create Maps with circle in state center and circle sized based on population"
map.popCircle <- map.simple + geom_point(data=newMerged, aes(x=newMerged$x, y=newMerged$y, size=population, color="red"), shape = 1)
map.popCircle <- map.popCircle + ggtitle("United States with points based on Population")

"Query long and lat of center of New York"
NY <- newMerged$state[30]
NYClat <- newMerged$x[30]- 10
NYClong <- newMerged$y[30]- 10

"Step D"

map.popColor1 <- ggplot(newMerged, aes(map_id= state))
map.popColor1 <- map.popColor1 + geom_map(map = us, aes(fill= population))
map.popColor1 <- map.popColor1 + expand_limits(x=us$long, y=us$lat)
map.popColor1 <- map.popColor1 + coord_map() + ggtitle("Northeast of United States by Population") + xlim(NYClat,-60) + ylim(NYClong,50) 

map.popmurder1 <- ggplot(newMerged, aes(map_id= state))
map.popmurder1 <- map.popmurder1 + geom_map(map = us, aes(fill= Murder))
map.popmurder1<- map.popmurder1 + expand_limits(x=us$long, y=us$lat)
map.popmurder1 <- map.popmurder1 + coord_map() + ggtitle("Northeast of United States by Murderrate") + xlim(NYClat,-60) + ylim(NYClong,50) 


"Create a Map of the North East with Circles based on population size"
map.northeast <- ggplot(newMerged, aes(map_id = state))
map.northeast <- map.northeast + geom_map(map = us, fill="white", color="black")
map.northeast <- map.northeast + expand_limits(x=us$long, y=us$lat)
map.northeast <- map.northeast + coord_map() + ggtitle("Northeast of United States with Population points") + xlim(NYClat,-60) + ylim(NYClong,50)
map.northeastcircle <- map.northeast + geom_point(data=newMerged, aes(x=newMerged$x, y=newMerged$y, size=population, color="red"), shape = 1)



