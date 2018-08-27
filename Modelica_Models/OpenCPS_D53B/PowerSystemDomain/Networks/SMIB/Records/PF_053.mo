within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Records;
record PF_053
  //Power flow results for the snapshot h53.0_after_PF

  extends Modelica.Icons.Record;

  record Voltages
    // Bus number 1
    parameter Real V1=1.000000;
    parameter Real A1=5.514300;
    // Bus number 2
    parameter Real V2=0.993580;
    parameter Real A2=0.924900;
    // Bus number 3
    parameter Real V3=1.000000;
    parameter Real A3=0.000000;
    // Bus number 21
    parameter Real V21=0.990620;
    parameter Real A21=-0.645900;
    // Bus number 22
    parameter Real V22=0.995290;
    parameter Real A22=-0.321400;
    // Bus number 23
    parameter Real V23=0.990620;
    parameter Real A23=-0.645900;
  end Voltages;

  record Machines
    // Machine 3_1
    parameter Real P3_1=0.001000;
    parameter Real Q3_1=1.002000;
    // Machine 1_1
    parameter Real P1_1=5.300000;
    parameter Real Q1_1=0.640000;
  end Machines;

  record Loads
    // Load 23_1
    parameter Real PL23_1=5.300000;
    parameter Real QL23_1=1.060000;
  end Loads;

  record Trafos
    // 2WindingTrafo 1_2
    parameter Real t1_1_2=1.000000;
    parameter Real t2_1_2=1.000000;
  end Trafos;
  Voltages voltages;
  Machines machines;
  Loads loads;
  Trafos trafos;
end PF_053;
