within OpenCPS_D53B.PowerSystemDomain.Controls.GGOV1.Simplified;
model PIDGovernor2B "GE General GGOV Governor Frequency Controller, PID Implementation 2B"
  parameter Integer Rselect=1 "Feedback signal for governor droop" annotation (Evaluate=true, choices(
      choice=1 "Electrical power",
      choice=0 "None (isochronous governor)",
      choice=-1 "Governor output (requested stroke)",
      choice=-2 "Fuel valve stroke (true stoke)"));
  parameter Real R "Permanent droop (pu)";
  parameter Real T_pelec "Electrical power transducer time constant (s)";
  parameter Real maxerr "Maximum value for speed error signal";
  parameter Real minerr "Minimum value for speed error signal";
  parameter Real Kpgov "Governor proportional gain";
  parameter Real Kigov "Governor integral gain";
  parameter Real Kdgov "Governor derivative gain";
  parameter Real Tdgov "Governor derivative controller time constant (s)";
  parameter Real Kturb "Turbine gain";
  parameter Real Dm "Mechanical damping coefficient (pu)";
  parameter Real Kimw "Power controller (reset) gain";
  parameter Real db "Speed governor deadband";
  parameter Real Vmax "Maximum valve position limit";
  parameter Real Vmin "Minimum valve position limit";
  parameter Real Wfnl "Non load fuel flow (pu)";
  parameter Real Pref "Reference power (pu)";
  Modelica.Blocks.Math.Gain KPGOV(k=Kpgov) annotation (Placement(transformation(extent={{52,0},{68,16}})));
  Modelica.Blocks.Continuous.Integrator s2(
    k=1,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s20) annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=180,
        origin={75,-23})));
  Modelica.Blocks.Continuous.Derivative s1(
    k=Kdgov,
    T=Tdgov,
    y_start=0,
    initType=Modelica.Blocks.Types.Init.InitialOutput) annotation (Placement(transformation(extent={{50,42},{70,62}})));
  Modelica.Blocks.Math.Add3 GovernorPID annotation (Placement(transformation(extent={{96,-14},{118,8}})));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(uMax=db, deadZoneAtInit=false) annotation (Placement(transformation(extent={{-20,-12},{0,8}})));
  Modelica.Blocks.Nonlinear.Limiter limiterSerror(uMax=maxerr, uMin=minerr) annotation (Placement(transformation(extent={{10,-12},{30,8}})));
  Modelica.Blocks.Math.Add3 add3_2(k1=-1, k3=-1) annotation (Placement(transformation(extent={{-44,-8},{-32,4}})));
  Modelica.Blocks.Math.Gain r(k=R) "Permanent droop" annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=90,
        origin={-53,-29})));
  Modelica.Blocks.Math.Add add2 annotation (Placement(transformation(extent={{-84,-8},{-72,4}})));
  Modelica.Blocks.Continuous.LimIntegrator s7(
    k=Kimw,
    outMax=1.1*R,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=s70) "Power controller" annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=90,
        origin={-92,-26})));
  Modelica.Blocks.Math.Add add3(k2=-1) annotation (Placement(transformation(
        extent={{-6,-6},{6,6}},
        rotation=90,
        origin={-92,-50})));
  OpenIPSL.NonElectrical.Continuous.SimpleLag s0(
    T=T_pelec,
    y_start=s00,
    K=1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-116,-98})));
  Modelica.Blocks.Math.Gain KPGOV1(k=Kigov) annotation (Placement(transformation(
        extent={{5,-5},{-5,5}},
        rotation=180,
        origin={55,-23})));
  OpenIPSL.Electrical.Controls.PSSE.TG.GGOV1.RSELECT rSELECT(Rselect=Rselect) annotation (Placement(transformation(
        extent={{-15,-22},{15,22}},
        rotation=90,
        origin={-52,-59})));
protected
  parameter Real Pe0(fixed=false);
  parameter Real Pmech0(fixed=false);
  parameter Real Pmwset(fixed=false);
  parameter Real s00(fixed=false);
  parameter Real s20(fixed=false);
  parameter Real s70(fixed=false);
  parameter Real fsr0(fixed=false);
