function [ JP_, ...
    WD1_, WW1_, WT1_ ,WNT1_ ,WSW1_ ,WST1_ ,WSNT1_, ...
    SOC, ...
    LW1l_, LT1l_, LNT1l_, LSW1l_, LST1l_, LSNT1l_, LNDCG1l_, Lh1l_, CD1l_, CND1l_, LNDCG1b_, Lh1b_, CD1b_, CND1b_, LKP1_, LHP1_, LND1_, LCG1_, LKG1_, LHG1_, KPT1_, KPNT1_, KPW1_, IKP1_, IHP1_, P1_, YWC1_, X1_] ...
    = step3GetSteadyBackupBackup( lambda, eta, phiR, zetaR, gamma, scriptp, scriptq,  ...
alphaCP, alphaCD, alphah, alphaKP, alphaD, alphaND, alphaHP, alphaHW, alphaHL, alphaK, alphaKL, alphaHLX, alphaY, betabarl, ...
sigma, xi, bbeta, ...
h, varrhoC, eC, varrhoCP, eCP, varrhoCD, ...
nuW, nuT, nuNT, nuSW, nuST, nuSNT, nuD, nuNDCG, nuK, nuH, nuh, ...
rhoQB, ...
thetaKU0, thetaKU1, thetaDU0, thetaDU1, ...
alphaNC, eT, eW, FWCtilde, FKtilde, ...
o, eKLT, eKLNT, eKLW, varrhoKL, eHLXT, eHLXNT, eHLXW, varrhoHLX, eYT, eYNT, eYW, varrhoY, ...
tauKG_, tauHG_, tauCG_, taub_, tauD_, tauND_, tauNT_, tauTC_, iotaTX_, iotaTM_, iotaWX_, iotaWM_, tauLa_, tauLb_, tauHW_, tauHT_, tauHNT_, tauKW_, tauKT_, tauKNT_, tauscriptXW_, tauscriptXT_, tauscriptXNT_, ...
phiiotaTX ,phiiotaTM, phiiotaWX, phiiotaWM,...
Omegah_, OmegaCP_, OmegaC_, OmegaKP_, OmegaHP_, OmegaD_, OmegaND_, OmegaKG_, OmegaHG_, OmegaCG_, OmegaY_, OmegaTC_, OmegaWP_, OmegaWC_, OmegaKT_, OmegaHLT_, OmegaKLT_, OmegaHLXT_, OmegaT_, OmegaKNT_, OmegaHLNT_, OmegaKLNT_, OmegaHLXNT_, OmegaNT_, OmegaKW_, OmegaHLW_, OmegaKLW_, OmegaHLXW_, OmegaW_, ...
GN_, Z_, deltaItilde_, scriptFI_, deltaD_, kappa0_, kappah_, ...
kappaT_, kappaNT_, kappaW_, kappaST_, kappaSNT_, kappaSW_, kappaD_, kappaNDCG_, kappaK_, kappaH_, ...
deltaKPT_, deltaHPT_, deltaKPNT_, deltaHPNT_, deltaKPW_, deltaHPW_, deltaKG_, deltaHG_, betabarb, ...
pT0, yTC0, m_, varpi_, eT0_, Ntilde1_, Ntilde2_, Ntilde3_, Ntilde4_)


% This is a crude version of step3GetSteady used only for development.


%note that dynare will clear all unless: dynare XXX noclearall
global SolutionGuess

if isempty( SolutionGuess )
%    for CurrentBest_24Nov
    SolutionGuess=...
[-0.911151830230914;-3.84011655395191;-0.784663870195075;-1.90448842748471;-4.58847130121240;-1.74036661173722;-0.632654316305355;-0.111286713018814;1.68052491667214;0.510224739836171;-2.56723794165180;-2.12845310745101;-0.560053196808405;-1.54211660857263;-2.51646084350140;-3.06461090371848;-0.531063093157285;-3.91464236149531;-2.38911499748231;-2.44612969587140;-6.40178461662292;-1.43018950014356;-2.28873638050641;-2.49382891785392;-2.81598052892147;-3.14184137020348;-1.39787440819328;-1.48030275768350];
end

