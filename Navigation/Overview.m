%% DC Circuit Analysis
%
% <html>
% <span style="font-family:Arial">
% <span style="font-size:12pt">
% <h2> Information </h2>
% This curriculum module teaches DC circuit analysis using interactive 
% <a href="https://www.mathworks.com/products/matlab/live-editor.html">live scripts</a>
% and <a href="https://www.mathworks.com/products/simscape.html">Simscape&trade;</a> models. 
% Six essential topics, listed in the table below, are covered.
% There are two components for each topic: an introduction and a virtual lab. 
% The introduction explains the technique and offers opportunities to develop intuition using simulation. 
% In the labs, you can apply your knowledge to analyze circuits, take measurements, and design circuits to meet requirements. 
% Learning goals for each topic are described below.
% <br>
% <br>
% The lab solutions are available upon instructor request. If you
% would like to request solutions, find an issue,
% or have a suggestion, email the MathWorks online teaching team at 
% onlineteaching@mathworks.com
% <br>
% <br>
% <h2> Getting Started </h2>
% <ol>
% <li>
% Make sure that you have all the required products (listed below)
% installed. If you are missing a product, add it using the 
% <a href="https://www.mathworks.com/products/matlab/add-on-explorer.html">
% Add-On Explorer.</a> To install an add-on, go to the <b>Home</b>
% tab and select <img src="../Images/add-ons.png" style="margin:0px;" height=12> <b> Add-Ons > Get Add-Ons</b>.
% </li>
% <li>
% Watch the 2-minute introductory videos linked below to familiarize yourself with Simscape and the virtual equipment. 
% <ul style="margin-bottom:0px">
%   <li><a href="https://user-images.githubusercontent.com/81383420/145588577-d98c4563-b41b-447c-acbb-afe0f6d70da5.mp4">How to simulate a circuit in Simscape</a></li>
%   <li><a href="https://user-images.githubusercontent.com/81383420/145589989-f7ae4a32-cab3-405d-b7e8-476e34d697b5.mp4">How to use the virtual multimeter</a></li>
%   <li><a href="https://user-images.githubusercontent.com/81383420/145592175-ed68b140-f7d7-4355-85d4-a47feb8a82ec.mp4">How to use the virtual oscilloscope</a></li>
% </ul>
% </li>
% <li>
% Get started with each topic by clicking the link in the table below to access the
% interactive example. 
% </li>
% <li>
% Once you have finished learning the background
% material in the interactive example, complete the corresponding virtual lab. 
% </li>
% </ol>
% <h2> Products </h2>
% MATLAB, Simulink&reg;, Simscape, Simscape Electrical&trade;, DSP System Toolbox&trade;
% <br>
% <br>
% <h2> Modules </h2>
% <table border=1 style="margin-left:20px; cellpadding:15px;">
% <tr>
%   <th>Examples and Virtual Labs</th>
%   <th>Learning Goals</th>
%   <th>Models</th>
% </tr>
% <tr>
%   <td>
%       <b>Mesh Analysis</b>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Interactive example: <a href="matlab:edit MeshAnalysis.mlx;"><code>MeshAnalysis.mlx</code></a></li>
%           <li>Virtual lab: <a href="matlab:edit MeshAnalysisLab.mlx;"><code>MeshAnalysisLab.mlx</code></a></li>
%       </ul>
%       <img src = "../Images/meshes.png" height=100 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Use mesh analysis to compute currents through a linear circuit.</li>
%           <li>Solve the matrix form of circuit equations in MATLAB&reg;.</li>
%       	<li>Model and analyze linear circuits in Simscape.</li>
%       </ul>
%   </td>
%   <td>
%       <a href="matlab:MeshAnalysisExample;"><code>MeshAnalysisExample.slx</code><br></a>
%       <a href="matlab:MeshAnalysisCircuit;"><code>MeshAnalysisCircuit.slx</code><br></a>
%   </td>
% </tr>
% </tr>
% <tr>
%   <td>
%       <b>Nodal Analysis</b>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Interactive example: <a href="matlab:edit NodalAnalysis.mlx;"><code>NodalAnalysis.mlx</code></a></li>
%           <li>Virtual lab: <a href="matlab:edit NodalAnalysisLab.mlx;"><code>NodalAnalysisLab.mlx</code></a></li>
%       </ul>
%       <img src = "../Images/nodes.png" height=100 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Use nodal analysis to compute voltages.</li>
%           <li>Solve the matrix form of circuit equations in MATLAB.</li>
%       	<li>Model and analyze linear circuits in Simscape.</li>
%       </ul>
%   </td>
%   <td>
%       <a href="matlab:NodalAnalysisExample;"><code>NodalAnalysisExample.slx</code><br></a>
%       <a href="matlab:NodalAnalysisCircuit;"><code>NodalAnalysisCircuit.slx</code><br></a>
%   </td>
% </tr>
% <tr>
%   <td>
%       <b>Thevenin and Norton Equivalent Circuits</b>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Interactive example: <a href="matlab:edit TheveninNorton.mlx;"><code>TheveninNorton.mlx</code></a></li>
%           <li>Virtual lab: <a href="matlab:edit TheveninNortonLab.mlx;"><code>TheveninNortonLab.mlx</code></a></li>
%       </ul>
%       <img src = "../Images/TheveninNorton.png" height=75 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Explain Thevenin and Norton equivalent circuits.</li>
%           <li>Solve for Thevenin and Norton equivalents.</li>
%           <li>Compare circuits to their Thevenin and Norton equivalents.</li>
%       </ul>
%   </td>
%   <td>
%       <a href="matlab:EquivalentCircuitDemo;"><code>EquivalentCircuitDemo.slx</code><br></a>
%       <a href="matlab:TheveninNortonCircuit;"><code>TheveninNortonCircuit.slx</code><br></a>
%   </td>
% </tr>
% <tr>
%   <td>
%       <b>RC Circuits</b>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Interactive example: <a href="matlab:edit RCCircuits.mlx;"><code>RCCircuits.mlx</code></a></li>
%           <li>Virtual lab: <a href="matlab:edit RCCircuitsLab.mlx;"><code>RCCircuitsLab.mlx</code></a></li>
%       </ul>
%       <img src = "../Images/rccircuit.png" height=100 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Simulate charging and discharging RC circuits.</li>
%           <li>Plot solutions of RC circuit differential equations.</li>
%       	<li>Measure the time constant of an RC circuit.</li>
%       </ul>
%   </td>
%   <td>
%       <a href="matlab:RCCircuit;"><code>RCCircuit.slx</code><br></a>
%       <a href="matlab:RCCircuitTau;"><code>RCCircuitTau.slx</code><br></a>
%   </td>
% </tr>
% <tr>
%   <td>
%       <b>RLC Circuits</b>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Interactive example: <a href="matlab:edit RLCCircuits.mlx;"><code>RLCCircuits.mlx</code></a></li>
%           <li>Virtual lab: <a href="matlab:edit RLCCircuitsLab.mlx;"><code>RLCCircuitsLab.mlx</code></a></li>
%       </ul>
%       <img src = "../Images/rlccircuit.png" height=100 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Compare the response of first and second order circuits.</li>
%           <li>Analyze a second order RLC circuit differential equation.</li>
%       	<li>Solve for the natural frequency and damping in an RLC circuit.</li>
%       	<li>Compare underdamped, overdamped, and critically damped circuits.</li>
%       </ul>
%   </td>
%   <td>
%       <a href="matlab:RCRLCircuits;"><code>RCRLCircuits.slx</code><br></a>
%       <a href="matlab:RLCCircuit;"><code>RLCCircuit.slx</code><br></a>
%       <a href="matlab:VirtualOscilloscope;"><code>VirtualOscilloscope.slx</code><br></a>
%   </td>
% </tr>
% <tr>
%   <td>
%       <b>Op Amps</b>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Interactive example <a href="matlab:edit OpAmps.mlx;"><code>OpAmps.mlx</code></a></li>
%           <li>Virtual lab: <a href="matlab:edit OpAmpLab.mlx;"><code>OpAmpLab.mlx</code></a></li>
%       </ul>
%       <img src = "../Images/opamps.png" height=75 style="margin-top:5px; margin-bottom:0px"></a>
%   </td>
%   <td>
%   	<ul style="margin-top:5px; margin-bottom:10px">
%           <li>Describe the open-loop behavior of an op amp.</li>
%           <li>Compare ideal and non-ideal op amp behavior.</li>
%           <li>Analyze negative feedback op amp circuits.</li>
%       	<li>Design circuits using combinations of basic op amp circuits.</li>
%       </ul>
%   </td>
%   <td>
%       <a href="matlab:OpAmpOpenLoop;"><code>OpAmpOpenLoop.slx</code><br></a>
%       <a href="matlab:OpAmpFeedback;"><code>OpAmpFeedback.slx</code><br></a>
%       <a href="matlab:OpAmpNoninverting;"><code>OpAmpNoninverting.slx</code><br></a>
%       <a href="matlab:OpAmpCircuits;"><code>OpAmpCircuits.slx</code><br></a>
%       <a href="matlab:OpAmpLab;"><code>OpAmpLab.slx</code><br></a>
%   </td>
% </tr>
% </table>
% <br>
% </span>
% </span>
% </html>
% 
% Copyright 2021-2022 The MathWorks(TM), Inc.
