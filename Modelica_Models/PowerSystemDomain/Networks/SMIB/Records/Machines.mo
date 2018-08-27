within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Records;
record Machines "P,Q power flow results of the machines"
  extends Modelica.Icons.Record;
  // Machine 3_1
  parameter Real P3_1=0.001000;
  parameter Real Q3_1=0.932000;
  // Machine 1_1
  parameter Real P1_1=5.000000;
  parameter Real Q1_1=0.585000;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Machines;
