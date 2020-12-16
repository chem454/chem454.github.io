### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 389e73f0-3efd-11eb-1dae-538a2121a045
using GLM, DataFrames, Plots, Statistics, HypothesisTests

# ╔═╡ 1974d4d2-3f08-11eb-3ecd-9d73ed8fbe9c
md"""
# Determination of Quinine Concentration in Commercial Tonic Water

**Al Fischer**

December 15, 2020
"""

# ╔═╡ 3259ead2-3f08-11eb-0c8b-45d108629844
md"""
# Introduction

- What are you studying and why?
- How are you studying it and why?
- What do you expect to find?

"""

# ╔═╡ 068d4ccc-3f09-11eb-05ed-018d62fca359
md"""
# Materials and Methods

## Standard and QC Preparation

The provided 113.4 ppm quinine sulfate stock was used to prepare 5 standards by pipetting 20.00, 15.00, 10.00, and 5.00 mL of the stock into 4 separate 25.00 mL volumetic flasks, which were then brought to volume with 5% H$_2$SO$_4$ in 18.2 MΩ water.  The fifth standard consisted of the undiluted stock.


"""

# ╔═╡ 9ce9a3f6-3ef7-11eb-3f6d-2744d90b44b2
stock_conc = 113.4; # ppm

# ╔═╡ caec811e-3f3b-11eb-1c5f-ffcd06782dec
if !(@isdefined stock_conc)
	md"""Do not change the name of the variable - write you answer as `stock_conc = "..."`"""
elseif (@isdefined stock_conc) && (stock_conc !== 113.4)
	md"""
!!! danger "Oops!"
    You entered an incorrect stock concentration.
	"""
else
	md"""
	!!! correct
	Looks great!
	"""
end

# ╔═╡ 77f822f4-3ef7-11eb-27ce-7db4ee204c51
pipette_volume = [5.00, 10.00, 15.00, 20.00, 25.00]; # mL

# ╔═╡ 7670f148-3f3d-11eb-2dd7-6f119d2d754f
if !(length(pipette_volume) == 5 && pipette_volume[1] < pipette_volume[2])
		md"""
!!! warning "Not enough values or wrong order."
    You should have 5 volumes here.  I suggest you order them smallest to largest.  Don't forget to add 25.00 for your high standard!
		"""
else
		md"""
!!! correct "Looks like you're on the right track!"
		"""
end


# ╔═╡ bb6091f2-3ef7-11eb-1ebf-7f71bb8fb83d
flask_volume = 25.00; # mL

# ╔═╡ 7d6624ae-3f3e-11eb-2d24-ef6684f04e4d
if (flask_volume !== 25.00)
		md"""
!!! warning "Unexpected flask volume?"
    Did you use a flask other than 25 ml?  It's OK if so -- just make sure you have the right volume listed!  If you used more than one volume you can enter it like `flask_volume = [1, 2, 3, ...]`.
		"""
else
		md"""
!!! correct "Looks good."
		"""
end

# ╔═╡ 340904fa-3ef7-11eb-0708-75853130399e
# std_concs = C2 = C1V1 ÷ V2
# C1 = stock conc. = 113.4 ppm
# V1 = pipette_volume (varies)
# V2 = vol flask volume (25 ml)
standard_concentrations = pipette_volume * stock_conc / flask_volume # mg/L

# ╔═╡ 2772604a-3f0a-11eb-3d3a-b9e9bde5793e
md"""
A QC sample was prepared by placing 20.00 mL of quinine sulfate stock into a 25 mL volumetric flask and filling to volume with the same diluent used in the previous step.
"""

# ╔═╡ b863400a-3efa-11eb-1e2b-1dce178424f0
# qc_conc_expected = C2 = C1V1 ÷ V2
# C1 = stock conc. = 103.2 ppm
# V1 = pipette_volume (10 ml)
# V2 = vol flask volume (25 ml)
qc_expected_conc = 103.2 * 10 / 25 # mg/L

# ╔═╡ 89112f64-3f0a-11eb-34e8-fdd7b6449fef
md"""
## Sample Preparation

Dissolved CO$_2$ was removed from samples using the degas mode of an sonicator (Branson ).  Samples were run undiluted.
"""

