

#Step A: Load and Merge Datasets
#Assign USArrest dataset to a local variable 
Arrest <- USArrests
#Assign the rownames to a variable
stateName <- rownames(Arrest)
#Delete existing rownames column from dataset
rownames(Arrest) <- NULL
#add a new column to the dataframe
dfArrest <- cbind(stateName,Arrest)
#Merge the USArrest dataset with census dataset based on state name
dfMerged <- merge(dfArrest, census, by= "stateName")
str(dfMerged)
 
