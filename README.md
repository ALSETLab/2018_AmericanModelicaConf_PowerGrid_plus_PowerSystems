# Multi-Domain Modelica Models for Gas Turbine Detailed Model Analysis using Modelica, OpenIPSL and ThermoPower

Modelica models presented in a paper of the 2018 American Modelica Conference for the paper "Coalesced Gas Turbine and Power System Modeling and Simulation using Modelica".

![Multi-domain SMIB model](https://github.com/ALSETLab/2018_AmericanModelicaConf_PowerGrid_plus_PowerSystems/blob/master/Results/images/MDSMIBModel.png)

This repository contains a Modelica Single Machine Infinite Bus (SMIB) Multi-domain model based on components from the OpenIPSL and ThermoPower libraries. The package also includes the gas turbine and SMIB network models needed to build the multi-domain model. These Modelica-compliant models are briefly described in the following paper of the American Modelica Conference 2018:

> Miguel Aguilera, Luigi Vanfretti, Tetiana Bogodorova and Francisco Gómez, "Coalesced Gas Turbine and Power System Modeling and Simulation using Modelica", Proceedings of The American Modelica Conference 2018, Cambridge, MA, United States of America, 2018.

Please see the full paper for the documentation of the models.
Download the paper from the [American Modelica Conference 2018](https://www.modelica.org/events/modelica2018Americas) website.
A pre-print is available under `./doc/`; note that this is the version submitted for review, and not the final version of the paper, which you can obtain in the website cited above.

## Sample Results from the Paper
The repository also provides the Modelica MAT results from the SMIB Power system-only and Multi-Domain models comparison and the Multi-Domain simulation, as discussed in the paper. The results can be found under the `./Results/` folder.

## Example: How to simulate one of the models?
In Dymola 2019 (or newer), follow the steps below:
-  Load dependencies:
  -  OpenIPSL Library v1.5.0 - [here](https://github.com/OpenIPSL/OpenIPSL/releases/tag/v1.5.0)
  -  ThermoPower Library v3.1-beta.0 - [here](https://github.com/casella/ThermoPower/releases/tag/v3.1-beta.0)
- Inside the folder `Modelica_Models`, there is the `OpenCPS_D53B` folder, copy this to a location of your preference, DO NOT modify the name of the folder.
- File/Open `./OpenCPS_D53B/package.mo`
- Set as simulation model: `./OpenCPS_D53B/PowerSystemDomain/Networks/SMIB/NoNoise/OnLoad/SMIB_TurbGov.mo`
- Simulate the model for 100 sec using DASSL and a tolerance of 0.0001.
- Plot `./generator/PELEC`, you should obtain the response shown below.
![response1](https://github.com/ALSETLab/2018_AmericanModelicaConf_PowerGrid_plus_PowerSystems/blob/master/Results/images/SMIB_TurbGov.png)

- Repeating the same process for the multi-domain model should result in the comparison below.

![response2](https://github.com/ALSETLab/2018_AmericanModelicaConf_PowerGrid_plus_PowerSystems/blob/master/Results/images/ElPowResponseComp.png)

## Development and contribution
The library is developed by Miguel Aguilera, Luigi Vanfretti, Tetiana Bogodorova and Francisco Gómez.

Contributions are welcome via pull requests.

## License - No Warranty
This Modelica package is free software and the use is completely at your own risk; it can be redistributed and/or modified under the terms of the GNU Public License version 3.

Copyright (C) 2018, Miguel Aguilera, Luigi Vanfretti, Tetiana Bogodorova and Francisco Gómez
