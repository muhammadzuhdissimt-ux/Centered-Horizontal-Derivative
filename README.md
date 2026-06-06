README
Circular Horizontal Gradient (CHG) Method

This repository contains MATLAB codes and datasets used to compute the Circular Horizontal Gradient (CHG), Total Horizontal Gradient (THG), and Signal-to-Noise Ratio (SNR) for both synthetic models and real gravity data from Lombok Island including Samalas Volcano (Lombok_Final2.mat) and Tambora Volcano (Tambora_Final2.mat), Indonesia. Tambora_Final2.mat has been regridded to a grid spacing that is twice as large, reducing the dataset size and making it suitable for upload to this site.

Software Requirements
MATLAB R2020a or later
No additional toolbox is required unless otherwise stated in the source code.
Repository Contents
1. Synthetic Models
cyrcle.m

Constructs Synthetic Model 1 (circular body).

Input

No input required.

Output

g : gravity anomaly matrix.

Ring_Beam.m

Constructs Synthetic Model 2 (ring-shaped structure).

Input

No input required.

Output

g : gravity anomaly matrix.

Horst.m

Constructs Synthetic Model 3 (horst structure).

Input

No input required.

Output

g : gravity anomaly matrix.


2. Determination of the Optimum Center
Optimum_center.m

Determines the optimum center coordinates used in CHG computation.

Input

g : gravity anomaly matrix

Procedure

Run the program.
Click and drag to select the area of interest.
Double-click to confirm the selection.

Output

xc : optimum center x-coordinate
yc : optimum center y-coordinate

The values of xc and yc should be assigned to xo and yo in CHG_Final.m.

3. Circular Horizontal Gradient Calculation
CHG_Final.m

Computes THG and CHG attributes.

Input

g : gravity anomaly matrix

Output

THG : Total Horizontal Gradient
CHG_rad_n : normalized radial Circular Horizontal Gradient
CHG_tan_n : normalized tangential Circular Horizontal Gradient

Before running this program, replace:

xo = ...
yo = ...

with the optimum center coordinates obtained from Optimum_center.m.

4. CHG Mixing Process
MixCHG_THG2.m

Combines THG and CHG attributes to generate directional enhancement maps.

Input

CHG_rad_n
CHG_tan_n

Output

Radial components:

Mr1
Mr2
Mr3
Mr4

Tangential components:

Mt1
Mt2
Mt3
Mt4

5. Signal-to-Noise Ratio Analysis
SNR_rad.m

Computes SNR statistics for radial CHG results.

Input

Assign one radial component to g:

g = Mr1;

Repeat for:

g = Mr2;
g = Mr3;
g = Mr4;

Output

mu : mean value
sigma : standard deviation
length(signal) : number of signal samples
length(noise) : number of noise samples
RMS_signal : root-mean-square of signal
STD_noise : standard deviation of noise
SNR : signal-to-noise ratio
SNR_dB : signal-to-noise ratio in decibels

SNR_tan.m

Computes SNR statistics for tangential CHG results.

Input

Assign one tangential component to g:

g = Mt1;

Repeat for:

g = Mt2;
g = Mt3;
g = Mt4;

Output

mu : mean value
sigma : standard deviation
length(signal) : number of signal samples
length(noise) : number of noise samples
RMS_signal : root-mean-square of signal
STD_noise : standard deviation of noise
SNR : signal-to-noise ratio
SNR_dB : signal-to-noise ratio in decibels



Workflow


Run one of the synthetic model generators or your own gravity data:
cyrcle.m
Ring_Beam.m
Horst.m
Run:
Optimum_center.m
Obtain:
xc
yc
Replace xo and yo in:
CHG_Final.m
Run:
CHG_Final.m
Run:
MixCHG_THG2.m
Evaluate radial SNR:
SNR_rad.m
Evaluate tangential SNR:
SNR_tan.m

Citation

If you use this code in your research, please cite the corresponding publication describing the Circular Horizontal Gradient (CHG) method.