public
  Modelica.Blocks.Interfaces.RealInput PELEC "Machine electrical power (pu)"
    annotation (Placement(transformation(extent={{-182,-134},{-154,-106}}),iconTransformation(extent={{-168,-98},{-134,-64}})));
  Modelica.Blocks.Interfaces.RealInput SPEED "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(extent={{-102,12},{-76,38}}), iconTransformation(extent={{-168,64},{-134,98}})));
  Modelica.Blocks.Interfaces.RealOutput FSR
    annotation (Placement(transformation(
        extent={{-11,-11},{11,11}},
        rotation=90,
        origin={109,103}), iconTransformation(extent={{140,-12},{164,12}})));
  Modelica.Blocks.Sources.Constant Pmw_set(k=Pmwset) "Supervisory Load Controller Setpoint," annotation (Placement(transformation(extent={{-138,-74},{-116,-52}})));
  Modelica.Blocks.Nonlinear.Limiter V(uMax=Vmax, uMin=Vmin) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=90,
        origin={109,53})));
  Modelica.Blocks.Math.Gain r_(k=R) annotation (Placement(transformation(extent={{-112,0},{-98,14}})));
  Modelica.Blocks.Sources.Constant Vstr_set(k=0) annotation (Placement(transformation(extent={{-28,-114},{-6,-92}})));
  Modelica.Blocks.Sources.Constant P_ref(k=Pref) annotation (Placement(transformation(extent={{-140,-2},{-122,16}})));
initial equation
  Pe0 = PELEC;
  Pmech0 = PELEC;
  Pmwset = Pe0;
  s00 = Pe0;
  s20 = fsr0;
  s70 = 0;
  fsr0 = (Pmech0 + Dm)/Kturb + Wfnl;

