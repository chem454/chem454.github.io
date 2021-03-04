### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ 4ae04c94-78bd-11eb-3fbc-1100761316d0
using CSV, DataFrames, Plots, Statistics

# ╔═╡ 3bc95926-78ca-11eb-2ac4-1dabed09ddd7
md"""
# Title

**Your Name**

February 27, 2021
"""

# ╔═╡ 50d91580-7c90-11eb-262b-4d9d60357376
md"""
**NOTE:** *The sections listed in this template are meant to be a guide to help you determine what information you should include and different ways of presenting that information.  I encourage you to make it your own!  You are free to add sections, rearrange information, etc., in a way that works for you, so long as the notebook stays organized and easy to understand.*

*You should delete the template text (like this) before you turn your notebook in.*
"""

# ╔═╡ 503be9d4-78ca-11eb-3193-c37d66d2f95f
md"""
# Introduction

Your introduction goes here.

"""

# ╔═╡ 5890957e-78ca-11eb-05aa-536cf337874c
md"""
# Materials and Methods

Add your methods here, with enough detail that someone could *exactly* reproduce your experiment with no other resources.

"""

# ╔═╡ 6efee05e-7c8f-11eb-3724-0111656bf807
md"""
**Table 1: Sample Summaries**

| Sample ID    | Manufacturer | Flavor | Advertised Nic. Conc. (mg/mL) |
| -----        | ------       | -----  | :-----:                       |
| Sample 1 ID  |              |        |                               |

*You can add more columns to this table if you want to.*

"""

# ╔═╡ ddf851fc-7c8f-11eb-3185-8d2f326ff6de
md"""
## Laboratory Methods & Sample Prep

1. Add your sample prep and lab procedures here.  
2. Remember to include exact quantities just like you would in a paper notebook.
"""

# ╔═╡ c55e8fc6-7c8f-11eb-19b9-8779f06dfef3
md"""
## Instrumental Methods

*Insert info about the steps you used on the instrument here.*

"""

# ╔═╡ 6288abd6-78ca-11eb-15e0-37a6bed8d836
md"""
**Table 2: FT-IR Parameters**

|   Parameter    |   Value    |
| :--------       | :--------:   |
| Make               |            |
| Model              |            |
| etc...see website for example |            |
"""

# ╔═╡ b0f34c52-78ca-11eb-21b2-55ea50051747
md"""
# Results and Data Processing
"""

# ╔═╡ 1252c44a-7912-11eb-30a2-4174b29cc92e
md"""
## Import
"""

# ╔═╡ 20600570-7912-11eb-2ecf-87517fee3051
md"""
### Reference Data
"""

# ╔═╡ c124ab2c-78be-11eb-2a56-9bb5f9c9777b
reference_spectrum = missing;

# ╔═╡ 9bfe2b2c-7911-11eb-1060-e93f7885ce59
reference_spectrum

# ╔═╡ 34024f78-7912-11eb-18b8-393890e9d088
md"""
### Sample 1 Data
"""

# ╔═╡ 52927184-78bf-11eb-3408-594d9d7670bb
sample1_spectrum = missing;

# ╔═╡ 49173ad6-7912-11eb-2425-df41bd95f462
md"""
### Sample 2 Data
"""

# ╔═╡ 69f54f0e-78bf-11eb-266c-fb952c315e2f
sample2_spectrum = missing;

# ╔═╡ 03800716-7912-11eb-3024-bf5760b9726b
md"""
## Normalize
"""

# ╔═╡ dba12458-79f4-11eb-28be-0310de3b9c2d
md"""
### Reference Data
"""

# ╔═╡ bb4fbcd4-79f2-11eb-2319-01ef5b9b84bf
reference_baseline =  missing;

# ╔═╡ 01bf8818-79f1-11eb-0a33-c1aa0f0c6d51
reference_normalized = missing;

# ╔═╡ ce9f4f82-79f4-11eb-22c6-db400b8ccd4e
md"""
### Sample 1 Data
"""

# ╔═╡ 90580e62-79f4-11eb-37cc-c16154f397f2
sample1_baseline = missing;

