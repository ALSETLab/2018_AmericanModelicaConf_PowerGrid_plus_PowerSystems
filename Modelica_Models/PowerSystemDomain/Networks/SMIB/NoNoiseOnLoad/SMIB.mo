within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.NoNoiseOnLoad;
model SMIB "SMIB network without controls (no noise on load)"
  extends Partial.SMIB_Partial_NoNoise(
    transformer(V_b=13.8, Vn=13.8),
    LOAD(V_b=13.8),
    GEN1(V_b=13.8),
    BUS1(V_b=13.8),
    BUS2(V_b=13.8),
    BUS3(V_b=13.8),
    GEN2(V_b=13.8),
    infiniteGen(
      V_b=13.8,
      M_b=1000,
      P_0=pf_results.machines.P3_1,
      Q_0=pf_results.machines.Q3_1,
      V_0=pf_results.voltages.V3,
      angle_0=pf_results.voltages.A3),
    variableLoad(
      d_P=0,
      t1=0,
      d_t=0,
      P_0=pf_results.loads.PL23_1,
      Q_0=pf_results.loads.QL23_1,
      V_0=pf_results.voltages.V23,
      angle_0=pf_results.voltages.A23),
    pMU(V_0=pf_results.voltages.V23, angle_0=pf_results.voltages.A23));
  import Modelica.Constants.pi;

  Generation_Groups.SMIB.Generator generator(
    V_b=13.8,
    M_b=10,
    Q_0=pf_results.machines.Q1_1,
    P_0=pf_results.machines.P1_1,
    V_0=pf_results.voltages.V1,
    angle_0=pf_results.voltages.A1) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Records.PF_050 pf_results annotation (Placement(transformation(extent={{-136,50},{-116,70}})));
equation
  connect(generator.pwPin, GEN1.p) annotation (Line(points={{-49,0},{-45.5,0},{-42,0}}, color={0,0,255}));
  connect(generator.Pm0, generator.Pmech) annotation (Line(points={{-55.4,-9.8},{-55.4,-20},{-80,-20},{-80,0},{-70.6,0}}, color={0,0,127}));
  annotation (
    Diagram(graphics={Text(
          extent={{-112,68},{108,48}},
          lineColor={0,0,0},
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fontSize=15,
          textStyle={TextStyle.Bold},
          textString="(Constant Efd)")}),
    experiment(StopTime=50),
    __Dymola_experimentSetupOutput);
end SMIB;
