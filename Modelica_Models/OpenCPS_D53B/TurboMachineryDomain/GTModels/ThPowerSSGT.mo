within OpenCPS_D53B.TurboMachineryDomain.GTModels;
model ThPowerSSGT "Gas Turbine Dynamics based on ThermoPower Example Case"

  parameter Real tableEtaC[6, 4]=[0, 95, 100, 105; 1, 82.5e-2, 81e-2, 80.5e-2; 2, 84e-2, 82.9e-2, 82e-2; 3, 83.2e-2, 82.2e-2, 81.5e-2; 4, 82.5e-2, 81.2e-2, 79e-2; 5, 79.5e-2, 78e-2, 76.5e-2];
  parameter Real tablePhicC[6, 4]=[0, 95, 100, 105; 1, 38.3e-3, 43e-3, 46.8e-3; 2, 39.3e-3, 43.8e-3, 47.9e-3; 3, 40.6e-3, 45.2e-3, 48.4e-3; 4, 41.6e-3, 46.1e-3, 48.9e-3; 5, 42.3e-3, 46.6e-3, 49.3e-3];
  parameter Real tablePR[6, 4]=[0, 95, 100, 105; 1, 22.6, 27, 32; 2, 22, 26.6, 30.8; 3, 20.8, 25.5, 29; 4, 19, 24.3, 27.1; 5, 17, 21.5, 24.2];
  parameter Real tablePhicT[5, 4]=[1, 90, 100, 110; 2.36, 4.68e-3, 4.68e-3, 4.68e-3; 2.88, 4.68e-3, 4.68e-3, 4.68e-3; 3.56, 4.68e-3, 4.68e-3, 4.68e-3; 4.46, 4.68e-3, 4.68e-3, 4.68e-3];
  parameter Real tableEtaT[5, 4]=[1, 90, 100, 110; 2.36, 89e-2, 89.5e-2, 89.3e-2; 2.88, 90e-2, 90.6e-2, 90.5e-2; 3.56, 90.5e-2, 90.6e-2, 90.5e-2; 4.46, 90.2e-2, 90.3e-2, 90e-2];

  Modelica.Mechanics.Rotational.Interfaces.Flange_b shaft_b annotation (Placement(transformation(extent={{180,-20},{220,20}}, rotation=0), iconTransformation(extent={{180,-20},{220,20}})));
  ThermoPower.PowerPlants.Buses.Sensors SensorsBus annotation (Placement(transformation(extent={{180,-120},{220,-80}}, rotation=0), iconTransformation(extent={{180,-120},{220,-80}})));
  ThermoPower.PowerPlants.Buses.Actuators ActuatorsBus annotation (Placement(transformation(extent={{220,-180},{180,-140}}, rotation=0), iconTransformation(extent={{220,-180},{180,-140}})));
  ThermoPower.Gas.SourcePressure AirSource(
    redeclare package Medium = ThermoPower.Media.Air,
    p0=34300,
    T=244.4,
    use_in_p0=false,
    use_in_T=false) annotation (Placement(transformation(extent={{-172,18},{-116,74}}, rotation=0)));
  ThermoPower.Gas.SinkPressure FlueGasesSink(
    redeclare package Medium = ThermoPower.Media.FlueGas,
    p0=152000,
    T=800) annotation (Placement(transformation(extent={{136,128},{200,192}}, rotation=0)));
  OpenCPS_D53B.TurboMachineryDomain.GTArrangements.SingleShaftGT gasTurbine(
    Ndesign=157.08,
    V=0.05,
    S=0.05,
    gamma=1,
    Cm=1,
    HH=41.6e6,
    pd1_wnom=100,
    pd1_rhonom=4.7,
    pd2_wnom=102,
    pd2_rhonom=2,
    comprTablePhic=tablePhicC,
    comprTablePR=tablePR,
    comprTableEta=tableEtaC,
    turbTablePhic=tablePhicT,
    turbTableEta=tableEtaT,
    comprTdes_in=244.4,
    turbTdes_in=1400,
    dpnom1=19000,
    dpnom2=26000) annotation (Placement(transformation(extent={{-58,-128},{68,0}})));
  Modelica.Blocks.Interfaces.RealInput valvePosition annotation (Placement(transformation(extent={{-214,148},{-194,168}}, rotation=0), iconTransformation(extent={{-214,84},{-192,106}})));
  inner ThermoPower.System system(allowFlowReversal=false) annotation (Placement(transformation(extent={{-2,90},{40,132}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft_a annotation (Placement(transformation(extent={{-220,-22},{-180,18}}, rotation=0)));
  ThermoPower.Gas.SensT SensT1(redeclare package Medium =
        ThermoPower.Media.FlueGas)                                                   annotation (Placement(transformation(extent={{90,48},{128,86}}, rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder gasFlowActuator(
    k=1,
    T=4,
    y_start=500,
    initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(extent={{-174,142},{-142,174}},rotation=0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor annotation (Placement(transformation(extent={{128,-16},{160,16}}, rotation=0)));
  Modelica.Blocks.Continuous.FirstOrder powerSensor1(
    k=1,
    T=1,
    y_start=56.8e6,
    initType=Modelica.Blocks.Types.Init.SteadyState) annotation (Placement(transformation(
        extent={{17,-17},{-17,17}},
        rotation=90,
        origin={131,-129})));
  Modelica.Blocks.Interfaces.RealOutput generatedPower annotation (Placement(transformation(
        extent={{-15,-15},{15,15}},
        rotation=-90,
        origin={131,-207})));
  ThermoPower.Gas.SourceMassFlow FuelSource(
    redeclare package Medium = ThermoPower.Media.NaturalGas,
    w0=2.02,
    use_in_w0=true,
    p0=811000,
    T=300) annotation (Placement(transformation(extent={{-80,12},{-8,84}}, rotation=0)));
  Modelica.Blocks.Tables.CombiTable1D combiTable1D(smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments, table=[0.15, 1.84968; 0.35, 2.0588; 0.55, 2.27026; 0.75, 2.48528; 0.816667, 2.55802])
    annotation (Placement(transformation(extent={{-112,82},{-82,112}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Mechanical Power (W)"
    annotation (Placement(transformation(extent={{160,-74},{190,-44}}), iconTransformation(
        extent={{-14,-14},{14,14}},
        rotation=-90,
        origin={-130,-206})));
equation
  connect(AirSource.flange, gasTurbine.AirInlet) annotation (Line(points={{-116,46},{-116,-12.8},{-58,-12.8}}, color={159,159,223}));
  connect(shaft_a, gasTurbine.shaft_a) annotation (Line(points={{-200,-2},{-148,-2},{-148,-64},{-58,-64}}, color={0,0,0}));
  connect(SensT1.outlet, FlueGasesSink.flange) annotation (Line(points={{120.4,59.4},{136,59.4},{136,160}}, color={159,159,223}));
  connect(SensT1.inlet, gasTurbine.FlueGasOutlet) annotation (Line(points={{97.6,59.4},{68,59.4},{68,-12.8}}, color={159,159,223}));
  connect(gasFlowActuator.u, valvePosition) annotation (Line(points={{-177.2,158},{-177.2,158},{-204,158}}, color={0,0,127}));
  connect(gasTurbine.shaft_b, powerSensor.flange_a) annotation (Line(points={{68,-64},{106,-64},{106,0},{128,0}}, color={0,0,0}));
  connect(shaft_b, powerSensor.flange_b) annotation (Line(points={{200,0},{180,0},{160,0}}, color={0,0,0}));
  connect(powerSensor.power, powerSensor1.u) annotation (Line(points={{131.2,-17.6},{131,-17.6},{131,-108.6}}, color={0,0,127}));
  connect(powerSensor1.y, generatedPower) annotation (Line(points={{131,-147.7},{131,-170.85},{131,-207}}, color={0,0,127}));
  connect(FuelSource.flange, gasTurbine.FuelInlet) annotation (Line(points={{-8,48},{5,48},{5,0}}, color={159,159,223}));
  connect(combiTable1D.y[1], FuelSource.in_w0) annotation (Line(points={{-80.5,97},{-65.6,97},{-65.6,66}}, color={0,0,127}));
  connect(gasFlowActuator.y, combiTable1D.u[1]) annotation (Line(points={{-140.4,158},{-128,158},{-128,97},{-115,97}}, color={0,0,127}));
  connect(PMECH, powerSensor1.u) annotation (Line(points={{175,-59},{154,-58},{132,-58},{131,-108.6}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,200}}), graphics={
        Rectangle(
          extent={{-200,200},{200,-200}},
          lineColor={170,170,255},
          fillColor={230,230,230},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-130,12},{200,-12}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={135,135,135}),
        Ellipse(
          extent={{-30,150},{30,90}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={255,0,0}),
        Polygon(
          points={{-30,30},{-40,30},{-40,120},{-30,120},{-30,30}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,170,255}),
        Polygon(
          points={{30,30},{40,30},{40,120},{30,120},{30,30}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,170,255}),
        Polygon(
          points={{-130,120},{-30,40},{-30,-40},{-130,-120},{-130,120}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,170,255}),
        Polygon(
          points={{130,120},{30,40},{30,-40},{130,-120},{130,-120},{130,120}},
          lineColor={0,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={170,170,255}),
        Text(
          extent={{-168,-74},{178,-124}},
          lineColor={0,0,0},
          textString="Gas Turbine
Dynamics",textStyle={TextStyle.Bold}),
        Line(
          points={{-196,94},{-172,94},{-164,94},{-164,174},{0,174},{0,150}},
          color={0,127,0},
          pattern=LinePattern.Dash,
          thickness=0.5),
        Polygon(
          points={{-6,162},{6,162},{0,148},{-6,162}},
          lineColor={0,127,0},
          lineThickness=0.5,
          fillColor={0,127,0},
          fillPattern=FillPattern.Solid),
        Bitmap(
          extent={{96,-188},{168,-136}},
          imageSource=
              "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",
          fileName="modelica://OpenCPS_D53B/speedsensor.png"),
        Text(
          extent={{-180,-162},{-84,-196}},
          lineColor={0,0,0},
          textString="PMECH",
          textStyle={TextStyle.Bold})}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-200,-200},{200,200}})));
end ThPowerSSGT;
