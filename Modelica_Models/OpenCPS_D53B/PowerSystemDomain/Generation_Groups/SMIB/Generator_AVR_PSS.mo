within OpenCPS_D53B.PowerSystemDomain.Generation_Groups.SMIB;
model Generator_AVR_PSS "Generator + AVR + PSS"
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
        origin={80,-106}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={46,-98})));
  Modelica.Blocks.Sources.Constant const(k=0) annotation (Placement(transformation(extent={{-62,-98},{-42,-78}})));
  OpenIPSL.Electrical.Controls.PSSE.ES.IEEET1 avr(
    T_R=aVRPars.T_R,
    K_A=aVRPars.K_A,
    T_A=aVRPars.T_A,
    V_RMAX=aVRPars.V_RMAX,
    V_RMIN=aVRPars.V_RMIN,
    K_E=aVRPars.K_E,
    T_E=aVRPars.T_E,
    K_F=aVRPars.K_F,
    T_F=aVRPars.T_F,
    E_1=aVRPars.E_1,
    S_EE_1=aVRPars.S_EE_1,
    E_2=aVRPars.E_2,
    S_EE_2=aVRPars.S_EE_2) annotation (Placement(transformation(extent={{8,-76},{-24,-48}})));
  OpenIPSL.Electrical.Controls.PSSE.PSS.PSS2A pss(
    T_w1=pSSPars.T_w1,
    T_w2=pSSPars.T_w2,
    T_6=pSSPars.T_6,
    T_w3=pSSPars.T_w3,
    T_w4=pSSPars.T_w4,
    T_7=pSSPars.T_7,
    K_S2=pSSPars.K_S2,
    K_S3=pSSPars.K_S3,
    T_8=pSSPars.T_8,
    T_9=pSSPars.T_9,
    K_S1=pSSPars.K_S1,
    T_1=pSSPars.T_1,
    T_2=pSSPars.T_2,
    T_3=pSSPars.T_3,
    T_4=pSSPars.T_4,
    V_STMAX=pSSPars.V_STMAX,
    V_STMIN=pSSPars.V_STMIN,
    M=pSSPars.M,
    N=pSSPars.N) annotation (Placement(transformation(extent={{60,-48},{22,-40}})));
  Modelica.Blocks.Interfaces.RealInput Pmech annotation (Placement(transformation(extent={{-126,-20},{-86,20}})));
  Modelica.Blocks.Interfaces.RealOutput speed annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={106,20}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-44,-98})));
  SMIB.Records.MachinePars1 machinePars annotation (Placement(transformation(extent={{-90,66},{-70,86}})));
  Records.AVRPars aVRPars annotation (Placement(transformation(extent={{-68,66},{-48,86}})));
  Records.PSSPars pSSPars annotation (Placement(transformation(extent={{-46,66},{-26,86}})));
equation
  connect(gENROU.p, pwPin) annotation (Line(points={{60,0},{60,0},{110,0}}, color={0,0,255}));
  connect(Pm0, gENROU.PMECH0) annotation (Line(points={{80,-106},{80,-88},{92,-88},{92,15},{63,15}}, color={0,0,127}));
  connect(avr.EFD, gENROU.EFD) annotation (Line(points={{-24.8,-60.4444},{-34,
          -60.4444},{-40,-60.4444},{-40,-60},{-40,-32},{-40,-15},{-6,-15}},                                                                     color={0,0,127}));
  connect(gENROU.EFD0, avr.EFD0) annotation (Line(points={{63,-15},{76,-15},{76,
          -70.5556},{8,-70.5556}},                                                                       color={0,0,127}));
  connect(gENROU.ETERM, avr.ECOMP) annotation (Line(points={{63,-9},{82,-9},{82,
          -60.4444},{8,-60.4444}},                                                                       color={0,0,127}));
  connect(const.y, avr.VOEL) annotation (Line(points={{-41,-88},{-41,-88},{-2.4,-88},{-2.4,-76}}, color={0,0,127}));
  connect(avr.VUEL, avr.VOEL) annotation (Line(points={{2.4,-76},{2,-76},{2,-88},{-2.4,-88},{-2.4,-76}}, color={0,0,127}));
  connect(pss.VOTHSG, avr.VOTHSG) annotation (Line(points={{21.4,-44},{14,-44},
          {14,-53.4444},{8,-53.4444}},                                                                      color={0,0,127}));
  connect(gENROU.PELEC, pss.V_S2) annotation (Line(points={{63,9},{96,9},{96,-46},{60,-46}}, color={0,0,127}));
  connect(Pmech, gENROU.PMECH) annotation (Line(points={{-106,0},{-60,0},{-60,15},{-6,15}}, color={0,0,127}));
  connect(speed, gENROU.SPEED) annotation (Line(points={{106,20},{88,20},{88,21},{63,21}}, color={0,0,127}));
  connect(pss.V_S1, gENROU.SPEED) annotation (Line(points={{60,-42},{88,-42},{88,21},{63,21}}, color={0,0,127}));
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
end Generator_AVR_PSS;
