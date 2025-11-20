%% Defining common variables
clc;
clear;
age=input('Please enter your age: \n');
clc;
yearborn=input('Please enter the year in which you were born: \n');
clc;

heightft=input('Please enter your height in ft (ex: 6, not 6''3): \n');
clc;
heightin=input('Please enter the rest of your height (in inches): \n');
clc;

height=(heightft*12)+heightin; %calculates the users height only in inches
clc;
weight=input('Please enter your weight (lbs): \n');
clc;
country=input('Please enter the country you have lived in the most (e.g. United States): \n','s'); 
clc;
%% Calling functions
bmiscore=BMI(height,weight);
livelongermatrix=LiveLongerFunc(age,bmiscore); %should store outputs of the func
whodatamanagerscore=WHOdataManager(country,age); %should store outputs of the func

%% Compiling scores (?)
yearsgainedlost=sum(livelongermatrix(:,2));
yearsgainedlost=yearsgainedlost{:,:};
notes=livelongermatrix{:,3};
%notes=livelongermatrix(:,3);
%nonEmptyCells = notes(~cellfun(@isempty, notes));
%sentence = strjoin(nonEmptyCells, ' '); % Joins with a space as delimiter
%      disp(sentence);

nonEmptyStrings = notes(notes ~= ""); 
nonEmptyStrings(:,1) = eraseBetween(nonEmptyStrings(:,1),1,1);
%nonEmptyStrings = notes(~ismissing(notes)); 
sentenceMatrix = string(nonEmptyStrings);
%fprintf('Notes about your lifestyles: \n',sentenceMatrix);
%fprintf('Notes about your lifestyles: \n''%s''\n',sentenceMatrix);
fprintf('\nNotes about your lifestyles: \n''%s',sentenceMatrix);
fprintf('\n \nYears that you gained/lost: \n %d\n', yearsgainedlost);
%fprintf('Years that you gained/lost: \n', yearsgainedlost);
%livelongermatrix=livelongermatrix{:,:}