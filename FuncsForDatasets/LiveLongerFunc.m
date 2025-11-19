function lifeMatx = LiveLongerFunc(age, bmi)

DATA = readtable("DataSets\LiveLongerData.csv", VariableNamingRule="preserve");
DATA = DATA(:, [1:2 8]);   % factor | val | note

% fix data
lifeMatx = cell2table(cell(0,3), 'VariableNames', {'Factor','Value','Note'});

%% ------------------- Q1: SMOKING -------------------
Q1 = input('How many days a month do you smoke? (Enter 1 if you don''t currently but you''ve had the habit before) ');
clc;

if age < 26 && Q1 < 6
    lifeMatx(1,:) = {"Smoking", 0, ""};
elseif Q1 <= 0
    lifeMatx(1,:) = DATA(14,:);
elseif Q1 == 1
    lifeMatx(1,:) = {"Smoking", 0, ""};
elseif Q1 <= 5 && Q1 > 1
    lifeMatx(1,:) = {"Smoking", -5, DATA{1,3}};
else
    lifeMatx(1,:) = DATA(1,:);
end

%% ------------------- Q2: SITTING -------------------
Q2 = input('On average, how many hours per day do you spend sitting down? ');
clc;

if Q2 >= 8
    lifeMatx(2,:) = DATA(2,:);
else
    lifeMatx(2,:) = {"Sitting", 0, ""};
end

%% ------------------- Q3: SLEEP -------------------
Q3 = input('How many hours of sleep (on average) do you get a night? ');
clc;

if Q3 > 8
    lifeMatx(3,:) = DATA(3,:);
else
    lifeMatx(3,:) = {"Sleep", 0, "Too much sleeping"};
end

%% ------------------- Q4: BMI -------------------
Q4 = bmi;
clc;

if Q4 >= 29
    lifeMatx(4,:) = DATA(4,:);
elseif Q4 >= 18 && Q4 <= 28
    lifeMatx(4,:) = {DATA{4,1}, 11, "Being at a healthy weight greatly increases your health outcomes."};
else
    lifeMatx(4,:) = {"Obesity", 0, ""};
end

%% ------------------- Q5: ALCOHOL -------------------
Q5 = input('How many drinks of alcohol do you have per week? ');
clc;

if Q5 > 14
    lifeMatx(5,:) = DATA(5,:);
else
    lifeMatx(5,:) = {"Alcohol", 0, ""};
end

%% ------------------- Q6: MENTAL HEALTH -------------------
Q6 = input('From 1–10, how would you rate your mental health? ');
clc;

if Q6 <= 4
    lifeMatx(6,:) = DATA(6,:);
else
    lifeMatx(6,:) = {"Mental Health", 0, ""};
end

%% ------------------- Q7: EXERCISE -------------------
Q7 = input('How many hours per week do you get moderate exercise? ');
clc;

if Q7 < 2
    lifeMatx(7,:) = DATA(7,:);
else
    lifeMatx(7,:) = {"Exercise", 0, ""};
end

end
