within OpenCPS_D53B.PowerSystemDomain.Networks.SMIB.NoiseOnLoad;
model SMIB_normal_noise
  "SMIB network without controls (noise on load)"
  extends Partial.SMIB_Partial_Noise_normal(
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
    pMU(V_0=pf_results.voltages.V23, angle_0=pf_results.voltages.A23),
    whiteNoiseInjection(active_sigma=1e-3, samplePeriod=0.01),
    line_3(opening=1));
  import Modelica.Constants.pi;

  Generation_Groups.SMIB.Generator_AVR_PSS_TurbGov
                                   generator_AVR_PSS_TurbGov(
    V_b=13.8,
    M_b=10,
    Q_0=pf_results.machines.Q1_1,
    P_0=pf_results.machines.P1_1,
    V_0=pf_results.voltages.V1,
    angle_0=pf_results.voltages.A1) annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  Records.PF_075 pf_results annotation (Placement(transformation(extent={{-60,-86},
            {-40,-66}})));
equation
  connect(generator_AVR_PSS_TurbGov.pwPin, GEN1.p)
    annotation (Line(points={{-49,0},{-45.5,0},{-42,0}}, color={0,0,255}));
  annotation (
    experiment(
      StopTime=300,
      Interval=0.02,
      __Dymola_Algorithm="Dassl"),
    __Dymola_experimentSetupOutput,
    Diagram(coordinateSystem(extent={{-80,-120},{120,40}}), graphics={Text(
          extent={{-60,40},{100,20}},
          lineColor={28,108,200},
          textString="Note: this model uses a full generator+controls, it simulates the ambient response of the system to a stochastically varying load.
")}),
    Icon(coordinateSystem(extent={{-80,-120},{120,40}})));
end SMIB_normal_noise;
