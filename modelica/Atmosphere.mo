model Atmosphere
  Emulsion_Port ep annotation(
    Placement(visible = true, transformation(origin = {0, -36}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 0}, extent = {{-22, -22}, {22, 22}}, rotation = 0)));
equation

  ep.gas_rho=1.2;
  ep.liq_rho=860;
  ep.p=GP.p_atm*100;
  ep.f_gas_M=0.9;
  ep.liq_mu = 1;


annotation(
    Icon(graphics = {Rectangle(extent = {{-60, 60}, {60, -60}})}));
end Atmosphere;
