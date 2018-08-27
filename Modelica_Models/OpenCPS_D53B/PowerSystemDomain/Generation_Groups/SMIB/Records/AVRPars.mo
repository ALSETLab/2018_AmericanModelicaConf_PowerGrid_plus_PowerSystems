within OpenCPS_D53B.PowerSystemDomain.Generation_Groups.SMIB.Records;
record AVRPars "Example of AVR parameters"
  extends Modelica.Icons.Record;

  parameter Real T_R=1 "Voltage input time constant (s)";
  parameter Real K_A=40 "AVR gain";
  parameter Real T_A=0.04 "AVR time constant (s)";
  parameter Real V_RMAX=7.3 "Maximum AVR output (pu)";
  parameter Real V_RMIN=-7.3 "Minimum AVR output (pu)";
  parameter Real K_E=1 "Exciter field gain, s";
  parameter Real T_E=0.8 "Exciter time constant (s)";
  parameter Real K_F=0.03 "Rate feedback gain (pu)";
  parameter Real T_F=1 "Rate feedback time constant (s)";
  parameter Real E_1=2.400 "Exciter saturation point 1 (pu)";
  parameter Real S_EE_1=0.30000E-01 "Saturation at E1";
  parameter Real E_2=5.0000 "Exciter saturation point 2 (pu)";
  parameter Real S_EE_2=0.50000 "Saturation at E2";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end AVRPars;
