### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ c05fe2d0-7a1f-11eb-30fc-85a392f0cc6c
using CSV, DataFrames, Plots, Statistics, GLM, StringEncodings

# ╔═╡ 843abe86-7cab-11eb-14e0-cb78f4ebf601
md"""
# Title

**Your Name**

February 27, 2021
"""

# ╔═╡ 88947592-7cab-11eb-0fcb-eba69da36ce5
md"""
**NOTE:** *The sections listed in this template are meant to be a guide to help you determine what information you should include and different ways of presenting that information.  I encourage you to make it your own!  You are free to add sections, rearrange information, etc., in a way that works for you, so long as the notebook stays organized and easy to understand.*

*You should delete the template text (like this) before you turn your notebook in.*
"""

# ╔═╡ 93adb760-7cab-11eb-3418-636173332201
md"""
# Introduction

Your introduction goes here.

"""

# ╔═╡ 9acd14e6-7cab-11eb-257d-6b39ac4b5093
md"""
# Materials and Methods

Add your methods here, with enough detail that someone could *exactly* reproduce your experiment with no other resources.

"""

# ╔═╡ a41aaba8-7cab-11eb-1b3e-79e48174489f
md"""
## Sample Information

**Table 1: Sample Summaries**

| Sample ID    | Manufacturer | Flavor | Advertised Nic. Conc. (mg/mL) |
| -----        | ------       | -----  | :-----:                       |
| Sample 1 ID  |              |        |                               |

*You can add more columns to this table if you want to.*

"""

# ╔═╡ b2a0d8a2-7cab-11eb-0ff5-4182faa410b3
md"""
## Laboratory Methods & Sample Prep

1. Add your sample prep and lab procedures here.  
2. Remember to include exact quantities just like you would in a paper notebook.
"""

# ╔═╡ 9daa4a1a-7ca3-11eb-2124-a744fc0a5be0
concentrations = [1.014, 2.007, 2.996, 3.963, 5.010]

# ╔═╡ b63201ce-7cab-11eb-33ff-8587745784f2
md"""
## Instrumental Methods

*Insert info about the steps you used on the instrument here.*

"""

# ╔═╡ bc0242e4-7cab-11eb-0fb0-810ce7d3f0eb
md"""
**Table 2: FAAS Parameters**

|   Parameter    |   Value    |
| :--------       | :--------:   |
| Make               |            |
| Model              |            |
| etc...see website for example |            |
"""

# ╔═╡ ee21d98a-7cab-11eb-3186-2bcbfc2393e5
md"""
# Results and Data Processing
"""

# ╔═╡ 0ffa9644-7cac-11eb-2922-cb2e9c0df2f6
md"""
## Import the Data
"""

# ╔═╡ 2db2f670-7bc3-11eb-3ae7-29c1243fd2ff
faas_data = CSV.read(open("faas_data.csv", enc"UTF-16LE"), DataFrame, normalizenames=true)

# ╔═╡ 03128dc2-7ca4-11eb-3207-c7fc203faefc
faas_data.Conc = vcat(missing, concentrations, ones(3).*missing) 

# ╔═╡ 32577ba8-7cac-11eb-3dc2-ab14a977ae9d
md"""
### Calculate the Mean Signal 
"""

# ╔═╡ 489de90a-7ca3-11eb-1e3a-9fbe2eb89436
faas_data.Abs = mean(Matrix(faas_data[!, 7:9]), dims = 2)[:, 1]

# ╔═╡ 24d3fa6c-7a20-11eb-3e8f-9b52f9aeef68
md"""
## Create a Standard Curve
"""

# ╔═╡ 32c68a72-7a20-11eb-0125-85c8890c97b3
calcurve = lm(@formula(Abs ~ Conc), faas_data[2:6, :])

# ╔═╡ cd8e499c-7a24-11eb-084d-7d4d7e15bab6
k = coef(calcurve)[2]

# ╔═╡ dbdce38c-7a24-11eb-19e0-ad127a66b14a
b = coef(calcurve)[1]

# ╔═╡ e28e60fe-7a24-11eb-3594-85a37e1c6c65
R² = r2(calcurve)

