### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 389e73f0-3efd-11eb-1dae-538a2121a045
using GLM, DataFrames, Plots, Statistics, HypothesisTests
# Leave this chunk alone -- it will load the packages you need!

# ╔═╡ 1974d4d2-3f08-11eb-3ecd-9d73ed8fbe9c
md"""
# Your Title Here

**Your Name Here**

December 15, 2020
"""

# Click the grey eyeball to the left of the title to hide this code chunk when you're done editing!

# ╔═╡ 3259ead2-3f08-11eb-0c8b-45d108629844
md"""
# Introduction

Write your Introduction here.  Aim for 1-2 paragraphs.  A few questions to get you thinking about what to write:

- What are you studying and why?
- How are you studying it and why?
- What are your goals?
- What do you expect to find?

(Click the grey eyeball icon to the left of Introduction and then type in the tan box that appears to edit!)

"""

# ╔═╡ 068d4ccc-3f09-11eb-05ed-018d62fca359
md"""
# Materials and Methods

**This section should be filled in during lab!**

## Standard and QC Preparation

Insert your info about how you made standards and the QC here.

(Click the grey eyeball icon to the left of Materials and Methods and then type in the tan box that appears to edit!)


"""

# ╔═╡ 9ce9a3f6-3ef7-11eb-3f6d-2744d90b44b2
stock_conc = missing; # ppm
# Replace 'missing' with your value.

# ╔═╡ caec811e-3f3b-11eb-1c5f-ffcd06782dec
if !(@isdefined stock_conc)
	md"""Do not change the name of the variable - write you answer as `stock_conc = "..."`"""
elseif stock_conc === missing
	
elseif ((@isdefined stock_conc) && (stock_conc === 113.4))
		md"""
	!!! correct
	Looks great!
	"""
elseif ((@isdefined stock_conc) && (stock_conc === 103.2))
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

# ╔═╡ a04c2106-3f47-11eb-36d8-07156d6ea6fc
pipette_volume = [missing, missing]; # mL

# ╔═╡ 7670f148-3f3d-11eb-2dd7-6f119d2d754f
if (length(pipette_volume) == 5 && pipette_volume[1] < pipette_volume[2])
		md"""
!!! correct
    Looks like you entered the pipette volumes correctly!
		"""
elseif pipette_volume[1] === missing
	
else
		md"""
!!! warning "Not enough values or wrong order."
    You should have 5 volumes here.  I suggest you order them smallest to largest.  Don't forget to add 25.00 for your high standard!
		"""
end


# ╔═╡ bb6091f2-3ef7-11eb-1ebf-7f71bb8fb83d
flask_volume = missing; # mL

# ╔═╡ 7d6624ae-3f3e-11eb-2d24-ef6684f04e4d
if (flask_volume !== 25.00 && flask_volume !== missing)
		md"""
!!! warning "Unexpected flask volume?"
    Did you use a flask other than 25 ml?  It's OK if so -- just make sure you have the right volume listed!  If you used more than one volume you can enter it like `flask_volume = [1, 2, 3, ...]`.  Also note that in Julia 25 ≠ 25.0!  The first is an `Int` and the second is a `Float`.
		"""
elseif flask_volume === missing
	
else
		md"""
!!! correct "Looks good."
		"""
end

# ╔═╡ 340904fa-3ef7-11eb-0708-75853130399e
# std_concs = C2 = C1V1 ÷ V2
# C1 = stock conc.
# V1 = pipette_volume (varies)
# V2 = vol flask volume (25 ml)
standard_concentrations = missing # mg/L

# ╔═╡ 61d52506-3f49-11eb-04ec-af07ac9a7750
if standard_concentrations !== missing
	if (standard_concentrations == pipette_volume * stock_conc / flask_volume)
			md"""
!!! correct
    Well done!
			"""
	else
		md"""
!!! warning "Incorrect"
    I got different values...		
    Make sure you use the dot syntax here (`.*` and `./`).
		"""
	end
end

# ╔═╡ 9f6dff72-6e66-11eb-3725-531ee2f52173
md"""
Insert your info about how the QC was prepared here.
"""

# ╔═╡ b863400a-3efa-11eb-1e2b-1dce178424f0
# qc_conc_expected = C2 = C1V1 ÷ V2
# C1 = stock conc.
# V1 = pipette_volume (10 ml)
# V2 = vol flask volume (25 ml)
qc_expected_conc = missing # mg/L

