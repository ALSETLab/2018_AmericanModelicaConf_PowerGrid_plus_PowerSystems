within OpenCPS_D53B.PowerSystemDomain.Generation_Groups.SMIB.Records;
record PSSPars "Example of PSS parameters"
  extends Modelica.Icons.Record;

  parameter Real T_w1=10 "Washout 1 time constant";
  parameter Real T_w2=10 "Washout 2 time constant";
  parameter Real T_6=1e-9 "Lag 1 time constant";
  parameter Real T_w3=10 "Washout 3 time constant";
  parameter Real T_w4=1e-9 "Washout 4 time constant";
  parameter Real T_7=10 "Lag 2 time constant";
  parameter Real K_S2=0.99 "Lag 2 gain";
  parameter Real K_S3=1 "gain";
  parameter Real T_8=0.5 "Ramp-tracking filter time constant";
  parameter Real T_9=0.1 "Ramp-tracking filter time constant";
  parameter Real K_S1=20 "PSS gain";
  parameter Real T_1=0.15 "Leadlag1 time constant (data from IEEE std, not representive, need to be tuned following system parameters)";
  parameter Real T_2=0.025 "Leadlag1 time constant";
  parameter Real T_3=0.15 "Leadlag2 time constant";
  parameter Real T_4=0.025 "Leadlag2 time constant";
  parameter Real V_STMAX=0.1 "PSS output limiation";
  parameter Real V_STMIN=-0.1 "PSS output limiation";
  parameter Real M=0 "Ramp tracking filter coefficient";
  parameter Real N=0 "Ramp tracking filter coefficient";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end PSSPars;
