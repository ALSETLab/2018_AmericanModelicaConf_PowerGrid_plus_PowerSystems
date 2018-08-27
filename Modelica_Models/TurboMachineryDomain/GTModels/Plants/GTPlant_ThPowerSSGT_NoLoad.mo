within OpenCPS_D53B.TurboMachineryDomain.GTModels.Plants;
model GTPlant_ThPowerSSGT_NoLoad "ThermoPower Gas Turbine Plant Example without load, constant shaft speed"

  Modelica.Blocks.Interfaces.RealInput valvePosition annotation (Placement(transformation(extent={{-156,-10},{-136,10}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput Pmech annotation (Placement(transformation(extent={{136,-10},{156,10}}, rotation=0)));
  OpenCPS_D53B.TurboMachineryDomain.GTModels.ThPowerSSGT gTDynamics annotation (Placement(transformation(extent={{-74,-24},{-34,16}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed annotation (Placement(transformation(extent={{28,-14},{8,6}})));
  Modelica.Blocks.Sources.Step step(
    height=1,
    offset=157.08,
    startTime=1500) annotation (Placement(transformation(extent={{64,-14},{44,6}})));
equation
  connect(speed.w_ref, step.y) annotation (Line(points={{30,-4},{43,-4}}, color={0,0,127}));
  connect(gTDynamics.shaft_b, speed.flange) annotation (Line(points={{-34,-4},{8,-4}}, color={0,0,0}));
  connect(valvePosition, gTDynamics.valvePosition) annotation (Line(points={{-146,0},{-106,0},{-106,5.5},{-74.3,5.5}}, color={0,0,127}));
  connect(gTDynamics.PMECH, Pmech) annotation (Line(points={{-67,-24.6},{-67,-44},{92,-44},{92,0},{146,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}}), graphics={Rectangle(extent={{-140,100},{140,-100}}, lineColor={28,108,200}),Text(
          extent={{-86,32},{100,-32}},
          lineColor={28,108,200},
          textString="GTPlant",
          textStyle={TextStyle.Bold})}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})));
end GTPlant_ThPowerSSGT_NoLoad;
