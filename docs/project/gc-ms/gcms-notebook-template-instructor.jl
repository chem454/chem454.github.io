### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ c05fe2d0-7a1f-11eb-30fc-85a392f0cc6c
using DataFrames, CSV, Plots, GLM

# ╔═╡ 843abe86-7cab-11eb-14e0-cb78f4ebf601
md"""
# Title

**Your Name**

My lab parter was: **Lab Partner's Name**.

April 18, 2021
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

**Table 1: Sample Summary**

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

# ╔═╡ b63201ce-7cab-11eb-33ff-8587745784f2
md"""
## Instrumental Methods

*Insert info about the steps you used on the instrument here.*

"""

# ╔═╡ bc0242e4-7cab-11eb-0fb0-810ce7d3f0eb
md"""
**Table 2: GC Parameters**

|   Parameter    |   Value    |
| :--------       | :--------:   |
| Make               |            |
| Model              |            |
| etc...see website for example |            |
"""

# ╔═╡ 016389bc-a09f-11eb-0e5b-991de36be2e1
md"""
**Table 3: MS Parameters**

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

# ╔═╡ 4716e71c-a09d-11eb-0d31-a324b0f335f1
chromatogram = CSV.read("tic_front.csv", DataFrame, skipto = 3, header = ["Time", "Signal"])

# ╔═╡ 90ca560e-a09e-11eb-3e77-5f38ad1420e5
if !ismissing(chromatogram)
	bs1 = true
	if ncol(chromatogram) == 2
	md"""
	!!! correct "Looks Good"
	"""
	else
	md"""
!!! warning "Not Quite"
    You should end up with two columns: Time and Signal.  You may have to skip some rows (`skipto = n`) and give custom column names (`header = ["name1", "name2"]`).
	"""
	end
else bs1 = false
			md"""
	!!! hint 
	    Import your chromatogram!
	"""
end

# ╔═╡ 312c2fba-a09e-11eb-289d-d3f0d4515394
ms_data_1 = CSV.read("s1-ms-indole.csv", DataFrame, header = ["m/z", "Signal"], skipto = 3)

# ╔═╡ d684aa1c-7a30-11eb-1eec-f7d30b0eb462
if !ismissing(ms_data_1)
	bs2 = true
	if ncol(ms_data_1) == 2
	md"""
	!!! correct "Looks Good"
	"""
	else
	md"""
	!!! warning "Not Quite"
	    You should end up with two columns:  m/z and Signal.  You may have to skip some rows (`skipto = n`) and give custom column names (`header = ["name1", "name2"]`).
	"""
	end
else bs2 = false
			md"""
	!!! hint 
	    Import your chromatogram!
	"""
end

# ╔═╡ 424902d8-a09d-11eb-0506-7d2517cb49ea
ms_data_2 = CSV.read("s1-ms-eugenol.csv", DataFrame, header = ["m/z", "Signal"], skipto = 3)

# ╔═╡ 7ccc2d04-a09d-11eb-3bea-8f50898ff657
if !ismissing(ms_data_2)
	bs3 = true
	if ncol(ms_data_2) == 2
	md"""
	!!! correct "Looks Good"
	"""
	else
	md"""
	!!! warning "Not Quite"
		You should end up with two columns: m/z and Signal.  You may have to skip some rows (`skipto = n`) and give custom column names (`header = ["name1", "name2"]`).
	"""
	end
else bs3 = false
			md"""
	!!! hint 
	    Import your chromatogram!
	"""
end

# ╔═╡ 45ff6be0-a09f-11eb-33a6-e30de3ad1c9c
md"""
## Normalize the Data
"""

# ╔═╡ 5e1b89f0-a0a1-11eb-0dff-57524c679023
md"""
### Chromatogram
"""

# ╔═╡ 5bd1173e-a09f-11eb-128e-bd008aa10722
# Add a third column to the data frames for you chromatogram and mass spectra
# that contains the baseline correct, normalized data.  See Lab 1 (GC-TCD) or
# the FTIR lab for more details.  Call the column "Abundance".

chromatogram.Abundance = chromatogram.Signal .- minimum(chromatogram.Signal);

# ╔═╡ b6a34d4e-a09f-11eb-1abe-db4d77a92ac9
chromatogram.Abundance = chromatogram.Abundance ./ maximum(chromatogram.Abundance);

