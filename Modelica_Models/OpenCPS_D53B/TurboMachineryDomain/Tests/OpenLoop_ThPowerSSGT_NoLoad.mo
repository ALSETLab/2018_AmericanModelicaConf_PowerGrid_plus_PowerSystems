within OpenCPS_D53B.TurboMachineryDomain.Tests;
model OpenLoop_ThPowerSSGT_NoLoad "Open Loop Simulation - ThermoPower Gas Turbine Plant Example without load"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Step valvePosition(
    startTime=500,
    height=0.4,
    offset=0.35) annotation (Placement(transformation(extent={{-40,-10},{-20,10}},rotation=0)));
  GTModels.Plants.GTPlant_ThPowerSSGT_NoLoad gTPlant annotation (Placement(transformation(extent={{0,-10},{28,10}})));
equation
  connect(valvePosition.y, gTPlant.valvePosition) annotation (Line(points={{-19,0},{-0.6,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=475,
      StopTime=550,
      __Dymola_NumberOfIntervals=1000),
    __Dymola_experimentSetupOutput);
end OpenLoop_ThPowerSSGT_NoLoad;
