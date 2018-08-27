within OpenCPS_D53B.PowerSystemDomain.Controls.GGOV1.Original;
model GGOV1 "GE General Governor/Turbine Mode"
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
  parameter Real Tb "Turbine lag time constant (s)";
  parameter Real Tc "Turbine lead time constant (s)";
  parameter Real Teng "Transport lag time constant for diesel engine (s)";
  parameter Real Tfload "Load Limiter time constant (s)";
  parameter Real Kpload "Load limiter proportional gain for PI controller";
  parameter Real Kiload "Load limiter integral gain for PI controller";
  parameter Real Ldref "Load limiter reference value (pu)";
  parameter Real Dm "Mechanical damping coefficient (pu)";
  parameter Real Ropen "Maximum valve opening rate (p.u./s)";
  parameter Real Rclose "Maximum valve closing rate (p.u./s)";
  parameter Real Kimw "Power controller (reset) gain";
  parameter Real Aset "Acceleration limiter setpoint (p.u./s)";
  parameter Real Ka "Acceleration limiter gain";
  parameter Real Ta "Acceleration limiter time constant (s)";
  parameter Real Trate "Turbine rating (MW)";
  parameter Real db "Speed governor deadband";
  parameter Real Tsa "Temperature detection lead time constant (s)";
  parameter Real Tsb "Temperature detection lag time constant (s)";
  parameter Real Rup "Maximum rate of load limit increase";
  parameter Real Rdown "Maximum rate of load limit decrease";
  parameter Real DELT "PSSE time step";
  Modelica.Blocks.Interfaces.RealInput SPEED "Machine speed deviation from nominal (pu)"
    annotation (Placement(transformation(extent={{-302,-2},{-264,36}}), iconTransformation(extent={{-346,100},{-308,138}})));
  Modelica.Blocks.Interfaces.RealInput PELEC "Machine electrical power (pu)" annotation (Placement(transformation(extent={{-320,-72},{-284,-36}}), iconTransformation(extent={{-348,-118},{-310,-80}})));
  Modelica.Blocks.Sources.Constant AccelerationSet(k=Aset) annotation (Placement(transformation(extent={{-198,-14},{-176,8}})));
  Modelica.Blocks.Sources.Constant P_ref(k=Pref) annotation (Placement(transformation(extent={{-234,-102},{-212,-80}})));
  Modelica.Blocks.Sources.Constant Pmw_set(k=Pmwset) "Supervisory Load Controller Setpoint," annotation (Placement(transformation(extent={{-234,-146},{-212,-124}})));
  Modelica.Blocks.Sources.Constant set(k=Ldref) "load reference" annotation (Placement(transformation(extent={{-200,72},{-178,94}})));
  OpenIPSL.Electrical.Controls.PSSE.TG.GGOV1.Min_select min_select(frs0=fsr0, nu=3) annotation (Placement(transformation(extent={{-20,-34},{34,20}})));
  Modelica.Blocks.Interfaces.RealOutput PMECH "Turbine mechanical power (pu)" annotation (Placement(transformation(extent={{228,22},{254,48}}), iconTransformation(extent={{260,-12},{284,12}})));
public
  Original.LoadLimiter gGOV1_Temp(
    Kturb=Kturb,
    Kpload=Kpload,
    Kiload=Kiload,
    Dm=Dm,
    Wfnl=Wfnl) annotation (Placement(transformation(extent={{-140,40},{-80,100}})));
  Modelica.Blocks.Nonlinear.Limiter V(uMax=Vmax, uMin=Vmin) annotation (Placement(transformation(extent={{70,-20},{96,6}})));
  Original.Turbine gGOV1_Turb(
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
    Flag=0,
    Wfnl=Wfnl) annotation (Placement(transformation(extent={{136,-20},{196,40}})));
  Original.AccelerationLimiter gGOV1_Accel(
    Ka=Ka,
    Ta=Ta,
    DELT=DELT) annotation (Placement(transformation(extent={{-140,-48},{-80,12}})));
  Original.PIDGovernor gGOV1_Power(
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
    Wfnl=Wfnl) annotation (Placement(transformation(extent={{-140,-140},{-80,-80}})));
protected
  parameter Real Pe0(fixed=false);
  parameter Real Pmech0(fixed=false);
  parameter Real Pref(fixed=false);
  parameter Real Pmwset(fixed=false);
  parameter Real fsr0(fixed=false);

initial equation
  Pe0 = PELEC;
  Pmech0 = PELEC;
  Pref = R*Pe0;
  Pmwset = Pe0;
  fsr0 = (Pmech0 + Dm)/Kturb + Wfnl;

