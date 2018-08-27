within OpenCPS_D53B.TurboMachineryDomain.Tests;
model OpenLoop_ThPowerSSGT_NoLoad2 "Open Loop Simulation - ThermoPower Gas Turbine Plant Example without load"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Step valvePosition(
    startTime=25,
    height=0.4,
    offset=0.35) annotation (Placement(transformation(extent={{-40,4},{-20,24}}, rotation=0)));
  GTModels.Plants.GTPlant_ThPowerSSGT_NoLoad2 gTPlant annotation (Placement(transformation(extent={{0,-10},{28,10}})));
  Modelica.Blocks.Sources.Ramp speedRamp(
    height=-0.05*157.08,
    duration=50,
    offset=157.08,
    startTime=100) annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
equation
  connect(valvePosition.y, gTPlant.valvePosition) annotation (Line(points={{-19,14},{-10,14},{-10,6},{-0.4,6}}, color={0,0,127}));
  connect(speedRamp.y, gTPlant.speedRef) annotation (Line(points={{-19,-20},{-10,-20},{-10,-4},{-0.4,-4}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=200, __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput);
end OpenLoop_ThPowerSSGT_NoLoad2;
