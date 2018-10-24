
#re-use the code from before


readStates <- function(states)
{
    #remove rows that are not needed
    states<- states[-1,]
   
    #last row is Puerto Rico and not needed
    num.row <- nrow(states)
    states <- states[-num.row,]
    
    
    
    #delete the first four columns
    states <- states[,-1:-4]
    
    #rename the remaining columns
    colnames(states) <- c("stateName", "population", "popOver18", "percentOver18")
    
    #return the results
    return(states)

}

cleanCensus <- readStates(raw_data)
str(cleanCensus)
