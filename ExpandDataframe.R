
dfMerged <- data.frame(dfMerged, state.name, state.area, state.center)
dfMerged$center <- NULL

str(dfMerged)
