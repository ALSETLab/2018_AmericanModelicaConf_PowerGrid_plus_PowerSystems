within OpenCPS_D53B.TurboMachineryDomain.GTModels.Plants;
model GTPlant_ThPowerSSGT_NoLoad2 "ThermoPower Gas Turbine Plant Example without load, variable shaft speed"

  Modelica.Blocks.Interfaces.RealInput valvePosition annotation (Placement(transformation(extent={{-116,10},{-96,30}}, rotation=0), iconTransformation(extent={{-156,48},{-132,72}})));
  Modelica.Blocks.Interfaces.RealOutput Pmech annotation (Placement(transformation(extent={{136,-10},{156,10}}, rotation=0)));
  OpenCPS_D53B.TurboMachineryDomain.GTModels.ThPowerSSGT gTDynamics annotation (Placement(transformation(extent={{-74,-24},{-34,16}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed annotation (Placement(transformation(extent={{28,-14},{8,6}})));
  Modelica.Blocks.Interfaces.RealInput speedRef annotation (Placement(transformation(extent={{62,-14},{42,6}}), iconTransformation(extent={{-156,-52},{-132,-28}})));
equation
  connect(gTDynamics.shaft_b, speed.flange) annotation (Line(points={{-34,-4},{8,-4}}, color={0,0,0}));
  connect(valvePosition, gTDynamics.valvePosition) annotation (Line(points={{-106,20},{-88,20},{-88,5.5},{-74.3,5.5}}, color={0,0,127}));
  connect(gTDynamics.PMECH, Pmech) annotation (Line(points={{-67,-24.6},{-67,-44},{92,-44},{92,0},{146,0}}, color={0,0,127}));
  connect(speed.w_ref, speedRef) annotation (Line(points={{30,-4},{52,-4}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}}), graphics={Rectangle(extent={{-140,100},{140,-100}}, lineColor={28,108,200}),Text(
          extent={{-86,32},{100,-32}},
          lineColor={28,108,200},
          textString="GTPlant",
          textStyle={TextStyle.Bold})}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})));
end GTPlant_ThPowerSSGT_NoLoad2;