# ╔═╡ f2ef2da0-7a24-11eb-1b10-a5b2acefa3cf
begin
	plotly();
	scatter(faas_data.Conc[2:6], faas_data.Abs[2:6], grid = false, legend = (0.1, 0.95), color = "#592C88", border = :box)
	Plots.abline!(k, b, label = "$(round(b, sigdigits = 4)) + $(round(k, sigdigits = 4)) x,  R²=$(round(R², sigdigits=5))", color = "#592C88", linewidth = 2)
	xlims!(0, 5); ylims!(0, 0.3)
	xlabel!("[Zn] (mg/L)"); ylabel!("Absorbance (a.u.)");
end

# ╔═╡ 2ff3fa5e-7a26-11eb-214b-0179162be49f
md"""
### Validate the Standard Curve (QC)
"""

# ╔═╡ a3ca5b58-7a26-11eb-1232-09f8f9d92667
# QC percent difference
qc_expected_conc = 0.5985 #ppm

# ╔═╡ 595ed8c8-7a26-11eb-34f0-61369b347eb3
# QC Concentration
qc_measured_conc = (faas_data.Abs[9] - b) / k # mg/L

# ╔═╡ e5cfe2f0-7caa-11eb-22eb-771f1bb172cf
any(occursin.("QC", faas_data.Sample_ID))

# ╔═╡ cfe749ba-7a26-11eb-17a7-fd5f54b8c3fa
qc_percent_diff = (qc_measured_conc - qc_expected_conc) / qc_expected_conc * 100

# ╔═╡ ecc0a466-7a2d-11eb-1851-3d090902ebe7
md"""
### Determine LOD & LOQ
"""

# ╔═╡ f4f2e6ba-7a2d-11eb-0b4f-4f6cf4184a28
LOD = (3 * std(faas_data[1, 7:9])) / k # mg/L

# ╔═╡ 97995ba4-7a2e-11eb-0fbc-25f4a70bdc89
LOQ = (10 * std(faas_data[1, 7:9])) / k # mg/L

# ╔═╡ e9165720-7a26-11eb-2c56-4d9921be73ff
md"""
## Determine the Sample Concentrations
"""

# ╔═╡ 205c8278-7a2b-11eb-02e2-23ac064ac955
sample_signal = mean(Matrix(faas_data[8:9, 7:9]), dims = 2)

# ╔═╡ f56f7510-7a26-11eb-257c-5f7e92550ee9
sample_concs = (sample_signal .- b) ./ k
# Should be a 1x2 array of sample concentrations

# ╔═╡ 9dfa0f24-7a27-11eb-3922-71e865011996
md"""
### Compare Means
"""

# ╔═╡ dd412844-7a30-11eb-3ee5-4f59c2dea04b
md"""
**True or false: There is a significant difference between the pre- and post-vape samples. (Fill in your answer below.)**
"""

# ╔═╡ fbe65454-7a30-11eb-1d7b-c580d4d9fb63
signif_diff = false;

# ╔═╡ f99c6cbc-7cab-11eb-1b70-89d56f43dcf8
md"""
# Conclusions

"""

# ╔═╡ fbf33cd2-7cab-11eb-2183-81fbff3524d5
md"""
# References

1. Insert your references here in ACS format.    
2. Make sure any references you use are cited in the text of your notebook, and *vice-versa*.

"""

# ╔═╡ 475e5f76-7a27-11eb-1f94-494d0972f77f
# Leave this chunk alone -- it's a custom function you will need!

function calculateCI(model, std_conc, std_signal, new_signal; t = 3.182)
	sᵣ = sqrt((deviance(model) / dof_residual(model)));
	
	if length(coef(model)) > 1
		CI = (sᵣ/coef(model)[2]) * sqrt((1/length(predict(model))) + (1/length(new_signal)) + ((mean(new_signal) - mean(std_signal))^2 / (coef(model)[2]^2 * sum((std_conc .- mean(std_conc)).^2)))) * t
	
	else
		
		CI = (sᵣ/coef(model)[1]) * sqrt((1/length(predict(model))) + (1/length(new_signal)) + ((mean(new_signal) - mean(std_signal))^2 / (coef(model)[1]^2 * sum((std_conc .- mean(std_conc)).^2)))) * t
		
	end
end;

# ╔═╡ 183a4ee0-7a2b-11eb-098e-873fcc0d0cc9
pre_vape_CI = calculateCI(calcurve, faas_data.Conc[2:6], faas_data.Abs[2:6], sample_signal[1, 1])

# ╔═╡ 7ffb39a6-7a27-11eb-2c0a-5d34c20ed936
post_vape_CI = calculateCI(calcurve, faas_data.Conc[2:6], faas_data.Abs[2:6], sample_signal[2, 1])

