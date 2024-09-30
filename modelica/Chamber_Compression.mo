model Chamber_Compression
  import Modelica.Units.SI;
  //definicja parametrów
  parameter SI.Area A_cs = GP.A_c_com;
  parameter SI.Volume V_dead(displayUnit = "cm3") = A_cs * 10e-3;
  parameter SI.Volume V_emu_start(displayUnit = "cm3") = A_cs * GP.x_start + V_dead;
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
  Emulsion_Port ep_up annotation(
    Placement(visible = true, transformation(origin = {0, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-3.55271e-15, 78}, extent = {{-32, -32}, {32, 32}}, rotation = 0)));
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
  ep_up.p = emu.p;
  ep_up.f_gas_M = emu.f_gas_M;
  ep_up.f_liq_M = 1 - emu.f_gas_M;
  ep_up.gas_rho = emu.gas.rho;
  ep_up.liq_rho = emu.liq.rho;
  ep_up.liq_mu = emu.liq.mu;
//objętość emulsji
  emu.V = A_cs * ms.x + V_dead;
//masa emulsji
  der(emu.gas.M) = ep_down.gas_Q_M + ep_up.gas_Q_M;
  der(emu.liq.M) = ep_down.liq_Q_M + ep_up.liq_Q_M;
  annotation(
    Icon(graphics = {Rectangle(fillColor = {201, 202, 255}, fillPattern = FillPattern.Horizontal, lineThickness = 1, extent = {{-80, 58}, {80, -58}})}));
  /*a*/
end Chamber_Compression;
