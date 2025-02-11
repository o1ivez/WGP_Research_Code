%WGP Research Voltage vs Deflection code Oliver Gough

%-----------------------------------------------------------------
%Import All Data from Excell file
membraneData = readmatrix("MembraneData.csv"); i = 1;

%partition data for each membrane
Epoxy1      = membraneData(:, i:i+2); i =i+3;
Epoxy1Test2 = membraneData(:, i:i+2); i =i+3;
Grating1    = membraneData(:, i:i+2); i =i+3;
KMSF1       = membraneData(:, i:i+2); i =i+3;

%Convert the # of fringes to nm deflection TODO add more analisis
Epoxy1      = analizeData(Epoxy1);
Epoxy1Test2 = analizeData(Epoxy1Test2);
Grating1    = analizeData(Grating1);
KMSF1       = analizeData(KMSF1);

%-----------------------------------------------------------------
%Plot The Different deflections on sperate plots
figure(1); 
subplot(321); hold on;
scatter(Epoxy1(:,1),Epoxy1(:,2),10, "Filled"); title('SU8 Epoxy 1','FontSize',8);
ylabel('Deflection (nm)'); xlabel('Voltage Drop Across Device [V]'); hold off;
subplot(322); hold on;
scatter(Epoxy1Test2(:,1),Epoxy1Test2(:,2),10, "Filled"); title('SU8 Epoxy 1 Better Focus','FontSize',8);
ylabel('Deflection (nm)'); xlabel('Voltage Drop Across Device [V]'); hold off;
subplot(323); hold on;
scatter(Grating1(:,1),Grating1(:,2),10, "Filled"); title('SU8 Wire Grating 1','FontSize',8);
ylabel('Deflection (nm)'); xlabel('Voltage Drop Across Device [V]'); hold off;
subplot(324); hold on;
scatter(KMSF1(:,1),KMSF1(:,2),10, "Filled"); title('KMSF 1','FontSize',8);
ylabel('Deflection (nm)'); xlabel('Voltage Drop Across Device [V]'); hold off;
%Plot all on same plot
figure(2); hold on;
plot(Epoxy1(:,1),Epoxy1(:,2)); plot(Epoxy1Test2(:,1),Epoxy1Test2(:,2)); 
plot(Grating1(:,1),Grating1(:,2)); plot(KMSF1(:,1), KMSF1(:,2));
ylabel("Membraine Defelection [nm]"); xlabel("Voltage across Devices [Volts]");
legend("SU8 Membrane Test 1","SU8 Membrane Test 2", "SU8 Grating", "KMSF Mebraine 1", Location="northwest");
title('Voltage Vs Deflection Cummilitve Graph'); hold off;





