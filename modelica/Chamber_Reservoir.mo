model Chamber_Reservoir
  import Modelica.Units.SI;
  //definicja parametrów
  parameter SI.Area A_cs = GP.A_c_res;
  parameter SI.Volume V_dead(displayUnit = "cm3") = A_cs * 10e-3;
  parameter SI.Volume V_emu_start(displayUnit = "cm3");
  parameter SI.Diameter x_r_start = (V_emu_start - V_dead) / A_cs;
  parameter Real nu=2;
  //definicja obiektów
  Emulsion_Port ep_down annotation(
    Placement(visible = true, transformation(origin = {-6, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -78}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
  /*a*/
  Moving_Surface ms(A = A_cs) annotation(
    Placement(visible = true, transformation(origin = {-86, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-61, 77}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  /*a*/
  Emulsion emu(V_start = V_emu_start) annotation(
    Placement(visible = true, transformation(origin = {-50, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/
  Sheet_Flow sf annotation(
    Placement(visible = true, transformation(origin = {-10, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2.44249e-15, 78}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  /*a*/
equation
//podstawowe równania i zależności
  ms.p = emu.p;
  ep_down.p = emu.p;
  ep_down.f_gas_M = emu.f_gas_M;
  ep_down.f_liq_M = 1 - emu.f_gas_M;
  ep_down.gas_rho = emu.gas.rho;
  ep_down.liq_rho = emu.liq.rho;
  ep_down.liq_mu = emu.liq.mu;
//objętość emulsji
  emu.V = A_cs * ms.x + V_dead;
//absorbcja gazu
  sf.gas_Q_M = nu * (emu.gas_M_max - emu.gas.M);
//masa emulsji
  der(emu.gas.M) = ep_down.gas_Q_M + sf.gas_Q_M;
  der(emu.liq.M) = ep_down.liq_Q_M;
//ustwienia grafiki obiektu w widoku diagramowym
  annotation(
    Icon(graphics = {Rectangle(fillColor = {201, 202, 255}, fillPattern = FillPattern.Horizontal, lineThickness = 1, extent = {{-80, 58}, {80, -58}})}));
  /*a*/
end Chamber_Reservoir;
