model Test_Seat2
  /*a*/
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {26, -24}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  /*a*/
  /*a*/
  /*a*/
  /*a*/
  Real c_dump = (damper.piston.E_h - delay(damper.piston.E_h, 1 / 2 / 1)) / (GP.PI * 1 ^ 2 * 2 * GP.PI * 1);
  Damper damper(T(start = GP.h_fc + GP.h_fp + GP.x_start), s_rel(fixed = true)) annotation(
    Placement(visible = true, transformation(origin = {27, 17}, extent = {{-27, -27}, {27, 27}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 400) annotation(
    Placement(visible = true, transformation(origin = {38, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//  damper.T = GP.T_start + ramp.y;
  der(damper.T) = 0;
/*a*/
/*a*/
/*a*/
/*a*/
/*a*/
  connect(fixed.flange, damper.flange_a) annotation(
    Line(points = {{26, -24}, {26, -18}, {28, -18}, {28, -10}}, color = {0, 127, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram,
    experiment(StartTime = 0, StopTime = 0.1, Tolerance = 1e-6, Interval = 0.0001));
end Test_Seat2;
