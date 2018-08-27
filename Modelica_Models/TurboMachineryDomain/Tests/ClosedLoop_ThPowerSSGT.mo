within OpenCPS_D53B.TurboMachineryDomain.Tests;
model ClosedLoop_ThPowerSSGT "Closed Loop Simulation - ThermoPower Gas Turbine Plant Example"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Ramp powerSetPoint(
    duration=10,
    startTime=500,
    height=2e6,
    offset=4e6) annotation (Placement(transformation(extent={{-80,-6},{-60,14}}, rotation=0)));
  ThermoPower.Examples.RankineCycle.Models.PID pID(
    PVmin=2e6,
    PVmax=12e6,
    CSmin=0,
    CSmax=4,
    steadyStateInit=true,
    holdWhenSimplified=true,
    Kp=0.25,
    integralAction=true,
    Ti=5) annotation (Placement(transformation(extent={{-32,-10},{-12,10}}, rotation=0)));
  OpenCPS_D53B.TurboMachineryDomain.GTModels.Plants.GTPlant_ThPowerSSGT gTPlant annotation (Placement(transformation(extent={{12,-10},{40,10}})));
equation
  connect(pID.SP, powerSetPoint.y) annotation (Line(points={{-32,4},{-59,4}}, color={0,0,127}));
  connect(gTPlant.generatedPower, pID.PV) annotation (Line(points={{40.6,0},{54,0},{54,-28},{-42,-28},{-42,-4},{-32,-4}}, color={0,0,127}));
  connect(pID.CS, gTPlant.valvePosition) annotation (Line(points={{-12,0},{11.4,0}}, color={0,0,127}));
  annotation (experiment(StopTime=1000, Tolerance=1e-006), Documentation(revisions="<html>
<ul>
<li><i>10 Dec 2008</i>
    by <a>Luca Savoldelli</a>:<br>
       First release.</li>
</ul>
</html>", info="<html>
<p>This model simulates a simple continuous-time control system for the steam power plant. The generated power is controlled to the set point by a PI controller with anti-windup.</p>
<p>The model starts at steady state.
</html>"));
end ClosedLoop_ThPowerSSGT;
