%function [lifeMatx] = LiveLongerFunc(age,bmi)
age = 11;

DATA = readtable("DataSets\LiveLongerData.csv",VariableNamingRule="preserve"); %pull data
DATA = DATA(:,[1:2 8]);                                         

Q1 = input('How many days a month do you smoke? (Enter 1 if you don''t currently but you''ve had the habit before) ');
clc;
Q2 = input('On average, how many hours per day do you spend sitting down? ');
clc;
Q3 = input('How many hours of sleep (on average) do you get a night? ');
clc;
Q4 =   % input('Are you overweight? ');
clc;
Q5 = input('How many drinks of alcohol do you have per week? ');
clc;
Q6 = input('From 1-10 how would you rate your typical mental health? (1 being worst, 10 being best)? ');
clc;
Q7 = input('How many hours per week do you get moderate exercise? ');
clc;
%% Q1
if age < 26 && Q1 < 6
    lifeMatx(1,:) = ['Smoking' 0 0]; 
elseif Q1 <= 0
    lifeMatx(1,:) = DATA(14,:);
elseif Q1 == 1
    lifeMatx(1,:) = ['Smoking' 0 0];
elseif Q1 <= 5 && Q1 > 1
    lifeMatx(1,:) = ['Smoking' -5 DATA(1,3)];
else
    lifeMatx(1,:) = DATA(1,:);
end
%% Q2
if Q2 >= 8
    lifeMatx(2,:) = DATA(2,:);
else
    lifeMatx(2,:) = ['' 0 0];
end
%% Q3
if Q3 > 8 
    lifeMatx(3,:) = DATA(3,:);
else
    lifeMatx(3,:) = ['Too much sleeping' 0 0];
end 
%% Q4
if Q4 >= 29
    lifeMatx(4,:) = DATA(4,:);
elseif Q4 >= 18 && Q4 <= 28
    lifeMatx(4,:) = [DATA(4,1) 11 'Being at a healthy weight greatly increases your health outcomes. '];
else
    lifeMatx(4,:) = ['Obesity' 0 0];


%end