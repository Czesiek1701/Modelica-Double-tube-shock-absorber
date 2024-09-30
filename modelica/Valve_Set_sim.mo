model Valve_Set_sim
  import Modelica.Units.SI;
  //definicja parametrów dziedziczonych przez md
  parameter SI.Diameter d_1 = 2.5e-3;
  parameter SI.Pressure delta_p_f = 50e5;
  parameter SI.TranslationalSpringConstant k_z = 5e4;
  parameter SI.Length h_0(displayUnit = "mm") = 1e-4;
  //ilość pojedynczych zaworów
  parameter Integer nov = 6;
  //definicja referencyjnych strat miejscowych
  parameter SI.VolumeFlowRate Q_V_xi_ref = 1.5e-4;
  //definicja zmiennych
  SI.Pressure delta_p = ep_in.p - ep_out.p;
  Real f_xi;
  SI.Density rho_in, rho_out, rho_av;
  SI.DynamicViscosity mu_in, mu_out, mu_av;
  SI.VolumeFlowRate Q_V;
  SI.MassFlowRate Q_M;
  //definicja obiektów
  Emulsion_Port ep_in annotation(
    Placement(visible = true, transformation(origin = {-16, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 78}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
  /*a*/
  Emulsion_Port ep_out annotation(
    Placement(visible = true, transformation(origin = {-4, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {4.88498e-15, -78}, extent = {{-28, -28}, {28, 28}}, rotation = 0)));
  /*a*/
  Disc_Valve dv(delta_p_f = delta_p_f, k_z = k_z, d_1 = d_1, Q_V_xi_ref = Q_V_xi_ref / nov, h_0 = h_0) annotation(
    Placement(visible = true, transformation(origin = {-30, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /*a*/
equation

  ep_in.f_gas_M=0;
  ep_out.f_liq_M=1;
  ep_in.gas_rho=0;
  ep_out.gas_rho=0;
  ep_in.liq_rho=Liquid.rho_ref;
  ep_out.liq_rho=Liquid.rho_ref;
  ep_in.liq_mu=Liquid.mu_ref;
  ep_out.liq_mu=Liquid.mu_ref;
  ep_out.p=1e5;
  ep_in.p=2e5;
  

//podstawowe zależności
  ep_in.gas_Q_M = Q_M * ep_in.f_gas_M;
  ep_in.liq_Q_M = Q_M * ep_in.f_liq_M;
  ep_in.gas_Q_M + ep_out.gas_Q_M = 0;
  ep_in.liq_Q_M + ep_out.liq_Q_M = 0;
  dv.delta_p = delta_p;
  dv.f_xi = f_xi;
  dv.rho_av = rho_av;
//parametry przepływającego medium
  rho_in = ep_in.liq_rho * ep_in.gas_rho / (ep_in.f_gas_M * ep_in.liq_rho + ep_in.f_liq_M * ep_in.gas_rho);
  rho_out = ep_out.liq_rho * ep_out.gas_rho / (ep_out.f_gas_M * ep_out.liq_rho + ep_out.f_liq_M * ep_out.gas_rho);
  rho_av = 0.5 * (rho_in + rho_out);
  mu_in = ep_in.liq_mu * (1 + ep_in.f_gas_M * rho_in / ep_in.gas_rho * Emulsion.k);
  mu_out = ep_out.liq_mu * (1 + ep_out.f_gas_M * rho_out / ep_out.gas_rho * Emulsion.k);
  mu_av = 0.5 * (mu_in + mu_out);
  f_xi = mu_av / GP.mu_xi_ref * GP.rho_xi_ref / rho_av;
//Przepływ objętościowy i masowy przez zestaw zaworów
  Q_V = nov * dv.Q_V_1;
  Q_M = Q_V * rho_av;
/*a*/
  annotation(
    Icon(graphics = {Rectangle(origin = {31, 40}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Backward, lineThickness = 0.5, extent = {{19, -10}, {-19, 10}}), Line(origin = {4.83289, -31.6618}, points = {{5, 5}, {-1, -1}}), Line(origin = {0.175295, -26.2976}, points = {{-25.5, 0}, {26.5, 0}, {24.5, 0}}, thickness = 0.5), Line(origin = {-25.3075, -32.317}, points = {{5, 5}, {-5, -5}}), Line(origin = {0.675289, 41.0473}, rotation = 180, points = {{0, -8}, {0, 20}}, color = {85, 0, 255}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Rectangle(lineThickness = 0.5, extent = {{-50, 60}, {50, -60}}), Rectangle(origin = {0, 8}, lineColor = {93, 93, 93}, fillColor = {134, 134, 134}, fillPattern = FillPattern.VerticalCylinder, lineThickness = 0.5, extent = {{-30, 4}, {30, -4}}), Line(origin = {29.5017, 0.0909388}, points = {{-20, 20}, {0, 20}}, color = {85, 0, 255}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {0.675289, -35.1455}, rotation = 180, points = {{0, 0}, {0, 20}}, color = {85, 0, 255}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Line(origin = {0.922901, -32.2722}, points = {{20.0799, 7.0482}, {20.0799, 7.0482}, {-19.9201, 17.0482}, {-19.9201, 17.0482}, {20.0799, 7.04823}, {-19.9201, 17.0482}, {20.0799, 27.0482}, {-19.9201, 35.0482}, {-19.9201, 35.0482}}, color = {255, 0, 0}, thickness = 0.5), Line(origin = {-15.8067, -31.9894}, points = {{5, 5}, {-5, -5}}), Line(origin = {-4.34029, -31.6618}, points = {{5, 5}, {-5, -5}}), Line(origin = {-29.1364, 0.0908787}, points = {{20, 20}, {0, 20}}, color = {85, 0, 255}, thickness = 0.75, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5), Rectangle(origin = {-31, 40}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Backward, lineThickness = 0.5, extent = {{-19, 10}, {19, -10}})}));
end Valve_Set_sim;
