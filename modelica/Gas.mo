model Gas
  import Modelica.Units.SI;
  
  //Definicja parametrów gazu
  parameter SI.MolarMass mu_m=28.1;
  parameter SI.MolarHeatCapacity R=8.31;
  parameter SI.DynamicViscosity mu_ref=17.83e-6;
  parameter SI.Temperature T_mu_ref=288.15;
  parameter SI.Temperature C=110.4;
  
  //Definicja warunków początkowych
  parameter SI.Mass M_start(displayUnit="g") = V_start*rho_start;
  parameter SI.Density rho_start = GP.p_start*mu_m/GP.T_start/R;
  parameter SI.Volume V_start(displayUnit="cm3") = M_start/rho_start;
  
  //Definicja zmiennych  
  SI.Volume V(start = V_start, displayUnit="cm3");
  SI.Pressure p(start = GP.p_start, displayUnit="MPa");
  SI.Density rho(start = rho_start);
  SI.Temperature T(start = GP.T_start, displayUnit="degC");
  SI.Mass M(start = M_start, displayUnit="g");
  
equation

  //zależność gęstości gazu
  M = rho*V;
  //równanie Clapeyrona
  R/mu_m=p*V/T/M;
  
end Gas;