# ╔═╡ b629f6e8-3f0a-11eb-10e6-072baf22db8e
md"""
## Analysis

Samples were run on a Vernier SpectroVis Plus using Vernier's Spectral Analysis software.  Data were collected as Fluorecence Intensity (arbitrary units) vs. Wavelength (nm).  Relevant instrument parameters are given in Table 1.

**Table 1: Instrument Parameters**

| Parameter							| Value 	|
| :-----         					| :-----:	|
| Manufacturer      				| Vernier Software & Technology |
| Model 							| SpectroVis Plus |
| Software  						| Spectral Analysis |
| Integration Time (ms) 			| 250 |
| Wavelength Smoothing (nm) 		| 1   |
| Temporal Averaging 				| 6   |
| Excitation Wavelength (nm)    	| 405 |
| Emission Wavelength (λ-max, nm) | 465 |
"""

# ╔═╡ 65d329e8-3f0b-11eb-174e-3d82834dd797
md"""
# Results and Data Analysis
"""

# ╔═╡ d5e06754-3f0c-11eb-3692-996bcf0d63a7
md"""
The package GLM will be used to conduct a linear regression.

The package DataFrames will be used to keep data organized into a data frame.

The package Plots will be used for plotting.

The package Statistics will be used for averaging data.

The package HypothesisTests will be used for grading and feedback.
"""

# ╔═╡ 5f07d80e-3f36-11eb-30d6-f35fa7cd80c6
md"""
A custom function, `calculateCI()`, can be used to calculate the 95% confidence interval on the concentration.

The confidence interval on concentration determined from a standard curve is:

$CI = t s_{C_a}$

where $t$ is the critical $t$ value (3.182 for 3 degrees of freedom at the 95% CL) and $s_{C_a}$ is the standard deviation of the concentration, given by:

$s_{C_A} = \frac {s_r} {k_a} \sqrt{\frac {1} {m} + \frac {1} {n} + \frac {\left( \overline{S}_{samp} - \overline{S}_{std} \right)^2} {(k_a)^2 \sum_{i = 1}^{n} \left( C_{std_i} - \overline{C}_{std} \right)^2}}$

where $m$ is the number of sample replicates, $n$ is the number of standards, $\bar{S}$ denotes the average signal for the samples and standards, $C$ is the concentration of the standards, and s_r is the standard deviation about the regression:

$s_r = \sqrt{\frac {\sum_{i = 1}^{n} \left( y_i - \hat{y}_i \right)^2} {n-2}}$

such that the final concentration, $C_a$, is:

$\mu_{C_a} = C_a \pm t s_{C_a}$

The function below performs these calculations.  **The output of the function is CI (i.e. $tS_{C_a}$).**
"""

# ╔═╡ 8a1c2b54-3f30-11eb-2406-274ade08f7c4
function calculateCI(model, std_conc, std_signal, new_signal, t = 3.182)
	sᵣ = sqrt((deviance(model) / dof_residual(model)));
	CI = (sᵣ/coef(model)[2]) * sqrt((1/length(predict(model))) + (1/length(new_signal)) + ((mean(new_signal) - mean(std_signal))^2 / (coef(model)[2]^2 * sum((std_conc .- mean(std_conc)).^2)))) * t
end;

# ╔═╡ 989ff84a-3f0d-11eb-0b52-23313d318245
md"""
## Collected Data
"""

# ╔═╡ f8d23ec2-3f0c-11eb-2d16-fbc667ec82d1
md"""
The sample names are:
"""

# ╔═╡ a321a7e8-3f0b-11eb-2055-4d2b08d9fe6b
Names = [
"Blank", "Blank 2", "Blank 3", "Low Standard", "Med-Low Standard", "Medium Standard", "Med-High Standard", "High Standard", "Canada Dry 1", "Canada Dry 2", "Canada Dry 3", "QC (41.28 ppm)"
];

# ╔═╡ 02a01bfe-3f0d-11eb-1499-c37984690b2d
md"""
The corresponding concentrations, in mg/L, are:
"""

