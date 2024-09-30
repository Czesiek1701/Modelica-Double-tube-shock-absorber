model Damper_w
  import Modelica.Units.SI;
  
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
  Chamber_Extension chamber_extension annotation(
    Placement(visible = true, transformation(origin = {-2, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/ 
  Piston piston annotation(
    Placement(visible = true, transformation(origin = {-29, 29}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  /*a*/ 
  Chamber_Compression chamber_compression annotation(
    Placement(visible = true, transformation(origin = {0, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/ 
  Chamber_Reservoir chamber_reservoir(V_emu_start = 
  /*a*/ 
  GP.V_emu_total_start - chamber_compression.V_emu_start 
  - chamber_extension.V_emu_start) annotation(
    Placement(visible = true, transformation(origin = {34, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/ 
  Chamber_Air chamber_air(x_start = chamber_reservoir.x_start) annotation(
    Placement(visible = true, transformation(origin = {34, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  SI.HeatFlowRate H_res, H_atm, U, P_w;
  /*a*/ 
  SI.Temperature T(start = GP.T_start);
equation
  
  chamber_extension.emu.T = T;
  chamber_compression.emu.T = T;
  chamber_reservoir.emu.T = T;
  chamber_air.gas.T = T;
  der(T) = 0;

  piston.x = GP.x_start + 0.03 * (cos(6.38 * time * 10) - 1);
//der(chamber_reservoir.ms.x) = 0;
//der(ce.emu.T) = 0;
  connect(chamber_extension.ms, piston.ms_up) annotation(
    Line(points = {{-6.1, 38.3}, {-25.1, 38.3}, {-25.1, 25.3}}));
  connect(chamber_compression.ms, piston.ms_down) annotation(
    Line(points = {{-6.1, 1.7}, {-25.1, 1.7}, {-25.1, 15.7}}));
  connect(chamber_reservoir.ms, chamber_air.ms) annotation(
    Line(points = {{27.9, 15.7}, {27.9, 37.7}}));
  connect(chamber_reservoir.sf, chamber_air.sf) annotation(
    Line(points = {{34, 15.8}, {34, 37.8}}));
  H_res = -piston.v * ((-piston.B) + piston.F_en);
  H_atm = 23.97 * 2 * 3.14 * GP.D_ro * GP.h_o * 4 * (T - GP.T_atm);
  U = 478 * 1 * der(T);
  P_w = chamber_extension.emu.V * der(chamber_extension.emu.p) + chamber_compression.emu.V 
    * der(chamber_compression.emu.p) + chamber_reservoir.emu.V_start * der(chamber_reservoir.emu.p) 
    + chamber_air.gas.V * der(chamber_air.gas.p);
  //H_res-H_atm=U;
  /*a*/
  annotation(
    Diagram(graphics = {Text(origin = {51, 9}, extent = {{-7, 7}, {7, -7}}, textString = "Reservoir
 chamber"), Text(origin = {51, 47}, extent = {{-7, 7}, {7, -7}}, textString = "Air
 chamber"), Text(origin = {-17, 49}, extent = {{-7, 7}, {7, -7}}, textString = "Extension
 chamber"), Text(origin = {-19, -8}, extent = {{-9, 8}, {9, -8}}, textString = "Compression
 chamber"), Text(origin = {-39, 25}, extent = {{-5, 3}, {5, -3}}, textString = "Piston")}),
    Icon(graphics = {Line(origin = {-3.06333, -8.19321}, points = {{64, 15}, {64, 51}, {-82, 51}, {-82, -35}, {64, -35}, {64, -23}, {64, 1}}, color = {0, 85, 127}, thickness = 1.5), Rectangle(origin = {27, 0}, fillColor = {185, 185, 185}, fillPattern = FillPattern.CrossDiag, extent = {{33, 42}, {-33, -42}}), Rectangle(origin = {-46, 0}, rotation = -90, fillColor = {217, 228, 255}, fillPattern = FillPattern.Vertical, lineThickness = 0.5, extent = {{-43, 39}, {43, -39}}), Rectangle(origin = {-8, 0}, rotation = -90, fillColor = {217, 228, 255}, fillPattern = FillPattern.Vertical, lineThickness = 0.5, extent = {{-31, 67}, {31, -67}}), Line(origin = {-1.39073, -0.347682}, points = {{62, -8}, {62, 32}, {-74, 32}, {-74, -32}, {62, -32}, {62, -6}, {62, -22}}, color = {170, 85, 127}, thickness = 1.5), Rectangle(origin = {29, 0}, rotation = 90, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-6, -57}, {6, 57}}), Rectangle(origin = {-24, 0}, rotation = 90, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-30, 6}, {30, -6}})}));
end Damper_w;