# ╔═╡ 5c54b47a-a0a1-11eb-3392-2da931010e1f
md"""
### Mass Spectrum 1
"""

# ╔═╡ 5d0e1262-a0a1-11eb-2dee-c3458c3ac57c
# Add a third column to the data frames for your first mass spectrum
# that contains the baseline correct, normalized data.  See Lab 1 (GC-TCD) or
# the FTIR lab for more details.  Call the column "Abundance".
ms_data_1.Abundance = ms_data_1.Signal .- minimum(ms_data_1.Signal);

# ╔═╡ 908043e8-a0a1-11eb-0497-c33c6e44787a
ms_data_1.Abundance = ms_data_1.Abundance ./ maximum(ms_data_1.Abundance);

# ╔═╡ 5d978402-a0a1-11eb-2db0-d92cbc215923
md"""
### Mass Spectrum 2
"""

# ╔═╡ 71ed00bc-a0a1-11eb-3d35-97b1af0a358c
# Add a third column to the data frames for your second mass spectrum
# that contains the baseline correct, normalized data.  See Lab 1 (GC-TCD) or
# the FTIR lab for more details.  Call the column "Abundance".
ms_data_2.Abundance = ms_data_2.Signal .- minimum(ms_data_2.Signal);

# ╔═╡ 918c41bc-a0a1-11eb-312f-e9ac49e9f09a
ms_data_2.Abundance = ms_data_2.Abundance ./ maximum(ms_data_2.Abundance);

# ╔═╡ 09c013d2-84e5-11eb-1f70-4192220bf6d6
md"""
## Plot of the Chromatogram
"""

# ╔═╡ f97920d4-84e4-11eb-375d-d912c0e6c297
plotly()

# ╔═╡ d6190c2c-8533-11eb-3ebb-43222aa25a69
begin
	plot(chromatogram.Time, chromatogram.Abundance, legend = false, grid = false, border = :box, color = :forestgreen)
	xlabel!("Time (min)"); ylabel!("Relative Abundance");
	xlims!(3.1, 15); ylims!(0, 1)
end

# ╔═╡ dcdb244a-a0a2-11eb-19c0-6743a65a1b74
begin
	plot(chromatogram.Time, chromatogram.Abundance, label = "Chromatogram", grid = false, border = :box, color = :forestgreen, legend = (0.1, 0.95))
	xlabel!("Time (min)"); ylabel!("Relative Abundance");
	xlims!(3.5, 7); ylims!(0, 1)
	vline!([4.44], color = :firebrick, linestyle = :dot, label = "MS 1");
	vline!([6.41], color = :dodgerblue, linestyle = :dot, label = "MS 2")
end

# ╔═╡ 7dc2c594-a0a0-11eb-25b8-af9d010e54a7
md"""
## Plot & Interpretation of Mass Spectrum 1
"""

# ╔═╡ f2ef2da0-7a24-11eb-1b10-a5b2acefa3cf
begin
	bar(ms_data_1[!, "m/z"], ms_data_1[!, "Abundance"], legend = false, grid = false, border = :box, color = :firebrick, linecolor = :firebrick)
	xlabel!("Time (min)"); ylabel!("Relative Abundance");
	xlims!(20, 140); ylims!(0, 1)
end

# ╔═╡ e211d078-a0a3-11eb-3ec3-672b3d72bd8c
md"""
**Make sure to show your work for the steps below!!!**
"""

# ╔═╡ 31bd1fa2-a0a3-11eb-213d-8b2662c24550
md"""
### Molecular Ion
"""

# ╔═╡ 454c6af0-a0a3-11eb-3a59-1bcd102b20d4
molion = missing

# ╔═╡ 5eb82d9e-a0a3-11eb-3d70-4752b93c44b2
md"""
### Molecular Weight
"""

# ╔═╡ 7572c832-a0a3-11eb-3085-0933682370a3
molweight = missing

# ╔═╡ d63c0e1c-a0a3-11eb-373c-2f1eb2a03d3a
md"""
### Number Carbon Atoms
"""

# ╔═╡ d5246218-a0a3-11eb-13d1-b592ae1a465f
num_carbon = missing

# ╔═╡ 51831470-a0a3-11eb-3e14-a1f8f3c224b7
md"""
### Number of Nitrogen Atom
"""

# ╔═╡ 5e3d38c8-a0a3-11eb-1d3a-f1cf81b9ad9c
num_nitrogen = missing