# ╔═╡ 89112f64-3f0a-11eb-34e8-fdd7b6449fef
md"""
## Sample Preparation

Dissolved CO$_2$ was removed from samples using the degas mode of an sonicator (Branson ).  Samples were run undiluted.
"""

# ╔═╡ b629f6e8-3f0a-11eb-10e6-072baf22db8e
md"""
## Analysis

Insert info about your analysis here.  Fill in the values in the table, as well.

**Table 1: Instrument Parameters**

| Parameter							|   Value 	|
| :-----         					|  :-----:	|
| Manufacturer      				|   		|
| Model 							|   		|
| Software  						| 			|
| Integration Time (ms) 			| 		  	|
| Wavelength Smoothing (nm) 		|  			|
| Temporal Averaging 				|  			|
| Excitation Wavelength (nm)    	| 			|
| Emission Wavelength (λ-max, nm)   | 			|

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

# ╔═╡ 989ff84a-3f0d-11eb-0b52-23313d318245
md"""
## Collected Data

**This section should be filled in during lab!**
"""

# ╔═╡ f8d23ec2-3f0c-11eb-2d16-fbc667ec82d1
md"""
The sample names are:
"""

# ╔═╡ a321a7e8-3f0b-11eb-2055-4d2b08d9fe6b
Names = [
"Blank", "Blank 2" # insert your sample names in quote and separated by commas
];


# ╔═╡ 02a01bfe-3f0d-11eb-1499-c37984690b2d
md"""
The corresponding concentrations, in mg/L, are:
"""

# ╔═╡ b1d5ae2e-3f0b-11eb-38d1-f3cb3cdaf9e2
Concentrations = [
0, 0 # insert your standard separated by commas (no quotes)
];

# ╔═╡ 0d472534-3f0d-11eb-3906-f52a3fb4781b
md"""
And the corresponding signals measured in lab are, in arbitrary intensity units:
"""

# ╔═╡ c42c08ca-3f0b-11eb-2c9c-4ff0f2745d0b
Signal = [
0.000, 0.000 # insert your signal values separated by commas (no quotes)
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
calcurve = missing

# ╔═╡ cd70ece4-3f41-11eb-0be2-6b3a14d9cafc
let
	if calcurve !== missing
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
end

# ╔═╡ 4cb4c208-3f44-11eb-3a82-556f84c6666e
md"""
The sensitivity coefficient is:
"""

# ╔═╡ f8a689c0-3f0b-11eb-3175-c352ae6e0164
kₐ = missing

# ╔═╡ 5a72866e-3f44-11eb-297f-875aa3403e0a
md"""
The intercept is:
"""

# ╔═╡ 522f19dc-3f0c-11eb-3d8f-41ba04657fbd
b = missing

# ╔═╡ 5fe263c4-3f44-11eb-1d5c-b94368f3090c
md"""
The R² value is:
"""

# ╔═╡ 768be8f4-3f03-11eb-0724-373cca7ac21f
R² = missing

# ╔═╡ 94d3f8bc-3efc-11eb-1024-890804a76041
begin
	# insert a plot with the data and line of best fit plotted.
end

# ╔═╡ 5c825d20-3f0e-11eb-3d9a-0b3468066bb4
qc_measured_conc = missing
# this gives concentration in mg/L

# ╔═╡ 53dc6110-3f0f-11eb-0cfa-5d8e19effc0d
md"""
Insert your interpretation of the QC data here.
"""

# ╔═╡ df892290-3f44-11eb-198f-7192ac3bcf9c
let
	if qc_measured_conc !== missing
		qcmeas = (experiment_data[occursin.("QC", experiment_data[!, 1]), :Signal][1] - coef(calcurve)[1]) / coef(calcurve)[2]

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
end

# ╔═╡ 37c0a954-3f10-11eb-1d00-f5de36810dbf
md"""
# Determination of Sample Concentration

"""

# ╔═╡ 6d0ec564-3f10-11eb-3ca8-61a8a9ab64fc
mean_sample_signal = missing

# ╔═╡ c3495548-3f10-11eb-2b99-a51d8164f4fe
mean_sample_conc = missing
# concentration in mg/L

# ╔═╡ 5f07d80e-3f36-11eb-30d6-f35fa7cd80c6
md"""

