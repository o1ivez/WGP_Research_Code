%WGP Research Voltage vs Deflection code Oliver Gough

%-----------------------------------------------------------------
%Import All Data from Excell file
membraneData = readmatrix("MembraneData.csv"); i = 1;

%partition data for each membrane
Epoxy1      = membraneData(:, i:i+2); i =i+3;
Epoxy1Test2 = membraneData(:, i:i+2); i =i+3;
Grating1    = membraneData(:, i:i+2); i =i+3;
KMSF1       = membraneData(:, i:i+2); i =i+3;
KMSF2       = membraneData(:, i:i+2); i =i+3;

%Convert the # of fringes to nm deflection TODO add more analisis
[Epoxy1, E1avgGapSize, E1StressFit, E1Force] = analizeData(Epoxy1);
[Epoxy1Test2, E1T2avgGapSize, E1T2StressFit, E1T2Force] = analizeData(Epoxy1Test2);
[Grating1, G1avgGapSize, G1StressFit, G1Force] = analizeData(Grating1);
[KMSF1, K1avgGapSize, K1StressFit, K1Force]        = analizeData(KMSF1);
[KMSF2, K2avgGapSize, K2StressFit, K2Force]        = analizeData(KMSF2);


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

%-----------------------------------------------------------------
%Plot all on same plot
figure(2); hold on;
plot(Epoxy1(:,1),Epoxy1(:,2)); plot(Epoxy1Test2(:,1),Epoxy1Test2(:,2)); 
plot(Grating1(:,1),Grating1(:,2)); plot(KMSF1(:,1), KMSF1(:,2));
ylabel("Membraine Defelection [nm]"); xlabel("Voltage across Devices [Volts]");
legend("SU8 Membrane Test 1","SU8 Membrane Test 2", "SU8 Grating", "KMSF Mebraine 1", Location="northwest");
title('Voltage Vs Deflection Cummilitve Graph'); hold off;

%-----------------------------------------------------------------
%Plot deflection and stress data and maybe force
%Code to plot bead gap size
figure(3); hold on;
x = ["Epoxy 1","SU8 Grating","KMSF 1", "KMSF2"];
y = [E1avgGapSize, G1avgGapSize, K1avgGapSize, K2avgGapSize];
subplot(311); bar(x,y); ylabel("Average Gap Size (uM)"); 
title("Average Gap Size"); hold off;

%Code to plot poly fit of stress data
subplot(312); hold on; ylabel("Stress");
xlabel("Strain??"); title("Membrane Stress");
plot(E1StressFit); plot(E1T2StressFit); plot(G1StressFit); plot(K1StressFit); plot(K2StressFit);
legend("SU8 Membrane Test 1","SU8 Membrane Test 2", "SU8 Grating", "KMSF Mebraine 1", Location="northwest");
hold off;

%Code to plot electrostatic force vs deflection
subplot(313); hold on; xlabel("Electrostatic Force"); ylabel("Deflection");
title("Electrostatic Force vs Deflection (nM)");
plot(E1Force,Epoxy1); plot(E1T2Force,Epoxy1Test2); plot(G1Force, Grating1); plot(K1Force,KMSF1);
legend("SU8 Membrane Test 1","SU8 Membrane Test 2", "SU8 Grating", "KMSF Mebraine 1", Location="northeast");
hold off;
