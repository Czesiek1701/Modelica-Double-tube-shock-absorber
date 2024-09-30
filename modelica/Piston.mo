model Piston
  import Modelica.Units.SI;
  
  //definicja parametrów
  parameter SI.Position x_start(displayUnit = "mm") = GP.x_start;
  parameter SI.Length h_p = 10e-3;
  parameter SI.Mass M = 10;
  parameter SI.Force T_max = 22;
  parameter SI.Velocity v_ref = 0.5;
  
  //definicja zmiennych
  SI.Position x(start = x_start, displayUnit = "mm");
  SI.Velocity v = der(x);
  SI.Acceleration a = der(v);
  SI.Force B, F_com, F_ext, F_atm, T, F_h, F_st, F_en;
  SI.Pressure delta_p = ms_down.p - ms_up.p;
  
  //przypisane obiekty
  Moving_Surface ms_up(A=GP.A_c_ext) annotation(
    Placement(visible = true, transformation(origin = {-36, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {24, -26}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  /*a*/
  Moving_Surface ms_down(A=GP.A_c_com) annotation(
    Placement(visible = true, transformation(origin = {66, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {24, -74}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  /*a*/

equation

  //położenie powierzchni tłoka
  ms_down.x + h_p = ms_up.x;
  x=ms_down.x;
  //definicja sił
  B = M * a;
  F_com = ms_down.p * ms_down.A;
  F_ext = ms_up.p * ms_up.A;
  F_atm = GP.p_atm * (ms_down.A - ms_up.A);
  T = T_max * tanh(v / v_ref);
  B = F_com - F_ext - F_atm - T - F_en;
  //definicja sił 
  F_st = GP.p_start * (ms_down.A - ms_up.A);
  F_h = F_com - F_ext - F_atm - T - F_st;
  annotation(
    Icon(graphics = {Rectangle(origin = {0, 19}, fillColor = {200, 200, 200}, fillPattern = FillPattern.VerticalCylinder, extent = {{-10, 59}, {10, -59}}), Rectangle(origin = {0, -50}, fillColor = {216, 216, 216}, fillPattern = FillPattern.VerticalCylinder, extent = {{-60, 10}, {60, -10}})}));
/*a*/
end Piston;
