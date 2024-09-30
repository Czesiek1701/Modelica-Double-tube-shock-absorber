model Disc_Valve
  import Modelica.Units.SI;
  //definicja parametrów geometrycznych
  parameter SI.Length h_0(displayUnit="mm");
  parameter Real alpha = 1.5;
  parameter SI.Diameter d_1;
  parameter SI.Diameter d_2 = alpha * d_1;
  parameter SI.Length delta_r = (d_2-d_1)/2;
  parameter SI.Diameter d_z = sqrt( 1/4*d_1^2 + 4/3*delta_r^2 );
  parameter SI.Length l = 10e-3;
  parameter SI.Area A_1 = GP.PI * d_1^2/4;
  parameter SI.Area A_2_0 = GP.PI * d_2 * h_0;
  parameter SI.Area A_3_0 = sqrt(d_1 * d_2) * h_0;

//definicja parametrów przepływu
  parameter SI.Pressure delta_p_f;
  parameter Real xi_z_0 = (4*alpha*h_0/d_1)^2*(xi_1_ref-1) 
    + xi_3_ref*GP.PI^2*alpha+1;
  parameter SI.VolumeFlowRate Q_V_xi_ref;
  parameter Real xi_1_ref=16*GP.PI*l/Q_V_xi_ref * GP.mu_xi_ref/GP.rho_xi_ref; 
  parameter Real xi_3_ref=3*GP.PI*(alpha-1)*sqrt(alpha)*d_1^2/h_0/Q_V_xi_ref
    * GP.mu_xi_ref/GP.rho_xi_ref;
  //definicja parametrów sprężyny
  parameter SI.Force F_k_0 = delta_p_f * ( 2*A_2_0/xi_z_0 + GP.PI * 
    d_z^2 * (1-xi_1_ref/xi_z_0*(4*alpha*h_0/d_1)^2) );
  parameter SI.TranslationalSpringConstant k_z;
  //definicja parametrów siły reakcji
  parameter SI.Length h_ref = 1e-7;
  parameter SI.TranslationalSpringConstant k_r = 1e8;

//definicja parametru masy dysku
  parameter SI.Mass M=1e-4;
  parameter SI.TranslationalDampingConstant b = 10;
  //definicja zmiennych
  SI.Position h (start=h_0-F_k_0/k_r,displayUnit="mm");
  SI.Velocity c_h=der(h);
  SI.Acceleration a_h=der(c_h);
  SI.Area A_2;
  SI.Force F_k, F_hd, F_p, F_R;
  Real w_r, w_p;
  SI.Pressure delta_p;
  Real xi_1, xi_3, xi_z;
  Real f_xi;
  SI.VolumeFlowRate Q_V_1;
  SI.Density rho_av;
  Real Re = Q_V_1/A_1*d_1*rho_av/0.04;
  
equation
//definicja współczynników start
  xi_1 = xi_1_ref * f_xi;
  xi_3=xi_3_ref*f_xi;
  xi_z = (4*alpha*h/d_1)^2*(xi_1-1)+xi_3*GP.PI^2*alpha+1;
//definicja wskaźników
  w_r = tanh((h_0 - h) / h_ref) * 0.5 + 0.5;
  w_p =  tanh(delta_p) * 0.5 + 0.5;
//definicja sił działającyh na dysk
  F_R = w_r * k_r * (h_0 - h);
  F_p = GP.PI * d_z^2*(1-xi_1/xi_z* (4*alpha*h/d_1)^2 ) * (delta_p);
//F_hd = 2*A_2*(delta_p)/xi_z;
  F_hd = rho_av * Q_V_1 * (Q_V_1 / A_1 - c_h);
  F_k = F_k_0+k_z*(h-h_0);
//bilans sił działających na dysk
  a_h * M = F_hd + F_p + F_R - F_k - c_h * b;
//pola powierzchni przekrojów przepływów
  A_2 = GP.PI * d_2 * h * w_p;
//wartość przepływu przez pojedynczy zawór
  Q_V_1 = A_2 * sqrt(2 * abs(delta_p) / rho_av / xi_z);
annotation(
    Icon(graphics = {Rectangle(fillPattern = FillPattern.Solid, extent = {{-100, 18}, {100, -18}})}));
/*a*/
end Disc_Valve;
