function k = plotting(deltaYears,age)

if age < 13
    age = 0; % assigns gen alpha to 0
elseif age < 28 && age >= 13
    age = 1; % assigns gen z as 1
elseif age < 45 && age >= 29
    age = 2; % assigns millenial to 2
elseif age < 61 && age >= 45
    age = 3; % assigns gen x to 3
else
    age = 3;
end

Participant = 1:10;

GenAlpha_Yearsgainedorlost = [8 18 21 10 10 11 1 8 20 23 ];
GenZ_Yearsgainedorlost = [11 -12 23 2 18 23 -14 -17 -18 6];
Millennial_Yearsgainedorlost = [-2 -2 15 10 -10 0 18 -5 -2 16];
GenX_Yearsgainedorlost = [-9 -10 -8 -2 3 10 6 5 4 -8];

figure(1)
tiledlayout 
nexttile 
bar(Participant, GenAlpha_Yearsgainedorlost, 'r')
title('Years gained or lost in Gen Alpha')
xlabel('Participant')
ylabel('Years gained or lost')

nexttile
bar(Participant, GenZ_Yearsgainedorlost, 'b')
title('Years gained or lost in Gen Z')
xlabel('Participant')
ylabel('Years gained or lost')

nexttile
bar(Participant, Millennial_Yearsgainedorlost, 'm')
title('Years gained or lost in Millennials')
xlabel('Participant')
ylabel('Years gained or lost')

nexttile
bar(Participant, GenX_Yearsgainedorlost, 'g')
title('Years gained or lost in Gen X')
xlabel('Participant')
ylabel('Years gained or lost')

figure(2)
x = ["Gen Alpha", "GenZ", "Millennial", "GenX"];
y = [mean(GenAlpha_Yearsgainedorlost), ...
     mean(GenZ_Yearsgainedorlost), ...
     mean(Millennial_Yearsgainedorlost), ...
     mean(GenX_Yearsgainedorlost)];

bottom = y;
top = zeros(1,4);

if age >= 0 && age <= 3
    genIndex = age + 1;
    userVal  = deltaYears;
    avgVal   = y(genIndex);

    if userVal >= avgVal
        bottom(genIndex) = userVal; 
        top(genIndex) = avgVal;   
    else
        bottom(genIndex) = avgVal;  
        top(genIndex) = userVal; 
    end
end

b = bar(x, [bottom; top]', 'stacked');

b(1).FaceColor = [0 0 1]; 
b(2).FaceColor = [0.8 0 0];  

legend({'Average for Generation', 'User Value'}, ...
       'Location', 'northeast')

title('Average Lifespan Impact vs User Impact')
xlabel('Generation')
ylabel('Years Gained')



end