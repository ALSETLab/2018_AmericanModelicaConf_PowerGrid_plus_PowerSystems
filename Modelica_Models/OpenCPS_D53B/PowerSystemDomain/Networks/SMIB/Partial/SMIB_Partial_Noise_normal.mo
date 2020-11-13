within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.Partial;
partial model SMIB_Partial_Noise_normal
  "Partial model containing the network elements, GENROU generator, stochastic load"
  extends Modelica.Icons.Example;

  import Modelica.Constants.pi;
  OpenIPSL.Electrical.Buses.Bus GEN1(V_b=13.8) annotation (Placement(transformation(extent={{-54,-12},{-30,12}})));
  OpenIPSL.Electrical.Buses.Bus BUS1(V_b=13.8) annotation (Placement(transformation(extent={{-18,-12},{6,12}})));
  OpenIPSL.Electrical.Buses.Bus GEN2(V_b=13.8) annotation (Placement(transformation(extent={{82,-12},{106,12}})));
  OpenIPSL.Electrical.Branches.PSAT.TwoWindingTransformer transformer(
    x=0.15,
    r=0,
    Sn=10,
    V_b=13.8,
    Vn=13.8) annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
  OpenIPSL.Electrical.Branches.PwLine line_1(
    G=0,
    B=0,
    R=0.001,
    X=0.2) annotation (Placement(transformation(extent={{34,14},{52,26}})));
  OpenIPSL.Electrical.Branches.PwLine line_2(
    G=0,
    B=0,
    R=0.0003,
    X=0.06) annotation (Placement(transformation(extent={{4,-26},{22,-14}})));
  inner OpenIPSL.Electrical.SystemBase SysData(S_b=10, fn=50) annotation (Placement(transformation(extent={{-60,-60},
            {-6,-40}})));
protected
  parameter Real S_b=SysData.S_b;
public
  OpenIPSL.Electrical.Buses.Bus LOAD(V_b=13.8) annotation (Placement(transformation(extent={{16,-32},{40,-8}})));
  OpenIPSL.Electrical.Branches.PwLine line_3(
    G=0,
    B=0,
    X=0.07,
    R=0.00035) annotation (Placement(transformation(extent={{38,-26},{56,-14}})));
public
  OpenIPSL.Electrical.Buses.Bus BUS2(V_b=13.8) annotation (Placement(transformation(extent={{48,-32},{72,-8}})));
  OpenIPSL.Electrical.Branches.PwLine line_4(
    G=0,
    B=0,
    X=0.07,
    R=0.00035) annotation (Placement(transformation(extent={{64,-26},{82,-14}})));
  OpenIPSL.Electrical.Branches.PwLine line_5(
    G=0,
    B=0,
    R=0,
    X=0.00001) annotation (Placement(transformation(
        extent={{-9,-6},{9,6}},
        rotation=270,
        origin={35,-36})));

public
  OpenIPSL.Electrical.Buses.Bus BUS3(V_b=13.8) annotation (Placement(transformation(
        extent={{-12,-12},{12,12}},
        rotation=90,
        origin={36,-66})));
  OpenIPSL.Electrical.Machines.PSSE.GENCLS infiniteGen(
    angle_0=0,
    Q_0=0.7185408,
    P_0=2.569692e-5) annotation (Placement(transformation(extent={{120,-10},{100,10}})));
  NoiseInjections.WhiteNoiseInjection whiteNoiseInjection(
    active_sigma=0.0001)
                 annotation (Placement(transformation(extent={{0,-94},{20,-74}})));
  Loads.VariableLoad variableLoad(
    V_b=13.8,
    V_0=0.9912454,
    angle_0=-0.6086974,
    P_0=5,
    Q_0=1,
    t1=0,
    d_t=0,
    d_P=0,
    characteristic=2) annotation (Placement(transformation(extent={{26,-98},{46,-80}})));
  Controls.SoftPMU.PMU pMU annotation (Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=-90,
        origin={36,-55})));
equation
  connect(GEN1.p, transformer.p) annotation (Line(points={{-42,0},{-35,0}}, color={0,0,255}));
  connect(transformer.n, BUS1.p) annotation (Line(points={{-13,0},{-6,0}}, color={0,0,255}));
  connect(BUS1.p, line_1.p) annotation (Line(points={{-6,0},{-6,0},{2,0},{2,20},{34.9,20}}, color={0,0,255}));
  connect(line_1.n, GEN2.p) annotation (Line(points={{51.1,20},{88,20},{88,0},{94,0}}, color={0,0,255}));
  connect(line_2.p, line_1.p) annotation (Line(points={{4.9,-20},{2,-20},{2,20},{34.9,20}}, color={0,0,255}));
  connect(LOAD.p, line_2.n) annotation (Line(points={{28,-20},{21.1,-20}}, color={0,0,255}));
  connect(LOAD.p, line_3.p) annotation (Line(points={{28,-20},{28,-20},{38.9,-20}}, color={0,0,255}));
  connect(BUS2.p, line_3.n) annotation (Line(points={{60,-20},{55.1,-20}}, color={0,0,255}));
  connect(line_4.p, BUS2.p) annotation (Line(points={{64.9,-20},{62.45,-20},{60,-20}}, color={0,0,255}));
  connect(line_4.n, GEN2.p) annotation (Line(points={{81.1,-20},{88,-20},{88,0},{94,0}}, color={0,0,255}));
  connect(line_5.p, line_3.p) annotation (Line(points={{35,-27.9},{35,-20},{38.9,-20}}, color={0,0,255}));
  connect(infiniteGen.p, GEN2.p) annotation (Line(points={{100,0},{97,0},{94,0}}, color={0,0,255}));
  connect(variableLoad.p, BUS3.p) annotation (Line(points={{36,-80},{36,-66}}, color={0,0,255}));
  connect(variableLoad.u, whiteNoiseInjection.y) annotation (Line(points={{27.9,
          -84.05},{24,-84.05},{24,-84.1},{20.9,-84.1}}, color={0,0,127}));
  connect(pMU.n, BUS3.p) annotation (Line(points={{36,-59.9},{36,-62.95},{36,-66}}, color={0,0,255}));
  connect(pMU.p, line_5.n) annotation (Line(points={{36,-50.1},{36,-50.1},{36,-44.1},{35,-44.1}}, color={0,0,255}));
  annotation (
    Placement(transformation(extent={{220,-100},{232,-88}})),
    Diagram(coordinateSystem(extent={{-140,-100},{120,100}}, preserveAspectRatio=false)),
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})),
    experiment(
      StopTime=10,
      Interval=0.0001,
      Tolerance=1e-006,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Rkfix2"),
    __Dymola_experimentSetupOutput,
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
end SMIB_Partial_Noise_normal;
