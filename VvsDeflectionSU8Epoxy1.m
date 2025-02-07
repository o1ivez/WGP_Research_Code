%WGP Research Voltage vs Deflection code Oliver Gough

%-----------------------------------------------------------------
%Formatting Data 

%Voltage vs deflection measuremnts for first su8 epoxy film 1st test
Epoxy_1_Test_1_Voltages = [0 22 46 92 144 190 236 286 332 380];
Epoxy_1_Test_1_NumOfFringes = [0 0 0.5 1 3 4 6 9 18 22];
Epoxy_1_Test_1_Deflections = Epoxy_1_Test_1_NumOfFringes.*(633/2);
Epoxy_1_Test_1_VvsD = [Epoxy_1_Test_1_Voltages ; Epoxy_1_Test_1_Deflections];

%Voltage vs deflection measuremnts for first su8 epoxy film 2nd test with
%better focus
Epoxy_1_Test_2_Voltages = [0 20 44 70 94 120 144 166 190 214 238 264 284 310 333 360 380];
Epoxy_1_Test_2_NumOfFringes = [0 0.25 0.33 0.6 0.9 1 1.5 2 2.66 3.75 4.5 5 6.25 8.75 9.75 10.1 13];
Epoxy_1_Test_2_Deflections = Epoxy_1_Test_2_NumOfFringes.*(633/2);
Epoxy_1_Test_2_VvsD = [Epoxy_1_Test_2_Voltages ; Epoxy_1_Test_2_Deflections];

%Voltage vs deflection measuremnts for first su8 wire grating
Wire_Grating_1_Voltages = [0 44 94 140 188 236 284 328 372];
Wire_Grating_1_NumOfFringes = [0 0.5 0.5 1 2 3 3 4 4];
Wire_Grating_1_Deflections = Wire_Grating_1_NumOfFringes.*(633/2);
Wire_Grating_1_VvsD = [Wire_Grating_1_Voltages;Wire_Grating_1_Deflections];

%Voltage vs deflection measuremnts for first kmsf membraine
KMSF_1_Voltages = [0 23 47 72 94 118 142 166 186 220 238 260 286 308];
KMSF_1_NumOfFringes = [0 0.25 0.75 2 4.5 6.5 10.5 14 20.5 29 42 40 52 63];
KMSF_1_Deflections = KMSF_1_NumOfFringes.*(633/2);
KMSF_1_VvsD = [KMSF_1_Voltages;KMSF_1_Deflections];

%-----------------------------------------------------------------
%Code to further compare data, maybe TODO


%-----------------------------------------------------------------
%Plot The Different deflections on seperate subplots

%Plot data for first epoxy film
figure(1);
subplot(2,2,1);
hold on
title('SU8 Epoxy 1 Test 1','FontSize',8);
ylabel('Deflection (nm)');
xlabel('Voltage Drop Across Device [V]');
scatter(Epoxy_1_Test_1_VvsD(1,:),Epoxy_1_Test_1_VvsD(2,:),10,"filled");
hold off
subplot(2,2,2);
hold on
title('SU8 Epoxy 1 Test 2 (Better camera focus)','FontSize',8);
ylabel('Deflection (nm)');
xlabel('Voltage Drop Across Device [V]');
scatter(Epoxy_1_Test_2_VvsD(1,:),Epoxy_1_Test_2_VvsD(2,:),10,"filled");
hold off
subplot(2,2,3);
hold on
title('SU8 Wire Grating 1','FontSize',8);
ylabel('Deflection (nm)');
xlabel('Voltage Drop Across Device [V]');
scatter(Wire_Grating_1_VvsD(1,:),Wire_Grating_1_VvsD(2,:),10,"filled");
hold off
subplot(2,2,4);
hold on
title('KMSF 1 Mirror','FontSize',8);
ylabel('Deflection (nm)');
xlabel('Voltage Drop Across Device [V]');
scatter(KMSF_1_VvsD(1,:),KMSF_1_VvsD(2,:),10,"filled");
hold off

sgtitle('Voltage vs Deflection Of Deformable Membranes');

%-----------------------------------------------------------------
%Plots Data on one big plot

figure(2)
hold on
plot(Epoxy_1_Test_1_VvsD(1,:),Epoxy_1_Test_1_VvsD(2,:))
plot(Epoxy_1_Test_2_VvsD(1,:),Epoxy_1_Test_2_VvsD(2,:))
plot(Wire_Grating_1_VvsD(1,:),Wire_Grating_1_VvsD(2,:))
plot(KMSF_1_VvsD(1,:),KMSF_1_VvsD(2,:));
ylabel("Membrane Deflection [nm]");
xlabel("Voltage Across Device [Volts]");
title('Voltage Vs Deflection Cumulative Graph');
legend("SU8 Membrane Test 1","SU8 Membrane Test 2", "SU8 Grating", "KMSF Membrane 1" );
hold off
