# README

## Articulated Control of an RP Robot Manipulator

This project focuses on the simulated study of various strategies for the joint control of a simple RP manipulator using MATLAB-SIMULINK. Below is a brief overview of the key tasks and objectives:

### Objectives
- Simulate and analyze joint control strategies for an RP manipulator.
- Implement control laws including PD, PID, and nonlinear centralized controls.
- Evaluate performance with different reduction ratios and environmental conditions.

### Setup Instructions
1. Launch **MATLAB** and **SIMULINK**.
2. Open the `lib_robotRP` library.
3. Create a new SIMULINK diagram and include the following blocks:
   - `profils_de_consigne_axes_1_et_2`
   - `robot_RP`
4. Explore block parameters and configure simulation settings.

### Key Tasks
1. **Simulation Setup**:
   - Test and analyze predefined motion profiles.
   - Explore the effect of reduction ratios (`r = 1/200, 1/30, 1`) on system dynamics.

2. **PD Control**:
   - Derive and calculate proportional-derivative (PD) coefficients.
   - Analyze open-loop and closed-loop behaviors.
   - Simulate responses for position and velocity inputs, with and without disturbances.

3. **PID Control**:
   - Implement a proportional-integral-derivative (PID) control strategy.
   - Tune parameters to improve system stability and precision.

4. **Nonlinear Centralized Controls**:
   - Develop feedforward and decoupling control laws.
   - Complete the provided "S-function" templates:
     - `sf_loi_avant_RP.m`
     - `sf_retour_linearisant_RP.m`
   - Test and compare these strategies against linear approximations.

5. **Model Validation**:
   - Verify the linear approximation's validity.
   - Investigate the influence of gravitational forces and other nonlinear effects.

### Simulation Notes
- Use `r = 1/200` for most PID experiments.
- Incorporate disturbances and environmental variations for robust testing.
- Leverage provided "S-functions" for implementing advanced control algorithms.

### Deliverables
- A functional SIMULINK model demonstrating the control strategies.
- Documented performance metrics and observations for all cases.

### Resources
- **MATLAB-SIMULINK library**: `lib_robotRP`
- **S-functions**: `sf_loi_avant_RP.m`, `sf_retour_linearisant_RP.m`

For further details, refer to the project documentation and embedded comments in the code files.
