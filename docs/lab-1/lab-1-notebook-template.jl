### A Pluto.jl notebook ###
# v0.15.1

using Markdown
using InteractiveUtils

# ╔═╡ 389e73f0-3efd-11eb-1dae-538a2121a045
using GLM, DataFrames, Plots, Statistics
# Leave this chunk alone -- it will load the packages you need!

# ╔═╡ 1974d4d2-3f08-11eb-3ecd-9d73ed8fbe9c
md"""
# Your Title Here

**Your Name Here**

September 09, 2021
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
		stddat = experiment_data[contains.(experiment_data[!, 1], "tandard") .== 1, :];
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

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
DataFrames = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
GLM = "38e38edf-8417-5370-95a0-9cbb8c7f171a"
Plots = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
Statistics = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[compat]
DataFrames = "~1.2.2"
GLM = "~1.5.1"
Plots = "~1.21.3"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

[[Adapt]]
deps = ["LinearAlgebra"]
git-tree-sha1 = "84918055d15b3114ede17ac6a7182f68870c16f7"
uuid = "79e6a3ab-5dfb-504d-930d-738a2a938a0e"
version = "3.3.1"

[[ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

[[Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[Bzip2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "19a35467a82e236ff51bc17a3a44b69ef35185a2"
uuid = "6e34b625-4abd-537c-b88f-471c36dfa7a0"
version = "1.0.8+0"

[[Cairo_jll]]
deps = ["Artifacts", "Bzip2_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "JLLWrappers", "LZO_jll", "Libdl", "Pixman_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "f2202b55d816427cd385a9a4f3ffb226bee80f99"
uuid = "83423d85-b0ee-5818-9007-b63ccbeb887a"
version = "1.16.1+0"

[[ChainRulesCore]]
deps = ["Compat", "LinearAlgebra", "SparseArrays"]
git-tree-sha1 = "30ee06de5ff870b45c78f529a6b093b3323256a3"
uuid = "d360d2e6-b24c-11e9-a2a3-2a2ae2dbcce4"
version = "1.3.1"

[[ColorSchemes]]
deps = ["ColorTypes", "Colors", "FixedPointNumbers", "Random"]
git-tree-sha1 = "9995eb3977fbf67b86d0a0a0508e83017ded03f2"
uuid = "35d6a980-a343-548e-a6ea-1d62b119f2f4"
version = "3.14.0"

[[ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[Colors]]
deps = ["ColorTypes", "FixedPointNumbers", "Reexport"]
git-tree-sha1 = "417b0ed7b8b838aa6ca0a87aadf1bb9eb111ce40"
uuid = "5ae59095-9a9b-59fe-a467-6f913c188581"
version = "0.12.8"

[[Compat]]
deps = ["Base64", "Dates", "DelimitedFiles", "Distributed", "InteractiveUtils", "LibGit2", "Libdl", "LinearAlgebra", "Markdown", "Mmap", "Pkg", "Printf", "REPL", "Random", "SHA", "Serialization", "SharedArrays", "Sockets", "SparseArrays", "Statistics", "Test", "UUIDs", "Unicode"]
git-tree-sha1 = "6071cb87be6a444ac75fdbf51b8e7273808ce62f"
uuid = "34da2185-b29b-5c13-b0c7-acf172513d20"
version = "3.35.0"

[[CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[Contour]]
deps = ["StaticArrays"]
git-tree-sha1 = "9f02045d934dc030edad45944ea80dbd1f0ebea7"
uuid = "d38c429a-6771-53c6-b99e-75d170b6e991"
version = "0.5.7"

[[Crayons]]
git-tree-sha1 = "3f71217b538d7aaee0b69ab47d9b7724ca8afa0d"
uuid = "a8cc5b0e-0ffa-5ad4-8c14-923d3ee1735f"
version = "4.0.4"

[[DataAPI]]
git-tree-sha1 = "bec2532f8adb82005476c141ec23e921fc20971b"
uuid = "9a962f9c-6df0-11e9-0e5d-c546b8b5ee8a"
version = "1.8.0"

[[DataFrames]]
deps = ["Compat", "DataAPI", "Future", "InvertedIndices", "IteratorInterfaceExtensions", "LinearAlgebra", "Markdown", "Missings", "PooledArrays", "PrettyTables", "Printf", "REPL", "Reexport", "SortingAlgorithms", "Statistics", "TableTraits", "Tables", "Unicode"]
git-tree-sha1 = "d785f42445b63fc86caa08bb9a9351008be9b765"
uuid = "a93c6f00-e57d-5684-b7b6-d8193f3e46c0"
version = "1.2.2"

[[DataStructures]]
deps = ["Compat", "InteractiveUtils", "OrderedCollections"]
git-tree-sha1 = "7d9d316f04214f7efdbb6398d545446e246eff02"
uuid = "864edb3b-99cc-5e75-8d2d-829cb0a9cfe8"
version = "0.18.10"

[[DataValueInterfaces]]
git-tree-sha1 = "bfc1187b79289637fa0ef6d4436ebdfe6905cbd6"
uuid = "e2d170a0-9d28-54be-80f0-106bbe20a464"
version = "1.0.0"

[[Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[DelimitedFiles]]
deps = ["Mmap"]
uuid = "8bb1440f-4735-579b-a4ab-409b98df4dab"

[[Distributed]]
deps = ["Random", "Serialization", "Sockets"]
uuid = "8ba89e20-285c-5b6f-9357-94700520ee1b"

[[Distributions]]
deps = ["ChainRulesCore", "FillArrays", "LinearAlgebra", "PDMats", "Printf", "QuadGK", "Random", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns"]
git-tree-sha1 = "f4efaa4b5157e0cdb8283ae0b5428bc9208436ed"
uuid = "31c24e10-a181-5473-b8eb-7969acd0382f"
version = "0.25.16"

[[DocStringExtensions]]
deps = ["LibGit2"]
git-tree-sha1 = "a32185f5428d3986f47c2ab78b1f216d5e6cc96f"
uuid = "ffbed154-4ef7-542d-bbb7-c09d3a79fcae"
version = "0.8.5"

[[Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

[[EarCut_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "3f3a2501fa7236e9b911e0f7a588c657e822bb6d"
uuid = "5ae413db-bbd1-5e63-b57d-d24a61df00f5"
version = "2.2.3+0"

[[Expat_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b3bfd02e98aedfa5cf885665493c5598c350cd2f"
uuid = "2e619515-83b5-522b-bb60-26c02a35a201"
version = "2.2.10+0"

[[FFMPEG]]
deps = ["FFMPEG_jll"]
git-tree-sha1 = "b57e3acbe22f8484b4b5ff66a7499717fe1a9cc8"
uuid = "c87230d0-a227-11e9-1b43-d7ebe4e7570a"
version = "0.4.1"

[[FFMPEG_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "JLLWrappers", "LAME_jll", "Libdl", "Ogg_jll", "OpenSSL_jll", "Opus_jll", "Pkg", "Zlib_jll", "libass_jll", "libfdk_aac_jll", "libvorbis_jll", "x264_jll", "x265_jll"]
git-tree-sha1 = "d8a578692e3077ac998b50c0217dfd67f21d1e5f"
uuid = "b22a6f82-2f65-5046-a5b2-351ab43fb4e5"
version = "4.4.0+0"

[[FillArrays]]
deps = ["LinearAlgebra", "Random", "SparseArrays", "Statistics"]
git-tree-sha1 = "a3b7b041753094f3b17ffa9d2e2e07d8cace09cd"
uuid = "1a297f60-69ca-5386-bcde-b61e274b549b"
version = "0.12.3"

[[FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[Fontconfig_jll]]
deps = ["Artifacts", "Bzip2_jll", "Expat_jll", "FreeType2_jll", "JLLWrappers", "Libdl", "Libuuid_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "21efd19106a55620a188615da6d3d06cd7f6ee03"
uuid = "a3f928ae-7b40-5064-980b-68af3947d34b"
version = "2.13.93+0"

[[Formatting]]
deps = ["Printf"]
git-tree-sha1 = "8339d61043228fdd3eb658d86c926cb282ae72a8"
uuid = "59287772-0a20-5a39-b81b-1366585eb4c0"
version = "0.4.2"

[[FreeType2_jll]]
deps = ["Artifacts", "Bzip2_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "87eb71354d8ec1a96d4a7636bd57a7347dde3ef9"
uuid = "d7e528f0-a631-5988-bf34-fe36492bcfd7"
version = "2.10.4+0"

[[FriBidi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "aa31987c2ba8704e23c6c8ba8a4f769d5d7e4f91"
uuid = "559328eb-81f9-559d-9380-de523a88c83c"
version = "1.0.10+0"

[[Future]]
deps = ["Random"]
uuid = "9fa8497b-333b-5362-9e8d-4d0656e87820"

[[GLFW_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libglvnd_jll", "Pkg", "Xorg_libXcursor_jll", "Xorg_libXi_jll", "Xorg_libXinerama_jll", "Xorg_libXrandr_jll"]
git-tree-sha1 = "dba1e8614e98949abfa60480b13653813d8f0157"
uuid = "0656b61e-2033-5cc2-a64a-77c0f6c09b89"
version = "3.3.5+0"

[[GLM]]
deps = ["Distributions", "LinearAlgebra", "Printf", "Reexport", "SparseArrays", "SpecialFunctions", "Statistics", "StatsBase", "StatsFuns", "StatsModels"]
git-tree-sha1 = "f564ce4af5e79bb88ff1f4488e64363487674278"
uuid = "38e38edf-8417-5370-95a0-9cbb8c7f171a"
version = "1.5.1"

[[GR]]
deps = ["Base64", "DelimitedFiles", "GR_jll", "HTTP", "JSON", "Libdl", "LinearAlgebra", "Pkg", "Printf", "Random", "Serialization", "Sockets", "Test", "UUIDs"]
git-tree-sha1 = "182da592436e287758ded5be6e32c406de3a2e47"
uuid = "28b8d3ca-fb5f-59d9-8090-bfdbd6d07a71"
version = "0.58.1"

[[GR_jll]]
deps = ["Artifacts", "Bzip2_jll", "Cairo_jll", "FFMPEG_jll", "Fontconfig_jll", "GLFW_jll", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Libtiff_jll", "Pixman_jll", "Pkg", "Qt5Base_jll", "Zlib_jll", "libpng_jll"]
git-tree-sha1 = "ef49a187604f865f4708c90e3f431890724e9012"
uuid = "d2c73de3-f751-5644-a686-071e5b155ba9"
version = "0.59.0+0"

[[GeometryBasics]]
deps = ["EarCut_jll", "IterTools", "LinearAlgebra", "StaticArrays", "StructArrays", "Tables"]
git-tree-sha1 = "58bcdf5ebc057b085e58d95c138725628dd7453c"
uuid = "5c1252a2-5f33-56bf-86c9-59e7332b4326"
version = "0.4.1"

[[Gettext_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "9b02998aba7bf074d14de89f9d37ca24a1a0b046"
uuid = "78b55507-aeef-58d4-861c-77aaff3498b1"
version = "0.21.0+0"

[[Glib_jll]]
deps = ["Artifacts", "Gettext_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Libiconv_jll", "Libmount_jll", "PCRE_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "7bf67e9a481712b3dbe9cb3dac852dc4b1162e02"
uuid = "7746bdde-850d-59dc-9ae8-88ece973131d"
version = "2.68.3+0"

[[Graphite2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "344bf40dcab1073aca04aa0df4fb092f920e4011"
uuid = "3b182d85-2403-5c21-9c21-1e1f0cc25472"
version = "1.3.14+0"

[[Grisu]]
git-tree-sha1 = "53bb909d1151e57e2484c3d1b53e19552b887fb2"
uuid = "42e2da0e-8278-4e71-bc24-59509adca0fe"
version = "1.0.2"

[[HTTP]]
deps = ["Base64", "Dates", "IniFile", "Logging", "MbedTLS", "NetworkOptions", "Sockets", "URIs"]
git-tree-sha1 = "60ed5f1643927479f845b0135bb369b031b541fa"
uuid = "cd3eb016-35fb-5094-929b-558a96fad6f3"
version = "0.9.14"

[[HarfBuzz_jll]]
deps = ["Artifacts", "Cairo_jll", "Fontconfig_jll", "FreeType2_jll", "Glib_jll", "Graphite2_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg"]
git-tree-sha1 = "8a954fed8ac097d5be04921d595f741115c1b2ad"
uuid = "2e76f6c2-a576-52d4-95c1-20adfe4de566"
version = "2.8.1+0"

[[IniFile]]
deps = ["Test"]
git-tree-sha1 = "098e4d2c533924c921f9f9847274f2ad89e018b8"
uuid = "83e8ac13-25f8-5344-8a64-a9f2b223428f"
version = "0.5.0"

[[InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[InvertedIndices]]
git-tree-sha1 = "bee5f1ef5bf65df56bdd2e40447590b272a5471f"
uuid = "41ab1584-1d38-5bbf-9106-f11c6c58b48f"
version = "1.1.0"

[[IrrationalConstants]]
git-tree-sha1 = "f76424439413893a832026ca355fe273e93bce94"
uuid = "92d709cd-6900-40b7-9082-c6be49f344b6"
version = "0.1.0"

[[IterTools]]
git-tree-sha1 = "05110a2ab1fc5f932622ffea2a003221f4782c18"
uuid = "c8e1da08-722c-5040-9ed9-7db0dc04731e"
version = "1.3.0"

[[IteratorInterfaceExtensions]]
git-tree-sha1 = "a3f24677c21f5bbe9d2a714f95dcd58337fb2856"
uuid = "82899510-4779-5014-852e-03e436cf321d"
version = "1.0.0"

[[JLLWrappers]]
deps = ["Preferences"]
git-tree-sha1 = "642a199af8b68253517b80bd3bfd17eb4e84df6e"
uuid = "692b3bcd-3c85-4b1f-b108-f13ce0eb3210"
version = "1.3.0"

[[JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "8076680b162ada2a031f707ac7b4953e30667a37"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.2"

[[JpegTurbo_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "d735490ac75c5cb9f1b00d8b5509c11984dc6943"
uuid = "aacddb02-875f-59d6-b918-886e6ef4fbf8"
version = "2.1.0+0"

[[LAME_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "f6250b16881adf048549549fba48b1161acdac8c"
uuid = "c1c5ebd0-6772-5130-a774-d5fcae4a789d"
version = "3.100.1+0"

[[LZO_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "e5b909bcf985c5e2605737d2ce278ed791b89be6"
uuid = "dd4b983a-f0e5-5f8d-a1b7-129d4a5fb1ac"
version = "2.10.1+0"

[[LaTeXStrings]]
git-tree-sha1 = "c7f1c695e06c01b95a67f0cd1d34994f3e7db104"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.2.1"

[[Latexify]]
deps = ["Formatting", "InteractiveUtils", "LaTeXStrings", "MacroTools", "Markdown", "Printf", "Requires"]
git-tree-sha1 = "a4b12a1bd2ebade87891ab7e36fdbce582301a92"
uuid = "23fbe1c1-3f47-55db-b15f-69d7ec21a316"
version = "0.15.6"

[[LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"

[[LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

[[Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[Libffi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "761a393aeccd6aa92ec3515e428c26bf99575b3b"
uuid = "e9f186c6-92d2-5b65-8a66-fee21dc1b490"
version = "3.2.2+0"

[[Libgcrypt_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgpg_error_jll", "Pkg"]
git-tree-sha1 = "64613c82a59c120435c067c2b809fc61cf5166ae"
uuid = "d4300ac3-e22c-5743-9152-c294e39db1e4"
version = "1.8.7+0"

[[Libglvnd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll", "Xorg_libXext_jll"]
git-tree-sha1 = "7739f837d6447403596a75d19ed01fd08d6f56bf"
uuid = "7e76a0d4-f3c7-5321-8279-8d96eeed0f29"
version = "1.3.0+3"

[[Libgpg_error_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "c333716e46366857753e273ce6a69ee0945a6db9"
uuid = "7add5ba3-2f88-524e-9cd5-f83b8a55f7b8"
version = "1.42.0+0"

[[Libiconv_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "42b62845d70a619f063a7da093d995ec8e15e778"
uuid = "94ce4f54-9a6c-5748-9c1c-f9c7231a4531"
version = "1.16.1+1"

[[Libmount_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "9c30530bf0effd46e15e0fdcf2b8636e78cbbd73"
uuid = "4b2f31a3-9ecc-558c-b454-b3730dcb73e9"
version = "2.35.0+0"

[[Libtiff_jll]]
deps = ["Artifacts", "JLLWrappers", "JpegTurbo_jll", "Libdl", "Pkg", "Zlib_jll", "Zstd_jll"]
git-tree-sha1 = "340e257aada13f95f98ee352d316c3bed37c8ab9"
uuid = "89763e89-9b03-5906-acba-b20f662cd828"
version = "4.3.0+0"

[[Libuuid_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7f3efec06033682db852f8b3bc3c1d2b0a0ab066"
uuid = "38a345b3-de98-5d2b-a5d3-14cd9215e700"
version = "2.36.0+0"

[[LinearAlgebra]]
deps = ["Libdl"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[LogExpFunctions]]
deps = ["ChainRulesCore", "DocStringExtensions", "IrrationalConstants", "LinearAlgebra"]
git-tree-sha1 = "86197a8ecb06e222d66797b0c2d2f0cc7b69e42b"
uuid = "2ab3a3ac-af41-5b50-aa03-7779005ae688"
version = "0.3.2"

[[Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[MacroTools]]
deps = ["Markdown", "Random"]
git-tree-sha1 = "0fb723cd8c45858c22169b2e42269e53271a6df7"
uuid = "1914dd2f-81c6-5fcd-8719-6d5c9610ff09"
version = "0.5.7"

[[Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[MbedTLS]]
deps = ["Dates", "MbedTLS_jll", "Random", "Sockets"]
git-tree-sha1 = "1c38e51c3d08ef2278062ebceade0e46cefc96fe"
uuid = "739be429-bea8-5141-9913-cc70e7f3736d"
version = "1.0.3"

[[MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"

[[Measures]]
git-tree-sha1 = "e498ddeee6f9fdb4551ce855a46f54dbd900245f"
uuid = "442fdcdd-2543-5da2-b0f3-8c86c306513e"
version = "0.3.1"

[[Missings]]
deps = ["DataAPI"]
git-tree-sha1 = "2ca267b08821e86c5ef4376cffed98a46c2cb205"
uuid = "e1d29d7a-bbdc-5cf2-9ac0-f12de2c33e28"
version = "1.0.1"

[[Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[NaNMath]]
git-tree-sha1 = "bfe47e760d60b82b66b61d2d44128b62e3a369fb"
uuid = "77ba4419-2d1f-58cd-9bb1-8ffee604a2e3"
version = "0.3.5"

[[NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[Ogg_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "7937eda4681660b4d6aeeecc2f7e1c81c8ee4e2f"
uuid = "e7412a2a-1a6e-54c0-be00-318e2571c051"
version = "1.3.5+0"

[[OpenSSL_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "15003dcb7d8db3c6c857fda14891a539a8f2705a"
uuid = "458c3c95-2e84-50aa-8efc-19380b2a3a95"
version = "1.1.10+0"

[[OpenSpecFun_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "13652491f6856acfd2db29360e1bbcd4565d04f1"
uuid = "efe28fd5-8261-553b-a9e1-b2916fc3738e"
version = "0.5.5+0"

[[Opus_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "51a08fb14ec28da2ec7a927c4337e4332c2a4720"
uuid = "91d4177d-7536-5919-b921-800302f37372"
version = "1.3.2+0"

[[OrderedCollections]]
git-tree-sha1 = "85f8e6578bf1f9ee0d11e7bb1b1456435479d47c"
uuid = "bac558e1-5e72-5ebc-8fee-abe8a469f55d"
version = "1.4.1"

[[PCRE_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b2a7af664e098055a7529ad1a900ded962bca488"
uuid = "2f80f16e-611a-54ab-bc61-aa92de5b98fc"
version = "8.44.0+0"

[[PDMats]]
deps = ["LinearAlgebra", "SparseArrays", "SuiteSparse"]
git-tree-sha1 = "4dd403333bcf0909341cfe57ec115152f937d7d8"
uuid = "90014a1f-27ba-587c-ab20-58faa44d9150"
version = "0.11.1"

[[Parsers]]
deps = ["Dates"]
git-tree-sha1 = "438d35d2d95ae2c5e8780b330592b6de8494e779"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.0.3"

[[Pixman_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "b4f5d02549a10e20780a24fce72bea96b6329e29"
uuid = "30392449-352a-5448-841d-b1acce4e97dc"
version = "0.40.1+0"

[[Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

[[PlotThemes]]
deps = ["PlotUtils", "Requires", "Statistics"]
git-tree-sha1 = "a3a964ce9dc7898193536002a6dd892b1b5a6f1d"
uuid = "ccf2f8ad-2431-5c83-bf29-c5338b663b6a"
version = "2.0.1"

[[PlotUtils]]
deps = ["ColorSchemes", "Colors", "Dates", "Printf", "Random", "Reexport", "Statistics"]
git-tree-sha1 = "9ff1c70190c1c30aebca35dc489f7411b256cd23"
uuid = "995b91a9-d308-5afd-9ec6-746e21dbc043"
version = "1.0.13"

[[Plots]]
deps = ["Base64", "Contour", "Dates", "Downloads", "FFMPEG", "FixedPointNumbers", "GR", "GeometryBasics", "JSON", "Latexify", "LinearAlgebra", "Measures", "NaNMath", "PlotThemes", "PlotUtils", "Printf", "REPL", "Random", "RecipesBase", "RecipesPipeline", "Reexport", "Requires", "Scratch", "Showoff", "SparseArrays", "Statistics", "StatsBase", "UUIDs"]
git-tree-sha1 = "2dbafeadadcf7dadff20cd60046bba416b4912be"
uuid = "91a5bcdd-55d7-5caf-9e0b-520d859cae80"
version = "1.21.3"

[[PooledArrays]]
deps = ["DataAPI", "Future"]
git-tree-sha1 = "a193d6ad9c45ada72c14b731a318bedd3c2f00cf"
uuid = "2dfb63ee-cc39-5dd5-95bd-886bf059d720"
version = "1.3.0"

[[Preferences]]
deps = ["TOML"]
git-tree-sha1 = "00cfd92944ca9c760982747e9a1d0d5d86ab1e5a"
uuid = "21216c6a-2e73-6563-6e65-726566657250"
version = "1.2.2"

[[PrettyTables]]
deps = ["Crayons", "Formatting", "Markdown", "Reexport", "Tables"]
git-tree-sha1 = "0d1245a357cc61c8cd61934c07447aa569ff22e6"
uuid = "08abe8d2-0d0c-5749-adfa-8a2ac140af0d"
version = "1.1.0"

[[Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[Qt5Base_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Fontconfig_jll", "Glib_jll", "JLLWrappers", "Libdl", "Libglvnd_jll", "OpenSSL_jll", "Pkg", "Xorg_libXext_jll", "Xorg_libxcb_jll", "Xorg_xcb_util_image_jll", "Xorg_xcb_util_keysyms_jll", "Xorg_xcb_util_renderutil_jll", "Xorg_xcb_util_wm_jll", "Zlib_jll", "xkbcommon_jll"]
git-tree-sha1 = "ad368663a5e20dbb8d6dc2fddeefe4dae0781ae8"
uuid = "ea2cea3b-5b76-57ae-a6ef-0a8af62496e1"
version = "5.15.3+0"

[[QuadGK]]
deps = ["DataStructures", "LinearAlgebra"]
git-tree-sha1 = "12fbe86da16df6679be7521dfb39fbc861e1dc7b"
uuid = "1fd47b50-473d-5c70-9696-f719f8f3bcdc"
version = "2.4.1"

[[REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[Random]]
deps = ["Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[RecipesBase]]
git-tree-sha1 = "44a75aa7a527910ee3d1751d1f0e4148698add9e"
uuid = "3cdcf5f2-1ef4-517c-9805-6587b60abb01"
version = "1.1.2"

[[RecipesPipeline]]
deps = ["Dates", "NaNMath", "PlotUtils", "RecipesBase"]
git-tree-sha1 = "d4491becdc53580c6dadb0f6249f90caae888554"
uuid = "01d81517-befc-4cb6-b9ec-a95719d0359c"
version = "0.4.0"

[[Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[Requires]]
deps = ["UUIDs"]
git-tree-sha1 = "4036a3bd08ac7e968e27c203d45f5fff15020621"
uuid = "ae029012-a4dd-5104-9daa-d747884805df"
version = "1.1.3"

[[Rmath]]
deps = ["Random", "Rmath_jll"]
git-tree-sha1 = "bf3188feca147ce108c76ad82c2792c57abe7b1f"
uuid = "79098fc4-a85e-5d69-aa6a-4863f24498fa"
version = "0.7.0"

[[Rmath_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "68db32dff12bb6127bac73c209881191bf0efbb7"
uuid = "f50d1b31-88e8-58de-be2c-1cc44531875f"
version = "0.3.0+0"

[[SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[Scratch]]
deps = ["Dates"]
git-tree-sha1 = "0b4b7f1393cff97c33891da2a0bf69c6ed241fda"
uuid = "6c6a2e73-6563-6170-7368-637461726353"
version = "1.1.0"

[[Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[SharedArrays]]
deps = ["Distributed", "Mmap", "Random", "Serialization"]
uuid = "1a1011a3-84de-559e-8e89-a11a2f7dc383"

[[ShiftedArrays]]
git-tree-sha1 = "22395afdcf37d6709a5a0766cc4a5ca52cb85ea0"
uuid = "1277b4bf-5013-50f5-be3d-901d8477a67a"
version = "1.0.0"

[[Showoff]]
deps = ["Dates", "Grisu"]
git-tree-sha1 = "91eddf657aca81df9ae6ceb20b959ae5653ad1de"
uuid = "992d4aef-0814-514b-bc4d-f2e9a6c4116f"
version = "1.0.3"

[[Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[SortingAlgorithms]]
deps = ["DataStructures"]
git-tree-sha1 = "b3363d7460f7d098ca0912c69b082f75625d7508"
uuid = "a2af1166-a08f-5f64-846c-94a0d3cef48c"
version = "1.0.1"

[[SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[SpecialFunctions]]
deps = ["ChainRulesCore", "LogExpFunctions", "OpenSpecFun_jll"]
git-tree-sha1 = "a322a9493e49c5f3a10b50df3aedaf1cdb3244b7"
uuid = "276daf66-3868-5448-9aa4-cd146d93841b"
version = "1.6.1"

[[StaticArrays]]
deps = ["LinearAlgebra", "Random", "Statistics"]
git-tree-sha1 = "3240808c6d463ac46f1c1cd7638375cd22abbccb"
uuid = "90137ffa-7385-5640-81b9-e52037218182"
version = "1.2.12"

[[Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[StatsAPI]]
git-tree-sha1 = "1958272568dc176a1d881acb797beb909c785510"
uuid = "82ae8749-77ed-4fe6-ae5f-f523153014b0"
version = "1.0.0"

[[StatsBase]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "Missings", "Printf", "Random", "SortingAlgorithms", "SparseArrays", "Statistics", "StatsAPI"]
git-tree-sha1 = "8cbbc098554648c84f79a463c9ff0fd277144b6c"
uuid = "2913bbd2-ae8a-5f71-8c99-4fb6c76f3a91"
version = "0.33.10"

[[StatsFuns]]
deps = ["ChainRulesCore", "IrrationalConstants", "LogExpFunctions", "Reexport", "Rmath", "SpecialFunctions"]
git-tree-sha1 = "46d7ccc7104860c38b11966dd1f72ff042f382e4"
uuid = "4c63d2b9-4356-54db-8cca-17b64c39e42c"
version = "0.9.10"

[[StatsModels]]
deps = ["DataAPI", "DataStructures", "LinearAlgebra", "Printf", "ShiftedArrays", "SparseArrays", "StatsBase", "StatsFuns", "Tables"]
git-tree-sha1 = "3fa15c1f8be168e76d59097f66970adc86bfeb95"
uuid = "3eaba693-59b7-5ba5-a881-562e759f1c8d"
version = "0.6.25"

[[StructArrays]]
deps = ["Adapt", "DataAPI", "StaticArrays", "Tables"]
git-tree-sha1 = "1700b86ad59348c0f9f68ddc95117071f947072d"
uuid = "09ab397b-f2b6-538f-b94a-2f83cf4a842a"
version = "0.6.1"

[[SuiteSparse]]
deps = ["Libdl", "LinearAlgebra", "Serialization", "SparseArrays"]
uuid = "4607b0f0-06f3-5cda-b6b1-a6196a1729e9"

[[TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"

[[TableTraits]]
deps = ["IteratorInterfaceExtensions"]
git-tree-sha1 = "c06b2f539df1c6efa794486abfb6ed2022561a39"
uuid = "3783bdb8-4a98-5b6b-af9a-565f29a5fe9c"
version = "1.0.1"

[[Tables]]
deps = ["DataAPI", "DataValueInterfaces", "IteratorInterfaceExtensions", "LinearAlgebra", "TableTraits", "Test"]
git-tree-sha1 = "368d04a820fe069f9080ff1b432147a6203c3c89"
uuid = "bd369af6-aec1-5ad0-b16a-f7cc5008161c"
version = "1.5.1"

[[Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

[[Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[URIs]]
git-tree-sha1 = "97bbe755a53fe859669cd907f2d96aee8d2c1355"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.3.0"

[[UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[Wayland_jll]]
deps = ["Artifacts", "Expat_jll", "JLLWrappers", "Libdl", "Libffi_jll", "Pkg", "XML2_jll"]
git-tree-sha1 = "3e61f0b86f90dacb0bc0e73a0c5a83f6a8636e23"
uuid = "a2964d1f-97da-50d4-b82a-358c7fce9d89"
version = "1.19.0+0"

[[Wayland_protocols_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll"]
git-tree-sha1 = "2839f1c1296940218e35df0bbb220f2a79686670"
uuid = "2381bf8a-dfd0-557d-9999-79630e7b1b91"
version = "1.18.0+4"

[[XML2_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libiconv_jll", "Pkg", "Zlib_jll"]
git-tree-sha1 = "1acf5bdf07aa0907e0a37d3718bb88d4b687b74a"
uuid = "02c8fc9c-b97f-50b9-bbe4-9be30ff0a78a"
version = "2.9.12+0"

[[XSLT_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Libgcrypt_jll", "Libgpg_error_jll", "Libiconv_jll", "Pkg", "XML2_jll", "Zlib_jll"]
git-tree-sha1 = "91844873c4085240b95e795f692c4cec4d805f8a"
uuid = "aed1982a-8fda-507f-9586-7b0439959a61"
version = "1.1.34+0"

[[Xorg_libX11_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll", "Xorg_xtrans_jll"]
git-tree-sha1 = "5be649d550f3f4b95308bf0183b82e2582876527"
uuid = "4f6342f7-b3d2-589e-9d20-edeb45f2b2bc"
version = "1.6.9+4"

[[Xorg_libXau_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4e490d5c960c314f33885790ed410ff3a94ce67e"
uuid = "0c0b7dd1-d40b-584c-a123-a41640f87eec"
version = "1.0.9+4"

[[Xorg_libXcursor_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXfixes_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "12e0eb3bc634fa2080c1c37fccf56f7c22989afd"
uuid = "935fb764-8cf2-53bf-bb30-45bb1f8bf724"
version = "1.2.0+4"

[[Xorg_libXdmcp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fe47bd2247248125c428978740e18a681372dd4"
uuid = "a3789734-cfe1-5b06-b2d0-1dd0d9d62d05"
version = "1.1.3+4"

[[Xorg_libXext_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "b7c0aa8c376b31e4852b360222848637f481f8c3"
uuid = "1082639a-0dae-5f34-9b06-72781eeb8cb3"
version = "1.3.4+4"

[[Xorg_libXfixes_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "0e0dc7431e7a0587559f9294aeec269471c991a4"
uuid = "d091e8ba-531a-589c-9de9-94069b037ed8"
version = "5.0.3+4"

[[Xorg_libXi_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXfixes_jll"]
git-tree-sha1 = "89b52bc2160aadc84d707093930ef0bffa641246"
uuid = "a51aa0fd-4e3c-5386-b890-e753decda492"
version = "1.7.10+4"

[[Xorg_libXinerama_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll"]
git-tree-sha1 = "26be8b1c342929259317d8b9f7b53bf2bb73b123"
uuid = "d1454406-59df-5ea1-beac-c340f2130bc3"
version = "1.1.4+4"

[[Xorg_libXrandr_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libXext_jll", "Xorg_libXrender_jll"]
git-tree-sha1 = "34cea83cb726fb58f325887bf0612c6b3fb17631"
uuid = "ec84b674-ba8e-5d96-8ba1-2a689ba10484"
version = "1.5.2+4"

[[Xorg_libXrender_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "19560f30fd49f4d4efbe7002a1037f8c43d43b96"
uuid = "ea2f1a96-1ddc-540d-b46f-429655e07cfa"
version = "0.9.10+4"

[[Xorg_libpthread_stubs_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "6783737e45d3c59a4a4c4091f5f88cdcf0908cbb"
uuid = "14d82f49-176c-5ed1-bb49-ad3f5cbd8c74"
version = "0.1.0+3"

[[Xorg_libxcb_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "XSLT_jll", "Xorg_libXau_jll", "Xorg_libXdmcp_jll", "Xorg_libpthread_stubs_jll"]
git-tree-sha1 = "daf17f441228e7a3833846cd048892861cff16d6"
uuid = "c7cfdc94-dc32-55de-ac96-5a1b8d977c5b"
version = "1.13.0+3"

[[Xorg_libxkbfile_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libX11_jll"]
git-tree-sha1 = "926af861744212db0eb001d9e40b5d16292080b2"
uuid = "cc61e674-0454-545c-8b26-ed2c68acab7a"
version = "1.1.0+4"

[[Xorg_xcb_util_image_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "0fab0a40349ba1cba2c1da699243396ff8e94b97"
uuid = "12413925-8142-5f55-bb0e-6d7ca50bb09b"
version = "0.4.0+1"

[[Xorg_xcb_util_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxcb_jll"]
git-tree-sha1 = "e7fd7b2881fa2eaa72717420894d3938177862d1"
uuid = "2def613f-5ad1-5310-b15b-b15d46f528f5"
version = "0.4.0+1"

[[Xorg_xcb_util_keysyms_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "d1151e2c45a544f32441a567d1690e701ec89b00"
uuid = "975044d2-76e6-5fbe-bf08-97ce7c6574c7"
version = "0.4.0+1"

[[Xorg_xcb_util_renderutil_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "dfd7a8f38d4613b6a575253b3174dd991ca6183e"
uuid = "0d47668e-0667-5a69-a72c-f761630bfb7e"
version = "0.3.9+1"

[[Xorg_xcb_util_wm_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xcb_util_jll"]
git-tree-sha1 = "e78d10aab01a4a154142c5006ed44fd9e8e31b67"
uuid = "c22f9ab0-d5fe-5066-847c-f4bb1cd4e361"
version = "0.4.1+1"

[[Xorg_xkbcomp_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_libxkbfile_jll"]
git-tree-sha1 = "4bcbf660f6c2e714f87e960a171b119d06ee163b"
uuid = "35661453-b289-5fab-8a00-3d9160c6a3a4"
version = "1.4.2+4"

[[Xorg_xkeyboard_config_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Xorg_xkbcomp_jll"]
git-tree-sha1 = "5c8424f8a67c3f2209646d4425f3d415fee5931d"
uuid = "33bec58e-1273-512f-9401-5d533626f822"
version = "2.27.0+4"

[[Xorg_xtrans_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "79c31e7844f6ecf779705fbc12146eb190b7d845"
uuid = "c5fb5394-a638-5e4d-96e5-b29de1b5cf10"
version = "1.4.0+3"

[[Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"

[[Zstd_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "cc4bf3fdde8b7e3e9fa0351bdeedba1cf3b7f6e6"
uuid = "3161d3a3-bdf6-5164-811a-617609db77b4"
version = "1.5.0+0"

[[libass_jll]]
deps = ["Artifacts", "Bzip2_jll", "FreeType2_jll", "FriBidi_jll", "HarfBuzz_jll", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "5982a94fcba20f02f42ace44b9894ee2b140fe47"
uuid = "0ac62f75-1d6f-5e53-bd7c-93b484bb37c0"
version = "0.15.1+0"

[[libfdk_aac_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "daacc84a041563f965be61859a36e17c4e4fcd55"
uuid = "f638f0a6-7fb0-5443-88ba-1cc74229b280"
version = "2.0.2+0"

[[libpng_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Zlib_jll"]
git-tree-sha1 = "94d180a6d2b5e55e447e2d27a29ed04fe79eb30c"
uuid = "b53b4c65-9356-5827-b1ea-8c7a1a84506f"
version = "1.6.38+0"

[[libvorbis_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Ogg_jll", "Pkg"]
git-tree-sha1 = "c45f4e40e7aafe9d086379e5578947ec8b95a8fb"
uuid = "f27f6e37-5d2b-51aa-960f-b287f2bc3b7a"
version = "1.3.7+0"

[[nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"

[[x264_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "4fea590b89e6ec504593146bf8b988b2c00922b2"
uuid = "1270edf5-f2f9-52d2-97e9-ab00b5d0237a"
version = "2021.5.5+0"

[[x265_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg"]
git-tree-sha1 = "ee567a171cce03570d77ad3a43e90218e38937a9"
uuid = "dfaa095f-4041-5dcd-9319-2fabd8486b76"
version = "3.5.0+0"

[[xkbcommon_jll]]
deps = ["Artifacts", "JLLWrappers", "Libdl", "Pkg", "Wayland_jll", "Wayland_protocols_jll", "Xorg_libxcb_jll", "Xorg_xkeyboard_config_jll"]
git-tree-sha1 = "ece2350174195bb31de1a63bea3a41ae1aa593b6"
uuid = "d8fb68d0-12a3-5cfd-a85a-d49703b185fd"
version = "0.9.1+5"
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
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