# ╔═╡ acb54dd0-7a27-11eb-1b75-57a339a5498d
begin
	bar(sample_concs, grid = false, color = [:dodgerblue, :red3], yerror = [pre_vape_CI, post_vape_CI], border = :box, legend = false, xticks=(1:2, ["Pre-vape", "Post-vape"]), xtickfont=font(16), ytickfont=font(12), guidefont=font(16))
	xlims!(0.5, 2.5); ylims!(0, 4); ylabel!("[Zn] (mg/L)")
	Plots.abline!(0, 0, color = "#000000")
end

# ╔═╡ 047b8ff8-7a31-11eb-1edb-2b8b880ffdc3
if !ismissing(signif_diff)
	if typeof(signif_diff) != Bool
	md""" 
	!!! danger
	    Make sure you used `true` or `false` (all lowercase) to specify you answer in the cell above.
	"""
	else
		if sample_concs[1] < sample_concs[2] 
			bs8 = sample_concs[1] + pre_vape_CI < sample_concs[2] - post_vape_CI;
		else
			bs8 = sample_concs[1] + pre_vape_CI > sample_concs[2] - post_vape_CI;
		end
		md""" 
	!!! correct "Good Job"
	    You entered your answer correctly.  It will be graded by your instructor.
	"""
	end
else
	bs8 = false;
	md""" 
	!!! danger
	    Make sure you specify whether or not there's a significant difference using `true` or `false` in the cell above.
	"""
end

# ╔═╡ f076d636-7a33-11eb-3373-11f986c1594a
# do not modify or delete this!!!

begin
	function checkFormat(n)
		if nrow(n) == 9
			return true
		else
			return false
		end
	end
	function ck(y, z)
		b = DataFrame(Abs = mean(Matrix(faas_data[!, 7:9]), dims = 2)[:, 1], Conc = faas_data.Conc) 
		f = lm(@formula(Abs ~ Conc), b[2:6, :])
		return coef(f)[1] == coef(z)[1] && coef(f)[2] == coef(z)[2]
	end
	function q(s, m)
		return round((3*s)/k, sigdigits = 4), round((10*s)/k, sigdigits = 4)
	end
	function cc(v, b, n)
		return (v-b) / n
	end
	function ccc(vc, x)
		return vc == x
	end
	function pd(m, e)
		p = (m - e) / e
		return p, p * 100
	end
	function pdc(p, s)
		return p[1] == s || p[2] == s
	end
end;

# ╔═╡ d684aa1c-7a30-11eb-1eec-f7d30b0eb462
if !ismissing(faas_data)
	if checkFormat(faas_data)
	bs1 = true
	md"""
	!!! correct "Looks Good"
	    Your dataframe appears correct. 
	"""
	else
	bs1 = false
	md"""
	!!! danger "Oops!"
	    Your dataframe appears incorrect.  It should have 12 columns and 9 rows.  Things to check: Did you export the right format?  Did modify the CSV file in any way? Have you modified the data frame in any way?  You must keep the data in the same format the instrument gave you for this template to work.
	"""
	end
else bs1 = false
			md"""
	!!! hint 
	    Import your first data using `CSV.read("filename.csv", DataFrame)`.  Use the argument `normalizenames = true` to get rid of the spaces and parentheses in the column names (it'll make things easier later on).
	"""
end

# ╔═╡ 76eb8b9a-7ca4-11eb-35c8-d1aee5341df6
if !ismissing(faas_data) && any(names(faas_data) .== "Conc")
	if checkFormat(faas_data)
	md"""
	!!! correct "Looks Good"
	    Your have a concentration column named correctly.
	"""
	else
	md"""
	!!! danger "Oops!"
	    Enter your concentrations as a new column called "Conc".
	"""
	end
else
			md"""
	!!! hint 
	     Enter your concentrations as a new column called "Conc".
	"""
end

# ╔═╡ 286e4388-7a36-11eb-1c43-4fbc4d760198
if !ismissing(calcurve)
	if ck(faas_data, calcurve)
	bs2 = true
	md"""
	!!! correct 
	    Your fit coefficients are correct. 
	"""
	else
	bs2 = false
	md"""
	!!! danger "Oops!"
	    Your fit appears incorrect.
	"""
	end
else bs2 = false
			md"""
	!!! hint 
	    Fit your data using `lm(@formula(y~x), DataFrame)`.  See Lab 2 for an example.
	"""
end

