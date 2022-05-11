within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.NoiseOnLoad;
model SMIB_normal_noise_gen_input_plusfault
  "SMIB network without controls (noise on load)"
  extends Partial.SMIB_Partial_Noise_normal_limhit(
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
    pMU(V_0=pf_results.voltages.V23, angle_0=pf_results.voltages.A23),
    line_3(opening=1));
  import Modelica.Constants.pi;

  Generation_Groups.SMIB.Generator_AVR_PSS_TurbGov_external_pmech
                                   generator_AVR_PSS_TurbGov_external_pmech(
    V_b=13.8,
    M_b=10,
    Q_0=pf_results.machines.Q1_1,
    P_0=pf_results.machines.P1_1,
    V_0=pf_results.voltages.V1,
    angle_0=pf_results.voltages.A1) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Records.PF_075 pf_results annotation (Placement(transformation(extent={{-76,
            -118},{-56,-98}})));
  NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(active_sigma=0.0)
                 annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-150,10})));

  Modelica.Blocks.Sources.Ramp ramp(
    height=-0.25,
    duration=120,
    startTime=60)
    annotation (Placement(transformation(extent={{-194,-110},{-174,-90}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{-98,-10},{-78,10}})));
  Modelica.Blocks.Discrete.Sampler sampler(samplePeriod=5)
    annotation (Placement(transformation(extent={{-162,-110},{-142,-90}})));
  Modelica.Blocks.Discrete.FirstOrderHold firstOrderHold(samplePeriod=0.02)
    annotation (Placement(transformation(extent={{-134,-110},{-114,-90}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-142,-38},{-122,-18}})));
  Modelica.Blocks.Logical.Greater greater
    annotation (Placement(transformation(extent={{-178,-38},{-158,-18}})));
  Modelica.Blocks.Sources.Clock clock
    annotation (Placement(transformation(extent={{-220,-38},{-200,-18}})));
  Modelica.Blocks.Sources.Constant const1(k=1)
    annotation (Placement(transformation(extent={{-220,-70},{-200,-50}})));
  Modelica.Blocks.Sources.Constant const2(k=0) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-166,-62})));
  NoiseInjections.WhiteNoiseInjection whiteNoiseInjection1(active_sigma=0.001)
                 annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-58,-54})));

  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{-20,-90},{0,-70}})));
  OpenIPSL.Electrical.Events.PwFault pwFault(
    R=0.001,
    X=0.001,
    t1=600,
    t2=690.08)
              annotation (Placement(transformation(extent={{-6,-48},{6,-36}})));
equation
  connect(generator_AVR_PSS_TurbGov_external_pmech.pwPin, GEN1.p)
    annotation (Line(points={{-49,0},{-45.5,0},{-42,0}}, color={0,0,255}));
  connect(add.y, generator_AVR_PSS_TurbGov_external_pmech.u)
    annotation (Line(points={{-77,0},{-72,0}}, color={0,0,127}));
  connect(sampler.y, firstOrderHold.u)
    annotation (Line(points={{-141,-100},{-136,-100}}, color={0,0,127}));
  connect(sampler.u, ramp.y)
    annotation (Line(points={{-164,-100},{-173,-100}}, color={0,0,127}));
  connect(clock.y, greater.u1)
    annotation (Line(points={{-199,-28},{-180,-28}}, color={0,0,127}));
  connect(const1.y, greater.u2) annotation (Line(points={{-199,-60},{-190,-60},
          {-190,-36},{-180,-36}}, color={0,0,127}));
  connect(greater.y, switch1.u2)
    annotation (Line(points={{-157,-28},{-144,-28}}, color={255,0,255}));
  connect(const2.y, switch1.u3) annotation (Line(points={{-155,-62},{-150,-62},
          {-150,-36},{-144,-36}}, color={0,0,127}));
  connect(switch1.y, add.u1) annotation (Line(points={{-121,-28},{-110,-28},{
          -110,6},{-100,6}}, color={0,0,127}));
  connect(whiteNoiseInjection.y, switch1.u1) annotation (Line(points={{-150.1,
          -0.9},{-150.1,-20},{-144,-20}}, color={0,0,127}));
  connect(firstOrderHold.y, add.u2) annotation (Line(points={{-113,-100},{-104,
          -100},{-104,-6},{-100,-6}}, color={0,0,127}));
  connect(switch2.y, variableLoad.u) annotation (Line(points={{1,-80},{14,-80},
          {14,-80.05},{27.9,-80.05}}, color={0,0,127}));
  connect(whiteNoiseInjection1.y, switch2.u1) annotation (Line(points={{-47.1,
          -54.1},{-32.55,-54.1},{-32.55,-72},{-22,-72}}, color={0,0,127}));
  connect(switch2.u2, switch1.u2) annotation (Line(points={{-22,-80},{-86,-80},
          {-86,-28},{-144,-28}}, color={255,0,255}));
  connect(switch2.u3, switch1.u3) annotation (Line(points={{-22,-88},{-92,-88},
          {-92,-52},{-150,-52},{-150,-36},{-144,-36}}, color={0,0,127}));
  connect(pwFault.p, BUS1.p) annotation (Line(points={{-7,-42},{-12,-42},{-12,0},
          {-6,0}}, color={0,0,255}));
  annotation (
    experiment(
      StopTime=300,
      Interval=0.01,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput,
    Diagram(coordinateSystem(extent={{-240,-120},{160,40}}), graphics={Text(
          extent={{-226,38},{-66,18}},
          lineColor={28,108,200},
          textString="Note: this model uses a full generator+controls, it simulates the ramp-up or down of the generator by varying the input of Pmech.
To do this, the ramp has a height of -0.25 for ramp up, and 0.25 for ramp up. Ramp is set to zero in this example.
Stochastic input is added also.
A fault block is added and line 4 is tripped. Simulates a contingency in the network.

")}),
    Icon(coordinateSystem(extent={{-240,-120},{160,40}})));
end SMIB_normal_noise_gen_input_plusfault;
