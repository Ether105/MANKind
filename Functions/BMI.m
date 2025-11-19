function bmi = BMI(height_in, weight_lb)

% convert metric
height_m = height_in * 0.0254;
weight_kg = weight_lb * 0.453592;

bmi = weight_kg / (height_m ^ 2);

end
