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

The provided 113.4 ppm quinine sulfate stock was used to prepare 5 standards by pipetting 20.00, 15.00, 10.00, and 5.00 mL of the stock into 4 separate 25.00 mL volumetric flasks, which were then brought to volume with 5% H$_2$SO$_4$ in 18.2 MΩ water.  The fifth standard consisted of the undiluted stock.


"""

# ╔═╡ 9ce9a3f6-3ef7-11eb-3f6d-2744d90b44b2
stock_conc = 103.5; # ppm

# ╔═╡ caec811e-3f3b-11eb-1c5f-ffcd06782dec
if !(@isdefined stock_conc)
	md"""Do not change the name of the variable - write you answer as `stock_conc = "..."`"""
elseif ((@isdefined stock_conc) && (stock_conc !== 103.5))
		md"""
	!!! correct
	Looks great!
	"""
elseif ((@isdefined stock_conc) && (stock_conc !== 103.2))
		md"""
	!!! correct
	Looks great!
	"""
else

	md"""
!!! danger "Oops!"
    You entered an incorrect stock concentration.
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
!!! correct
    Looks like you entered the pipette volumes correctly!
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

# ╔═╡ ebcc4646-3f3e-11eb-3945-7d9941558608
let
	result = standard_concentrations
	if (result == pipette_volume * stock_conc / flask_volume)
		md"""
!!! correct
    Well done!
		"""
	else
		md"""
!!! warning "Incorrect"
    I got different values...
		"""
	end
end

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

# ╔═╡ 3b9eeba0-3f40-11eb-1aa1-ad7a459bec4b
if (nrow(experiment_data) == 12) && (ncol(experiment_data) == 3)
		md"""
!!! correct
    Your data frame has the right dimensions (12 x 3).  Make sure the order is blanks (3), low ⇒ high standard, sample (3), and QC!  You should have concentration in column 2 and singal in column 3.
		"""
	else
		md"""
!!! warning 
    I'm expecting a data frame with 12 rows and 3 columns.  The order should be blanks (3), low ⇒ high standard, sample (3), and QC.   You should have concentration in column 2 and singal in column 3.
		"""
end

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

# ╔═╡ cd70ece4-3f41-11eb-0be2-6b3a14d9cafc
let
stddat = experiment_data[contains.(experiment_data[!, 1], "St") .== 1, :];
	conc = sort(stddat[!, 2]);
	sig  = sort(stddat[!, 3]);
	stdfit = lm(@formula(Signal ~ Concentration), DataFrame(Signal = sig, Concentration = conc));
	if coef(calcurve)[2] == coef(stdfit)[2] && coef(calcurve)[1] == coef(stdfit)[1]
		
		md"""
!!! correct
    Your calibration model is correct!  Extract the relevant parameters below.
		"""
	else
		md"""
!!! warning 
    Your calibration model appears incorrect.  Double check the previous steps.
		"""
	end
end

# ╔═╡ 4cb4c208-3f44-11eb-3a82-556f84c6666e
md"""
The sensitivity coefficient is:
"""

# ╔═╡ 01f67d76-3fc9-11eb-0416-f737e9eaf708


# ╔═╡ f8a689c0-3f0b-11eb-3175-c352ae6e0164
kₐ = GLM.coef(calcurve)[2]

# ╔═╡ 5a72866e-3f44-11eb-297f-875aa3403e0a
md"""
The intercept is:
"""

# ╔═╡ 522f19dc-3f0c-11eb-3d8f-41ba04657fbd
b = GLM.coef(calcurve)[1]

# ╔═╡ 5fe263c4-3f44-11eb-1d5c-b94368f3090c
md"""
The R² value is:
"""

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
qc_measured_conc = (experiment_data[12, "Signal"] - b) / kₐ
# this gives concentration in mg/L