equation
  connect(set.y, gGOV1_Temp.LDREF) annotation (Line(points={{-176.9,83},{-158,83},{-158,69.7},{-142.7,69.7}}, color={0,0,127}));
  connect(gGOV1_Temp.FSRT, min_select.u[1]) annotation (Line(points={{-77,52},{-52,52},{-52,4},{-52,5.6},{-20,5.6}}, color={0,0,127}));
  connect(min_select.yMin, V.u) annotation (Line(points={{36.7,-29.68},{52,-29.68},{52,-7},{67.4,-7}}, color={0,0,127}));
  connect(gGOV1_Turb.FSR, V.y) annotation (Line(points={{133.643,-11.6429},{108,-11.6429},{108,-7},{97.3,-7}}, color={0,0,127}));
  connect(gGOV1_Turb.TEXM, gGOV1_Temp.TEXM) annotation (Line(points={{166,42.5714},{166,42.5714},{166,70},{166,85},{-77.6,85}}, color={0,0,127}));
  connect(AccelerationSet.y, gGOV1_Accel.ASET) annotation (Line(points={{-174.9,-3},{-156,-3},{-156,-2.7},{-141.5,-2.7}}, color={0,0,127}));
  connect(gGOV1_Accel.FSR, V.y) annotation (Line(points={{-78.2,-33},{-60,-33},{-60,-60},{106,-60},{106,-6},{97.3,-7}}, color={0,0,127}));
  connect(gGOV1_Accel.FSRA, min_select.u[2]) annotation (Line(points={{-76.7,-3.3},{-62,-3.3},{-62,-7},{-20,-7}}, color={0,0,127}));
  connect(P_ref.y, gGOV1_Power.P_REF) annotation (Line(points={{-210.9,-91},{-198,-91},{-198,-102.071},{-142.357,-102.071}}, color={0,0,127}));
  connect(Pmw_set.y, gGOV1_Power.PMW_SET) annotation (Line(points={{-210.9,-135},{-196,-135},{-196,-118.786},{-142.357,-118.786}}, color={0,0,127}));
  connect(gGOV1_Power.FSRN, min_select.u[3]) annotation (Line(points={{-77.4286,-110},{-50,-110},{-50,-19.6},{-20,-19.6}}, color={0,0,127}));
  connect(gGOV1_Accel.SPEED, SPEED) annotation (Line(points={{-141.5,-33.3},{-240,-33.3},{-240,17},{-283,17}}, color={0,0,127}));
  connect(gGOV1_Power.SPEED, SPEED) annotation (Line(points={{-142.357,-90.5},{-180,-90.5},{-180,-34},{-240,-34},{-240,17},{-283,17}}, color={0,0,127}));
  connect(gGOV1_Turb.SPEED, SPEED) annotation (Line(points={{133.857,31.4286},{100,31.4286},{100,140},{-240,140},{-240,17},{-283,17}}, color={0,0,127}));
  connect(gGOV1_Power.PELEC, PELEC) annotation (Line(points={{-142.357,-131.643},{-182,-131.643},{-182,-168},{-256,-168},{-256,-54},{-302,-54}}, color={0,0,127}));
  connect(gGOV1_Temp.WF, V.y) annotation (Line(points={{-78.2,67},{80,67},{80,20},{106,20},{106,-6},{97.3,-7}}, color={0,0,127}));
  connect(gGOV1_Temp.PELEC, PELEC) annotation (Line(points={{-110,37.6},{-110,20},{-220,20},{-220,-54},{-302,-54}}, color={0,0,127}));
  connect(gGOV1_Power.VSTROKE, gGOV1_Turb.VSTROKE) annotation (Line(points={{-116.214,-141.929},{-116.214,-180},{212,-180},{212,-11.4286},{198.571,-11.4286}}, color={0,0,127}));
  connect(gGOV1_Turb.PELEC, PELEC) annotation (Line(points={{134.071,10.2143},{120,10.2143},{120,-200},{-274,-200},{-274,-54},{-302,-54}}, color={0,0,127}));
  connect(gGOV1_Turb.PMECH, PMECH) annotation (Line(points={{198.571,10},{214,10},{214,35},{241,35}}, color={0,0,127}));
  connect(gGOV1_Power.GOVOUT1, V.y) annotation (Line(points={{-94.7857,-141.929},{-94.7857,-160},{112,-160},{112,-12},{108,-12},{108,-7},{97.3,-7}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-320,-240},{260,220}})),
    Icon(coordinateSystem(extent={{-320,-240},{260,220}}, preserveAspectRatio=false), graphics={Rectangle(extent={{-320,220},{260,-240}}, lineColor={0,0,255}),Text(
          extent={{-306,146},{-216,92}},
          lineColor={0,0,255},
          textString="SPEED"),Text(
          extent={{-306,-74},{-222,-126}},
          lineColor={0,0,255},
          textString="PELEC"),Text(
          extent={{-114,64},{92,-64}},
          lineColor={0,0,255},
          textString="GGOV1"),Text(
          extent={{172,24},{256,-28}},
          lineColor={0,0,255},
          textString="PMECH")}),
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
end GGOV1;
