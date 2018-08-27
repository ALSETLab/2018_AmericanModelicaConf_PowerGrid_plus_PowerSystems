within OpenCPS_D53B.TurboMachineryDomain.Tests;
model OpenLoop_ThPowerSSGT "Open Loop Simulation - ThermoPower Gas Turbine Plant Example"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Step valvePosStep(
    startTime=500,
    height=0.4,
    offset=0.35) annotation (Placement(transformation(extent={{-40,-10},{-20,10}},rotation=0)));
  OpenCPS_D53B.TurboMachineryDomain.GTModels.Plants.GTPlant_ThPowerSSGT gTPlant annotation (Placement(transformation(extent={{14,-10},{42,10}})));
equation
  connect(valvePosStep.y, gTPlant.valvePosition) annotation (Line(points={{-19,0},{13.4,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=1000));
end OpenLoop_ThPowerSSGT;
