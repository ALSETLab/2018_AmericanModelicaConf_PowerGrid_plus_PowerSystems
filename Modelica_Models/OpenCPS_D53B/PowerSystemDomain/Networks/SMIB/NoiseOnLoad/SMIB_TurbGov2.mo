within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.NoiseOnLoad;
model SMIB_TurbGov2 "Model with GGOV1 turbine and ThermoPower PID controller, change of power dispatch"
  import OpenCPS_D53B;
  extends OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Partial.SMIB_Partial_Noise(
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
      angle_0=pf_results.voltages.A23,
      d_P=0.1,
      t1=80,
      d_t=5),
    pMU(V_0=pf_results.voltages.V23, angle_0=pf_results.voltages.A23));
  import Modelica.Constants.pi;

  OpenCPS_D53B.PowerSystemDomain.Generation_Groups.SMIB.Generator generator(
    V_b=13.8,
    M_b=10,
    Q_0=pf_results.machines.Q1_1,
    P_0=pf_results.machines.P1_1,
    V_0=pf_results.voltages.V1,
    angle_0=pf_results.voltages.A1) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Modelica.Blocks.Math.Add add annotation (Placement(transformation(extent={{-54,-60},{-66,-48}})));
  Modelica.Blocks.Sources.Step step(height=0.1, startTime=30) annotation (Placement(transformation(extent={{-30,-70},{-40,-60}})));
  OpenCPS_D53B.PowerSystemDomain.Controls.GGOV1.Simplified.GGOV2B gGOV2B(
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
    Tact=4,
    Tb=0.5,
    Tc=0,
    Teng=0,
    Tfload=3,
    Tsa=4,
    Tsb=5,
    DELT=0.005,
    Trate=10,
    Rup=99,
    Rdown=-99,
    Ropen=0.1,
    Rclose=-0.1,
    Flag=0,
    Kturb=1.5,
    Wfnl=0.15) annotation (Placement(transformation(extent={{-126,-28},{-94,0}})));
  OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Records.PF_050 pf_results annotation (Placement(transformation(extent={{-136,50},{-116,70}})));
equation
  connect(GEN1.p, generator.pwPin) annotation (Line(points={{-42,0},{-49,0}}, color={0,0,255}));
  connect(generator.Pm0, add.u1) annotation (Line(points={{-55.4,-9.8},{-55.4,-34},{-44,-34},{-44,-50.4},{-52.8,-50.4}}, color={0,0,127}));
  connect(step.y, add.u2) annotation (Line(points={{-40.5,-65},{-46,-65},{-46,-57.6},{-52.8,-57.6}}, color={0,0,127}));
  connect(gGOV2B.PMECH, generator.Pmech) annotation (Line(points={{-92.8,-21},{-82,-21},{-82,0},{-70.6,0}}, color={0,0,127}));
  connect(generator.PELEC, gGOV2B.PELEC) annotation (Line(points={{-69.2,-5.2},{-76,-5.2},{-76,-42},{-132,-42},{-132,-21.1},{-126.9,-21.1}}, color={0,0,127}));
  connect(generator.speed, gGOV2B.SPEED) annotation (Line(points={{-64.4,-9.8},{-64.4,-16},{-90,-16},{-90,6},{-134,6},{-134,-4.9},{-126.9,-4.9}}, color={0,0,127}));
  connect(add.y, gGOV2B.PSP) annotation (Line(points={{-66.6,-54},{-136,-54},{-136,-13.3},{-126.9,-13.3}}, color={0,0,127}));
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
end SMIB_TurbGov2;
