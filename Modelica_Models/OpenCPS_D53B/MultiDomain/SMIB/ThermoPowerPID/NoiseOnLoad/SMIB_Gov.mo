within OpenCPS_D53B.MultiDomain.SMIB.ThermoPowerPID.NoiseOnLoad;
model SMIB_Gov "Network model with no generator controls"
  import OpenCPS_D53B;
  extends OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Partial.SMIB_Partial_Noise(
    transformer(V_b=13.8, Vn=13.8),
    LOAD(V_b=13.8),
    GEN1(V_b=13.8),
    BUS1(V_b=13.8),
    BUS2(V_b=13.8),
    BUS3(V_b=13.8),
    GEN2(V_b=13.8),
    sineNoiseInjection(freqHz=0.1, active_sigma=0),
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

  OpenCPS_D53B.TurboMachineryDomain.GTModels.ThPowerSSGT ssgt annotation (Placement(transformation(extent={{-118,-20},{-78,20}})));
  OpenCPS_D53B.MultiDomain.Common.PID governor(
    Kp=0.25,
    Ti=5,
    CSmin=0,
    CSmax=4,
    holdWhenSimplified=true,
    steadyStateInit=true,
    PVmin=2e6,
    PVmax=12e6) annotation (Placement(transformation(extent={{-98,-36},{-118,-56}})));
  Modelica.Blocks.Sources.Step step(height=1e6, startTime=30) annotation (Placement(transformation(extent={{-34,-84},{-48,-70}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-66,-52},{-86,-72}})));
  OpenCPS_D53B.MultiDomain.Generation_Groups.SMIB.Gen_GT genGroup(
    V_b=13.8,
    M_b=10,
    Q_0=pf_results.machines.Q1_1,
    P_0=pf_results.machines.P1_1,
    V_0=pf_results.voltages.V1,
    angle_0=pf_results.voltages.A1) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Math.Gain gain(k=10e6) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=-90,
        origin={-54,-34})));
  OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Records.PF_050 pf_results annotation (Placement(transformation(extent={{-136,50},{-116,70}})));
equation
  connect(add.u1, step.y) annotation (Line(points={{-64,-68},{-54,-68},{-54,-77},{-48.7,-77}}, color={0,0,127}));
  connect(genGroup.pwPin, GEN1.p) annotation (Line(points={{-49,0},{-49,0},{-42,0}}, color={0,0,255}));
  connect(genGroup.Pm0, gain.u) annotation (Line(points={{-54.6,-9.4},{-54,-20},{-54,-26.8}}, color={0,0,127}));
  connect(gain.y, add.u2) annotation (Line(points={{-54,-40.6},{-54,-56},{-64,-56}}, color={0,0,127}));
  connect(governor.CS, ssgt.valvePosition) annotation (Line(points={{-118,-46},{-128,-46},{-128,9.5},{-118.3,9.5}}, color={0,0,127}));
  connect(ssgt.generatedPower, governor.PV) annotation (Line(points={{-84.9,-20.7},{-84.9,-42},{-98,-42}}, color={0,0,127}));
  connect(add.y, governor.SP) annotation (Line(points={{-87,-62},{-92,-62},{-92,-50},{-98,-50}}, color={0,0,127}));
  connect(ssgt.shaft_b, genGroup.shaft) annotation (Line(points={{-78,0},{-74,0},{-70,0}}, color={0,0,0}));
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
end SMIB_Gov;