# ╔═╡ 76b8e884-a0a3-11eb-03aa-7795a7274685
md"""
### Rings + Double Bonds
"""

# ╔═╡ 81761fee-a0a3-11eb-0d71-d95d91ea9172
num_rdb = missing

# ╔═╡ 81fe8eae-a0a3-11eb-0876-4381181f5129
md"""
### Formula
"""

# ╔═╡ 9c40962e-a0a3-11eb-2942-6d49689f97d1
formula = "formula" # example: "C12H6"

# ╔═╡ 93b036c2-a0a3-11eb-3946-c1444ecba2a0
md"""
### Chemical Name
"""

# ╔═╡ 9d45cd00-a0a3-11eb-061e-55db641dd5e3
chemical = "Name of Chemical"

# ╔═╡ 05a32f8e-a0a2-11eb-0a48-4dd9b4a234db
md"""
## Plot & Interpretation of Mass Spectrum 2
"""

# ╔═╡ 02413732-a0a2-11eb-21a2-5dbbf71652a5
begin
	bar(ms_data_2[!, "m/z"], ms_data_2[!, "Abundance"], legend = false, grid = false, border = :box, color = :dodgerblue, linecolor = :dodgerblue)
	xlabel!("Time (min)"); ylabel!("Relative Abundance");
	xlims!(20, 180); ylims!(0, 1)
end

# ╔═╡ ef0ab1cc-a243-11eb-1ee1-d50fa86d824b
md"""
![eugenol mass spectrum](https://upload.wikimedia.org/wikipedia/commons/9/94/Eugenol2DCSD.svg)
"""

# ╔═╡ 1e548db4-a0a4-11eb-0718-fb96169d7b06
md"""
**Make sure to show your work for the steps below!!!**
"""

# ╔═╡ 1dd632a2-a0a4-11eb-0f21-d3c41f077abe
md"""
### Molecular Ion
"""

# ╔═╡ 1d94bf18-a0a4-11eb-16f2-0b83b9458d57
molion_2 = missing

# ╔═╡ 1d556208-a0a4-11eb-12f9-ad8af965630d
md"""
### Molecular Weight
"""

# ╔═╡ 1d17b7b4-a0a4-11eb-0914-11374168923e
molweight_2 = missing

# ╔═╡ 1cd621dc-a0a4-11eb-2f32-798af4e4a174
md"""
### Number of Nitrogen Atom
"""

# ╔═╡ 1c9737ba-a0a4-11eb-13e0-875591a434d8
num_nitrogen_2 = missing

# ╔═╡ 1c58ab9e-a0a4-11eb-035f-6127c6429663
md"""
### Rings + Double Bonds
"""

# ╔═╡ 1c20cd50-a0a4-11eb-3281-29bed0a6c889
num_rdb_2 = missing

# ╔═╡ 1be2d748-a0a4-11eb-24d5-33b90cbb4094
md"""
### Formula
"""

# ╔═╡ 1badbbe4-a0a4-11eb-28e8-81b53de4f93b
formula_2 = "formula" # example: "C12H6"

# ╔═╡ 1b740a5c-a0a4-11eb-0378-836d84ed045c
md"""
### Chemical Name
"""

# ╔═╡ 1b3e0b28-a0a4-11eb-31eb-ade69bfd978b
chemical_2 = "Name of Chemical"

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

# ╔═╡ 6a7b5e78-7a3b-11eb-00c4-5f3c3020e8d2
# do not modify or delete this!!!

