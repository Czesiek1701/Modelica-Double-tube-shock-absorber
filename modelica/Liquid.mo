model Liquid
  import Modelica.Units.SI;
  
  //Definicja parametrów cieczy
  parameter SI.Density rho_ref = 860;
  parameter SI.Pressure p_rho_ref = 1e5;
  parameter SI.Compressibility beta = 5e-10;
  parameter SI.Temperature T_rho_ref = 288.15;
  parameter SI.LinearExpansionCoefficient tau = 1e-3;
  parameter SI.DynamicViscosity mu_ref = 40e-3;
  parameter SI.Temperature T_mu_ref = 288.15;
  parameter SI.RelativePressureCoefficient gamma = -0.02;
  
  //Definicja warunków początkowych
  parameter SI.Volume V_start(displayUnit="cm3");
  parameter SI.Density rho_start = 
    rho_ref*(1 + beta*(GP.p_start-p_rho_ref) - tau*(GP.T_start-T_rho_ref));
  parameter SI.Mass M_start(displayUnit="g") = V_start*rho_start;
  
  //Definicja zmiennych
  SI.Volume V(start = V_start, displayUnit="cm3");
  SI.Pressure p(start = GP.p_start, displayUnit="MPa");
  SI.Density rho(start = rho_start);
  SI.Temperature T(start = GP.T_start, displayUnit="C");
  SI.Mass M (start = M_start, displayUnit="g");
  SI.DynamicViscosity mu;

equation

  //zależność gęstości cieczy
  M = rho*V;
  //równanie ściśliwości i rozszrzalności cieplnej cieczy
  der(rho)/rho = beta*der(p) - tau*der(T);
  //równanie lepkości cieczy
  mu = mu_ref*(1+gamma*(T-T_mu_ref));
  //M*2500*der(T)=-p*der(V);
  
end Liquid;
