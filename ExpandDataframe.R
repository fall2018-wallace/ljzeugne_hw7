
"Add state, area, and center column to the previous dataset"
dfMerged <- data.frame(dfMerged, state.name, state.area, state.center)

str(dfMerged)