# ╔═╡ 53dc6110-3f0f-11eb-0cfa-5d8e19effc0d
md"""
The measured QC concentration of $(round(qc_measured_conc, sigdigits = 3)) mg/L is clost to the true QC concentration of $(qc_expected_conc) mg/L.  This equates to a $(round((qc_expected_conc - qc_measured_conc)/qc_expected_conc*100, sigdigits = 3)) % difference, which is <5% and therefore considered passing.
"""

# ╔═╡ df892290-3f44-11eb-198f-7192ac3bcf9c
let
	qcmeas = (experiment_data[12, 3] - coef(calcurve)[1]) / coef(calcurve)[2]
	
	if qcmeas == qc_measured_conc
		
		md"""
!!! correct
    You calculated your QC concentration correctly!
		"""
	else
		md"""
!!! warning 
    Your QC concentration appears incorrect.  Double check the previous steps.
		"""
	end
end

# ╔═╡ 37c0a954-3f10-11eb-1d00-f5de36810dbf
md"""
# Determination of Sample Concentration

Three replicates of the sample were measured.  These will be averaged and used to determine the average concentration with a 95% confidence interval.
"""

# ╔═╡ 6d0ec564-3f10-11eb-3ca8-61a8a9ab64fc
mean_sample_signal = mean(experiment_data[9:11, "Signal"])

# ╔═╡ b0418cf4-3f10-11eb-012e-fb8712e07e99
md"""
The sample concentration can be calculated in the same way as the QC, described above.  This yields, in mg/L:
"""

# ╔═╡ c3495548-3f10-11eb-2b99-a51d8164f4fe
mean_sample_conc = (mean_sample_signal - b) / kₐ
# this gives concentration in mg/L

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
# ╟─340904fa-3ef7-11eb-0708-75853130399e
# ╟─ebcc4646-3f3e-11eb-3945-7d9941558608
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
# ╠═d531e478-3f0b-11eb-1fa1-c77b408ea4d3
# ╟─3b9eeba0-3f40-11eb-1aa1-ad7a459bec4b
# ╟─a1757e02-3f0d-11eb-0c67-59100f1c0718
# ╟─3113db2e-3f0d-11eb-0804-91489b86fd8e
# ╠═f616be6a-3efd-11eb-3aad-9d01d81c41a6
# ╟─cd70ece4-3f41-11eb-0be2-6b3a14d9cafc
# ╟─4cb4c208-3f44-11eb-3a82-556f84c6666e
# ╠═01f67d76-3fc9-11eb-0416-f737e9eaf708
# ╠═f8a689c0-3f0b-11eb-3175-c352ae6e0164
# ╟─5a72866e-3f44-11eb-297f-875aa3403e0a
# ╟─522f19dc-3f0c-11eb-3d8f-41ba04657fbd
# ╟─5fe263c4-3f44-11eb-1d5c-b94368f3090c
# ╠═768be8f4-3f03-11eb-0724-373cca7ac21f
# ╟─d3913554-3f0d-11eb-3f0a-690a3ea1c807
# ╠═94d3f8bc-3efc-11eb-1024-890804a76041
# ╟─0766d24e-3f0e-11eb-1775-cf2d934c600f
# ╠═5c825d20-3f0e-11eb-3d9a-0b3468066bb4
# ╟─53dc6110-3f0f-11eb-0cfa-5d8e19effc0d
# ╟─df892290-3f44-11eb-198f-7192ac3bcf9c
# ╟─37c0a954-3f10-11eb-1d00-f5de36810dbf
# ╠═6d0ec564-3f10-11eb-3ca8-61a8a9ab64fc
# ╟─b0418cf4-3f10-11eb-012e-fb8712e07e99
# ╠═c3495548-3f10-11eb-2b99-a51d8164f4fe
# ╟─484e07b8-3f37-11eb-2154-cb829f097ffb
# ╠═012325ce-3f31-11eb-1f9f-059a0dc7e06d
# ╟─68f46214-3f37-11eb-1903-a9ae1fa695f9
# ╟─bc1db886-3f38-11eb-2d42-1bd1196107dc
# ╟─c7633808-3f38-11eb-213f-49d634169b1d
