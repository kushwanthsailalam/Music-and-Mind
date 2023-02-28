Music <- read.transactions("baskettt_data.csv",
                           rm.duplicates = FALSE, 
                           format = "basket",  ##if you use "single" also use cols=c(1,2)
                           sep=",",  ## csv file
                           cols=NULL) ## The dataset has no row numbers
inspect(Music)

##### Use apriori to get the RULES
Mrules = arules::apriori(Music, parameter = list(support=.15, 
                                                 confidence=.5, minlen=2))
inspect(Mrules)


## Plot of which items are most frequent
itemFrequencyPlot(Music, topN=20, type="absolute")

# Sort rules by support
SortedRulesSupport <- sort(Mrules, by = "support", decreasing = TRUE)
top15support <- head(SortedRulesSupport, n = 15)
inspect(top15support)

# Sort rules by confidence
SortedRulesConfidence <- sort(Mrules, by = "confidence", decreasing = TRUE)
top15confidence <- head(SortedRulesConfidence, n = 15)
inspect(top15confidence)

# Sort rules by lift
SortedRulesLift <- sort(Mrules, by = "lift", decreasing = TRUE)
top15lift <- head(SortedRulesLift, n = 15)
inspect(top15lift)


## Visualize
## tcltk

subrules <- head(sort(SortedRules, by="lift"),10)
plot(subrules)

#plot(subrules, method="graph", engine="interactive")
plot(subrules, method="graph", engine="htmlwidget")