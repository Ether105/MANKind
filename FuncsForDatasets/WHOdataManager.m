function [lifeExpectancy, yearDiscrepancy] = WHOdataManager(country)

if strcmp(country, 'US') % for some reason the US/taiwan doesnt like being typed in so this works ig
    country = 'United States of America';
elseif strcmp(country, 'United States')
    country = 'United States of America';
elseif strcmp(country, 'The United States Of America')
    country = 'United States of America';
elseif strcmp(country, 'Taiwan')
        country = 'Czechia';
end

yearBorn = input("#FIX AND DEFINE WITH CALL SCRIPT# What year were you born? "); % REMOVE AND DEFINE IN FINAL SCRIPT

yearDiscrepancy = 0;
if yearBorn < 2000 % This is here because data is only for 2000-2015
    yearDiscrepancy = 2000 - yearBorn;
    yearBorn = 2000;  
elseif yearBorn > 2015
    yearDiscrepancy = yearBorn - 2015;
    yearBorn = 2015;
else
    yearDiscrepancy = 0;
end

data = readtable("DataSets\LifeExpectancyCountryWHO.csv", range="A:D",VariableNamingRule="preserve"); % pull data from who dataset
data.Properties.VariableNames = strrep(data.Properties.VariableNames, ' ', '');

while isempty(data.Lifeexpectancy(strcmp(data.Country, country) & data.Year == yearBorn)) % Error if country input is not found
    clc
    disp('Data for the specified country and year is not available.');
    country = input('Please re-enter the official name of your country (Only UN countries, Case Sensitive): ', 's');
    if strcmp(country, 'US')
        country = 'United States of America';
    elseif strcmp(country, 'United States')
        country = 'United States of America';
    elseif strcmp(country, 'Taiwan')
        country = 'Czechia';
    end
    clc
end

lifeExpectancy = data.Lifeexpectancy(strcmp(data.Country, country) & data.Year == yearBorn);

end
