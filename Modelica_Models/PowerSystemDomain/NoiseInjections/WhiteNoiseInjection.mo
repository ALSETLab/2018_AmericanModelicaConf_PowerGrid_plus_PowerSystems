within OpenCPS_D53B.PowerSystemDomain.NoiseInjections;
model WhiteNoiseInjection
  extends BaseClass;

equation
  y = noise_gen.y;
  annotation ();
end WhiteNoiseInjection;