# ╔═╡ 901ab742-79f4-11eb-17db-51f0c74979a6
sample1_normalized = missing;

# ╔═╡ d6171d94-79f4-11eb-0fa7-7b4ec0c67b3b
md"""
### Sample 2 Data
"""

# ╔═╡ bdfe3d46-79f4-11eb-106a-298771593f83
sample2_baseline = missing;

# ╔═╡ bddbc112-79f4-11eb-2bb2-d7ffbc740c81
sample2_normalized = missing;

# ╔═╡ 4f6fe5ea-7919-11eb-1d9e-578d1ddc63ba
md"""
## Mean
"""

# ╔═╡ 4b9e3820-79f4-11eb-166b-7726a7e6f03a
## Calculate the mean of your normalized reference data and add it as a new column to your original reference data frame.
## Call the column "Corrected_A"

# ╔═╡ 4b0fb760-79f4-11eb-3882-3f9aa5bd6945
## Calculate the mean of your normalized sample 1 data and add it as a new column to your original sample 1 data frame.
## Call the column "Corrected_A"

# ╔═╡ deea11f0-79f3-11eb-05c8-6584ac6e8c20
## Calculate the mean of your normalized sample 2 data and add it as a new column to your original sample 2 data frame.
## Call the column "Corrected_A"

# ╔═╡ 7d3927e2-791a-11eb-0f0b-379d0e1dc27b
md"""
## Processed Data Sets
"""

# ╔═╡ 9deea930-791a-11eb-0e88-cf26226782f8
md"""
### Reference
"""

# ╔═╡ d23d96ba-791f-11eb-1676-4bf5aea1cd0d
# This will display your processed data.  There is nothing you need to do here.
reference_spectrum

# ╔═╡ ac66d8c0-791a-11eb-0a18-9db4352cb924
md"""
### Sample 1
"""

# ╔═╡ cb8fe602-791e-11eb-2c19-8de4917d3dde
# This will display your processed data.  There is nothing you need to do here.
sample1_spectrum

# ╔═╡ b45567d6-791a-11eb-07ef-25c21a21bf3d
md"""
### Sample 2
"""

# ╔═╡ 8d600a1e-791a-11eb-31c7-63d98d85707b
# This will display your processed data.  There is nothing you need to do here.
sample2_spectrum

# ╔═╡ d5b13cf8-791e-11eb-3fd7-e58c7c3bcc5f
md"""
## Plot
"""

# ╔═╡ 719be4a6-78c5-11eb-1776-699c4f5b64b9
begin
	plotly();
	
end

# ╔═╡ a6bea1ca-78c3-11eb-0353-6128ec73d49f
HQI1 = missing;

# ╔═╡ bbc0d138-78c8-11eb-3124-03cba813b4b9
HQI2 = missing;

# ╔═╡ fa194f3a-78ca-11eb-3970-a59ca63e5687
md"""
# Conclusions

"""

# ╔═╡ d4d78d36-7a00-11eb-1457-77f47c912d6c
md"""
Your conclusions go here.
"""

# ╔═╡ 05894e92-78cb-11eb-2dda-5b89c7e14514
md"""
# References

1. Insert your references here in ACS format.    
2. Make sure any references you use are cited in the text of your notebook, and *vice-versa*.

"""

# ╔═╡ 87d9bb80-7a00-11eb-0c65-5d7235fe7639


# ╔═╡ 835a69a2-78bf-11eb-0576-b9729ce6091e
# do not modify or delete this!!!

