within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.OpenLoopTests.NoNoiseOnLoad;
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

  Generation_Groups.SMIB.Generator genGroup(
    V_b=13.8,
    M_b=10,
    Q_0=pf_results.machines.Q1_1,
    P_0=pf_results.machines.P1_1,
    V_0=pf_results.voltages.V1,
    angle_0=pf_results.voltages.A1) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Sources.Step step(
    height=0.2,
    startTime=30,
    offset=0.483333) annotation (Placement(transformation(extent={{-138,4},{-124,18}})));
  Controls.GGOV1.Simplified.GTPlant_GGov1_PU
                              gt(
    Kturb=1.5,
    Teng=0,
    Dm=0,
    Tb=0.14101,
    Tc=0.11514) annotation (Placement(transformation(extent={{-110,-10},{-82,10}})));
  Records.PF_050 pf_results annotation (Placement(transformation(extent={{-136,50},{-116,70}})));
equation
  connect(GEN1.p, genGroup.pwPin) annotation (Line(points={{-42,0},{-49,0}}, color={0,0,255}));
  connect(genGroup.Pmech, gt.Pmech) annotation (Line(points={{-70.6,0},{-70.6,0},{-81.4,0}}, color={0,0,127}));
  connect(genGroup.speed, gt.speedRef) annotation (Line(points={{-64.4,-9.8},{-64.4,-28},{-120,-28},{-120,-4},{-110.4,-4}}, color={0,0,127}));
  connect(step.y, gt.valvePosition) annotation (Line(points={{-123.3,11},{-118,11},{-118,4},{-110.4,4}}, color={0,0,127}));
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
