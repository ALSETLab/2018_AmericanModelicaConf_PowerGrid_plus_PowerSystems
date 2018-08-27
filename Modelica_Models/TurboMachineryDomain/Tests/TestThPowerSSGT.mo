within OpenCPS_D53B.TurboMachineryDomain.Tests;
model TestThPowerSSGT "Test on the Dynamics of the ThermoPower Gas Turbine Example"
  extends Modelica.Icons.Example;

  OpenCPS_D53B.TurboMachineryDomain.GTModels.ThPowerSSGT gTDynamics annotation (Placement(transformation(extent={{-20,-18},{20,22}})));
  Modelica.Blocks.Sources.Step Step1(
    height=-0.1,
    offset=0.317,
    startTime=1) annotation (Placement(transformation(extent={{-90,28},{-70,48}}, rotation=0)));
  Modelica.Mechanics.Rotational.Components.Inertia Inertia1(J=10000) annotation (Placement(transformation(extent={{38,-8},{58,12}}, rotation=0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed ConstantSpeed1(w_fixed=523.3, useSupport=false) annotation (Placement(transformation(extent={{-74,-8},{-54,12}}, rotation=0)));
equation
  connect(Step1.y, gTDynamics.valvePosition) annotation (Line(points={{-69,38},{-38,38},{-38,11.5},{-20.3,11.5}}, color={0,0,127}));
  connect(ConstantSpeed1.flange, gTDynamics.shaft_a) annotation (Line(points={{-54,2},{-20,2},{-20,1.8}}, color={0,0,0}));
  connect(gTDynamics.shaft_b, Inertia1.flange_a) annotation (Line(points={{20,2},{38,2},{38,2}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestThPowerSSGT;
