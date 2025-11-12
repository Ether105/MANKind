%function [lifeMatx] = LiveLongerFunc(age,bmi)

DATA = readtable("DataSets\LiveLongerData.csv", range="A:D",VariableNamingRule="preserve"); %pull data

Q1 = input('How many days a month do you smoke? ');
clc;
Q2 = input('On average, how many hours per day do you spend sitting down? ');
clc;
Q3 = input('How many hours of sleep (on average) do you get a night? ');
clc;
Q4 = input('Are you overweight? ');
clc;
Q5 = input('How many drinks of alcohol do you have per week? ');
clc;
Q6 = input('From 1-10 how would you rate your typical mental health? (1 being worst, 10 being best)? ');
clc;
Q7 = input('How many hours per week do you get moderate exercise? ');





%end