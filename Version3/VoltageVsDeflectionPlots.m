%WGP Research Voltage vs Deflection code for plotting Oliver Gough
close all; clear all; clc;

%-----------------------------------------------------------------
%Import data from CSV files
interFerroData = readmatrix("MembraneData_Interferrometer.csv"); i = 1;
proFilmData = readmatrix("ProFilmData_2.5.25.csv"); j = 1;

%-----------------------------------------------------------------
%Collect interferrormeter voltage vs deflection data
Epoxy1_inter      = interFerroData(:, i:i+1); i =i+3;
Epoxy1Test2_inter = interFerroData(:, i:i+1); i =i+3;
Grating1_inter    = interFerroData(:, i:i+1); i =i+3;
KMSF1_inter       = interFerroData(:, i:i+1); i =i+3;
KMSF2_inter       = interFerroData(:, i:i+1); i =i+3;
Grating2_inter    = interFerroData(:, i:i+1); i =i+3;

%Convert the # of fringes to nm deflection
[Epoxy1]        = fringesToNm(Epoxy1_inter);
[Epoxy1Test2]   = fringesToNm(Epoxy1Test2_inter);
[Grating1]      = fringesToNm(Grating1_inter);
[KMSF1]         = fringesToNm(KMSF1_inter);
[KMSF2]         = fringesToNm(KMSF2_inter);
[Grating2]      = fringesToNm(Grating2_inter);

%-----------------------------------------------------------------
%Collect profilm voltage vs deflection data
Grating1_proFilm       = proFilmData(:, j:j+1); j =j+2;
Grating1_proFilm(:,1)  = Grating1_proFilm(:,1)*1000;
Grating2_proFilm       = proFilmData(:, j:j+1); j =j+2;
Grating2_proFilm(:,1)  = Grating2_proFilm(:,1).*1000;
Membrane1_proFilm      = proFilmData(:, j:j+1); j =j+2;
Membrane1_proFilm(:,1) = Membrane1_proFilm(:,1).*1000;
KMSF1_proFilm          = proFilmData(:, j:j+1); j =j+2;
KMSF1_proFilm(:,1)     = KMSF1_proFilm(:,1).*1000;

%-----------------------------------------------------------------
%Plot data
figure(1); 
subplot(331); plot(Epoxy1Test2(:,1), Epoxy1Test2(:,2)); hold on;
ylabel('Deflection (nm)'); xlabel('Voltage [V]'); 
title("SU8 Membrane 2 Interferrometer"); hold off;
subplot(332); plot(Grating1(:,1), Grating1(:,2)); hold on; 
ylabel('Deflection (nm)'); xlabel('Voltage [V]'); 
title("SU8 Grating 1 Interferrometer"); hold off;
subplot(333); plot(KMSF1(:,1), KMSF1(:,2)); hold on; 
ylabel('Deflection (nm)'); xlabel('Voltage [V]'); 
title("KMSF 1 Interferrometer"); hold off;
subplot(334); plot(KMSF2(:,1), KMSF2(:,2)); hold on; 
ylabel('Deflection (nm)'); xlabel('Voltage [V]'); 
title("KMSF 2 Interferrometer"); hold off;
subplot(335); plot(Grating2(:,1), Grating2(:,2)); hold on; 
ylabel('Deflection (nm)'); xlabel('Voltage [V]'); 
title("SU8 Grating 2 Interferrometer"); hold off;

subplot(336); plot(Grating1_proFilm(:,2), Grating1_proFilm(:,1)); hold on; 
ylabel('Deflection (nm)'); xlabel('Voltage [V]'); 
title("SU8 Grating 1 ProFilm"); hold off;
subplot(337); plot(Grating2_proFilm(:,2), Grating2_proFilm(:,1)); hold on; 
ylabel('Deflection (nm)'); xlabel('Voltage [V]'); 
title("SU8 Grating 2 ProFilm"); hold off;
subplot(338); plot(Membrane1_proFilm(:,2), Membrane1_proFilm(:,1)); hold on; 
ylabel('Deflection (nm)'); xlabel('Voltage [V]'); 
title("SU8 Membrane ProFilm"); hold off;
subplot(339); plot(KMSF1_proFilm(:,2), KMSF1_proFilm(:,1)); hold on; 
ylabel('Deflection (nm)'); xlabel('Voltage [V]'); 
title("KMSF Membrane 1 ProFilm"); hold off;

%Plot data on same graph
figure(2); hold on;
plot(Epoxy1Test2(:,1),Epoxy1Test2(:,2)); 
plot(Grating1(:,1),Grating1(:,2)); plot(KMSF1(:,1), KMSF1(:,2));
plot(Grating2(:,1),Grating2(:,2));
plot(Grating1_proFilm(:,2), Grating1_proFilm(:,1));
plot(Grating2_proFilm(:,2), Grating2_proFilm(:,1));
plot(Membrane1_proFilm(:,2), Membrane1_proFilm(:,1));
plot(KMSF1_proFilm(:,2), KMSF1_proFilm(:,1)); 
ylabel("Membraine Defelection [nm]"); xlabel("Voltage across Devices [Volts]");
lgd = legend("SU8 Membrane 2", "SU8 Grating 1", ...
    "KMSF Mebraine 1", "SU8 Grating 2", "SU8 Grating 1 Profilm", "SU8 Grating 2 Profilm", ...
   "SU8 Membrane Profilm", "KMSF Membrane 1 Profilm", Location="northwest");
title('Voltage Vs Deflection Cummilitve Graph');
hold off;
