
<a name="T_DEF03274"></a>
# <span style="color:rgb(213,80,0)">DC Circuit Analysis</span>
<a name="H_053613DF"></a>

[![View on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/103375-dc-circuit-analysis) or [![Open in MATLAB Online](https://www.mathworks.com/images/responsive/global/open-in-matlab-online.svg)](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/DC-Circuit-Analysis&project=DCCircuitAnalysis.prj)

**Curriculum Module**

_Created with R2021b. Compatible with R2021b and later releases._

# Information

This curriculum module contains interactive [MATLAB® live scripts](https://www.mathworks.com/products/matlab/live-editor.html) and [Simscape™](https://www.mathworks.com/products/simscape.html) models that teaches the fundamental concepts of DC circuits.

<a name="H_F00D98E4"></a>
## Background

You can use these live scripts as demonstrations in lectures, class activities, or interactive assignments outside class. DC Circuit Analysis covers topics such as mesh analysis, nodal analysis, thevenin circuits, RL circuits, RLC circuits, and op amps. It also includes an application of a virtual oscilloscope to perform measurements of the variety of DC circuits.


The instructions inside the live scripts will guide you through the exercises and activities. Get started with each live script by running it one section at a time. To stop running the script or a section midway (for example, when an animation is in progress), use the <img src="Images/image_0.png" width="19" alt="image_0.png"> Stop button in the **RUN** section of the **Live Editor** tab in the MATLAB Toolstrip.

## Contact Us

Solutions are available upon instructor request. Contact the [MathWorks teaching resources team](mailto:onlineteaching@mathworks.com) if you would like to request solutions, provide feedback, or if you have a question.

<a name="H_30BC7141"></a>
## Prerequisites

This module assumes knowledge of basic ciruit theory and standard electrical circuit notation. There is minimal MATLAB and Simscape knowledge required for these scripts, but you could use [MATLAB Onramp](https://matlabacademy.mathworks.com/details/matlab-onramp/gettingstarted) and [Circuit Simulation Onramp](https://matlabacademy.mathworks.com/details/circuit-simulation-onramp/circuits) as a resource to acquire familiarity with MATLAB syntax, live scripts, and models.

<a name="H_330E72C3"></a>
## Getting Started
### Accessing the Module
### **On MATLAB Online:**

Use the [<img src="Images/image_1.png" width="136" alt="image_1.png">](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/DC-Circuit-Analysis&project=DCCircuitAnalysis.prj) link to download the module. You will be prompted to log in or create a MathWorks account. The project will be loaded, and you will see an app with several navigation options to get you started.

### **On Desktop:**

Download or clone this repository. Open MATLAB, navigate to the folder containing these scripts and double-click on [DCCircuitAnalysis.prj](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/DC-Circuit-Analysis&project=DCCircuitAnalysis.prj). It will add the appropriate files to your MATLAB path and open an app that asks you where you would like to start. 


Ensure you have all the required products ([listed below](#H_E850B4FF)) installed. If you need to include a product, add it using the Add-On Explorer. To install an add-on, go to the **Home** tab and select  <img src="Images/image_2.png" width="16" alt="image_2.png"> **Add-Ons** > **Get Add-Ons**. 

<a name="H_E850B4FF"></a>
## Products

 *MATLAB* is used throughout. Tools from *Simulink®, Simscape, Simscape Electrical™, and DSP System Toolbox*™ are used frequently as well.

<a name="H_E8C62B23"></a>
# Scripts

 *If you are viewing this in a version of MATLAB prior to R2023b, you can view the learning outcomes for each script* [*here*](https://www.mathworks.com/matlabcentral/fileexchange/103375-dc-circuit-analysis)

<a name="H_BC8955C0"></a>
## [**MeshAnalysis.mlx**](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/DC-Circuit-Analysis&project=DCCircuitAnalysis.prj&file=MeshAnalysis.mlx)
|  | **In this script, students will...** | **Academic disciplines**  |
| :-- | :-- | :-- |
| <img src="Images/image_3.png" width="171" alt="image_3.png"> | <br>• Use mesh analysis to compute currents through a linear circuit. <br>• Solve the matrix form of circuit equations in MATLAB. <br>• Model and analyze linear circuits in Simscape. | • Electrical Engineering  |

<a name="H_17056DF7"></a>
## [**NodalAnalysis.mlx**](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/DC-Circuit-Analysis&project=DCCircuitAnalysis.prj&file=NodalAnalysis.mlx)
|  | **In this script, students will...** | **Academic disciplines**  |
| :-- | :-- | :-- |
| <img src="Images/image_4.png" width="171" alt="image_4.png"> |  <br>• Use nodal analysis to compute voltages. <br>• Solve the matrix form of circuit equations in MATLAB. <br>• Model and analyze linear circuits in Simscape. | • Electrical Engineering  |

<a name="H_93FB3755"></a>
## [**TheveninNorton.mlx**](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/DC-Circuit-Analysis&project=DCCircuitAnalysis.prj&file=TheveninNorton.mlx)
|  | **In this script, students will...** | **Academic disciplines**  |
| :-- | :-- | :-- |
| <img src="Images/image_5.png" width="171" alt="image_5.png"> |  <br>• Explain Thevenin and Norton equivalent circuits. <br>• Solve for Thevenin and Norton equivalents. <br>• Compare circuits to their Thevenin and Norton equivalents. | • Electrical Engineering  |

<a name="H_D4F9A4D1"></a>
## [**RCCircuits.mlx**](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/DC-Circuit-Analysis&project=DCCircuitAnalysis.prj&file=RCCircuits.mlx)
|  | **In this script, students will...** | **Academic disciplines**  |
| :-- | :-- | :-- |
| <img src="Images/image_6.png" width="171" alt="image_6.png"> |  <br>• Simulate charging and discharging RC circuits. <br>• Plot solutions of RC circuit differential equations. <br>• Measure the time constant of an RC circuit. | • Electrical Engineering  |

<a name="H_1E0A6441"></a>
## [**RLCCircuits.mlx**](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/DC-Circuit-Analysis&project=DCCircuitAnalysis.prj&file=RLCCircuits.mlx)
|  | **In this script, students will...** | **Academic disciplines**  |
| :-- | :-- | :-- |
| <img src="Images/image_7.png" width="171" alt="image_7.png"> |  <br>• Compare the response of first and second order circuits. <br>• Analyze a second order RLC circuit differential equation. <br>• Solve for the natural frequency and damping in an RLC circuit. <br>• Compare underdamped, overdamped, and critically damped circuits. | • Electrical Engineering  |

<a name="H_E550DF08"></a>
## [**OpAmps.mlx**](https://matlab.mathworks.com/open/github/v1?repo=MathWorks-Teaching-Resources/DC-Circuit-Analysis&project=DCCircuitAnalysis.prj&file=OpAmps.mlx)
|  | **In this script, students will...** | **Academic disciplines**  |
| :-- | :-- | :-- |
| <img src="Images/image_8.png" width="171" alt="image_8.png"> |  <br>• Describe the open-loop behavior of an op amp. <br>• Compare ideal and non-ideal op amp behavior. <br>• Analyze negative feedback op amp circuits. <br>• Design circuits using combinations of basic op amp circuits. | • Electrical Engineering  |

# How-To Videos

These short videos demonstrate some of the basic techniques used to simulate and measure circuits in the module.

-  [Building a Circuit](https://github.com/MathWorks-Teaching-Resources/DC-Circuit-Analysis#building-a-circuit) 
-  [Analyzing with a Multimeter](https://github.com/MathWorks-Teaching-Resources/DC-Circuit-Analysis#analyzing-with-a-multimeter) 
-  [Demonstrating Oscilloscope Operation](https://github.com/MathWorks-Teaching-Resources/DC-Circuit-Analysis#demonstrating-oscilloscope-operation) 

<a name="H_F61733D7"></a>
# License

The license for this module is available in the [LICENSE.md](https://github.com/MathWorks-Teaching-Resources/DC-Circuit-Analysis/blob/release/LICENSE.md).

<a name="H_3DE08377"></a>
# Related Courseware Modules

Feel free to explore our other [modular courseware content](https://www.mathworks.com/matlabcentral/fileexchange/?q=tag%3A%22courseware+module%22&sort=downloads_desc_30d).

# Educator Resources
-  [Educator Page](https://www.mathworks.com/academia/educators.html) 

<a name="H_0FA5DA18"></a>
# Contribute 

Looking for more? Find an issue? Have a suggestion? Please contact the [MathWorks teaching resources team](mailto:%20onlineteaching@mathworks.com). If you want to contribute directly to this project, you can find information about how to do so in the [CONTRIBUTING.md](https://github.com/MathWorks-Teaching-Resources/DC-Circuit-Analysis/blob/release/CONTRIBUTING.md) page on GitHub.


 *©* Copyright 2023 The MathWorks™, Inc



