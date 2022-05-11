%% CWM1-MATLAB - MODEL PARAMETERS
% Parameters from Langergraber et al. (2009)
%
% (c) Matteo M. 2022

% Hydrolisys
Kh = 3.0;               % p#1. Hydrolisys rate constant (1/d).
Kx = 0.1;               % p#2. Saturation/inhibition coefficient for hydrolysis (gCODSF/gCODBM).
etaH = 0.1;             % p#3. Correction factor for hydrolysis by ferm. bact. (-)
% Heterotrophic bacteria
uH = 6.0;               % p#4. Maximum growth rate on Sf and Sa (1/d).
etag = 0.8;             % p#5. Correction factor for denitrification by heterotrophs (-)
bH = 0.4;               % p#6. Rate constant for lysis (1/d).
KOH = 0.2;              % p#7. Sat./inh. coeff. for So (mgO2/L)
KSF = 2.0;              % p#8. Sat./inh. coeff. for Sf (mgCODSF/L)
KSA = 4.0;              % p#9. Sat./inh. coeff. for Sa (mgCODSA/L)
KNOH = 0.5;             % p#10. Sat./inh. coeff. for Sno (mgN/L)
KNHH = 0.05;            % p#11. Sat./inh. coeff. for Snh (mgN/L)
KH2SH = 140.0;          % p#12. Sat./inh. coeff. for SSh2s (mgS/L)
% Autotrophic bacteria
uA = 1.0;               % p#13. Maximum aerobic growth rate on Shn (1/d). 
bA = 0.15;              % p#14. Rate constant for lysis (1/d).
KOA = 1.0;              % p#15. Sat./inh. coeff. for So (mgO2/L).
KNHA = 0.5;             % p#16. Sat./inh. coeff. for Snh (mgN/L).
KH2SA = 140;            % p#17. Sat./inh. coeff. for Sh2s (mgS/L)
% Fermenting bacteria
uFB = 3.0;              % p#18. Maximum aerobic growth rate for Xfb (1/d).
bFB = 0.02;             % p#19. Rate constant for lysis (1/d).
KOFB = 0.2;             % p#20. Sat./inh. coeff. for So (mgO2/L).
KSFB = 28.0;            % p#21. Sat./inh. coeff. for Sf (mgCODSF/L).
KNOFB = 0.5;            % p#22. Sat./inh. coeff. for Sno (mgN/L).
KNHFB = 0.01;           % p#23. Sat./inh. coeff. for Snh (mgN/L).
KH2SFB = 140.0;         % p#24. Sat./inh. coeff. for Sh2s (mgS/L).
% Acetotrophic methanogenic bacteria
uAMB = 0.085;           % p#25. Maximum aerobic growth rate for Xamb (1/d).
bAMB = 0.008;           % p#26. Rate constant for lysis (1/d)
KOAMB = 0.0002;         % p#27. Sat./inh. coeff. for So (mgO2/L).
KSAMB = 56.0;           % p#28. Sat./inh. coeff. for Sf (mgCODSA/L).
KNOAMB = 0.0005;        % p#29. Sat./inh. coeff. for Sno (mgN/L).
KNHAMB = 0.01;          % p#30. Sat./inh. coeff. for Snh (mgN/L).
KH2SAMB = 140.0;        % p#31. Sat./inh. coeff. for Sh2s (mgS/L).
% Acetotrophic sulphate reducing bacteria
uASRB = 0.18;           % p#32. Maximum aerobic growth rate for Xasrb (1/d).
bASRB = 0.012;          % p#33. Rate constant for lysis (1/d)
KOASRB = 0.0002;        % p#34. Sat./inh. coeff. for So (mgO2/L).
KSASRB = 24.0;          % p#35. Sat./inh. coeff. for Sf (mgCODSA/L)
KNOASRB = 0.0005;       % p#36. Sat./inh. coeff. for Sno (mgN/L).
KNHASRB = 0.01;         % p#37. Sat./inh. coeff. for Snh (mgN/L).
KSOASRB = 19.0;         % p#38. Sat./inh. coeff. for Sso4 (mgS/L).
KH2SASRB = 140.0;       % p#39. Sat./inh. coeff. for Sh2s (mgS/L).
% Sulphide oxidising bacteria
uSOB = 5.28;            % p#40. Maximum aerobic growth rate for Xsob (1/d).
bSOB = 0.15;            % p#41. Rate constant for lysis (1/d)
KOSOB = 0.2;            % p#42. Sat./inh. coeff. for So (mgO2/L).
KNOSOB = 0.5;           % p#43. Sat./inh. coeff. for Sno (mgN/L).
KNHSOB = 0.05;          % p#44. Sat./inh. coeff. for Snh (mgN/L).
KSSOB = 0.24;           % p#45. Sat./inh. coeff. for Sh2s (mgS/L).
% Stoichiometric parameters
fHYDSI = 0.0;           % p#46. Production of Si in hydrolysis (gCODSI/gCODXS)
fBMSF = 0.05;           % p#47. Fraction of SF generated in biomass lysis (gCODSF/gCODBM)
fBMXI = 0.1;            % p#48. Fraction of Xi generated in biomass lysis (gCODXI/gCODBM)
YH = 0.63;              % p#49. Yield coefficient for heterotrophic bacteria (gCODBM/gCODSF)
YA = 0.24;              % p#50. Yield coefficient for autotrophic bacteria (gCODBM/gN)
YFB = 0.053;            % p#51. Yield coefficient for fermenting bacteria (gCODBM/gCODSF)
YAMB = 0.032;           % p#52. Yield coefficient for methanogenic bacteria (gCODBM/gCODSA)
YASRB = 0.05;           % p#53. Yield coefficient for sulphur reducing bacteria (gCODBM/gS)
YSOB = 0.12;            % p#54. Yield coefficient for sulphide oxidizing bacteria (gCODBM/gS)
% Composition parameters
iNSF = 0.03;            % p#55. N content of Sf (gN/gCODSF)
iNSI = 0.01;            % p#56. N content of Si (gN/gCODSI)
iNXS = 0.04;            % p#57. N content of Xs (gN/gCODXS)
iNXI = 0.03;            % p#58. N content of Xi (gN/gCODXI)
iNBM = 0.07;            % p#59. N content of biomass (gN/gCODBM)
% Extra parameters
etaSOB = 0.8;           % p#50. Correction factor for anoxic growth of Xsob. From Boog tutorial. Not included in Langergraber et al. (2009)

