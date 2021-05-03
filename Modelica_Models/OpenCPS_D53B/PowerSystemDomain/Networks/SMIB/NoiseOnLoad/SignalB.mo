within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.NoiseOnLoad;
model SignalB
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed(useAutomaticSeed=true)
    annotation (Placement(transformation(extent={{112,86},{132,106}})));
  Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod=0.01, sigma=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={10,98})));
  Modelica.Blocks.Sources.Ramp ramp(height=0.2, duration=15)
    annotation (Placement(transformation(extent={{-32,88},{-12,108}})));
  Modelica.Blocks.Sources.Ramp ramp1(
    height=-0.2,
    duration=15,
    startTime=30)
    annotation (Placement(transformation(extent={{-64,88},{-44,108}})));
  Modelica.Blocks.Math.MultiSum multiSum(nu=5)
    annotation (Placement(transformation(extent={{36,66},{48,78}})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=1,
    width=30,
    period=1,
    nperiod=1,
    startTime=70)
    annotation (Placement(transformation(extent={{-94,88},{-74,108}})));
  Modelica.Blocks.Interfaces.RealOutput y
    annotation (Placement(transformation(extent={{134,62},{154,82}})));
  Modelica.Blocks.Continuous.SecondOrder secondOrder1(
    k=1,
    w=10,
    D=5)
    annotation (Placement(transformation(extent={{76,62},{96,82}})));
  Modelica.Blocks.Logical.Switch switch1 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-22,-4})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold(threshold=120)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={34,-22})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=time)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={80,-22})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={56,4})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=time)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-64,-26})));
  Modelica.Blocks.Logical.GreaterThreshold greaterThreshold1(threshold=200)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-64,8})));
  Modelica.Blocks.Logical.Switch switch2 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-28,38})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=2,
    freqHz=15,
    phase=0,
    startTime=120) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={2,-28})));
  Modelica.Blocks.Math.Gain gain(k=5)  annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={20,38})));
  Modelica.Blocks.Sources.Constant const1(k=0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-84,46})));
equation
  connect(normalNoise.y, multiSum.u[1]) annotation (Line(points={{21,98},{28,
          98},{28,76},{36,76},{36,75.36}},                       color={0,0,
          127}));
  connect(ramp.y, multiSum.u[2]) annotation (Line(points={{-11,98},{-6,98},{
          -6,73.68},{36,73.68}},         color={0,0,127}));
  connect(ramp1.y, multiSum.u[3]) annotation (Line(points={{-43,98},{-36,98},
          {-36,72},{36,72}},        color={0,0,127}));
  connect(pulse.y, multiSum.u[4]) annotation (Line(points={{-73,98},{-68,98},
          {-68,70.32},{36,70.32}},          color={0,0,127}));
  connect(secondOrder1.y, y)
    annotation (Line(points={{97,72},{144,72}},
                                              color={0,0,127}));
  connect(greaterThreshold.y, switch1.u2) annotation (Line(points={{23,-22},{
          23,-4},{-10,-4}},    color={255,0,255}));
  connect(multiSum.y, secondOrder1.u)
    annotation (Line(points={{49.02,72},{74,72}},
                                                color={0,0,127}));
  connect(realExpression.y, greaterThreshold.u) annotation (Line(points={{69,-22},
          {46,-22}},                               color={0,0,127}));
  connect(realExpression1.y, greaterThreshold1.u)
    annotation (Line(points={{-64,-15},{-64,-4}},  color={0,0,127}));
  connect(greaterThreshold1.y, switch2.u2) annotation (Line(points={{-64,19},
          {-64,38},{-40,38}},                        color={255,0,255}));
  connect(sine.y, switch1.u1) annotation (Line(points={{2,-17},{2,-12},{-10,
          -12}},                           color={0,0,127}));
  connect(const.y, switch1.u3) annotation (Line(points={{45,4},{-10,4}},
                            color={0,0,127}));
  connect(switch1.y, switch2.u3) annotation (Line(points={{-33,-4},{-46,-4},{
          -46,30},{-40,30}},       color={0,0,127}));
  connect(switch2.y, gain.u) annotation (Line(points={{-17,38},{8,38}},
                          color={0,0,127}));
  connect(gain.y, multiSum.u[5]) annotation (Line(points={{31,38},{31,68.64},
          {36,68.64}},             color={0,0,127}));
  connect(const1.y, switch2.u1)
    annotation (Line(points={{-73,46},{-40,46}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{140,
            120}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{
            140,120}})),
    experiment(
      StopTime=300,
      __Dymola_NumberOfIntervals=9000,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Rkfix4"));
end SignalB;