begin
	function checkFormat(n)
		if nrow(n) > 3000 && ncol(n) == 2 || names(n)[2] == "A"
			return true
		else
			return false
		end
	end
	function z(a::DataFrame)
		return select(a, AsTable(occursin.("A", names(a)) .* (length.(names(a)) .< 5)) => ByRow(mean))[!, 1]
	end
	function a(z)
		return z .- minimum(z)
	end
	function b(n)
		return n ./ maximum(n)
	end
	function c(x, y)
		size(x)[1] != 1 ? x = x' : x
		size(y)[1] != 1 ? y = y' : y
		return (x * y')^2 / ((x * x') * (y * y'))
	end
	function checkHQI(x, y, w)
		e = c(
			mean(nm(x), dims = 2), 
			mean(nm(y), dims = 2)
		)[1]
		return e, round(e, sigdigits = 4) == round(w, sigdigits = 4)
	end
	# function checkHQI(x, y, w)
	# 	e = c(b(a(z(x))), b(a(z(y))))
	# 	return e == w
	# end
	function cm(m::DataFrame)
		s = ones(nrow(m), 3)
		for i in 2:4 
			s[:, i-1] = m[!, i] .- minimum(m[!, i])
		end
		return s
	end
	function nm(m::DataFrame)
		s = cm(m)
		for i in 1:3 
			s[:, i] = s[:, i] ./ maximum(s[:, i])
		end
		return s
	end
end;

# ╔═╡ af342e94-78cb-11eb-2139-9b4a3870c74c
if !ismissing(reference_spectrum)
	if checkFormat(reference_spectrum)
	sa1 = true
	md"""
	!!! correct
	    Your dataframe appears correct.  Do the same for the other two spectra!
	"""
	else
	sa1 = false
	md"""
	!!! danger "Oops!"
	    Your dataframe appears incorrect.  It should have (1) a column for frequency, (2-4) 3 absorbance columns columns and 3000-4000 rows.  Things to check: Did you skip the metadata row?  Did you add all three replicates to the data frame?  Did you rerun the first cell with `reference_spectrum = ...` after adding the new columns? **Make sure your spectra are in columns 2-4!**
		
	!!! hint
	    Did you skip the metadata row? Use `CSV.read(filename.csv, DataFrame, header = 2)` to start importing at row 2? 
		
	!!! hint
	    Did you add all three replicates to the data frame? Add the other two replicates to your data frame using something like `reference_spectrum[!, "NewColumnName"] = CSV.read(filename-2.csv, DataFrame, header = 2)`.	**Make sure your spectra are in columns 2-4!**
	"""
	end
else sa1 = false
			md"""
	!!! hint 
	    Import your first spectrum using `CSV.read("filename.csv", DataFrame)`.  Add the other two replicates to your data frame using something like `reference_spectrum[!, "NewColumnName"] = CSV.read(filename-2.csv, DataFrame, header = 2)`.
	"""
end

# ╔═╡ 49d974e6-79f5-11eb-328c-4d97cf0ebae3
if !ismissing(sample1_spectrum)
	if checkFormat(sample1_spectrum)
	sa2 = true
	md"""
	!!! correct
	    Your dataframe appears correct.  Do the same for the other replicates and then the last sample!
	"""
	else
	sa2 = false
	md"""
	!!! danger "Oops!"
	    Your dataframe appears incorrect.  It should have (1) a column for frequency, (2-4) 3 absorbance columns columns and 3000-4000 rows.  Things to check: Did you skip the metadata row?  Did you add all three replicates to the data frame?  Did you rerun the first cell with `reference_spectrum = ...` after adding the new columns? **Make sure your spectra are in columns 2-4!**
		
	!!! hint
	    Did you skip the metadata row? Use `CSV.read(filename.csv, DataFrame, header = 2)` to start importing at row 2? **Make sure your spectra are in columns 2-4!**
		
	!!! hint
	    Did you add all three replicates to the data frame? Add the other two replicates to your data frame using something like `reference_spectrum[!, "NewColumnName"] = CSV.read(filename-2.csv, DataFrame, drop = 2)`.	**Make sure your spectra are in columns 2-4!**
	"""
	end
else sa2 = false
		md"""
	!!! hint 
	    Import your data using `CSV.read("filename.csv", DataFrame)`.
	"""
end

# ╔═╡ 4a930ade-79f5-11eb-1635-3147dc874b69
if !ismissing(sample2_spectrum)
	if checkFormat(sample2_spectrum)
	sa3 = true
	md"""
	!!! correct
	    Your dataframe appears correct.  Do the same for the other replicates!
	"""
	else
	sa3 = false
	md"""
	!!! danger "Oops!"
	    Your dataframe appears incorrect.  It should have (1) a column for frequency, (2-4) 3 absorbance columns columns and 3000-4000 rows.  Things to check: Did you skip the metadata row?  Did you add all three replicates to the data frame?  Did you rerun the first cell with `reference_spectrum = ...` after adding the new columns? **Make sure your spectra are in columns 2-4!**
		
	!!! hint
	    Did you skip the metadata row? Use `CSV.read(filename.csv, DataFrame, header = 2)` to start importing at row 2? 
		
	!!! hint
	    Did you add all three replicates to the data frame? Add the other two replicates to your data frame using something like `reference_spectrum[!, "NewColumnName"] = CSV.read(filename-2.csv, DataFrame, drop = 2)`.	**Make sure your spectra are in columns 2-4!**
	"""
	end
else sa3 = false
		md"""
	!!! hint 
	    Import your data using `CSV.read("filename.csv", DataFrame)`.
	"""
end

# ╔═╡ d5cfad76-79f5-11eb-3b9d-150506bb5ca9
if !ismissing(reference_baseline)
	if cm(reference_spectrum) == Matrix(reference_baseline)
	sa4 = true
	md"""
	!!! correct
	    Your reference baseline appears correct.  Do the same for the other samples!
	"""
	else
	sa4 = false
	md"""
	!!! danger "Oops!"
	    Your baseline appears incorrect.
	
	!!! hint
		You should subtract the minimum absorbance value in each spectrum from every absorbance value in each spectrum.
	"""
	end
else sa4 = false
		md"""
	!!! hint 
	    Baseline correct your data.  This means you subtract the minimum absorbance value in each spectrum from every absorbance value in each spectrum.
	"""
end

# ╔═╡ 53898142-79fa-11eb-1aa0-e3077ecbc811
if !ismissing(reference_normalized)
	if nm(reference_spectrum) == Matrix(reference_normalized)
	sa5 = true
	md"""
	!!! correct
	    Your normalized reference data appear correct.  Do the same for the other samples!
	"""
	else
	sa5 = false
	md"""
	!!! danger "Oops!"
	    Your normalized data appear incorrect.
		
	!!! hint 
        You should divide each absorbance value in each spectrum by the maximum absorbance value in each spectrum.
	"""
	end
else sa5 = false
		md"""
	!!! hint 
	    Normalize your data to the maximum value in each spectrum.  This means you divide each absorbance value in each spectrum by the maximum absorbance value in each spectrum.
	"""
end

# ╔═╡ 356af6ce-79fc-11eb-2ffa-a5560a3de5fc
if !ismissing(sample1_baseline)
	if cm(sample1_spectrum) == Matrix(sample1_baseline)
	sa6 = true
	md"""
	!!! correct
	    Your baseline appears correct.
	"""
	else
	sa6 = false
	md"""
	!!! danger "Oops!"
	    Your baseline appears incorrect.
	
	!!! hint
		You should subtract the minimum absorbance value in each spectrum from every absorbance value in each spectrum.
	"""
	end
else sa6 = false
		md"""
	!!! hint 
	    Baseline correct your data.  This means you subtract the minimum absorbance value in each spectrum from every absorbance value in each spectrum.
	"""
end

# ╔═╡ fc38a4f0-79fb-11eb-2e59-3d6a47231ee3
if !ismissing(sample1_normalized)
	if nm(sample1_spectrum) == Matrix(sample1_normalized)
	sa7 = true
	md"""
	!!! correct
	    Your normalized data appear correct.
	"""
	else
	sa7 = false
	md"""
	!!! danger "Oops!"
	    Your normalized data appear incorrect.
		
	!!! hint 
        You should divide each absorbance value in each spectrum by the maximum absorbance value in each spectrum.
	"""
	end
else sa7 = false
		md"""
	!!! hint 
	    Normalize your data to the maximum value in each spectrum.  This means you divide each absorbance value in each spectrum by the maximum absorbance value in each spectrum.
	"""
end

# ╔═╡ 62df44e8-79fc-11eb-1bd6-cf7683951f68
if !ismissing(sample2_baseline)
	if cm(sample2_spectrum) == Matrix(sample2_baseline)
	sa8 = true
	md"""
	!!! correct
	    Your baseline appears correct.
	"""
	else
	sa8 = false
	md"""
	!!! danger "Oops!"
	    Your baseline appears incorrect.
	
	!!! hint
		You should subtract the minimum absorbance value in each spectrum from every absorbance value in each spectrum.
	"""
	end
else sa8 = false
		md"""
	!!! hint 
	    Baseline correct your data.  This means you subtract the minimum absorbance value in each spectrum from every absorbance value in each spectrum.
	"""
end

# ╔═╡ 70edc35c-79fc-11eb-3889-c30b2ecf6261
if !ismissing(sample2_normalized)
	if nm(sample2_spectrum) == Matrix(sample2_normalized)
	sa9 = true
	md"""
	!!! correct
	    Your normalized data appear correct.
	"""
	else
	sa9 = false
	md"""
	!!! danger "Oops!"
	    Your normalized data appear incorrect.
		
	!!! hint 
        You should divide each absorbance value in each spectrum by the maximum absorbance value in each spectrum.
	"""
	end
else sa9 = false
		md"""
	!!! hint 
	    Normalize your data to the maximum value in each spectrum.  This means you divide each absorbance value in each spectrum by the maximum absorbance value in each spectrum.
	"""
end

# ╔═╡ c7aa4822-78c7-11eb-3158-3d8712a02db2
if !ismissing(HQI1)
	if checkHQI(reference_spectrum, sample1_spectrum, HQI1)[2]
		sa10 = true
		md"""
		!!! correct
			Your HQI is correct!
		"""
	else
		sa10 = false
		md"""
		!!! danger "Oops!"
			Your HQI is incorrect.
		"""
	end
else
	sa10 = false;
	md"""
	!!! hint 
	    Calculate the HQI for Sample 1 vs the Reference.  See the Lab Manual for more info.
	"""
end

# ╔═╡ c8f7c53c-78c8-11eb-3581-056b68d95d5d
if !ismissing(HQI2)
	if checkHQI(reference_spectrum, sample2_spectrum, HQI2)[2]
		sa11 = true
		md"""
		!!! correct
			Your HQI is correct!
		"""
	else
		sa11 = false
		md"""
		!!! danger "Oops!"
			Your HQI is incorrect.
		"""
	end
else
	sa11 = false;
		md"""
	!!! hint 
	    Calculate the HQI for Sample 2 vs the Reference.  See the Lab Manual for more info.
	"""
end

# ╔═╡ 422ef4e0-7926-11eb-0395-d9d791cb534e
# do not modify or delete this!!!

begin
	sa = [sa1, sa2, sa3, sa4, sa5, sa6, sa7, sa8, sa9, sa10, sa11];
	ssa = sum(sa)/length(sa)
	if ssa > 0.85 5.0
	elseif ssa > 0.4 && ssa < 0.86 3.0
	else 0.0
	end
end

# ╔═╡ Cell order:
# ╟─3bc95926-78ca-11eb-2ac4-1dabed09ddd7
# ╟─50d91580-7c90-11eb-262b-4d9d60357376
# ╟─503be9d4-78ca-11eb-3193-c37d66d2f95f
# ╟─5890957e-78ca-11eb-05aa-536cf337874c
# ╟─6efee05e-7c8f-11eb-3724-0111656bf807
# ╟─ddf851fc-7c8f-11eb-3185-8d2f326ff6de
# ╟─c55e8fc6-7c8f-11eb-19b9-8779f06dfef3
# ╟─6288abd6-78ca-11eb-15e0-37a6bed8d836
# ╟─b0f34c52-78ca-11eb-21b2-55ea50051747
# ╠═4ae04c94-78bd-11eb-3fbc-1100761316d0
# ╟─1252c44a-7912-11eb-30a2-4174b29cc92e
# ╟─20600570-7912-11eb-2ecf-87517fee3051
# ╠═c124ab2c-78be-11eb-2a56-9bb5f9c9777b
# ╟─9bfe2b2c-7911-11eb-1060-e93f7885ce59
# ╟─af342e94-78cb-11eb-2139-9b4a3870c74c
# ╟─34024f78-7912-11eb-18b8-393890e9d088
# ╠═52927184-78bf-11eb-3408-594d9d7670bb
# ╟─49d974e6-79f5-11eb-328c-4d97cf0ebae3
# ╟─49173ad6-7912-11eb-2425-df41bd95f462
# ╠═69f54f0e-78bf-11eb-266c-fb952c315e2f
# ╟─4a930ade-79f5-11eb-1635-3147dc874b69
# ╟─03800716-7912-11eb-3024-bf5760b9726b
# ╟─dba12458-79f4-11eb-28be-0310de3b9c2d
# ╠═bb4fbcd4-79f2-11eb-2319-01ef5b9b84bf
# ╟─d5cfad76-79f5-11eb-3b9d-150506bb5ca9
# ╠═01bf8818-79f1-11eb-0a33-c1aa0f0c6d51
# ╟─53898142-79fa-11eb-1aa0-e3077ecbc811
# ╟─ce9f4f82-79f4-11eb-22c6-db400b8ccd4e
# ╠═90580e62-79f4-11eb-37cc-c16154f397f2
# ╟─356af6ce-79fc-11eb-2ffa-a5560a3de5fc
# ╠═901ab742-79f4-11eb-17db-51f0c74979a6
# ╟─fc38a4f0-79fb-11eb-2e59-3d6a47231ee3
# ╟─d6171d94-79f4-11eb-0fa7-7b4ec0c67b3b
# ╠═bdfe3d46-79f4-11eb-106a-298771593f83
# ╟─62df44e8-79fc-11eb-1bd6-cf7683951f68
# ╠═bddbc112-79f4-11eb-2bb2-d7ffbc740c81
# ╟─70edc35c-79fc-11eb-3889-c30b2ecf6261
# ╟─4f6fe5ea-7919-11eb-1d9e-578d1ddc63ba
# ╠═4b9e3820-79f4-11eb-166b-7726a7e6f03a
# ╠═4b0fb760-79f4-11eb-3882-3f9aa5bd6945
# ╠═deea11f0-79f3-11eb-05c8-6584ac6e8c20
# ╟─7d3927e2-791a-11eb-0f0b-379d0e1dc27b
# ╟─9deea930-791a-11eb-0e88-cf26226782f8
# ╠═d23d96ba-791f-11eb-1676-4bf5aea1cd0d
# ╠═ac66d8c0-791a-11eb-0a18-9db4352cb924
# ╠═cb8fe602-791e-11eb-2c19-8de4917d3dde
# ╟─b45567d6-791a-11eb-07ef-25c21a21bf3d
# ╠═8d600a1e-791a-11eb-31c7-63d98d85707b
# ╟─d5b13cf8-791e-11eb-3fd7-e58c7c3bcc5f
# ╠═719be4a6-78c5-11eb-1776-699c4f5b64b9
# ╠═a6bea1ca-78c3-11eb-0353-6128ec73d49f
# ╟─c7aa4822-78c7-11eb-3158-3d8712a02db2
# ╠═bbc0d138-78c8-11eb-3124-03cba813b4b9
# ╟─c8f7c53c-78c8-11eb-3581-056b68d95d5d
# ╟─fa194f3a-78ca-11eb-3970-a59ca63e5687
# ╟─d4d78d36-7a00-11eb-1457-77f47c912d6c
# ╟─05894e92-78cb-11eb-2dda-5b89c7e14514
# ╟─87d9bb80-7a00-11eb-0c65-5d7235fe7639
# ╟─835a69a2-78bf-11eb-0576-b9729ce6091e
# ╟─422ef4e0-7926-11eb-0395-d9d791cb534e