## How to Calculate a Confidence Interval

The confidence interval on a concentration value that was determined using a standard curve is:

$\text{CI} = t s_{C_a}$

where $t$ is the critical $t$ value (3.182 for 3 degrees of freedom at the 95% CL) and $s_{C_a}$ is the standard deviation of the concentration, given by:

$s_{C_A} = \frac {s_r} {k_a} \sqrt{\frac {1} {m} + \frac {1} {n} + \frac {\left( \overline{S}_{samp} - \overline{S}_{std} \right)^2} {(k_a)^2 \sum_{i = 1}^{n} \left( C_{std_i} - \overline{C}_{std} \right)^2}}$

where $m$ is the number of sample replicates, $n$ is the number of standards, $\bar{S}$ denotes the average signal for the samples and standards, $C$ is the concentration of the standards, and s_r is the standard deviation about the regression:

$s_r = \sqrt{\frac {\sum_{i = 1}^{n} \left( y_i - \hat{y}_i \right)^2} {n-2}}$

such that the final average concentration, $\mu_{C_a}$, is:

$\mu_{C_a} = C_a \pm t s_{C_a}$

A custom function, `calculateCI(model, std_conc, std_signal, new_signal, t = 3.182)`, can be used to perform these calculations, where:

- `model`: A linear model of the standard data (i.e. standard curve)
- `std_conc`: A 1-d array of concentrations for the standards
- `std_signal`: A 1-d array of signal values for the standards
- `new_signal`: A 1-d array of signal values for the samples/unknowns
- `t`: The critical *t* value to use for the CI

**The output of the function is CI (i.e. $tS_{C_a}$).**