# ╔═╡ 8f00af82-7a36-11eb-2e05-83e75532c360
if !ismissing(qc_measured_conc)
	if any(occursin.("QC", faas_data.Sample_ID))
		adat = mean(Matrix(faas_data[occursin.("QC", faas_data.Sample_ID), 7:9]), dims = 2)[:, 1]
		stp = false
	elseif any(occursin.("qc", faas_data.Sample_ID))
		adat = mean(Matrix(faas_data[occursin.("qc", faas_data.Sample_ID), 7:9]), dims = 2)[:, 1]
		stp = false
	else
		bs3 = false
		md"""
	    !!! danger 
	        Make sure you have a sample called "QC".  
		"""
		stp = true
	end

	if stp != true
		if ccc(cc(adat[1], b, k), qc_measured_conc)
		bs3 = true
		md"""
		!!! correct 
		    Your QC measured concentration is correct. 
		"""
		else
		bs3 = false
		md"""
		!!! danger "Oops!"
		    Your QC measured concentration appears incorrect.
		"""
		end
	end
else bs3 = false
			md"""
	!!! hint 
	    Determine your QC concentration based on your standard curve coefficients.  See Lab 2 for an example.
	"""
end

# ╔═╡ 340a4a44-7cab-11eb-0e3c-95805ce58672
adat

# ╔═╡ 71434b8a-7a38-11eb-146c-197c97541c2d
if !ismissing(qc_percent_diff)
	if pd(qc_measured_conc, qc_expected_conc)[2] > 5
		bs5 = false
	else
		bs5 = true
	end
	if pdc(pd(qc_measured_conc, qc_expected_conc), qc_percent_diff)
	bs4 = true
	md"""
	!!! correct 
	    Your QC percent difference is correct. 
	"""
	else
	bs4 = false
	md"""
	!!! danger "Oops!"
	    Your QC percent difference appears incorrect.
	"""
	end
else bs4 = false
			md"""
	!!! hint 
	    Determine your QC percent difference based on your measured and known concentrations.  See Lab 2 for an example.
	"""

end

# ╔═╡ 4333cafc-7a37-11eb-0fa5-a5f811e0a16e
if !ismissing(LOQ)
	t = q(std(Array((faas_data[occursin.("lank", faas_data.Sample_ID), 7:9]))), k)
	let LOD = round(LOD, sigdigits = 4), LOQ = round(LOQ, sigdigits = 4)
	
		if t[1] == LOD && t[2] == LOQ
		global bs6 = t[1] == LOD && t[2] == LOQ
		md"""
		!!! correct 
		    Your LOD and LOQ are correct. 
		"""
		elseif t[1] != LOD && t[2] == LOQ
		global bs6 = t[1] != LOD && t[2] == LOQ
		md"""
		!!! danger "Oops!"
		    Your LOD is incorrect.
		"""
		elseif t[1] == LOD && t[2] != LOQ
		global bs6 = t[1] == LOD && t[2] != LOQ
		md"""
		!!! danger "Oops!"
		    Your LOQ is incorrect.
		"""
		else
		global bs6 = false
		md"""
		!!! danger
		    Your LOD and/or LOQ appear incorrect.
		"""
		end
	end
else global bs6 = false
			md"""
	!!! hint 
	    Determine your LOD and LOQ based on the standard deviation of your blank sample (SD\_Corr\_Abs\_).  See Lab 2 for an example.
	"""
end

# ╔═╡ 480c57da-7a3a-11eb-06ec-798002fe689e
if !ismissing(sample_concs) && length(sample_concs) == 2
	if sample_concs == cc.(sample_signal, b, k)
	bs7 = true
	md"""
	!!! correct 
	    Your concentrations are correct. 
	"""
	else
	md"""
	!!! danger
	    Your concentrations appear incorrect.
	"""
	end
else bs7 = false
			md"""
	!!! hint 
	    Determine your pre- and post-vape concentrations based your standard curve.  See Lab 2 for an example.  You should create a 1 row by 2 column array.
	"""
end

# ╔═╡ 6a7b5e78-7a3b-11eb-00c4-5f3c3020e8d2
# do not modify or delete this!!!

begin
bs = [bs1 bs2 bs3 bs4 bs5 bs6 bs7 bs8]
bss = sum(bs)/length(bs)
if bss > 0.95 s = 5.0
elseif bss > 0.80 && bss < 0.96 s = 3.0
	else s = 0.0
end
end

