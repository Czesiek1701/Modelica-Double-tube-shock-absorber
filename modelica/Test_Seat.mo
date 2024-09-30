model Test_Seat
  Damper damper annotation(
    Placement(visible = true, transformation(origin = {26, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 90)));
  /*a*/
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation(
    Placement(visible = true, transformation(origin = {26, -24}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  /*a*/
  Modelica.Mechanics.Translational.Sources.Position position(useSupport = true) annotation(
    Placement(visible = true, transformation(origin = {-16, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/
  Modelica.Blocks.Sources.Sine sine(amplitude = 0.02, f = 15) annotation(
    Placement(visible = true, transformation(origin = {-58, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/
  Modelica.Mechanics.Translational.Components.Fixed fixed_support(s0 = GP.h_fc + GP.h_fp + GP.x_start) annotation(
    Placement(visible = true, transformation(origin = {-16, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/
equation
  connect(damper.flange_a, fixed.flange) annotation(
    Line(points = {{26, -12}, {26, -24}}, color = {0, 127, 0}));
/*a*/
  connect(damper.flange_b, position.flange) annotation(
    Line(points = {{26, 28}, {26, 44}, {-6, 44}}, color = {0, 127, 0}));
/*a*/
  connect(position.s_ref, sine.y) annotation(
    Line(points = {{-28, 44}, {-46, 44}}, color = {0, 0, 127}));
/*a*/
  connect(position.support, fixed_support.flange) annotation(
    Line(points = {{-16, 34}, {-16, 26}}, color = {0, 127, 0}));
/*a*/
/*a*/
  annotation(
    uses(Modelica(version = "4.0.0")),
    Diagram);
end Test_Seat;
