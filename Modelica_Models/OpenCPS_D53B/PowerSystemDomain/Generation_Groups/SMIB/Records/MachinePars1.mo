within OpenCPS_D53B.PowerSystemDomain.Generation_Groups.SMIB.Records;
record MachinePars1 "Original OpenIPSL GENROU Model Parameters"
  extends Modelica.Icons.Record;

  parameter Real M_b=10 "Machine base power (MVA)";
  parameter Real Tpd0=5 "d-axis transient open-circuit time constant (s)";
  parameter Real Tppd0=0.50000E-01 "d-axis sub-transient open-circuit time constant (s)";
  parameter Real Tppq0=0.1 "q-axis transient open-circuit time constant (s)";
  parameter Real H=4.0000 "Inertia constant (s)";
  parameter Real D=0 "Speed damping";
  parameter Real Xd=1.41 "d-axis reactance";
  parameter Real Xq=1.3500 "q-axis reactance";
  parameter Real Xpd=0.3 "d-axis transient reactance";
  parameter Real Xppd=0.2 "d-axis sub-transient reactance";
  parameter Real Xppq=0.2 "q-axis sub-transient reactance";
  parameter Real Xl=0.12 "leakage reactance";
  parameter Real S10=0.1 "Saturation factor at 1.0 pu";
  parameter Real S12=0.5 "Saturation factor at 1.2 pu";
  parameter Real R_a=0 "amature resistance";
  parameter Real Xpq=0.6 "q-axis transient reactance (pu)";
  parameter Real Tpq0=0.7 "q-axis transient open-circuit time constant (s)";
  parameter Real Xpp=0.2 "Sub-transient reactance (pu)";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end MachinePars1;
