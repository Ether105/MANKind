function [lifeMatx] = LiveLongerFunc(age)

data = readtable("DataSets\LiveLongerData.csv", range="A:D",VariableNamingRule="preserve"); %pull data