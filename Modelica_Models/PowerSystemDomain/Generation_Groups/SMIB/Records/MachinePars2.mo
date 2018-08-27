within OpenCPS_D53B.PowerSystemDomain.Generation_Groups.SMIB.Records;
record MachinePars2 "Parameters taken from Anderson book"
  extends Modelica.Icons.Record;

  parameter Real M_b=10 "Machine base power (MVA)";
  parameter Real Tpd0=7.5 "d-axis transient open-circuit time constant (s)";
  parameter Real Tppd0=0.054 "d-axis sub-transient open-circuit time constant (s)";
  parameter Real Tppq0=0.107 "q-axis transient open-circuit time constant (s)";
  parameter Real H=4.28 "Inertia constant (s)";
  parameter Real D=2 "Speed damping";
  parameter Real Xd=1.64 "d-axis reactance";
  parameter Real Xq=1.575 "q-axis reactance";
  parameter Real Xpd=0.159 "d-axis transient reactance";
  parameter Real Xppd=0.102 "d-axis sub-transient reactance";
  parameter Real Xppq=0.1 "q-axis sub-transient reactance";
  parameter Real Xl=0.113 "leakage reactance";
  parameter Real S10=0.087 "Saturation factor at 1.0 pu";
  parameter Real S12=0.2681 "Saturation factor at 1.2 pu";
  parameter Real R_a=0.034 "amature resistance";
  parameter Real Xpq=0.306 "q-axis transient reactance (pu)";
  parameter Real Tpq0=1.5 "q-axis transient open-circuit time constant (s)";
  parameter Real Xpp=Xppd "Sub-transient reactance (pu)";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MachinePars2;
