model Chamber_Air
  import Modelica.Units.SI;
  parameter SI.Diameter x_r_start;
  parameter SI.Area A_cs = GP.PI / 4 * (GP.D_ro ^ 2 - GP.D_ri ^ 2);
  parameter SI.Volume V_dead(displayUnit = "cm3") = A_cs * 10e-3;
  parameter SI.Volume V_gas_start(displayUnit = "cm3") = A_cs * (GP.h_o - x_r_start) + V_dead;
  Moving_Surface ms(A = A_cs) annotation(
    Placement(visible = true, transformation(origin = {-86, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-61, -77}, extent = {{-31, -31}, {31, 31}}, rotation = 0)));
  /*a*/
  Sheet_Flow sf annotation(
    Placement(visible = true, transformation(origin = {-10, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-2.44249e-15, -78}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  /*a*/
  Gas gas(V_start = V_gas_start) annotation(
    Placement(visible = true, transformation(origin = {-34, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/
equation
//podstawowe równania i zależności
  ms.p = gas.p;
//objętość gazu
  gas.V = A_cs * (GP.h_o - ms.x) + V_dead;
//masa gazu
  der(gas.M) = sf.gas_Q_M;
//ustwienia grafiki obiektu w widoku diagramowym
  annotation(
    Icon(graphics = {Rectangle(fillColor = {209, 209, 209}, fillPattern = FillPattern.CrossDiag, lineThickness = 1, extent = {{-80, 58}, {80, -58}})}));
  /*a*/
end Chamber_Air;
