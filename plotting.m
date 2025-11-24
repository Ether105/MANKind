Participant = [1:10];
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
x = ["Gen Alpha", "GenZ", "Millennial", "GenX"]
y = [mean(GenAlpha_Yearsgainedorlost), mean(GenZ_Yearsgainedorlost), mean(Millennial_Yearsgainedorlost), mean(GenX_Yearsgainedorlost)]
bar(x, y, 'c')
title('Average years lost of gained of each generation')
xlabel('Generation')
ylabel('Average years gained or lost')