global Solution
[Solution,~ ,exitflag] = fsolve( @( InVec )...
    step3GetSteadyResids_mex( InVec, lambda, eta, phiR, zetaR, gamma, scriptp, scriptq,  ...
alphaCP, alphaCD, alphah, alphaKP, alphaD, alphaND, alphaHP, alphaHW, alphaHL, alphaK, alphaKL, alphaHLX, alphaY, betabarl, ...
sigma, xi, bbeta, ...
h, varrhoC, eC, varrhoCP, eCP, varrhoCD, ...
nuW, nuT, nuNT, nuSW, nuST, nuSNT, nuD, nuNDCG, nuK, nuH, nuh, ...
rhoQB, ...
thetaKU0, thetaKU1, thetaDU0, thetaDU1, ...
alphaNC, eT, eW, FWCtilde, FKtilde, ...
o, eKLT, eKLNT, eKLW, varrhoKL, eHLXT, eHLXNT, eHLXW, varrhoHLX, eYT, eYNT, eYW, varrhoY, ...
tauKG_, tauHG_, tauCG_, taub_, tauD_, tauND_, tauNT_, tauTC_, iotaTX_, iotaTM_, iotaWX_, iotaWM_, tauLa_, tauLb_, tauHW_, tauHT_, tauHNT_, tauKW_, tauKT_, tauKNT_, tauscriptXW_, tauscriptXT_, tauscriptXNT_, ...
phiiotaTX ,phiiotaTM, phiiotaWX, phiiotaWM,...
Omegah_, OmegaCP_, OmegaC_, OmegaKP_, OmegaHP_, OmegaD_, OmegaND_, OmegaKG_, OmegaHG_, OmegaCG_, OmegaY_, OmegaTC_, OmegaWP_, OmegaWC_, OmegaKT_, OmegaHLT_, OmegaKLT_, OmegaHLXT_, OmegaT_, OmegaKNT_, OmegaHLNT_, OmegaKLNT_, OmegaHLXNT_, OmegaNT_, OmegaKW_, OmegaHLW_, OmegaKLW_, OmegaHLXW_, OmegaW_, ...
GN_, Z_, deltaItilde_, scriptFI_, deltaD_, kappa0_, kappah_, ...
kappaT_, kappaNT_, kappaW_, kappaST_, kappaSNT_, kappaSW_, kappaD_, kappaNDCG_, kappaK_, kappaH_, ...
deltaKPT_, deltaHPT_, deltaKPNT_, deltaHPNT_, deltaKPW_, deltaHPW_, deltaKG_, deltaHG_, betabarb, ...
pT0, yTC0, m_, varpi_, eT0_, Ntilde1_, Ntilde2_, Ntilde3_, Ntilde4_), ...
    SolutionGuess, optimoptions(@fsolve, 'Algorithm', 'trust-region', 'Display','iter', 'OptimalityTolerance',1e-12,'FunctionTolerance',1e-12,'StepTolerance',1e-12,'MaxIterations',inf,'MaxFunctionEvaluations',Inf,'FiniteDifferenceType','central'));
    %iter-detailed
    %optimoptions('fsolve')

[Resids, JP_, ...
		WD1_, WW1_, WT1_ ,WNT1_ ,WSW1_ ,WST1_ ,WSNT1_, ...
		SOC] = step3GetSteadyResids_log_mex( Solution, lambda, eta, phiR, zetaR, gamma, scriptp, scriptq,  ...
alphaCP, alphaCD, alphah, alphaKP, alphaD, alphaND, alphaHP, alphaHW, alphaHL, alphaK, alphaKL, alphaHLX, alphaY, betabarl, ...
sigma, xi, bbeta, ...
h, varrhoC, eC, varrhoCP, eCP, varrhoCD, ...
nuW, nuT, nuNT, nuSW, nuST, nuSNT, nuD, nuNDCG, nuK, nuH, nuh, ...
rhoQB, ...
thetaKU0, thetaKU1, thetaDU0, thetaDU1, ...
alphaNC, eT, eW, FWCtilde, FKtilde, ...
o, eKLT, eKLNT, eKLW, varrhoKL, eHLXT, eHLXNT, eHLXW, varrhoHLX, eYT, eYNT, eYW, varrhoY, ...
tauKG_, tauHG_, tauCG_, taub_, tauD_, tauND_, tauNT_, tauTC_, iotaTX_, iotaTM_, iotaWX_, iotaWM_, tauLa_, tauLb_, tauHW_, tauHT_, tauHNT_, tauKW_, tauKT_, tauKNT_, tauscriptXW_, tauscriptXT_, tauscriptXNT_, ...
phiiotaTX ,phiiotaTM, phiiotaWX, phiiotaWM,...
Omegah_, OmegaCP_, OmegaC_, OmegaKP_, OmegaHP_, OmegaD_, OmegaND_, OmegaKG_, OmegaHG_, OmegaCG_, OmegaY_, OmegaTC_, OmegaWP_, OmegaWC_, OmegaKT_, OmegaHLT_, OmegaKLT_, OmegaHLXT_, OmegaT_, OmegaKNT_, OmegaHLNT_, OmegaKLNT_, OmegaHLXNT_, OmegaNT_, OmegaKW_, OmegaHLW_, OmegaKLW_, OmegaHLXW_, OmegaW_, ...
GN_, Z_, deltaItilde_, scriptFI_, deltaD_, kappa0_, kappah_, ...
kappaT_, kappaNT_, kappaW_, kappaST_, kappaSNT_, kappaSW_, kappaD_, kappaNDCG_, kappaK_, kappaH_, ...
deltaKPT_, deltaHPT_, deltaKPNT_, deltaHPNT_, deltaKPW_, deltaHPW_, deltaKG_, deltaHG_, betabarb, ...
pT0, yTC0, m_, varpi_, eT0_, Ntilde1_, Ntilde2_, Ntilde3_, Ntilde4_);
global AdditionalSolution

