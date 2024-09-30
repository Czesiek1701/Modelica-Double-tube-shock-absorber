model Emulsion
  import Modelica.Units.SI;
  
  //definicja obiektów
  Gas gas(M_start = M_gas_start) annotation(
    Placement(visible = true, transformation(origin = {-78, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0))
  //ustwienia grafiki obiektu w widoku diagramowym
  );
  /*a*/
  Liquid liq(V_start = V_liq_start) annotation(
    Placement(visible = true, transformation(origin = {-50, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0))
  //ustwienia grafiki obiektu w widoku diagramowym 
  );
  /*a*/

  //definicja parametrów gazu
  parameter Real C_g(unit="kg / (m3 * Pa)")=1/1e6;
  parameter Real k=1.5;

  //definicja warunków początkowych
  parameter SI.Volume V_start(displayUnit="cm3");
  parameter SI.Mass M_gas_start(displayUnit="g") = C_g*GP.p_start*V_start;
  parameter SI.Volume V_liq_start(displayUnit="cm3") = V_start - gas.V_start;
  
  parameter SI.Density rho_start = (gas.M_start+liq.M_start)/V_start;
  parameter SI.Mass M_start(displayUnit="g") = gas.M_start+liq.M_start;
  
  //definicja zmiennych  
  SI.Volume V(start = V_start, displayUnit="cm3");
  SI.Pressure p(start = GP.p_start, displayUnit="MPa");
  SI.Density rho(start = rho_start);
  SI.Temperature T(start = GP.T_start, displayUnit="C");
  SI.Mass M(start = M_start, displayUnit="g");
  SI.DynamicViscosity mu;
  Real gas_M_max;
  Real f_gas_M, f_gas_M_max;
  Real f_gas_V;
  
  Real dM=der(M);
  
equation
  
  //podstawowe zależności i uproszczenia
  V = gas.V + liq.V;
  M = gas.M + liq.M;
  p = gas.p;
  p = liq.p;
  T = gas.T;
  T = liq.T;
  //zależność gęstości
  rho = M / V;
  //udziały masowe i objętościowe
  f_gas_M = gas.M/M;
  f_gas_V = gas.V/V;
  f_gas_M_max = gas_M_max/M;
  //prawo Henry'ego
  gas_M_max = C_g * p / rho;
  //lepkość emulsji
  mu=liq.mu*(1+f_gas_V*k);

end Emulsion;
