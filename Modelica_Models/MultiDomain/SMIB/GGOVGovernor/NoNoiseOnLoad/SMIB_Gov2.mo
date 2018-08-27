within OpenCPS_D53B.MultiDomain.SMIB.GGOVGovernor.NoNoiseOnLoad;
model SMIB_Gov2 "Model with GGOV1 turbine and ThermoPower PID controller, change of power dispatch"
  import OpenCPS_D53B;
  extends OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Partial.SMIB_Partial_NoNoise(
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
      P_0=pf_results.loads.PL23_1,
      Q_0=pf_results.loads.QL23_1,
      V_0=pf_results.voltages.V23,
      angle_0=pf_results.voltages.A23),
    pMU(V_0=pf_results.voltages.V23, angle_0=pf_results.voltages.A23));
  import Modelica.Constants.pi;

  OpenCPS_D53B.MultiDomain.Generation_Groups.SMIB.Gen_GT genGroup(
    V_b=13.8,
    M_b=10,
    Q_0=pf_results.machines.Q1_1,
    P_0=pf_results.machines.P1_1,
    V_0=pf_results.voltages.V1,
    angle_0=pf_results.voltages.A1) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-54,-60},{-66,-48}})));
  Modelica.Blocks.Sources.Step step(startTime=30, height=0.3) annotation (Placement(transformation(extent={{-30,-70},{-40,-60}})));
  OpenCPS_D53B.PowerSystemDomain.Controls.GGOV1.Simplified.PIDGovernor2A governor(
    R=0.04,
    T_pelec=1,
    maxerr=0.05,
    minerr=-0.05,
    Kpgov=10,
    Kigov=5,
    Kdgov=0,
    Tdgov=1,
    Dm=0,
    Kimw=0,
    db=0,
    Vmax=1,
    Vmin=0.1,
    Kturb=1.5,
    Wfnl=0.15,
    Rselect=1) annotation (Placement(transformation(extent={{-94,-64},{-120,-36}})));
  OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Records.PF_050 pf_results annotation (Placement(transformation(extent={{-136,50},{-116,70}})));
  OpenCPS_D53B.TurboMachineryDomain.GTModels.ThPowerSSGT gtDyns annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
equation
  connect(GEN1.p, genGroup.pwPin) annotation (Line(points={{-42,0},{-49,0}}, color={0,0,255}));
  connect(genGroup.Pm0, add.u1) annotation (Line(points={{-54.6,-9.4},{-54.6,-34},{-44,-34},{-44,-50.4},{-52.8,-50.4}}, color={0,0,127}));
  connect(step.y, add.u2) annotation (Line(points={{-40.5,-65},{-46,-65},{-46,-57.6},{-52.8,-57.6}}, color={0,0,127}));
  connect(genGroup.Pelec, governor.PELEC) annotation (Line(points={{-69,-5},{-80,-5},{-80,-58},{-92,-58},{-92,-58.1},{-92.9786,-58.1}}, color={0,0,127}));
  connect(genGroup.speed, governor.SPEED) annotation (Line(points={{-64,-9.8},{-64,-42},{-64,-41.9},{-92.9786,-41.9}}, color={0,0,127}));
  connect(add.y, governor.PSP) annotation (Line(points={{-66.6,-54},{-72,-54},{-72,-50},{-72,-50.1},{-92.9786,-50.1}}, color={0,0,127}));
  connect(gtDyns.shaft_b, genGroup.shaft) annotation (Line(points={{-90,0},{-90,0},{-70,0}}, color={0,0,0}));
  connect(governor.FSR, gtDyns.valvePosition) annotation (Line(points={{-121.114,-50},{-138,-50},{-138,9.5},{-130.3,9.5}}, color={0,0,127}));
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
end SMIB_Gov2;