# ╔═╡ Cell order:
# ╟─843abe86-7cab-11eb-14e0-cb78f4ebf601
# ╟─88947592-7cab-11eb-0fcb-eba69da36ce5
# ╟─93adb760-7cab-11eb-3418-636173332201
# ╟─9acd14e6-7cab-11eb-257d-6b39ac4b5093
# ╟─a41aaba8-7cab-11eb-1b3e-79e48174489f
# ╟─b2a0d8a2-7cab-11eb-0ff5-4182faa410b3
# ╠═9daa4a1a-7ca3-11eb-2124-a744fc0a5be0
# ╟─b63201ce-7cab-11eb-33ff-8587745784f2
# ╟─bc0242e4-7cab-11eb-0fb0-810ce7d3f0eb
# ╟─ee21d98a-7cab-11eb-3186-2bcbfc2393e5
# ╠═c05fe2d0-7a1f-11eb-30fc-85a392f0cc6c
# ╟─0ffa9644-7cac-11eb-2922-cb2e9c0df2f6
# ╠═2db2f670-7bc3-11eb-3ae7-29c1243fd2ff
# ╟─d684aa1c-7a30-11eb-1eec-f7d30b0eb462
# ╠═03128dc2-7ca4-11eb-3207-c7fc203faefc
# ╟─76eb8b9a-7ca4-11eb-35c8-d1aee5341df6
# ╟─32577ba8-7cac-11eb-3dc2-ab14a977ae9d
# ╠═489de90a-7ca3-11eb-1e3a-9fbe2eb89436
# ╟─24d3fa6c-7a20-11eb-3e8f-9b52f9aeef68
# ╠═32c68a72-7a20-11eb-0125-85c8890c97b3
# ╟─286e4388-7a36-11eb-1c43-4fbc4d760198
# ╠═cd8e499c-7a24-11eb-084d-7d4d7e15bab6
# ╠═dbdce38c-7a24-11eb-19e0-ad127a66b14a
# ╠═e28e60fe-7a24-11eb-3594-85a37e1c6c65
# ╠═f2ef2da0-7a24-11eb-1b10-a5b2acefa3cf
# ╟─2ff3fa5e-7a26-11eb-214b-0179162be49f
# ╠═a3ca5b58-7a26-11eb-1232-09f8f9d92667
# ╠═595ed8c8-7a26-11eb-34f0-61369b347eb3
# ╠═e5cfe2f0-7caa-11eb-22eb-771f1bb172cf
# ╟─8f00af82-7a36-11eb-2e05-83e75532c360
# ╠═340a4a44-7cab-11eb-0e3c-95805ce58672
# ╠═cfe749ba-7a26-11eb-17a7-fd5f54b8c3fa
# ╟─71434b8a-7a38-11eb-146c-197c97541c2d
# ╟─ecc0a466-7a2d-11eb-1851-3d090902ebe7
# ╠═f4f2e6ba-7a2d-11eb-0b4f-4f6cf4184a28
# ╠═97995ba4-7a2e-11eb-0fbc-25f4a70bdc89
# ╟─4333cafc-7a37-11eb-0fa5-a5f811e0a16e
# ╟─e9165720-7a26-11eb-2c56-4d9921be73ff
# ╠═205c8278-7a2b-11eb-02e2-23ac064ac955
# ╠═f56f7510-7a26-11eb-257c-5f7e92550ee9
# ╟─480c57da-7a3a-11eb-06ec-798002fe689e
# ╠═183a4ee0-7a2b-11eb-098e-873fcc0d0cc9
# ╠═7ffb39a6-7a27-11eb-2c0a-5d34c20ed936
# ╟─9dfa0f24-7a27-11eb-3922-71e865011996
# ╠═acb54dd0-7a27-11eb-1b75-57a339a5498d
# ╟─dd412844-7a30-11eb-3ee5-4f59c2dea04b
# ╠═fbe65454-7a30-11eb-1d7b-c580d4d9fb63
# ╟─047b8ff8-7a31-11eb-1edb-2b8b880ffdc3
# ╟─f99c6cbc-7cab-11eb-1b70-89d56f43dcf8
# ╟─fbf33cd2-7cab-11eb-2183-81fbff3524d5
# ╠═475e5f76-7a27-11eb-1f94-494d0972f77f
# ╠═f076d636-7a33-11eb-3373-11f986c1594a
# ╠═6a7b5e78-7a3b-11eb-00c4-5f3c3020e8d2
