class GP //Global Parameters
  import Modelica.Units.SI;
  
  parameter Real PI=2*Modelica.Math.asin(1.0);
  
  parameter SI.Pressure p_start(displayUnit="MPa") = 1e5+40e5;
  parameter SI.Pressure p_atm(displayUnit="MPa")  = 1e5;
  parameter SI.Temperature T_start(displayUnit="C") = 273.15+15;
  parameter SI.Temperature T_atm(displayUnit="C") = 273.15+15;
  parameter SI.Position x_start(displayUnit="m") = 0.08;
  
  parameter SI.Mass M_liq_total(displayUnit="g") = 0.125;
  parameter SI.Volume V_emu_total_start(displayUnit="cm3") =
   M_liq_total / Liquid.rho_start / (1 - p_start*Emulsion.C_g/Gas.rho_start);
 
  parameter SI.Diameter D_ei = 12e-3;
  parameter SI.Diameter D_eo = 28e-3;
  parameter SI.Diameter D_ri = 30.4e-3;
  parameter SI.Diameter D_ro = 35e-3;
  parameter SI.Length h_i = 180e-3;
  parameter SI.Length h_o = 200e-3;
  parameter SI.Length h_fc = 50e-3;
  parameter SI.Length h_fp = h_o+70e-3;
  
  parameter SI.Area A_c_ext = PI/4*(D_eo^2-D_ei^2);
  parameter SI.Area A_c_com = PI/4*(D_eo^2-0^2);
  parameter SI.Area A_c_res = PI/4*(D_ro^2 - D_ri^2);
  
  parameter SI.Position piston_x_start_up = x_start+Piston.h_p;
  
  parameter SI.Density rho_xi_ref = 900;
  parameter SI.DynamicViscosity mu_xi_ref = 0.04;
  
end GP;
