connector Moving_Surface
  import Modelica.Units.SI; 
  
//  parameter SI.Position x_start(displayUnit="mm");
  parameter SI.Area A(displayUnit="mm");
  
  SI.Pressure p(start=GP.p_start,displayUnit="MPa");
  SI.Position x(displayUnit="mm");
  annotation(
    Icon(graphics = {Line(points = {{-60, 0}, {60, 0}}, thickness = 1.25), Line(origin = {-40.3031, 20.0149}, points = {{0, 29}, {0, -19}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Rectangle(lineThickness = 0.5, extent = {{-60, 60}, {60, -60}}), Line(origin = {0.33621, 19.8668}, points = {{0, 29}, {0, -19}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {40.1283, 19.8257}, points = {{0, 29}, {0, -19}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {-40.2948, -19.9434}, rotation = 180, points = {{0, 29}, {0, -19}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {0.235232, -19.75}, rotation = 180, points = {{0, 29}, {0, -19}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6), Line(origin = {40.0251, -19.9267}, rotation = 180, points = {{0, 29}, {0, -19}}, thickness = 1, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 6)})
  //ustwienia grafiki obiektu w widoku diagramowym
  );
  /*a*/
end Moving_Surface;
