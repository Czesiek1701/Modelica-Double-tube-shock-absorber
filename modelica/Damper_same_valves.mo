model Damper_same_valves
  import Modelica.Units.SI;
  extends Modelica.Mechanics.Translational.Interfaces.PartialCompliant;
  SI.Temperature T(start = GP.T_start);
  SI.Mass M_total(displayUnit = "g") = chamber_extension.emu.M + chamber_air.gas.M + chamber_compression.emu.M + chamber_reservoir.emu.M;
  Chamber_Extension chamber_extension annotation(
    Placement(visible = true, transformation(origin = {0, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/
  Piston piston annotation(
    Placement(visible = true, transformation(origin = {-43, 23}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  /*a*/
  Chamber_Compression chamber_compression annotation(
    Placement(visible = true, transformation(origin = {0, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/
  Chamber_Reservoir chamber_reservoir(V_emu_start = GP.V_emu_total_start - chamber_compression.V_emu_start - chamber_extension.V_emu_start) annotation(
    Placement(visible = true, transformation(origin = {40, -6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/
  Chamber_Air chamber_air(x_r_start = chamber_reservoir.x_r_start) annotation(
    Placement(visible = true, transformation(origin = {40, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/
  Valve_Set v_p_com(Q_V_xi_ref = 2.5e-4, d_1 = 2.2e-3, delta_p_f = 2000000, k_z = 1e5, nov = 6) annotation(
    Placement(visible = true, transformation(origin = {-7, 21}, extent = {{-9, -9}, {9, 9}}, rotation = 180)));
  /*a*/
  /*a*/
  /*a*/
  /*a*/
  Valve_Set v_p_ext(Q_V_xi_ref = 2.5e-4, d_1 = 2.2e-3, delta_p_f = 2000000, k_z = 1e5, nov = 6) annotation(
    Placement(visible = true, transformation(origin = {7, 21}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Valve_Set v_f_com(Q_V_xi_ref = 2.5e-4, d_1 = 2.2e-3, delta_p_f = 2000000, k_z = 1e5, nov = 6) annotation(
    Placement(visible = true, transformation(origin = {19, -35}, extent = {{-9, -9}, {9, 9}}, rotation = 90)));
  Valve_Set v_f_ext(Q_V_xi_ref = 2.5e-4, d_1 = 2.2e-3, delta_p_f = 2000000, k_z = 1e5, nov = 6) annotation(
    Placement(visible = true, transformation(origin = {19, -23}, extent = {{-9, -9}, {9, 9}}, rotation = -90)));
equation
  T = chamber_extension.emu.T;
  T = chamber_compression.emu.T;
  T = chamber_reservoir.emu.T;
  T = chamber_air.gas.T;
  s_rel = piston.x + GP.h_fc + GP.h_fp;
  piston.F_en = f;
  connect(chamber_extension.ms, piston.ms_up) annotation(
    Line(points = {{-6, 38}, {-39, 38}, {-39, 19}}));
/*a*/
  connect(chamber_compression.ms, piston.ms_down) annotation(
    Line(points = {{-6, 4}, {-39, 4}, {-39, 10}}));
/*a*/
  connect(chamber_reservoir.ms, chamber_air.ms) annotation(
    Line(points = {{33.9, 1.7}, {33.9, 19.7}, {34, 19.7}, {34, 16}}));
/*a*/
  connect(chamber_reservoir.sf, chamber_air.sf) annotation(
    Line(points = {{40, 1.8}, {40, 16}}));
/*a*/
/*a*/
/*a*/
/*a*/
/*a*/
  connect(chamber_extension.ep_down, v_p_com.ep_out) annotation(
    Line(points = {{0, 38}, {0, 32}, {-6, 32}, {-6, 28}}, color = {10, 141, 255}));
/*a*/
/*a*/
  connect(chamber_compression.ep_up, v_p_com.ep_in) annotation(
    Line(points = {{0, 4}, {0, 10}, {-6, 10}, {-6, 14}}, color = {10, 141, 255}));
/*a*/
/*a*/
  connect(v_p_ext.ep_out, chamber_compression.ep_up) annotation(
    Line(points = {{8, 14}, {8, 4}, {0, 4}}, color = {10, 141, 255}));
  connect(v_p_ext.ep_in, chamber_extension.ep_down) annotation(
    Line(points = {{8, 28}, {0, 28}, {0, 38}}, color = {10, 141, 255}));
  connect(chamber_compression.ep_down, v_f_ext.ep_out) annotation(
    Line(points = {{0, -12}, {0, -22}, {12, -22}}, color = {10, 141, 255}));
  connect(chamber_compression.ep_down, v_f_com.ep_in) annotation(
    Line(points = {{0, -12}, {0, -34}, {12, -34}}, color = {10, 141, 255}));
  connect(chamber_reservoir.ep_down, v_f_ext.ep_in) annotation(
    Line(points = {{40, -14}, {38, -14}, {38, -22}, {26, -22}}, color = {10, 141, 255}));
  connect(v_f_com.ep_out, chamber_reservoir.ep_down) annotation(
    Line(points = {{26, -34}, {40, -34}, {40, -14}}, color = {10, 141, 255}));
  annotation(
    Diagram(graphics = {Text(origin = {56, -6}, extent = {{-16, 14}, {16, -14}}, textString = "Reservoir
 chamber", fontSize = 12), Text(origin = {56, 24}, extent = {{-10, 10}, {10, -10}}, textString = "Air
 chamber", fontSize = 12), Text(origin = {-18, -5}, extent = {{-16, 11}, {16, -11}}, textString = "Compression
 chamber", fontSize = 12), Text(origin = {-55, 27}, extent = {{-5, 3}, {5, -3}}, textString = "Piston", fontSize = 12), Text(origin = {-20, 21}, extent = {{-18, 19}, {18, -19}}, textString = "Piston
 valves
 compression", fontSize = 12), Text(origin = {-16, 47}, extent = {{-18, 15}, {18, -15}}, textString = "Extension
 chamber", fontSize = 12), Text(origin = {18, 21}, extent = {{-18, 19}, {18, -19}}, textString = "Piston
 valves
 extension", fontSize = 12), Text(origin = {20, -45}, extent = {{-18, 19}, {18, -19}}, textString = "Foot
 valves
 compression", fontSize = 12), Text(origin = {18, -11}, extent = {{-18, 19}, {18, -19}}, textString = "Foot
 valves
 extension", fontSize = 12)}),
    Icon(graphics = {Line(origin = {-3.06333, -8.19321}, points = {{64, 15}, {64, 51}, {-82, 51}, {-82, -35}, {64, -35}, {64, -23}, {64, 1}}, color = {0, 85, 127}, thickness = 1.5), Rectangle(origin = {27, 0}, fillColor = {185, 185, 185}, fillPattern = FillPattern.CrossDiag, extent = {{33, 42}, {-33, -42}}), Rectangle(origin = {-46, 0}, rotation = -90, fillColor = {217, 228, 255}, fillPattern = FillPattern.Horizontal, lineThickness = 0.5, extent = {{-43, 39}, {43, -39}}), Rectangle(origin = {-8, 0}, rotation = -90, fillColor = {217, 228, 255}, fillPattern = FillPattern.Horizontal, lineThickness = 0.5, extent = {{-31, 67}, {31, -67}}), Line(origin = {-1.39073, -0.347682}, points = {{62, -8}, {62, 32}, {-74, 32}, {-74, -32}, {62, -32}, {62, -6}, {62, -22}}, color = {170, 85, 127}, thickness = 1.5), Rectangle(origin = {29, 0}, rotation = 90, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-6, -57}, {6, 57}}), Rectangle(origin = {-24, 0}, rotation = 90, fillColor = {255, 255, 255}, fillPattern = FillPattern.VerticalCylinder, extent = {{-30, 6}, {30, -6}})}));
end Damper_same_valves;