equation
  connect(deadZone.y, limiterSerror.u) annotation (Line(
      points={{1,-2},{8,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPGOV.u, limiterSerror.y) annotation (Line(
      points={{50.4,8},{40,8},{40,-2},{31,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_2.y, deadZone.u) annotation (Line(
      points={{-31.4,-2},{-22,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(r.y, add3_2.u3) annotation (Line(
      points={{-53,-21.3},{-53,-6.8},{-45.2,-6.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add2.y, add3_2.u2) annotation (Line(
      points={{-71.4,-2},{-45.2,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s7.y, add2.u2) annotation (Line(
      points={{-92,-17.2},{-92,-5.6},{-85.2,-5.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3.y, s7.u) annotation (Line(
      points={{-92,-43.4},{-92,-35.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s0.y, add3.u2) annotation (Line(
      points={{-105,-98},{-88,-98},{-88,-57.2},{-88.4,-57.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s1.u, limiterSerror.y) annotation (Line(
      points={{48,52},{40,52},{40,-2},{31,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s1.y, GovernorPID.u1) annotation (Line(
      points={{71,52},{86,52},{86,5.8},{93.8,5.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(KPGOV.y, GovernorPID.u2) annotation (Line(
      points={{68.8,8},{80,8},{80,-3},{93.8,-3}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(s0.y, rSELECT.Pelect) annotation (Line(
      points={{-105,-98},{-64.32,-98},{-64.32,-77}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rSELECT.y, r.u) annotation (Line(
      points={{-51.56,-42.5},{-51.72,-42.5},{-51.72,-37.4},{-53,-37.4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(add3_2.u1, SPEED) annotation (Line(points={{-45.2,2.8},{-60,2.8},{-60,25},{-89,25}}, color={0,0,127}));
  connect(PELEC, s0.u) annotation (Line(points={{-168,-120},{-140,-120},{-140,-98},{-128,-98}}, color={0,0,127}));
  connect(Pmw_set.y, add3.u1) annotation (Line(points={{-114.9,-63},{-95.6,-63},{-95.6,-57.2}}, color={0,0,127}));
  connect(GovernorPID.y, V.u) annotation (Line(points={{119.1,-3},{128,-3},{128,28},{109,28},{109,42.2}}, color={0,0,127}));
  connect(V.y, FSR) annotation (Line(points={{109,62.9},{109,103},{109,103}}, color={0,0,127}));
  connect(rSELECT.GovernorOutput, FSR) annotation (Line(points={{-25.6,-46.4},{40,-46.4},{40,-80},{126,-80},{126,-62},{136,-62},{136,76},{110,76},{109,103}}, color={0,0,127}));
  connect(KPGOV1.y, s2.u) annotation (Line(points={{60.5,-23},{66.6,-23}}, color={0,0,127}));
  connect(s2.y, GovernorPID.u3) annotation (Line(points={{82.7,-23},{88,-23},{88,-11.8},{93.8,-11.8}}, color={0,0,127}));
  connect(KPGOV1.u, limiterSerror.y) annotation (Line(points={{49,-23},{40,-23},{40,-2},{31,-2}}, color={0,0,127}));
  connect(add2.u1, r_.y) annotation (Line(points={{-85.2,1.6},{-92,1.6},{-92,7},{-97.3,7}}, color={0,0,127}));
  connect(Vstr_set.y, rSELECT.ValveStroke) annotation (Line(points={{-4.9,-103},{10,-103},{10,-57.8},{-25.6,-57.8}}, color={0,0,127}));
  connect(P_ref.y, r_.u) annotation (Line(points={{-121.1,7},{-113.4,7}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-140},{140,140}}), graphics={Text(
          extent={{-108,-8},{-96,-16}},
          lineColor={255,0,0},
          textString="s7"),Text(
          extent={{42,72},{52,64}},
          lineColor={255,0,0},
          textString="s1"),Text(
          extent={{90,-28},{80,-36}},
          lineColor={255,0,0},
          textString="s2"),Text(
          extent={{-102,-102},{-90,-110}},
          lineColor={255,0,0},
          textString="s0")}),
    Icon(coordinateSystem(extent={{-140,-140},{140,140}}, preserveAspectRatio=false), graphics={
        Rectangle(extent={{-140,140},{140,-140}}, lineColor={0,0,255}),
        Text(
          extent={{-128,94},{-72,70}},
          lineColor={28,108,200},
          textString="SPEED"),
        Text(
          extent={{-128,-70},{-72,-94}},
          lineColor={28,108,200},
          textString="PELEC"),
        Text(
          extent={{90,8},{138,-10}},
          lineColor={28,108,200},
          textString="FSR"),
        Text(
          extent={{-64,42},{66,-40}},
          lineColor={28,108,200},
          textString="Governor")}),
    Documentation(revisions="<html>
<!--DISCLAIMER-->
<p>OpenIPSL:</p>
<p>Copyright 2016 SmarTS Lab (Sweden)</p>
<ul>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>

<p></p>
<p>iPSL:</p>
<p>Copyright 2015-2016 RTE (France), SmarTS Lab (Sweden), AIA (Spain) and DTU (Denmark)</p>
<ul>
<li>RTE: <a href=\"http://www.rte-france.com\">http://www.rte-france.com</a></li>
<li>SmarTS Lab, research group at KTH: <a href=\"https://www.kth.se/en\">https://www.kth.se/en</a></li>
<li>AIA: <a href=\"http://www.aia.es/en/energy\"> http://www.aia.es/en/energy</a></li>
<li>DTU: <a href=\"http://www.dtu.dk/english\"> http://www.dtu.dk/english</a></li>
</ul>
<p>The authors can be contacted by email: <a href=\"mailto:info@itesla-ipsl.org\">info@itesla-ipsl.org</a></p>

<p>This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. </p>
<p>If a copy of the MPL was not distributed with this file, You can obtain one at <a href=\"http://mozilla.org/MPL/2.0/\"> http://mozilla.org/MPL/2.0</a>.</p>
</html>
", info="<html>
<p><span style=\"font-family: Arial,sans-serif;\">Similar to PIDGovernor1C but with the PID controller integral mode implementation of PIDGovernor2A.</span></p>
<p><span style=\"font-family: Arial,sans-serif;\">The reference power is specified as a parameter.</span></p>
</html>"));
end PIDGovernor2B;