# ╔═╡ b1d5ae2e-3f0b-11eb-38d1-f3cb3cdaf9e2
Concentrations = [
0, 0, 0, 22.68, 45.36, 68.04, 90.72, 113.4, missing, missing, missing, missing
];

# ╔═╡ 0d472534-3f0d-11eb-3906-f52a3fb4781b
md"""
And the corresponding signals measured in lab are, in arbitrary intensity units:
"""

# ╔═╡ c42c08ca-3f0b-11eb-2c9c-4ff0f2745d0b
Signal = [
0.000, 0.000, -0.001, 0.09, 0.268, 0.441, 0.620, 0.794, 0.147, 0.144, 0.145, 0.242
];

# ╔═╡ 1f980db6-3f0d-11eb-282e-23525edbc13e
md"""
The complete dataset is shown below with Concentration in mg/L and Signal in arbitrary units:
"""

# ╔═╡ d531e478-3f0b-11eb-1fa1-c77b408ea4d3
experiment_data = DataFrame(Name = Names, Concentration = Concentrations, Signal = Signal)

# ╔═╡ a1757e02-3f0d-11eb-0c67-59100f1c0718
md"""
## Standard Curve Determination
"""

# ╔═╡ 3113db2e-3f0d-11eb-0804-91489b86fd8e
md"""
A linear regression of the form $S_a = k_a C_a + b$ will be used to fit a standard curve, where $S_a$ is the signal from the analyte, $k_a$ is the senstivity coefficient, $C_a$ is the concentration of the analyte, and is the calculated intercept.

The parameters from this fit are:
"""

# ╔═╡ f616be6a-3efd-11eb-3aad-9d01d81c41a6
calcurve = lm(@formula(Signal ~ Concentration), experiment_data[4:8, :])

# ╔═╡ f8a689c0-3f0b-11eb-3175-c352ae6e0164
kₐ = GLM.coef(calcurve)[2]

# ╔═╡ 522f19dc-3f0c-11eb-3d8f-41ba04657fbd
b = GLM.coef(calcurve)[1]

# ╔═╡ 768be8f4-3f03-11eb-0724-373cca7ac21f
R² = round(r2(calcurve), sigdigits=5)

# ╔═╡ d3913554-3f0d-11eb-3f0a-690a3ea1c807
md"""
The R² value is > 0.9999, which is considered passing for these purposes.
"""

# ╔═╡ 94d3f8bc-3efc-11eb-1024-890804a76041
begin
	plotly();
	scatter(experiment_data[4:8, "Concentration"], experiment_data[4:8, "Signal"], grid = false, label = "Standard Data");
	xlabel!("[Quinine] (mg/L)"); ylabel!("Signal (arbitrary)");
	xlims!(0, 120); ylims!(0, 1);
	Plots.abline!(kₐ, b, label = "$(round(b, sigdigits = 4)) + $(round(kₐ, sigdigits = 4)) x,  R²=$(round(r2(calcurve), sigdigits=5))", color = 1);
end

# ╔═╡ 0766d24e-3f0e-11eb-1775-cf2d934c600f
md"""
# Determination of QC Concentration

The concentration of the QC can be determined by measuring $S_a$ for the QC, plugging the value into the `calcurve` fit, and then solving for $C_a$:


$C_a = \frac{S_a - b}{k_a}$
"""

# ╔═╡ 5c825d20-3f0e-11eb-3d9a-0b3468066bb4
qc_measured_conc = round((experiment_data[12, "Signal"] - b) / kₐ, sigdigits = 3)
# this gives concentration in mg/L

# ╔═╡ 53dc6110-3f0f-11eb-0cfa-5d8e19effc0d
md"""
The measured QC concentration of $(qc_measured_conc) mg/L is clost to the true QC concentration of $(qc_expected_conc) mg/L.  This equates to a $(round((qc_expected_conc - qc_measured_conc)/qc_expected_conc, sigdigits = 3)*100) % difference, which is <5% and therefore considered passing.
"""

# ╔═╡ 37c0a954-3f10-11eb-1d00-f5de36810dbf
md"""
# Determination of Sample Concentration

Three replicates of the sample were measured.  These will be averaged and used to determine the average concentration with a 95% confidence interval.
"""

