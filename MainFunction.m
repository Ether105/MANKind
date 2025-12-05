%% Defining common variables 
clc;
clear;
age = input('Please enter your age: \n');
clc;
yearborn = currentYear - age;
clc;

heightft = input('Please enter your height in ft (ex: 6, not 6''3): \n');
clc;
heightin = input('Please enter the rest of your height (in inches): \n');
clc;

height = (heightft*12)+heightin; %calculates the users height only in inches
clc;
weight = input('Please enter your weight (lbs): \n');
clc;
country = input('Please enter the country you have lived in the most (e.g. United States): \n','s'); 
clc;
%% Calling functions
bmiscore = BMI(height,weight);
livelongermatrix = LiveLongerFunc(age,bmiscore); %should store outputs of the func
estimatedAvgLife = WHOdataManager(country,age); %should store outputs of the func

%% Compiling scores
yearsgainedlost = sum(livelongermatrix(:,2)); % sums all effects of lifestyle choices
yearsgainedlost = yearsgainedlost{:,:}; %
notes=livelongermatrix{:,3}; % saves relevant notes about users lifestyle

nonEmptyStrings = notes(notes ~= ""); % cleans up empty boxes

sentenceMatrix = string(nonEmptyStrings);

fprintf('Notes about your lifestyles: \n');
disp(sentenceMatrix)
fprintf('\nYears that you gained/lost from the avg: \n\n %.0f\n', yearsgainedlost);
input('Press enter to plot. ')
plotting(yearsgainedlost,age)

%% Calculating lifespan (not shown to user)
lifeScore = estimatedAvgLife + yearsgainedlost;
time = (yearborn + lifeScore) - currentYear;