%% Interpolate parameters at given temperature
Kh = temperature_interp(Kh,2.0,T);
Kx = temperature_interp(Kx,0.22,T);
uH = temperature_interp(uH,3.0,T);
bH = temperature_interp(bH,0.2,T);
uA = temperature_interp(uA,0.35,T);
bA = temperature_interp(bA,0.05,T);
KNHA = temperature_interp(KNHA,5,T);
uFB = temperature_interp(uFB,1.5,T);
uAMB = temperature_interp(uAMB,0.04,T);     % Boog et al. (2019)
bAMB = temperature_interp(bAMB,0.004,T);    % Boog et al. (2019)


%% Build parameters vector
params = [Kh Kx etaH uH etag bH KOH KSF KSA KNOH ...
          KNHH KH2SH uA bA KOA KNHA KH2SA uFB bFB KOFB ...
          KSFB KNOFB KNHFB KH2SFB uAMB bAMB KOAMB KSAMB KNOAMB KNHAMB ...
          KH2SAMB uASRB bASRB KOASRB KSASRB KNOASRB KNHASRB KSOASRB KH2SASRB uSOB ...
          bSOB KOSOB KNOSOB KNHSOB KSSOB fHYDSI fBMSF fBMXI YH YA ...
          YFB YAMB YASRB YSOB iNSF iNSI iNXS iNXI iNBM etaSOB];
      
      
