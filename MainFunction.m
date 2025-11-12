%% Defining common variables
age=input('Please enter your age: \n');
yearborn=input('Please enter the year in which you were born: \n');
country=input('Please enter the country you have lived in the most: \n','s'); 

%% Calling functions
livelongerscore=LiveLongerFunc(age); %should store outputs of the func
whodatamanagerscore=WHOdataManager(country,age); %should store outputs of the func

%% Compiling scores (?)
