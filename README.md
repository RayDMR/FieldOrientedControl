### 1 - Introduction
This is the product of a highly experimental approach to introducing FOC implementation to FPGA boards through the use of HDL code generation from MATLAB Simulink models.
Within this repository, you will find all the related project files that were created in this project. 

 - On the root of the repository, you will find the MATLAB files required to make any changes to the model used to generate the VDHL code.
 - Within the FOC VHDL folder, you will find the generated VHDL code. This code is to be used in an HDL environment to synthesize into an FPGA.
 
 **The generated code is not validated outside of the validation tools provided by MathWorks, and thus, there is a possibility of it not behaving as intended**

### 2 - How to run (Simulink model)

##### 2.1 System requierements

The project was done in Matlab R2020a
The following toolboxes were used to run this model:
 - Simulink                 -       Version 10.1
 - Control System Toolbox    -      Version 10.8  
 - HDL Coder                  -     Version 3.16
 - HDL Verifier              -      Version 6.1
 - Simscape                 -       Version 4.8
 - Simscape Electrical       -      Version 7.3
 - Optimization Toolbox       -     Version 8.5
 - Simulink Control Design     -    Version 5.5
 - Simulink Design Optimization -   Version 3.8
  
##### 2.2 Running the model
1. Open "foc_controlsystem_param.m" in Matlab
2. Run the foc_controlsystem_param.m script
3. Open "FOC.slx" in Matlab. This will open a new Simulink window with the model
4. Press the run button within Simulink

##### 2.3 Changing the model parameters
Minor changes can be achieved by changing the values within the model parameters file "foc_controlsystem_param.m" and running the script with the new values
Then you can run the Simulink file again using these new parameters.

**The PI's within the FOC subsystem in the model must be re-tuned if the values are changed to obtain sensible results**

### 3 - Limitations
As it stands, it is currently difficult to tune the modeled field-oriented controller. It is not possible to use MATLAB's Simulink PID tune helper functions. Linearization is not easily achievable due to the non-linear behavior of the model.
The generated VHDL files are meant to serve as a proof of concept on the approach. The controllers are not appropriately tuned due to the above-mentioned limitations.

### 4 - Future work
The tunning limitation can be worked around acquiring the [System Identification Toolbox](https://nl.mathworks.com/products/sysid.html). This should allow MATLAB to linearize the model using the model input and output data, and thus, permit the use of MATLAB's Simulink PID tuning helper functions.
The VHDL code needs to be validated. Exercise caution if/when synthesizing into an FPGA.




