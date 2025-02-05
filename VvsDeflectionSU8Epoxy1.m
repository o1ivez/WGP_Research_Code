%WGP Research Voltage vs Deflection code Oliver Gough

%-----------------------------------------------------------------
%Formatting Data

%Voltage vs deflection measuremnts for first epoxy film
Epoxy_1_Voltages = [0 22 46 92 144 190 236 286 332 380];
Epoxy_1_NumOfFringes = [0 0 0.5 1 3 4 6 9 18 22];
Epoxy_1_Deflections = Epoxy_1_NumOfFringes.*(633/2);
Epoxy_1_VvsD = [Epoxy_1_Voltages ; Epoxy_1_Deflections];


%-----------------------------------------------------------------
%Code to further compare data


%-----------------------------------------------------------------
%Plot The Different deflections on seperate subplots

%Plot data for first epoxy film
figure(1);
subplot(2,2,1);
hold on
title('SU8 Epoxy 1','FontSize',8);
ylabel('Deflection (nm)');
xlabel('Voltage Drop Across Device');
scatter(Epoxy_1_VvsD(1,:),Epoxy_1_VvsD(2,:),10,"filled");
hold off

sgtitle('Voltage vs Deflection Of Deformable Membraines');

%-----------------------------------------------------------------
%Plots Data on one big plot

%figure(2);
