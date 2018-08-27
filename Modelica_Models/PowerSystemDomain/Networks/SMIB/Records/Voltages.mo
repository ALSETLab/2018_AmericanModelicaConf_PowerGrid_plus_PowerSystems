within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Records;
record Voltages "P,Q power flow results of every bus"
  extends Modelica.Icons.Record;
  // Bus number 1
  parameter Real V1=1.000000;
  parameter Real A1=5.198700;
  // Bus number 2
  parameter Real V2=0.994050;
  parameter Real A2=0.871700;
  // Bus number 3
  parameter Real V3=1.000000;
  parameter Real A3=0.000000;
  // Bus number 21
  parameter Real V21=0.991250;
  parameter Real A21=-0.608700;
  // Bus number 22
  parameter Real V22=0.995610;
  parameter Real A22=-0.303000;
  // Bus number 23
  parameter Real V23=0.991250;
  parameter Real A23=-0.608700;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Voltages;
