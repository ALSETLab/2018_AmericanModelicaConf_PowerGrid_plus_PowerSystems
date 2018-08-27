within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Records.SimpleSMIB;
record Voltages "P,Q power flow results of every bus"
  extends Modelica.Icons.Record;
  // Bus number 1
  parameter Real V1=1.000000;
  parameter Real A1=4.334500;
  // Bus number 2
  parameter Real V2=0.992810;
  parameter Real A2=0.002100;
  // Bus number 3
  parameter Real V3=1.000000;
  parameter Real A3=0.000000;
  // Bus number 22
  parameter Real V22=0.996410;
  parameter Real A22=0.001000;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Voltages;