See [Chapter 5](https://chem.libretexts.org/Bookshelves/Analytical_Chemistry/Book%3A_Analytical_Chemistry_2.1_(Harvey)/05%3A_Standardizing_Analytical_Methods/5.04%3A_Linear_Regression_and_Calibration_Curves) in *Analytical Chemistry 2.1* by David Harvey for more information.
"""

# ╔═╡ 8a1c2b54-3f30-11eb-2406-274ade08f7c4
# Leave this chunk alone -- it's a custom function you will need!

function calculateCI(model, std_conc, std_signal, new_signal; t = 3.182)
	sᵣ = sqrt((deviance(model) / dof_residual(model)));
	CI = (sᵣ/coef(model)[2]) * sqrt((1/length(predict(model))) + (1/length(new_signal)) + ((mean(new_signal) - mean(std_signal))^2 / (coef(model)[2]^2 * sum((std_conc .- mean(std_conc)).^2)))) * t
end;

# ╔═╡ 012325ce-3f31-11eb-1f9f-059a0dc7e06d
CI = missing

# ╔═╡ 7753ebd0-6e6d-11eb-100f-31b0593efd65
md"""
# Determine Limit of Detection and Limit of Quantitation
"""

# ╔═╡ fdd3dac6-6e6d-11eb-02f9-450542e2218a
LOD = missing

# ╔═╡ b8ae0908-6e6d-11eb-25cd-733b8eb4f620
if LOD !== missing
		llod = ( 3 * std(experiment_data[occursin.("Blank", experiment_data[!, 1]), :Signal]) ) / coef(calcurve)[2]
	
	if llod == LOD

	md"""
!!! correct
			"""
		else
	md"""
!!! warning 
			"""
	end
end

# ╔═╡ 0214f7dc-6e6e-11eb-276c-033cc0aeecd2
LOQ = missing

# ╔═╡ 0bcf6636-6e6e-11eb-0928-b9739c4c456e
if LOD !== missing
		lloq = ( 10 * std(experiment_data[occursin.("Blank", experiment_data[!, 1]), :Signal]) ) / coef(calcurve)[2]
	
	if lloq == LOQ

	md"""
!!! correct
			"""
		else
	md"""
!!! warning 
			"""
	end
end

# ╔═╡ bc1db886-3f38-11eb-2d42-1bd1196107dc
md"""
# Conlcusions

Fill in your conclusions here. Aim for 1 paragraph or so.

- Provide a 1-2 sentence summary of the experiment.
- Provide a 1-2 sentence summary of the outcome, focusing on it's implications.
- How does your outcome relate to the question(s) posed in the introduction?
- If you did not compare to previous studies in your Results & Data Processing Section you should do that here.

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
# ╠═a04c2106-3f47-11eb-36d8-07156d6ea6fc
# ╟─7670f148-3f3d-11eb-2dd7-6f119d2d754f
# ╠═bb6091f2-3ef7-11eb-1ebf-7f71bb8fb83d
# ╟─7d6624ae-3f3e-11eb-2d24-ef6684f04e4d
# ╠═340904fa-3ef7-11eb-0708-75853130399e
# ╟─61d52506-3f49-11eb-04ec-af07ac9a7750
# ╟─9f6dff72-6e66-11eb-3725-531ee2f52173
# ╠═b863400a-3efa-11eb-1e2b-1dce178424f0
# ╟─89112f64-3f0a-11eb-34e8-fdd7b6449fef
# ╟─b629f6e8-3f0a-11eb-10e6-072baf22db8e
# ╟─65d329e8-3f0b-11eb-174e-3d82834dd797
# ╟─d5e06754-3f0c-11eb-3692-996bcf0d63a7
# ╠═389e73f0-3efd-11eb-1dae-538a2121a045
# ╟─989ff84a-3f0d-11eb-0b52-23313d318245
# ╟─f8d23ec2-3f0c-11eb-2d16-fbc667ec82d1
# ╠═a321a7e8-3f0b-11eb-2055-4d2b08d9fe6b
# ╟─02a01bfe-3f0d-11eb-1499-c37984690b2d
# ╠═b1d5ae2e-3f0b-11eb-38d1-f3cb3cdaf9e2
# ╟─0d472534-3f0d-11eb-3906-f52a3fb4781b
# ╠═c42c08ca-3f0b-11eb-2c9c-4ff0f2745d0b
# ╟─1f980db6-3f0d-11eb-282e-23525edbc13e
# ╟─d531e478-3f0b-11eb-1fa1-c77b408ea4d3
# ╟─3b9eeba0-3f40-11eb-1aa1-ad7a459bec4b
# ╟─a1757e02-3f0d-11eb-0c67-59100f1c0718
# ╟─3113db2e-3f0d-11eb-0804-91489b86fd8e
# ╠═f616be6a-3efd-11eb-3aad-9d01d81c41a6
# ╟─cd70ece4-3f41-11eb-0be2-6b3a14d9cafc
# ╟─4cb4c208-3f44-11eb-3a82-556f84c6666e
# ╠═f8a689c0-3f0b-11eb-3175-c352ae6e0164
# ╟─5a72866e-3f44-11eb-297f-875aa3403e0a
# ╠═522f19dc-3f0c-11eb-3d8f-41ba04657fbd
# ╟─5fe263c4-3f44-11eb-1d5c-b94368f3090c
# ╠═768be8f4-3f03-11eb-0724-373cca7ac21f
# ╠═94d3f8bc-3efc-11eb-1024-890804a76041
# ╠═5c825d20-3f0e-11eb-3d9a-0b3468066bb4
# ╟─53dc6110-3f0f-11eb-0cfa-5d8e19effc0d
# ╟─df892290-3f44-11eb-198f-7192ac3bcf9c
# ╟─37c0a954-3f10-11eb-1d00-f5de36810dbf
# ╠═6d0ec564-3f10-11eb-3ca8-61a8a9ab64fc
# ╠═c3495548-3f10-11eb-2b99-a51d8164f4fe
# ╟─5f07d80e-3f36-11eb-30d6-f35fa7cd80c6
# ╟─8a1c2b54-3f30-11eb-2406-274ade08f7c4
# ╠═012325ce-3f31-11eb-1f9f-059a0dc7e06d
# ╟─7753ebd0-6e6d-11eb-100f-31b0593efd65
# ╠═fdd3dac6-6e6d-11eb-02f9-450542e2218a
# ╟─b8ae0908-6e6d-11eb-25cd-733b8eb4f620
# ╠═0214f7dc-6e6e-11eb-276c-033cc0aeecd2
# ╟─0bcf6636-6e6e-11eb-0928-b9739c4c456e
# ╟─bc1db886-3f38-11eb-2d42-1bd1196107dc
# ╟─c7633808-3f38-11eb-213f-49d634169b1d
