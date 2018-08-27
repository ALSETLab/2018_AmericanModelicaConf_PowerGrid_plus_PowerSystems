within OpenCPS_D53B.TurboMachineryDomain.GTModels.Plants;
model GTPlant_ThPowerSSGT "ThermoPower Gas Turbine Plant Example"

  Modelica.Blocks.Interfaces.RealInput valvePosition annotation (Placement(transformation(extent={{-156,-10},{-136,10}}, rotation=0)));
  ThermoPower.Electrical.Generator generator(initOpt=ThermoPower.Choices.Init.Options.steadyState, J=30) annotation (Placement(transformation(extent={{18,-24},{58,16}}, rotation=0)));
  ThermoPower.Electrical.NetworkGrid_Pmax network(
    deltaStart=0.4,
    initOpt=ThermoPower.Choices.Init.Options.steadyState,
    Pmax=10e6,
    J=30000) annotation (Placement(transformation(extent={{74,-16},{98,8}}, rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput generatedPower annotation (Placement(transformation(extent={{136,-10},{156,10}}, rotation=0)));
  OpenCPS_D53B.TurboMachineryDomain.GTModels.ThPowerSSGT gTDynamics annotation (Placement(transformation(extent={{-74,-24},{-34,16}})));
equation
  connect(network.powerConnection, generator.powerConnection) annotation (Line(
      points={{74,-4},{55.2,-4}},
      pattern=LinePattern.None,
      thickness=0.5));
  connect(gTDynamics.shaft_b, generator.shaft) annotation (Line(points={{-34,-4},{-12,-4},{20.8,-4}}, color={0,0,0}));
  connect(gTDynamics.generatedPower, generatedPower) annotation (Line(points={{-40.9,-24.7},{-40.9,-46},{124,-46},{124,0},{146,0}}, color={0,0,127}));
  connect(valvePosition, gTDynamics.valvePosition) annotation (Line(points={{-146,0},{-100,0},{-100,5.5},{-74.3,5.5}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}}), graphics={Rectangle(extent={{-140,100},{140,-100}}, lineColor={28,108,200}),Text(
          extent={{-86,32},{100,-32}},
          lineColor={28,108,200},
          textString="GTPlant",
          textStyle={TextStyle.Bold})}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})));
end GTPlant_ThPowerSSGT;
