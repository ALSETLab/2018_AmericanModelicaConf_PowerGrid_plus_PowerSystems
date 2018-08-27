within OpenCPS_D53B.MultiDomain.Common;
model PID "PID-controller"
  extends ThermoPower.Examples.RankineCycle.Models.PID;
  annotation (Icon(graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,255},
          fillColor={225,225,225},
          fillPattern=FillPattern.Solid),Text(
          extent={{-64,34},{70,-28}},
          lineColor={0,0,255},
          fillColor={225,225,225},
          fillPattern=FillPattern.Solid,
          textString="GOV")}));
end PID;