# ╔═╡ 6063b204-3f10-11eb-3330-436e705850bc
md"""
### Average Sample Replicates
"""

# ╔═╡ 6d0ec564-3f10-11eb-3ca8-61a8a9ab64fc
mean_sample_signal = mean(experiment_data[9:11, "Signal"])

# ╔═╡ b0418cf4-3f10-11eb-012e-fb8712e07e99
md"""
### Calculate Average Concentration

The sample concentration can be calculated in the same way as the QC, described above.  This yields, in mg/L:
"""

# ╔═╡ c3495548-3f10-11eb-2b99-a51d8164f4fe
mean_sample_conc = (mean_sample_signal - b) / kₐ
# this gives concentration in mg/L

# ╔═╡ 219ecb70-3f37-11eb-2b2f-1b5fc2ce8970
md"""
### Determine the 95% CI
"""

# ╔═╡ 484e07b8-3f37-11eb-2154-cb829f097ffb
md"""
The 95% CI is, in mg/L:
"""

# ╔═╡ 012325ce-3f31-11eb-1f9f-059a0dc7e06d
CI = calculateCI(calcurve, experiment_data[4:8, "Concentration"], experiment_data[4:8, "Signal"], experiment_data[9:11, "Signal"])

# ╔═╡ 68f46214-3f37-11eb-1903-a9ae1fa695f9
md"""
Thus, **the concentration of the Canada Dry tonic water is $(round(mean_sample_conc, sigdigits = 3)) ± $(round(CI, sigdigits = 3)) mg/L.**  This is 2-3 times lower that similar studies have found for other brands of tonic water, but it is still within the expected range since there is no defined concentration for quinine in commercial tonic water.
"""

# ╔═╡ d1d71eb8-3fce-11eb-1604-d9cebcbdc409
md"""
### Limits of Detection and Quantitation

The limit of detection (LOD) and limit of quantitation (LOQ) are given by:

$LOD = \frac{3 s_{blank}}{k_a}$

and

$LOQ = \frac{10 s_{blank}}{k_a}$
"""

# ╔═╡ 22146536-3fcf-11eb-32ad-e5434a64bce0
s_blank = std(experiment_data[1:3, "Signal"]);

# ╔═╡ 43d724f4-3fcf-11eb-0a65-1df7bcc52ccc
LOD = (3 * s_blank) / GLM.coef(calcurve)[2] # mg/L

# ╔═╡ 57af3824-3fcf-11eb-21aa-d17ad5468ca3
LOQ = (10 * s_blank) / GLM.coef(calcurve)[2] # mg/L

# ╔═╡ 5dccb952-3fcf-11eb-13dd-69627d363c0e
md"""
Thus, the **limit of quantitation is $(round(LOQ, sigdigits = 3)) mg/L**.  The sample concentration is well above this and I can confidently say the sample was measured within the quantifiable range of the instrument.
"""

# ╔═╡ bc1db886-3f38-11eb-2d42-1bd1196107dc
md"""
# Conlcusions

Fill in your conclusions here.

(Click the eyeball icon to the left of "Conclusions" to edit!)

"""

# ╔═╡ c7633808-3f38-11eb-213f-49d634169b1d
md"""
# References

1. Lawson-Wood, Kathryn, and Kieran Evans. “Determination of Quinine in Tonic Water Using Fluorescence Spectroscopy,” (Application Note: Fluorescence Spectroscopy) [Link](https://www.perkinelmer.com/lab-solutions/resources/docs/APP_Quinine_in_Tonic_Water_014133_01.pdf)

"""

