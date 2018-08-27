within OpenCPS_D53B.MultiDomain.Generation_Groups.SMIB;
model Gen_AVR_GT "Generator + AVR"
  extends OpenIPSL.Electrical.Essentials.pfComponent;
  OpenIPSL.Interfaces.PwPin pwPin annotation (Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,10}})));
  Common.TM2EPConverter tM2EPConverter annotation (Placement(transformation(extent={{-64,-16},{-32,16}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a shaft annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  parameter Real M_b "Machine base power (MVA)";
  Modelica.Blocks.Interfaces.RealOutput Pm0 annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,-106}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-94})));
  PowerSystemDomain.Generation_Groups.SMIB.Generator_AVR generator(
    M_b=M_b,
    V_b=V_b,
    V_0=V_0,
    angle_0=angle_0,
    P_0=P_0,
    Q_0=Q_0) annotation (Placement(transformation(extent={{30,-18},{66,18}})));
equation
  connect(tM2EPConverter.shaft, shaft) annotation (Line(points={{-64,0},{-100,0}}, color={0,0,0}));
  connect(generator.pwPin, pwPin) annotation (Line(points={{67.8,0},{110,0}}, color={0,0,255}));
  connect(tM2EPConverter.PMECH, generator.Pmech) annotation (Line(points={{-30.4,8},{12,8},{12,0},{28.92,0}}, color={0,0,127}));
  connect(generator.speed, tM2EPConverter.SPEED) annotation (Line(points={{40.08,-17.64},{40.08,-38},{0,-38},{0,-8},{-33.6,-8}}, color={0,0,127}));
  connect(generator.Pm0, Pm0) annotation (Line(points={{56.28,-17.64},{56.28,-57},{70,-57},{70,-106}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Ellipse(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),Line(
          points={{-48,2},{-20,56},{2,4},{24,-28},{48,22}},
          color={0,0,0},
          smooth=Smooth.Bezier),Text(
          extent={{-52,-18},{56,-66}},
          lineColor={0,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(
          extent={{-74,94},{74,54}},
          lineColor={28,108,200},
          fillColor={238,238,238},
          fillPattern=FillPattern.Solid,
          textString="Generator+AVR with Interface for
Detailed Gas Turbine Model")}),
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
end Gen_AVR_GT;
