within OpenCPS_D53B.PowerSystemDomain.Generation_Groups.SMIB;
model Generator_TurbGov "Generator + Turbine + Governor"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  OpenIPSL.Electrical.Machines.PSSE.GENROU gENROU(
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0,
    M_b=M_b,
    Tpd0=machinePars.Tpd0,
    Tppd0=machinePars.Tppd0,
    Tppq0=machinePars.Tppq0,
    H=machinePars.H,
    D=machinePars.D,
    Xd=machinePars.Xd,
    Xq=machinePars.Xq,
    Xpd=machinePars.Xpd,
    Xppd=machinePars.Xppd,
    Xppq=machinePars.Xppq,
    Xl=machinePars.Xl,
    S10=machinePars.S10,
    S12=machinePars.S12,
    Xpq=machinePars.Xpq,
    Tpq0=machinePars.Tpq0,
    Xpp=machinePars.Xpp,
    R_a=machinePars.R_a,
    V_b=V_b) annotation (Placement(transformation(extent={{0,-30},{60,30}})));
  parameter Real M_b "Machine base power (MVA)";
  Modelica.Blocks.Interfaces.RealOutput Pm0 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={60,-106}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={46,-98})));
  Modelica.Blocks.Interfaces.RealOutput speed annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={106,20}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-44,-98})));
  Modelica.Blocks.Interfaces.RealOutput PELEC
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={94,-88}), iconTransformation(extent={{-82,-62},{-102,-42}})));
  Controls.GGOV1.Simplified.GGOV2 govturb(
    R=0.04,
    T_pelec=1,
    maxerr=0.05,
    minerr=-0.05,
    Kpgov=10,
    Kigov=5,
    Kdgov=0,
    Tdgov=1,
    Dm=0,
    Kimw=0,
    db=0,
    Vmax=1,
    Vmin=0.1,
    Tact=4,
    Teng=0,
    Tfload=3,
    Tsa=4,
    Tsb=5,
    DELT=0.005,
    Trate=10,
    Rup=99,
    Rdown=-99,
    Ropen=0.1,
    Rclose=-0.1,
    Flag=0,
    Pref=P_0/10,
    Kturb=1.5,
    Wfnl=0.15,
    Tb=0.14101,
    Tc=0.11514) annotation (Placement(transformation(extent={{-80,40},{-40,80}})));
  SMIB.Records.MachinePars1 machinePars annotation (Placement(transformation(extent={{40,60},{60,80}})));
equation
  connect(gENROU.p, pwPin) annotation (Line(points={{60,0},{60,0},{110,0}}, color={0,0,255}));
  connect(gENROU.EFD0, gENROU.EFD) annotation (Line(points={{63,-15},{72,-15},{72,-46},{-20,-46},{-20,-15},{-6,-15}},color={0,0,127}));
  connect(Pm0, Pm0) annotation (Line(points={{60,-106},{60,-101},{60,-106}}, color={0,0,127}));
  connect(Pm0, gENROU.PMECH0) annotation (Line(points={{60,-106},{60,-74},{86,-74},{86,15},{63,15}}, color={0,0,127}));
  connect(gENROU.SPEED, speed) annotation (Line(points={{63,21},{83.5,21},{83.5,20},{106,20}}, color={0,0,127}));
  connect(gENROU.PELEC, PELEC) annotation (Line(points={{63,9},{94,9},{94,-88}}, color={0,0,127}));
  connect(govturb.PELEC, PELEC) annotation (Line(points={{-81.125,49.8571},{-90,
          49.8571},{-90,-52},{94,-52},{94,-88}},                                                                       color={0,0,127}));
  connect(govturb.SPEED, speed) annotation (Line(points={{-81.125,73},{-90,73},{-90,88},{80,88},{80,22},{83.5,21},{83.5,20},{106,20}}, color={0,0,127}));
  connect(govturb.PMECH, gENROU.PMECH) annotation (Line(points={{-38.5,50},{-20,50},{-20,15},{-6,15}},color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
          color={0,0,0},
          smooth=Smooth.Bezier),
        Text(
          extent={{-52,-18},{56,-66}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
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
<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\">
<tr>
<td><p>Reference</p></td>
<td><p>SMIB PSAT, d_kundur2.mdl, PSAT</p></td>
</tr>
<tr>
<td><p>Last update</p></td>
<td>February 2016</td>
</tr>
<tr>
<td><p>Author</p></td>
<td><p>Maxime Baudette, Ahsan Murad, SmarTS Lab, KTH Royal Institute of Technology</p></td>
</tr>
<tr>
<td><p>Contact</p></td>
<td><p><a href=\"mailto:luigiv@kth.se\">luigiv@kth.se</a></p></td>
</tr>
</table>
</html>"));
end Generator_TurbGov;