# ╔═╡ Cell order:
# ╟─1974d4d2-3f08-11eb-3ecd-9d73ed8fbe9c
# ╟─3259ead2-3f08-11eb-0c8b-45d108629844
# ╟─068d4ccc-3f09-11eb-05ed-018d62fca359
# ╠═9ce9a3f6-3ef7-11eb-3f6d-2744d90b44b2
# ╟─caec811e-3f3b-11eb-1c5f-ffcd06782dec
# ╠═77f822f4-3ef7-11eb-27ce-7db4ee204c51
# ╟─7670f148-3f3d-11eb-2dd7-6f119d2d754f
# ╠═bb6091f2-3ef7-11eb-1ebf-7f71bb8fb83d
# ╟─7d6624ae-3f3e-11eb-2d24-ef6684f04e4d
# ╠═340904fa-3ef7-11eb-0708-75853130399e
# ╟─2772604a-3f0a-11eb-3d3a-b9e9bde5793e
# ╠═b863400a-3efa-11eb-1e2b-1dce178424f0
# ╟─89112f64-3f0a-11eb-34e8-fdd7b6449fef
# ╟─b629f6e8-3f0a-11eb-10e6-072baf22db8e
# ╟─65d329e8-3f0b-11eb-174e-3d82834dd797
# ╟─d5e06754-3f0c-11eb-3692-996bcf0d63a7
# ╠═389e73f0-3efd-11eb-1dae-538a2121a045
# ╟─5f07d80e-3f36-11eb-30d6-f35fa7cd80c6
# ╠═8a1c2b54-3f30-11eb-2406-274ade08f7c4
# ╟─989ff84a-3f0d-11eb-0b52-23313d318245
# ╟─f8d23ec2-3f0c-11eb-2d16-fbc667ec82d1
# ╠═a321a7e8-3f0b-11eb-2055-4d2b08d9fe6b
# ╟─02a01bfe-3f0d-11eb-1499-c37984690b2d
# ╠═b1d5ae2e-3f0b-11eb-38d1-f3cb3cdaf9e2
# ╟─0d472534-3f0d-11eb-3906-f52a3fb4781b
# ╠═c42c08ca-3f0b-11eb-2c9c-4ff0f2745d0b
# ╟─1f980db6-3f0d-11eb-282e-23525edbc13e
# ╟─d531e478-3f0b-11eb-1fa1-c77b408ea4d3
# ╟─a1757e02-3f0d-11eb-0c67-59100f1c0718
# ╟─3113db2e-3f0d-11eb-0804-91489b86fd8e
# ╠═f616be6a-3efd-11eb-3aad-9d01d81c41a6
# ╠═f8a689c0-3f0b-11eb-3175-c352ae6e0164
# ╟─522f19dc-3f0c-11eb-3d8f-41ba04657fbd
# ╟─768be8f4-3f03-11eb-0724-373cca7ac21f
# ╟─d3913554-3f0d-11eb-3f0a-690a3ea1c807
# ╠═94d3f8bc-3efc-11eb-1024-890804a76041
# ╟─0766d24e-3f0e-11eb-1775-cf2d934c600f
# ╠═5c825d20-3f0e-11eb-3d9a-0b3468066bb4
# ╟─53dc6110-3f0f-11eb-0cfa-5d8e19effc0d
# ╟─37c0a954-3f10-11eb-1d00-f5de36810dbf
# ╟─6063b204-3f10-11eb-3330-436e705850bc
# ╠═6d0ec564-3f10-11eb-3ca8-61a8a9ab64fc
# ╟─b0418cf4-3f10-11eb-012e-fb8712e07e99
# ╠═c3495548-3f10-11eb-2b99-a51d8164f4fe
# ╟─219ecb70-3f37-11eb-2b2f-1b5fc2ce8970
# ╟─484e07b8-3f37-11eb-2154-cb829f097ffb
# ╠═012325ce-3f31-11eb-1f9f-059a0dc7e06d
# ╟─68f46214-3f37-11eb-1903-a9ae1fa695f9
# ╟─d1d71eb8-3fce-11eb-1604-d9cebcbdc409
# ╠═22146536-3fcf-11eb-32ad-e5434a64bce0
# ╠═43d724f4-3fcf-11eb-0a65-1df7bcc52ccc
# ╠═57af3824-3fcf-11eb-21aa-d17ad5468ca3
# ╟─5dccb952-3fcf-11eb-13dd-69627d363c0e
# ╟─bc1db886-3f38-11eb-2d42-1bd1196107dc
# ╟─c7633808-3f38-11eb-213f-49d634169b1d