begin
bs = [bs1 bs2 bs3]
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
# ╟─b63201ce-7cab-11eb-33ff-8587745784f2
# ╟─bc0242e4-7cab-11eb-0fb0-810ce7d3f0eb
# ╟─016389bc-a09f-11eb-0e5b-991de36be2e1
# ╟─ee21d98a-7cab-11eb-3186-2bcbfc2393e5
# ╠═c05fe2d0-7a1f-11eb-30fc-85a392f0cc6c
# ╟─0ffa9644-7cac-11eb-2922-cb2e9c0df2f6
# ╠═4716e71c-a09d-11eb-0d31-a324b0f335f1
# ╟─90ca560e-a09e-11eb-3e77-5f38ad1420e5
# ╠═312c2fba-a09e-11eb-289d-d3f0d4515394
# ╟─d684aa1c-7a30-11eb-1eec-f7d30b0eb462
# ╠═424902d8-a09d-11eb-0506-7d2517cb49ea
# ╟─7ccc2d04-a09d-11eb-3bea-8f50898ff657
# ╟─45ff6be0-a09f-11eb-33a6-e30de3ad1c9c
# ╟─5e1b89f0-a0a1-11eb-0dff-57524c679023
# ╠═5bd1173e-a09f-11eb-128e-bd008aa10722
# ╠═b6a34d4e-a09f-11eb-1abe-db4d77a92ac9
# ╟─5c54b47a-a0a1-11eb-3392-2da931010e1f
# ╠═5d0e1262-a0a1-11eb-2dee-c3458c3ac57c
# ╠═908043e8-a0a1-11eb-0497-c33c6e44787a
# ╟─5d978402-a0a1-11eb-2db0-d92cbc215923
# ╠═71ed00bc-a0a1-11eb-3d35-97b1af0a358c
# ╠═918c41bc-a0a1-11eb-312f-e9ac49e9f09a
# ╟─09c013d2-84e5-11eb-1f70-4192220bf6d6
# ╠═f97920d4-84e4-11eb-375d-d912c0e6c297
# ╠═d6190c2c-8533-11eb-3ebb-43222aa25a69
# ╠═dcdb244a-a0a2-11eb-19c0-6743a65a1b74
# ╟─7dc2c594-a0a0-11eb-25b8-af9d010e54a7
# ╠═f2ef2da0-7a24-11eb-1b10-a5b2acefa3cf
# ╟─e211d078-a0a3-11eb-3ec3-672b3d72bd8c
# ╟─31bd1fa2-a0a3-11eb-213d-8b2662c24550
# ╠═454c6af0-a0a3-11eb-3a59-1bcd102b20d4
# ╟─5eb82d9e-a0a3-11eb-3d70-4752b93c44b2
# ╠═7572c832-a0a3-11eb-3085-0933682370a3
# ╟─d63c0e1c-a0a3-11eb-373c-2f1eb2a03d3a
# ╠═d5246218-a0a3-11eb-13d1-b592ae1a465f
# ╟─51831470-a0a3-11eb-3e14-a1f8f3c224b7
# ╠═5e3d38c8-a0a3-11eb-1d3a-f1cf81b9ad9c
# ╟─76b8e884-a0a3-11eb-03aa-7795a7274685
# ╠═81761fee-a0a3-11eb-0d71-d95d91ea9172
# ╟─81fe8eae-a0a3-11eb-0876-4381181f5129
# ╠═9c40962e-a0a3-11eb-2942-6d49689f97d1
# ╟─93b036c2-a0a3-11eb-3946-c1444ecba2a0
# ╠═9d45cd00-a0a3-11eb-061e-55db641dd5e3
# ╟─05a32f8e-a0a2-11eb-0a48-4dd9b4a234db
# ╟─02413732-a0a2-11eb-21a2-5dbbf71652a5
# ╟─ef0ab1cc-a243-11eb-1ee1-d50fa86d824b
# ╟─1e548db4-a0a4-11eb-0718-fb96169d7b06
# ╟─1dd632a2-a0a4-11eb-0f21-d3c41f077abe
# ╠═1d94bf18-a0a4-11eb-16f2-0b83b9458d57
# ╟─1d556208-a0a4-11eb-12f9-ad8af965630d
# ╠═1d17b7b4-a0a4-11eb-0914-11374168923e
# ╟─1cd621dc-a0a4-11eb-2f32-798af4e4a174
# ╠═1c9737ba-a0a4-11eb-13e0-875591a434d8
# ╟─1c58ab9e-a0a4-11eb-035f-6127c6429663
# ╠═1c20cd50-a0a4-11eb-3281-29bed0a6c889
# ╟─1be2d748-a0a4-11eb-24d5-33b90cbb4094
# ╠═1badbbe4-a0a4-11eb-28e8-81b53de4f93b
# ╟─1b740a5c-a0a4-11eb-0378-836d84ed045c
# ╠═1b3e0b28-a0a4-11eb-31eb-ade69bfd978b
# ╟─f99c6cbc-7cab-11eb-1b70-89d56f43dcf8
# ╟─fbf33cd2-7cab-11eb-2183-81fbff3524d5
# ╟─6a7b5e78-7a3b-11eb-00c4-5f3c3020e8d2