AdditionalSolution=[WD1_, WW1_, WT1_ ,WNT1_ ,WSW1_ ,WST1_ ,WSNT1_];

if SOC <= 0
	error( 'SOC not satisfied at steady state.' );
end
	
if Resids'*Resids>1e-6
[Solution,~ ,exitflag] = fsolve( @( InVec )...
    step3GetSteadyResids_log_mex( InVec, lambda, eta, phiR, zetaR, gamma, scriptp, scriptq,  ...
alphaCP, alphaCD, alphah, alphaKP, alphaD, alphaND, alphaHP, alphaHW, alphaHL, alphaK, alphaKL, alphaHLX, alphaY, betabarl, ...
sigma, xi, bbeta, ...
h, varrhoC, eC, varrhoCP, eCP, varrhoCD, ...
nuW, nuT, nuNT, nuSW, nuST, nuSNT, nuD, nuNDCG, nuK, nuH, nuh, ...
rhoQB, ...
thetaKU0, thetaKU1, thetaDU0, thetaDU1, ...
alphaNC, eT, eW, FWCtilde, FKtilde, ...
o, eKLT, eKLNT, eKLW, varrhoKL, eHLXT, eHLXNT, eHLXW, varrhoHLX, eYT, eYNT, eYW, varrhoY, ...
tauKG_, tauHG_, tauCG_, taub_, tauD_, tauND_, tauNT_, tauTC_, iotaTX_, iotaTM_, iotaWX_, iotaWM_, tauLa_, tauLb_, tauHW_, tauHT_, tauHNT_, tauKW_, tauKT_, tauKNT_, tauscriptXW_, tauscriptXT_, tauscriptXNT_, ...
phiiotaTX ,phiiotaTM, phiiotaWX, phiiotaWM,...
Omegah_, OmegaCP_, OmegaC_, OmegaKP_, OmegaHP_, OmegaD_, OmegaND_, OmegaKG_, OmegaHG_, OmegaCG_, OmegaY_, OmegaTC_, OmegaWP_, OmegaWC_, OmegaKT_, OmegaHLT_, OmegaKLT_, OmegaHLXT_, OmegaT_, OmegaKNT_, OmegaHLNT_, OmegaKLNT_, OmegaHLXNT_, OmegaNT_, OmegaKW_, OmegaHLW_, OmegaKLW_, OmegaHLXW_, OmegaW_, ...
GN_, Z_, deltaItilde_, scriptFI_, deltaD_, kappa0_, kappah_, ...
kappaT_, kappaNT_, kappaW_, kappaST_, kappaSNT_, kappaSW_, kappaD_, kappaNDCG_, kappaK_, kappaH_, ...
deltaKPT_, deltaHPT_, deltaKPNT_, deltaHPNT_, deltaKPW_, deltaHPW_, deltaKG_, deltaHG_, betabarb, ...
pT0, yTC0, m_, varpi_, eT0_, Ntilde1_, Ntilde2_, Ntilde3_, Ntilde4_), ...
    SolutionGuess, optimoptions(@fsolve, 'Algorithm', 'trust-region', 'Display','iter', 'OptimalityTolerance',1e-12,'FunctionTolerance',1e-12,'StepTolerance',1e-12,'MaxIterations',inf,'MaxFunctionEvaluations',Inf,'FiniteDifferenceType','central'));

