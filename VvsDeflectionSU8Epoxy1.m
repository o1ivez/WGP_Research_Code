Voltages = [0 22 46 92 144 190 236 286 332 380];
NumOfFringes = [0 0 0.5 1 3 4 6 9 18 22];
Deflections = NumOfFringes.*(633/2);
VvsD = [Voltages ; Deflections];
hold on
title("Voltage vs Deflection SU8 Epoxy 1")
ylabel("Deflection (nm)")
xlabel("Voltage Frop Across Device")
scatter(VvsD(1,:),VvsD(2,:))
hold off
legend("Data")
