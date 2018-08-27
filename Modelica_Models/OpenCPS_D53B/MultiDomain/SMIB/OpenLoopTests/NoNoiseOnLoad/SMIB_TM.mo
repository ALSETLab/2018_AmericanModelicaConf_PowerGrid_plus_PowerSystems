within OpenCPS_D53B.MultiDomain.SMIB.OpenLoopTests.NoNoiseOnLoad;
model SMIB_TM "Open-Loop Test of the Single-Shaft Gas Turbine Model driving generator of the SMIB network"
  extends PowerSystemDomain.Networks.SMIB.Partial.SMIB_Partial_NoNoise(
    transformer(V_b=13.8, Vn=13.8),
    LOAD(V_b=13.8),
    GEN1(V_b=13.8),
    BUS1(V_b=13.8),
    BUS2(V_b=13.8),
    BUS3(V_b=13.8),
    GEN2(V_b=13.8),
    infiniteGen(
      V_b=13.8,
      M_b=1000,
      P_0=pf_results.machines.P3_1,
      Q_0=pf_results.machines.Q3_1,
      V_0=pf_results.voltages.V3,
      angle_0=pf_results.voltages.A3),
    variableLoad(
      d_P=0,
      t1=0,
      d_t=0,
      P_0=pf_results.loads.PL23_1,
      Q_0=pf_results.loads.QL23_1,
      V_0=pf_results.voltages.V23,
      angle_0=pf_results.voltages.A23),
    pMU(V_0=pf_results.voltages.V23, angle_0=pf_results.voltages.A23));
  import Modelica.Constants.pi;

  Modelica.Blocks.Sources.Step step(
    startTime=30,
    height=0.2,
    offset=0.483333) annotation (Placement(transformation(extent={{-128,0},{-114,14}})));
  TurboMachineryDomain.GTModels.ThPowerSSGT ssgt annotation (Placement(transformation(extent={{-106,-14},{-78,14}})));
  Generation_Groups.SMIB.Gen_GT genGroup(
    V_b=13.8,
    M_b=10,
    Q_0=pf_results.machines.Q1_1,
    P_0=pf_results.machines.P1_1,
    V_0=pf_results.voltages.V1,
    angle_0=pf_results.voltages.A1) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  PowerSystemDomain.Networks.SMIB.Records.PF_050 pf_results annotation (Placement(transformation(extent={{-136,50},{-116,70}})));
equation
  connect(GEN1.p, genGroup.pwPin) annotation (Line(points={{-42,0},{-49,0}}, color={0,0,255}));
  connect(ssgt.shaft_b, genGroup.shaft) annotation (Line(points={{-78,0},{-74,0},{-70,0}}, color={0,0,0}));
  connect(ssgt.valvePosition, step.y) annotation (Line(points={{-106.21,6.65},{-110,6.65},{-110,7},{-113.3,7}}, color={0,0,127}));
  annotation (
    Diagram(graphics={Text(
          extent={{-112,68},{108,48}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="(Constant Efd)")}),
    experiment(StopTime=100),
    __Dymola_experimentSetupOutput);
end SMIB_TM;
