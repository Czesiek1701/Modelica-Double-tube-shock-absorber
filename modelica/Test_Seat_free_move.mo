model Test_Seat_free_move
  /*a*/
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {28, -46}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  /*a*/
  /*a*/
  /*a*/
  /*a*/
  //Real c_dump = (damper.piston.E_h - delay(damper.piston.E_h, 1 / 2 / sine.f)) / (GP.PI * sine.amplitude ^ 2 * 2 * GP.PI * sine.f);
  Damper damper annotation(
    Placement(visible = true, transformation(origin = {29, -3}, extent = {{-27, -27}, {27, 27}}, rotation = 90)));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 452.289 / 9.81 * 1.0, s(start = GP.h_fc + GP.h_fp + GP.x_start), v(start = -3.5))  annotation(
    Placement(visible = true, transformation(origin = {30, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sources.Force force annotation(
    Placement(visible = true, transformation(origin = {30, 86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
//  damper.T = GP.T_start + ramp.y;
  der(damper.T) = 0;
  force.f=-9.81*mass.m;
  //der(mass.flange_a.s)=0;
  connect(fixed.flange, damper.flange_a) annotation(
    Line(points = {{28, -46}, {28, -30}, {29, -30}}, color = {0, 127, 0}));
  connect(mass.flange_a, damper.flange_b) annotation(
    Line(points = {{30, 42}, {30, 24}, {29, 24}}, color = {0, 127, 0}));
  connect(force.flange, mass.flange_b) annotation(
    Line(points = {{30, 76}, {30, 62}}, color = {0, 127, 0}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram,
    experiment(StartTime = 0, StopTime = 0.1, Tolerance = 1e-6, Interval = 0.0001));
end Test_Seat_free_move;
