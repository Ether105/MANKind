%% Defining common variables
age=input('Please enter your age: \n');
yearborn=input('Please enter the year in which you were born: \n');
country=input('Please enter the country you have lived in the most: \n','s'); 
heightft=input('Please enter your height (only ft): \n');
heightin=input('Please enter your height (only in): \n');
height=(heightft*12)+heightin; %calculates the users height only in inches
weight=input('Please enter your weight (lbs): \n');

%% Calling functions
livelongerscore=LiveLongerFunc(age,bmi); %should store outputs of the func
whodatamanagerscore=WHOdataManager(country,age); %should store outputs of the func
bmiscore=BMI(weight,height);

%% Compiling scores (?)
