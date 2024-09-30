connector Emulsion_Port
  import Modelica.Units.SI;
  
  SI.Pressure p(fixed=false, displayUnit="MPa");
  flow SI.MassFlowRate liq_Q_M(displayUnit="g/s");
  flow SI.MassFlowRate gas_Q_M(displayUnit="g/s");
  Real f_gas_M;
  Real f_liq_M;
  SI.Density liq_rho;
  SI.Density gas_rho;
  SI.DynamicViscosity liq_mu;
  annotation(
    Diagram(graphics = {Rectangle(fillColor = {154, 193, 253}, lineThickness = 0.75, extent = {{-60, 60}, {60, -60}}), Ellipse(fillColor = {26, 30, 255}, fillPattern = FillPattern.Solid, extent = {{-40, 40}, {40, -40}})}),
    Icon(graphics = {Ellipse(lineColor = {10, 141, 255},fillColor = {26, 30, 255}, lineThickness = 1.75, extent = {{-40, 40}, {40, -40}}), Rectangle(fillColor = {154, 193, 253}, lineThickness = 0.75, extent = {{-60, 60}, {60, -60}})})
  );
  /*a*/  
end Emulsion_Port;
