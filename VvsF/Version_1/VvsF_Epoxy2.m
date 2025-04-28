close all; clear all; clc;

%Chopper data was taken from 40% to 60% peak height avoiding jutting part of
%graph. There distance from the lens to the chopper blade was measured and
%the transition time from 40% to 60% was colleceted spacing out the data
%every 0.5 cm. This data was then used to fit a regression plot and the
%focus was solved for when the regression crossed the 0 axis. Due to non
%idealites with the beam not coming to a point, data where there was
%no/verry little change between points was ignored and not fit into the
%regression model.

Profilm_V     = [0 42 92 140 186 190 240 282 300 315 342 374];
Profilm_D     = [0.85 0.215 0.385 0.775 1.75 1.77 2.545 3.64 3.655 4.31 5.71 6.01]; %um
Chopper_V     = [250 275 300 325 350];
Chopper_F     = [164.1 122.5 101.42 91.03 71.8];           %mm
InterFer_V    = [0 23 50 71 93 119 144 166 195 214 236 260 284 308 332 360];
InterFer_Frng = [2 2 2 3 3 5 5 6 7 8 9 11 13 15 19 22];    %num of fringe

%Convert to deflection
InterFer_D    = (InterFer_Frng.*(633/2)).*0.001;           %um

%Convert to Focus Length
Profilm_F_Predict = [];
InterFer_F_Predict = [];

for i = 1:length(Profilm_D)
    Profilm_F_Predict = [Profilm_F_Predict (1.5^2)/(4*Profilm_D(i)*0.001)];     %mm
end

for i = 1:length(InterFer_D)
    InterFer_F_Predict  = [InterFer_F_Predict (1.5^2)/(4*InterFer_D(i)*0.001)]; %mm
end

%Plot Data Theory vs measured for my stuff

figure(1); plot(Chopper_V, Chopper_F); hold on; title("Voltage vs Focus Plot");
ylabel("Focoal Length [mm]"); xlabel("Voltage Across Device [V]");
plot(Profilm_V, Profilm_F_Predict); plot(InterFer_V,InterFer_F_Predict); 
xlim([225 375]); ylim([50 300]); legend("Chopper Data", ...
    "Interferometer Prediction", "Profilm " + "Prediction", ...
    Location="northeast"); hold off;
