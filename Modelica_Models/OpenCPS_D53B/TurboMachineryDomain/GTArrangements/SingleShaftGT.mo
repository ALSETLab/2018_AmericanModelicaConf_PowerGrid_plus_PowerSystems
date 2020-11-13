within OpenCPS_D53B.TurboMachineryDomain.GTArrangements;
model SingleShaftGT "Complete Single Shaft Gas Turbine Model From ThermoPower Library"
  extends ThermoPower.PowerPlants.GasTurbine.Interfaces.GasTurbine;
  ThermoPower.Gas.Compressor compressor(
    redeclare package Medium = ThermoPower.Media.Air,
    Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
    explicitIsentropicEnthalpy=true,
    Ndesign=Ndesign,
    Tdes_in=comprTdes_in,
    tablePhic=comprTablePhic,
    tableEta=comprTableEta,
    tablePR=comprTablePR,
    pstart_in=34300,
    pstart_out=830000,
    Tstart_in=244.4,
    Tstart_out=600.4) annotation (Placement(transformation(extent={{-104,-30},{-44,30}}, rotation=0)));
  ThermoPower.Gas.Turbine turbine(
    redeclare package Medium = ThermoPower.Media.FlueGas,
    Table=ThermoPower.Choices.TurboMachinery.TableTypes.matrix,
    Tdes_in=turbTdes_in,
    pstart_in=785000,
    pstart_out=152000,
    Tstart_in=1370,
    Tstart_out=800,
    Ndesign=Ndesign,
    tablePhic=turbTablePhic,
    tableEta=turbTableEta) annotation (Placement(transformation(extent={{48,-30},{108,30}}, rotation=0)));
  ThermoPower.Gas.CombustionChamber CombustionChamber1(
    initOpt=ThermoPower.Choices.Init.Options.steadyState,
    V=V,
    S=S,
    gamma=gamma,
    Cm=Cm,
    HH=HH,
    pstart=811000,
    Tstart=1370) annotation (Placement(transformation(extent={{-18,80},{22,120}}, rotation=0)));
  ThermoPower.Gas.PressDrop PressDrop1(
    redeclare package Medium = ThermoPower.Media.FlueGas,
    FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
    wnom=pd2_wnom,
    dpnom=dpnom2,
    rhonom=pd2_rhonom,
    pstart=811000,
    Tstart=1370) annotation (Placement(transformation(
        origin={54,68},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  ThermoPower.Gas.PressDrop PressDrop2(
    FFtype=ThermoPower.Choices.PressDrop.FFtypes.OpPoint,
    A=1,
    redeclare package Medium = ThermoPower.Media.Air,
    wnom=pd1_wnom,
    dpnom=dpnom1,
    rhonom=pd1_rhonom,
    pstart=830000,
    Tstart=600) annotation (Placement(transformation(
        origin={-50,70},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  ThermoPower.PowerPlants.HRSG.Components.StateReader_gas stateInletCC(redeclare
      package                                                                            Medium =
        ThermoPower.Media.Air)                                                                                           annotation (Placement(transformation(extent={{-46,90},{-26,110}}, rotation=0)));
  ThermoPower.PowerPlants.HRSG.Components.StateReader_gas stateOutletCC(redeclare
      package                                                                             Medium =
        ThermoPower.Media.FlueGas)
    annotation (Placement(transformation(extent={{30,90},{50,110}}, rotation=0)));
  parameter ThermoPower.Units.AbsoluteTemperature comprTdes_in "Compressor inlet design temperature";
  parameter ThermoPower.Units.AbsoluteTemperature turbTdes_in "Turbine inlet design temperature";
  parameter Modelica.SIunits.AngularVelocity Ndesign "Design velocity";
  parameter Modelica.SIunits.Volume V "Combustion Chamber Inner volume";
  parameter Modelica.SIunits.Area S=0 "Combustion Chamber Inner surface";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer gamma=0 "Combustion Chamber Heat Transfer Coefficient";
  parameter Modelica.SIunits.HeatCapacity Cm=0 "Combustion Chamber Metal Heat Capacity";
  parameter Modelica.SIunits.SpecificEnthalpy HH "Lower Heating value of fuel";
  parameter Modelica.SIunits.MassFlowRate pd1_wnom "Pre-combustion PressureDrop Nominal mass flowrate";
  parameter Modelica.SIunits.MassFlowRate pd2_wnom "Post-combustion PressureDrop Nominal mass flowrate";
  parameter Modelica.SIunits.Pressure dpnom1 "Pre-combustion nominal pressure drop";
  parameter Modelica.SIunits.Pressure dpnom2 "Post-combustion nominal pressure drop";
  parameter ThermoPower.Units.GasDensity pd1_rhonom=0 "Pre-combustion PressureDrop Nominal density";
  parameter ThermoPower.Units.GasDensity pd2_rhonom=0 "Post-combustion PressureDrop Nominal density";
  parameter Real comprTablePhic[:, :]=fill(
      0,
      0,
      2) "Table for compressor phic(N_T,beta)";
  parameter Real comprTableEta[:, :]=fill(
      0,
      0,
      2) "Table for compressor eta(N_T,beta)";
  parameter Real comprTablePR[:, :]=fill(
      0,
      0,
      2) "Table for compressor eta(N_T,beta)";
  parameter Real turbTablePhic[:, :]=fill(
      0,
      0,
      2) "Table for turbine phic(N_T,PR)";
  parameter Real turbTableEta[:, :]=fill(
      0,
      0,
      2) "Table for turbine eta(N_T,PR)";
equation
  connect(PressDrop1.outlet, turbine.inlet) annotation (Line(
      points={{54,58},{54,24}},
      color={159,159,223},
      thickness=0.5));
  connect(compressor.outlet, PressDrop2.inlet) annotation (Line(
      points={{-50,24},{-50,60}},
      color={159,159,223},
      thickness=0.5));
  connect(compressor.shaft_b, turbine.shaft_a) annotation (Line(
      points={{-56,0},{60,0}},
      color={0,0,0},
      thickness=0.5));
  connect(CombustionChamber1.ina, stateInletCC.outlet) annotation (Line(
      points={{-18,100},{-30,100}},
      color={159,159,223},
      thickness=0.5));
  connect(stateInletCC.inlet, PressDrop2.outlet) annotation (Line(
      points={{-42,100},{-50,100},{-50,80}},
      color={159,159,223},
      thickness=0.5));
  connect(stateOutletCC.inlet, CombustionChamber1.out) annotation (Line(
      points={{34,100},{22,100}},
      color={159,159,223},
      thickness=0.5));
  connect(stateOutletCC.outlet, PressDrop1.inlet) annotation (Line(
      points={{46,100},{54,100},{54,78}},
      color={159,159,223},
      thickness=0.5));
  connect(CombustionChamber1.inf, FuelInlet) annotation (Line(points={{2,120},{2,200},{0,200}}, color={159,159,223}));
  connect(compressor.inlet, AirInlet) annotation (Line(points={{-98,24},{-148,24},{-148,160},{-200,160}}, color={159,159,223}));
  connect(turbine.outlet, FlueGasOutlet) annotation (Line(points={{102,24},{156,24},{156,160},{200,160}}, color={159,159,223}));
  connect(compressor.shaft_a, shaft_a) annotation (Line(points={{-92,0},{-144,0},{-200,0}}, color={0,0,0}));
  connect(turbine.shaft_b, shaft_b) annotation (Line(points={{96,0},{146,0},{200,0}}, color={0,0,0}));
end SingleShaftGT;
