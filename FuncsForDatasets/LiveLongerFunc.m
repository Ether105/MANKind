function lifeMatx = LiveLongerFunc(age, bmi)

% Load dataset
DATA = readtable("DataSets\LiveLongerData.csv", VariableNamingRule="preserve");
DATA = DATA(:, [1:2 8]);   % Keep only 3 columns (factor | value | note)

% Output table initialized
lifeMatx = table(strings(0,1), zeros(0,1), strings(0,1), 'VariableNames', {'Factor','Value','Note'});

%% ------------------- Q1: SMOKING -------------------
Q1 = input('How many days a month do you smoke? (Enter 1 if you don''t currently but used to) ');
clc;

if age < 26 && Q1 < 6
    lifeMatx(1,:) = {"Smoking", 0, ""};

elseif Q1 <= 0
    lifeMatx(1,:) = {DATA{1,1}, -5, DATA{1,3}};

elseif Q1 == 1
    lifeMatx(1,:) = {"Smoking", 0, ""};

elseif Q1 > 1 && Q1 <= 5
    lifeMatx(1,:) = {"Smoking", -5, DATA{1,3}};

else
    lifeMatx(1,:) = {DATA{1,1}, DATA{1,2}, DATA{1,3}};
end


%% ------------------- Q2: SITTING -------------------
Q2 = input('On average, how many hours per day do you spend sitting? ');
clc;

if Q2 >= 8
    lifeMatx(2,:) = {DATA{2,1}, DATA{2,2}, DATA{2,3}};
else
    lifeMatx(2,:) = {"Sitting Down", 0, ""};
end


%% ------------------- Q3: SLEEP -------------------
Q3 = input('How many hours of sleep (on average) do you get a night? ');
clc;

if Q3 > 8
    lifeMatx(3,:) = {DATA{3,1}, DATA{3,2}, DATA{3,3}};
elseif Q3 < 5 
    lifeMatx(3,:) = {"Sleep", -5, "Sleeping less than 6 hours a night is linked to cardiovascular events that can signifigantly reduce your lifespan. "};
else
    lifeMatx(3,:) = {"Sleep", 0, ""};
end


%% ------------------- Q4: BMI -------------------
Q4 = bmi;
clc;

if Q4 >= 29
    lifeMatx(4,:) = {DATA{4,1}, DATA{4,2}, DATA{4,3}};

elseif Q4 >= 18 && Q4 <= 28
    lifeMatx(4,:) = {DATA{4,1}, 11, "Being at a healthy weight greatly increases your health outcomes."};

else
    lifeMatx(4,:) = {"BMI", 0, ""};
end


%% ------------------- Q5: ALCOHOL -------------------
Q5 = input('How many drinks of alcohol (on avg.) do you have per week? ');
clc;

if Q5 > 9
    lifeMatx(5,:) = {DATA{7,1}, DATA{7,2}, DATA{7,3}};
else
    lifeMatx(5,:) = {DATA{7,1}, 0, ""};
end


%% ------------------- Q6: MENTAL HEALTH -------------------
Q6 = input('From 1–10 (1 being best 10 being worst), how would you rate your mental health? ');
clc;

Q6 = abs(11-Q6);

if Q6 > 10     % checks if its in bounds and adjusts # to work w formula
    Q6 = 10; 
elseif Q6 <= 3
    Q6 = 3; 
end

if Q6 == 3
    lifeMatx(6,:) = {DATA{9,1}, 0, ""};
else
    plce = -25 * (Q6 * 0.1);                     % linear equation equating rating to years
    lifeMatx(6,:) = {DATA{9,1}, plce, DATA{9,3}};
end


%% ------------------- Q7: EXERCISE -------------------
Q7 = input('How many hours per week do you get moderate exercise? ');
clc;

if Q7 >= 2 && Q7 < 5
    lifeMatx(7,:) = {DATA{21,1}, 2, DATA{21,3}};
elseif Q7 >= 5 
    lifeMatx(7,:) = {DATA{21,1}, 4, DATA{21,3}};
end


if Q7 >= 2 && Q1 == 0 && Q4 < 29
    lifeMatx(8,:) = {DATA{14,1}, 8, DATA{14,3}};
end
end