within OpenCPS_D53B.PowerSystemDomain.Controls.GGOV1.Simplified;
model GTPlant_GGov1_PU "ThermoPower Gas Turbine Plant Example with variable shaft speed (pu)"

  Modelica.Blocks.Interfaces.RealInput valvePosition annotation (Placement(transformation(extent={{-156,-6},{-136,14}}, rotation=0), iconTransformation(extent={{-156,28},{-132,52}})));
  Modelica.Blocks.Interfaces.RealOutput Pmech annotation (Placement(transformation(extent={{136,-10},{156,10}}, rotation=0)));
  PowerSystemDomain.Controls.GGOV1.Simplified.Turbine turbine(
    Flag=0,
    Tact=4,
    Wfnl=0.15,
    Tfload=3,
    Ropen=0.1,
    Rclose=-0.1,
    Tsa=4,
    Tsb=5,
    DELT=0.005,
    Kturb=Kturb,
    Tb=Tb,
    Tc=Tc,
    Teng=Teng,
    Dm=Dm) annotation (Placement(transformation(extent={{-40,-20},{20,40}})));
  Modelica.Blocks.Math.Gain gain(k=1.5) annotation (Placement(transformation(extent={{-64,4},{-52,16}})));
  Modelica.Blocks.Math.Add add(k1=-1) annotation (Placement(transformation(extent={{-96,0},{-76,20}})));
  Modelica.Blocks.Sources.Constant const(k=0.15) annotation (Placement(transformation(extent={{-134,18},{-120,32}})));
  Modelica.Blocks.Interfaces.RealInput speedRef annotation (Placement(transformation(extent={{-88,34},{-68,54}}), iconTransformation(extent={{-156,-52},{-132,-28}})));
  parameter Real Kturb "Turbine gain";
  parameter Real Tb "Turbine lag time constant (s)";
  parameter Real Tc "Turbine lead time constant (s)";
  parameter Real Teng "Transport lag time constant for diesel engine (s)";
  parameter Real Dm "Mechanical damping coefficient (pu)";
equation
  connect(valvePosition, turbine.FSR) annotation (Line(points={{-146,4},{-120,4},{-120,-11.6429},{-42.3571,-11.6429}}, color={0,0,127}));
  connect(gain.y, turbine.PELEC) annotation (Line(points={{-51.4,10},{-41.9286,10},{-41.9286,10.2143}}, color={0,0,127}));
  connect(add.y, gain.u) annotation (Line(points={{-75,10},{-65.2,10}}, color={0,0,127}));
  connect(add.u2, turbine.FSR) annotation (Line(points={{-98,4},{-120,4},{-120,-11.6429},{-42.3571,-11.6429}}, color={0,0,127}));
  connect(const.y, add.u1) annotation (Line(points={{-119.3,25},{-110,25},{-110,16},{-98,16}}, color={0,0,127}));
  connect(speedRef, turbine.SPEED) annotation (Line(points={{-78,44},{-58,44},{-58,31.4286},{-42.1429,31.4286}}, color={0,0,127}));
  connect(turbine.PMECH, Pmech) annotation (Line(points={{22.5714,10},{60,10},{60,0},{146,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}}), graphics={Rectangle(extent={{-140,100},{140,-100}}, lineColor={28,108,200}),Text(
                extent={{-86,32},{100,-32}},
                lineColor={28,108,200},
                textString="GTPlant",
                textStyle={TextStyle.Bold})}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{140,100}})));
end GTPlant_GGov1_PU;