[~, JP_, ...
		WD1_, WW1_, WT1_ ,WNT1_ ,WSW1_ ,WST1_ ,WSNT1_, ...
		SOC] = step3GetSteadyResids_log_mex( Solution, lambda, eta, phiR, zetaR, gamma, scriptp, scriptq,  ...
alphaCP, alphaCD, alphah, alphaKP, alphaD, alphaND, alphaHP, alphaHW, alphaHL, alphaK, alphaKL, alphaHLX, alphaY, betabarl, ...
sigma, xi, bbeta, ...
h, varrhoC, eC, varrhoCP, eCP, varrhoCD, ...
nuW, nuT, nuNT, nuSW, nuST, nuSNT, nuD, nuNDCG, nuK, nuH, nuh, ...
rhoQB, ...
thetaKU0, thetaKU1, thetaDU0, thetaDU1, ...
alphaNC, eT, eW, FWCtilde, FKtilde, ...
o, eKLT, eKLNT, eKLW, varrhoKL, eHLXT, eHLXNT, eHLXW, varrhoHLX, eYT, eYNT, eYW, varrhoY, ...
tauKG_, tauHG_, tauCG_, taub_, tauD_, tauND_, tauNT_, tauTC_, iotaTX_, iotaTM_, iotaWX_, iotaWM_, tauLa_, tauLb_, tauHW_, tauHT_, tauHNT_, tauKW_, tauKT_, tauKNT_, tauscriptXW_, tauscriptXT_, tauscriptXNT_, ...
phiiotaTX ,phiiotaTM, phiiotaWX, phiiotaWM,...
Omegah_, OmegaCP_, OmegaC_, OmegaKP_, OmegaHP_, OmegaD_, OmegaND_, OmegaKG_, OmegaHG_, OmegaCG_, OmegaY_, OmegaTC_, OmegaWP_, OmegaWC_, OmegaKT_, OmegaHLT_, OmegaKLT_, OmegaHLXT_, OmegaT_, OmegaKNT_, OmegaHLNT_, OmegaKLNT_, OmegaHLXNT_, OmegaNT_, OmegaKW_, OmegaHLW_, OmegaKLW_, OmegaHLXW_, OmegaW_, ...
GN_, Z_, deltaItilde_, scriptFI_, deltaD_, kappa0_, kappah_, ...
kappaT_, kappaNT_, kappaW_, kappaST_, kappaSNT_, kappaSW_, kappaD_, kappaNDCG_, kappaK_, kappaH_, ...
deltaKPT_, deltaHPT_, deltaKPNT_, deltaHPNT_, deltaKPW_, deltaHPW_, deltaKG_, deltaHG_, betabarb, ...
pT0, yTC0, m_, varpi_, eT0_, Ntilde1_, Ntilde2_, Ntilde3_, Ntilde4_);

AdditionalSolution=[WD1_, WW1_, WT1_ ,WNT1_ ,WSW1_ ,WST1_ ,WSNT1_];

if SOC <= 0
	error( 'SOC not satisfied at steady state.' );
end

end

%%
if exitflag>=1
    SolutionGuess=Solution;
end
if exitflag<0
    disp( 'Fsolve was unsuccessful:' );
    disp( exitflag );
end
JP_=real(JP_);
if nargout > 1
    LW1l_ = exp( Solution( 1+(1-1)*28 ) );
    LT1l_ = exp( Solution( 2+(1-1)*28 ) );
    LNT1l_ = exp( Solution( 3+(1-1)*28 ) );
    LSW1l_ = exp( Solution( 4+(1-1)*28 ) );
    LST1l_ = exp( Solution( 5+(1-1)*28 ) );
    LSNT1l_ = exp( Solution( 6+(1-1)*28 ) );
    LNDCG1l_ = exp( Solution( 7+(1-1)*28 ) );
    Lh1l_ = exp( Solution( 8+(1-1)*28 ) );
    CD1l_ = exp( Solution( 9+(1-1)*28 ) );
    CND1l_ = exp( Solution( 10+(1-1)*28 ) );
    LNDCG1b_ = exp( Solution( 11+(1-1)*28 ) );
    Lh1b_ = exp( Solution( 12+(1-1)*28 ) );
    CD1b_ = exp( Solution( 13+(1-1)*28 ) );
    CND1b_ = exp( Solution( 14+(1-1)*28 ) );
	LKP1_ = exp( Solution( 15+(1-1)*28 ) );
	LHP1_ = exp( Solution( 16+(1-1)*28 ) );
	LND1_ = exp( Solution( 17+(1-1)*28 ) );
    LCG1_ = exp( Solution( 18+(1-1)*28 ) );
	LKG1_ = exp( Solution( 19+(1-1)*28 ) );
	LHG1_ = exp( Solution( 20+(1-1)*28 ) );
	KPT1_ = exp( Solution( 21+(1-1)*28 ) );
	KPNT1_ = exp( Solution( 22+(1-1)*28 ) );
	KPW1_ = exp( Solution( 23+(1-1)*28 ) );
    IKP1_ = exp( Solution( 24+(1-1)*28 ) );
    IHP1_ = exp( Solution( 25+(1-1)*28 ) );
    P1_ = exp( Solution( 26+(1-1)*28 ) );
	YWC1_ = exp( Solution( 27+(1-1)*28 ) );
	X1_ = exp( Solution( 28+(1-1)*28 ) );
end

end
