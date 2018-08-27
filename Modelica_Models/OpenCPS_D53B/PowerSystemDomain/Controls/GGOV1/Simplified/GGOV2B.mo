within OpenCPS_D53B.PowerSystemDomain.Controls.GGOV1.Simplified;
model GGOV2B "GE General Governor/Turbine Model without Load & Acceleration Limiters (PIDGovernor2A)"
  parameter Real R "Permanent droop (pu)";
  parameter Real T_pelec "Electrical power transducer time constant (s)";
  parameter Real maxerr "Maximum value for speed error signal";
  parameter Real minerr "Minimum value for speed error signal";
  parameter Real Kpgov "Governor proportional gain";
  parameter Real Kigov "Governor integral gain";
  parameter Real Kdgov "Governor derivative gain";
  parameter Real Tdgov "Governor derivative controller time constant (s)";
  parameter Real Vmax "Maximum valve position limit";
  parameter Real Vmin "Minimum valve position limit";
  parameter Real Tact "Actuator time constant (s)";
  parameter Real Kturb "Turbine gain";
  parameter Real Wfnl "No load fuel flow (pu)";
  parameter Real Tfload "Load Limiter time constant (s)";
  parameter Real Tb "Turbine lag time constant (s)";
  parameter Real Tc "Turbine lead time constant (s)";
  parameter Real Teng "Transport lag time constant for diesel engine (s)";
  parameter Real Dm "Mechanical damping coefficient (pu)";
  parameter Real Ropen "Maximum valve opening rate (p.u./s)";
  parameter Real Rclose "Maximum valve closing rate (p.u./s)";
  parameter Real Kimw "Power controller (reset) gain";
  parameter Real Trate "Turbine rating (MW)";
  parameter Real db "Speed governor deadband";
  parameter Real Tsa "Temperature detection lead time constant (s)";
  parameter Real Tsb "Temperature detection lag time constant (s)";
  parameter Real Rup "Maximum rate of load limit increase";
  parameter Real Rdown "Maximum rate of load limit decrease";
  parameter Real DELT "PSSE time step";
  Modelica.Blocks.Interfaces.RealInput SPEED "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(extent={{-146,-2},{-108,36}}), iconTransformation(extent={{-188,72},{-150,110}})));
  Modelica.Blocks.Interfaces.RealInput PELEC "Machine electrical power (pu)" annotation (Placement(transformation(extent={{-146,-36},{-110,0}}), iconTransformation(extent={{-188,-90},{-150,-52}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Turbine mechanical power (pu)" annotation (Placement(transformation(extent={{120,-12},{146,14}}), iconTransformation(extent={{160,-82},{184,-58}})));
  Turbine turb(
    Tact=Tact,
    Kturb=Kturb,
    Tb=Tb,
    Tc=Tc,
    Teng=Teng,
    Tfload=Tfload,
    Dm=Dm,
    Ropen=Ropen,
    Rclose=Rclose,
    Tsa=Tsa,
    Tsb=Tsb,
    DELT=DELT,
    Wfnl=Wfnl,
    Flag=Flag) annotation (Placement(transformation(extent={{40,-30},{100,30}})));
  PIDGovernor2A gov(
    R=R,
    T_pelec=T_pelec,
    maxerr=maxerr,
    minerr=minerr,
    Kpgov=Kpgov,
    Kigov=Kigov,
    Kdgov=Kdgov,
    Tdgov=Tdgov,
    Dm=Dm,
    Kimw=Kimw,
    db=db,
    Kturb=Kturb,
    Wfnl=Wfnl,
    Vmax=Vmax,
    Vmin=Vmin,
    Rselect=1) annotation (Placement(transformation(extent={{-80,-30},{-20,30}})));
  parameter Integer Flag=1 "Switch for fuel source
            characteristic";
  Modelica.Blocks.Interfaces.RealInput PSP annotation (Placement(transformation(extent={{-172,-18},{-136,18}}),iconTransformation(extent={{-188,-12},{-150,26}})));
equation
  connect(gov.FSR, turb.FSR) annotation (Line(points={{-17.4286,0},{0,0},{0,-21.6429},{37.6429,-21.6429}}, color={0,0,127}));
  connect(SPEED, gov.SPEED) annotation (Line(points={{-127,17},{-105.5,17},{-105.5,17.3571},{-82.3571,17.3571}}, color={0,0,127}));
  connect(turb.SPEED, gov.SPEED) annotation (Line(points={{37.8571,21.4286},{0,21.4286},{0,60},{-100,60},{-100,17.3571},{-82.3571,17.3571}}, color={0,0,127}));
  connect(PELEC, gov.PELEC) annotation (Line(points={{-128,-18},{-82.3571,-18},{-82.3571,-17.3571}}, color={0,0,127}));
  connect(turb.PELEC, gov.PELEC) annotation (Line(points={{38.0714,0.214286},{20,0.214286},{20,-60},{-100,-60},{-100,-18},{-82.3571,-18},{-82.3571,-17.3571}}, color={0,0,127}));
  connect(turb.PMECH, PMECH) annotation (Line(points={{102.571,0},{102.571,1},{133,1}}, color={0,0,127}));
  connect(PSP, gov.PSP) annotation (Line(points={{-154,0},{-82.3571,0},{-82.3571,-0.214286}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-160,-140},{160,140}})),
    Icon(coordinateSystem(extent={{-160,-140},{160,140}}, preserveAspectRatio=false), graphics={
        Rectangle(extent={{-160,140},{160,-140}}, lineColor={0,0,255}),
        Text(
          extent={{-148,112},{-72,68}},
          lineColor={28,108,200},
          textString="SPEED"),
        Text(
          extent={{-148,-46},{-72,-94}},
          lineColor={28,108,200},
          textString="PELEC"),
        Text(
          extent={{-76,42},{64,-40}},
          lineColor={28,108,200},
          textString="GGOV1"),
        Text(
          extent={{64,-44},{148,-96}},
          lineColor={28,108,200},
          textString="PMECH"),
        Text(
          extent={{-146,20},{-96,-2}},
          lineColor={28,108,200},
          textString="PwSP")}),
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
"));
end GGOV2B;
