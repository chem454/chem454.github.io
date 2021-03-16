### A Pluto.jl notebook ###
# v0.12.21

using Markdown
using InteractiveUtils

# ╔═╡ c05fe2d0-7a1f-11eb-30fc-85a392f0cc6c
using DataFrames, CSV, Plots, LsqFit, StatsPlots, Statistics, StringEncodings, SpecialFunctions, GLM

# ╔═╡ 843abe86-7cab-11eb-14e0-cb78f4ebf601
md"""
# Title

**Your Name**

My lab parter was: **Lab Partner's Name**.

π, 2021
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

# ╔═╡ c1a3cf0c-84e3-11eb-1a46-5fc456ba40b5
concentrations = missing # you may want to enter your concentrations into julia here as an array, e.g., [1, 2, 3, ... ]

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
hplc_data = missing;

# ╔═╡ 09c013d2-84e5-11eb-1f70-4192220bf6d6
md"""
## Plot of the Chromatograms
"""

# ╔═╡ f97920d4-84e4-11eb-375d-d912c0e6c297
plotly()

# ╔═╡ d6190c2c-8533-11eb-3ebb-43222aa25a69
begin

end

# ╔═╡ 06e6fe26-84e5-11eb-17aa-5fad52228f3d
md"""
## Plot for Publication
"""

# ╔═╡ 2548b486-84e5-11eb-2486-0b04bdd469e9
begin

end

# ╔═╡ 2c0d0fe2-84e5-11eb-0917-d9663cfec7b3
md"""
# Integrate the Peaks
"""

# ╔═╡ 5152fa28-84e5-11eb-3676-416ff92b6cc7
peaks = missing;

# ╔═╡ 58674fc4-84e5-11eb-2cd4-777f6ddb6b19
md"""
# Prepare a Standard Curve
"""

# ╔═╡ 03128dc2-7ca4-11eb-3207-c7fc203faefc
# Create a new data frame that contains only the concentrations and peak areas for your standards.  This will make it easier to fit the data.
fitdat = missing

# ╔═╡ 76eb8b9a-7ca4-11eb-35c8-d1aee5341df6
if !ismissing(fitdat) && ncol(fitdat) == 2 && nrow(fitdat) == 5
	md"""
	!!! correct "Looks Good"
	    Your have a concentration column named correctly.
	"""
else
			md"""
	!!! hint 
	     Create a new data frame called **fitdat** containing the concentrations of your standards and corresponding peak areas.  Enter your concentrations as a column called "Conc" and the peak areas from the peak integrations as a column called "Area".  Remember that you can create a data frame with `newDFname = DataFrame(ColName1 = [ ], colName2 = [], ...)`.  Your data frame should have 5 rows and 2 columns.
	"""
end

# ╔═╡ 32c68a72-7a20-11eb-0125-85c8890c97b3
calcurve = missing

# ╔═╡ cd8e499c-7a24-11eb-084d-7d4d7e15bab6
k = missing

# ╔═╡ dbdce38c-7a24-11eb-19e0-ad127a66b14a
b = missing

# ╔═╡ e28e60fe-7a24-11eb-3594-85a37e1c6c65
R² = missing

# ╔═╡ f2ef2da0-7a24-11eb-1b10-a5b2acefa3cf
begin
	# plot the calibration curve
end

# ╔═╡ 2ff3fa5e-7a26-11eb-214b-0179162be49f
md"""
### Validate the Standard Curve (QC)
"""

# ╔═╡ a3ca5b58-7a26-11eb-1232-09f8f9d92667
qc_expected_conc = missing

# ╔═╡ 595ed8c8-7a26-11eb-34f0-61369b347eb3
qc_measured_conc = missing

# ╔═╡ cfe749ba-7a26-11eb-17a7-fd5f54b8c3fa
qc_percent_diff = missing

# ╔═╡ ecc0a466-7a2d-11eb-1851-3d090902ebe7
md"""
### Determine LOD & LOQ
"""

# ╔═╡ f4f2e6ba-7a2d-11eb-0b4f-4f6cf4184a28
LOD = missing

# ╔═╡ 97995ba4-7a2e-11eb-0fbc-25f4a70bdc89
LOQ = missing

# ╔═╡ e9165720-7a26-11eb-2c56-4d9921be73ff
md"""
## Determine the Sample Concentrations
"""

# ╔═╡ 205c8278-7a2b-11eb-02e2-23ac064ac955
sample_area = missing

# ╔═╡ f56f7510-7a26-11eb-257c-5f7e92550ee9
sample_concs = missing
# Should be a 2x1 array of sample concentrations

# ╔═╡ 5d7442e4-821a-11eb-2cf8-6f8ff0da7cce
md"""
**After you get the right concentration you still need to account for your dilution factor!**
"""

# ╔═╡ 82c459f2-7cad-11eb-1b01-0db08c3a874e
md"""
### Compare Means
"""

# ╔═╡ 183a4ee0-7a2b-11eb-098e-873fcc0d0cc9
sample1_CI = missing
# calculate the confidence interval for the concentration.  Remember there is a function `calculateCI()`.

# ╔═╡ 7ffb39a6-7a27-11eb-2c0a-5d34c20ed936
sample2_CI = missing # calculate the confidence interval for the concentration.  Remember there is a function `calculateCI()`.

# ╔═╡ 7b1473be-821a-11eb-3960-cff604a22a30
md"""
**Don't forget to factor the dilution into your confidence interval too!**
"""

# ╔═╡ acb54dd0-7a27-11eb-1b75-57a339a5498d
begin
	# I suggest a bar plot, with error bars, to succinctly display the final results
end

# ╔═╡ dd412844-7a30-11eb-3ee5-4f59c2dea04b
md"""
**True or false: There is a significant difference between the pre- and post-vape samples. (Fill in your answer below.)**
"""

# ╔═╡ fbe65454-7a30-11eb-1d7b-c580d4d9fb63
signif_diff = [ missing, missing ]

# ╔═╡ 047b8ff8-7a31-11eb-1edb-2b8b880ffdc3
if !ismissing(signif_diff)
	if typeof(signif_diff) != Array{Bool,1}
	md""" 
	!!! danger "Hold on!"
	    Make sure you used `true` or `false` (all lowercase) to specify you answer in the cell above.
	"""
	else
		md""" 
	!!! correct "Good Job"
	    You entered your answer correctly.  It will be graded by your instructor.
	"""
	end
else
	bs8 = false;
	md""" 
	!!! danger "Hold on!"
	    Make sure you specify whether or not there's a significant difference using `true` or `false` in the cell above.  You need to specify this for both samples.
	"""
end

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

# ╔═╡ ee0f0bd8-84e3-11eb-3131-b79ab23c42af
# Leave this chunk alone -- it's a custom function you will need!


function importHPLC(dir = pwd())
	fnames = readdir()[endswith.(readdir(), ".CSV") .| endswith.(readdir(), ".csv")]
	chromatograms = CSV.read(
		open(fnames[1], enc"UTF-16LE"), DataFrame, 
		header = ["Time", fnames[1][1:(end-4)]]
	)
	l = nrow(chromatograms)
	
	for i in 2:length(fnames)
		f = CSV.read(
			open(fnames[i], enc"UTF-16LE"), DataFrame, 
			header = ["Time", fnames[i][1:(end-4)]]
		)[1:l, 2]
		if length(f) < l
			chromatograms[!, :A] .= missing
			chromatograms[1:l, :A] = f
		elseif length(f) > l
			chromatograms[!, :A] = f[1:l]
		else
			chromatograms[!, :A] = f
		end
		rename!(chromatograms, :A => fnames[i][1:(end-4)])
	end

	chromatograms
end;

# ╔═╡ edb01f92-84e3-11eb-14f4-dbf19bccf779
# This is the function to plot the peaks ####
# You can leave this chunk as-is
"""
plotPeak(fitted_peak)

Plots the results of `fitPeak()`.
"""
function plotPeak(fitted_peak::Array; area_type = :emg)
	p = plot(legend = (110, 1))
	xlims!(fitted_peak[1][1, 2] - 0.75, fitted_peak[1][1, 2] + 0.75)
	xlabel!("Time"); ylabel!("Signal");
	for i in 2:nrow(fitted_peak[1])
		plot!(peaks[3][!, 1], peaks[3][!, i], color = i, label = names(fitted_peak[3])[i]);
		plot!(peaks[2][!, 1], peaks[2][!, i],
			fillrange=0, fillalpha=0.15, color = i, linewidth = 0,
			label = 
			"Fit: tᵣ=$(round(fitted_peak[1][i, 2], sigdigits = 4)), σ = $(round(fitted_peak[1][i, 3], sigdigits = 4)), Area = $(round(fitted_peak[1][i, 4], sigdigits = 4))"
		)
	end
	p
end;

# ╔═╡ ed740034-84e3-11eb-2814-fd35bed8a0d5
# Leave this chunk alone -- it's a custom function you will need!


"""
	trapz(x::Vector{Tx}, y::Vector{Ty}) where {Tx <: Number, Ty <: Number}
Trapezoidal integration. This function is particularly helpful to calculate the area under a portion of a spectrum, and can be used for various purposes (normalisation, area comparison, etc.).
Inputs
-----
	x: Vector{Float64}
		x values
	y: Vector{Float64}
		y values.
Outputs
-------
	area: Vector{Float64}
		trapezoidal integration value.
"""
function trapz(x::Vector{Tx}, y::Vector{Ty}) where {Tx <: Number, Ty <: Number}
    # Trapezoidal integration rule
    local n = length(x)
    if (length(y) != n)
        error("Vectors 'x', 'y' must be of same length")
    end
    r = zero(zero(Tx) + zero(Ty))
    if n == 1; return r; end
    for i in 2:n
        r += (x[i] - x[i-1]) * (y[i] + y[i-1])
    end
    trapz_int = r/2
    return trapz_int
end;

### https://github.com/charlesll/Spectra.jl/blob/b99c3a78dd2ed1c7533cfdf426cd8b537dcf9445/src/integrale.jl

# ╔═╡ edd8bb1e-84e3-11eb-3160-4f6553381710
# This is the function to fit the peaks ####
# You can leave this chunk as-is

# p[1] = m0, p[2] = t, p[3] = σ, p[4] = t_g (rt)

"""
fitPeak(Chrom::DataFrame; tmin = 0.5, tmax = 1, t_r = 1.0, guesses = [0.5, 0.5, 0.05])

Fits an exponentially modified Gaussian to a chromatographic peak.

   - **Chrom:** A n-column data frame with Time column 1 and Signal in columns 2:n
   - **tmin:** The time at which to begin looking for a peak
   - **tmax:** The time at which to stop looking for a peak
   - **t_r:** A guess at the retention time of the peak.
   - **guesses:** Guesses for the other fit parameters (area, standard deviation, and exponential decay rate, respectively).

"""
function fitPeak(Chrom::DataFrame; tmin = 0.5, tmax = 1, t_r = 1.0, guesses = [0.5, 0.5, 0.05])
	
	Chrom2A = Matrix(Chrom)
	
	guesses = vcat(guesses, t_r);
   	Chrom2 = Chrom2A[findall(y -> y > tmin, Chrom2A[:, 1]), :]
	Chrom2 = Chrom2[findall(y -> y < tmax, Chrom2[:, 1]), :]
	
	local X
	
	for i in 2:size(Chrom2)[2]
		@. emgFit(x, p) = (p[1]/2*p[2])*exp((p[3]^2 / (2 * p[2]^2)) - ((x-p[4])/p[2])) * erfc((1/sqrt(2))*((p[3]/p[2]) - ((x - p[4])/p[3])));
	
		fitted_peak = curve_fit(emgFit, Chrom2[:, 1], Chrom2[:, i], guesses)
	
		s = ((fitted_peak.param[3]^2 + fitted_peak.param[2]^2))^0.5
		m = fitted_peak.param[4] + fitted_peak.param[2]
	
		trapmin = m .- (2.0 .* s)
		trapmax = m .+ (2.0 .* s)
		chrom_trap = Chrom2A[findall(y -> y > trapmin, Chrom2A[:, 1]), [1, i]]
		chrom_trap = chrom_trap[findall(y -> y < trapmax, chrom_trap[:, 1]), :]
		
		peak_characters =  DataFrame(Sample = names(Chrom)[i], tᵣ = m, σ = s, Area = fitted_peak.param[1], trap_Area = trapz(chrom_trap[:, 1], chrom_trap[:, 2]))
	
		fit_data = DataFrame(Time = range(0, stop = maximum(Chrom2A[:, 1]), length = size(Chrom2A)[1]), Signal = emgFit(range(0, stop = maximum(Chrom2A[:, 1]), length = size(Chrom2A)[1]), [fitted_peak.param[1], fitted_peak.param[2], fitted_peak.param[3], fitted_peak.param[4]]))
		
		if i == 2
			X = [ peak_characters, fit_data, DataFrame(Time = Chrom2A[:, 1], Signal = Chrom2A[:, 2]) ]
		else
			push!(X[1], peak_characters[1, :])
			X[2][!, Symbol("Signal_"*string(i))] = fit_data[!, :Signal]
			X[3][!, Symbol("Signal_"*string(i))] = Chrom[:, i]
		end
	end
	return X
end;

# ╔═╡ f076d636-7a33-11eb-3373-11f986c1594a
# do not modify or delete this!!!

begin
	function checkFormat(n)
		if nrow(n) >500 && ncol(n) > 10
			return true
		else
			return false
		end
	end
	function ck(y, z)
		f = lm(@formula(Area ~ Conc), y)
		return coef(f)[1] == coef(z)[1] && coef(f)[2] == coef(z)[2]
	end
	function q(s, m)
		return round((3*s)/k, sigdigits = 4), round((10*s)/k, sigdigits = 4)
	end
	function cc(v, b, n)
		return (v.-b) ./ n
	end
	function ccc(vc, x)
		return vc == x
	end
	function pd(m, e)
		p = (m .- e) ./ e
		return p, p .* 100
	end
	function pdc(p, s)
		return p[1] == s || p[2] == s
	end
end;

# ╔═╡ d684aa1c-7a30-11eb-1eec-f7d30b0eb462
if !ismissing(hplc_data)
	if checkFormat(hplc_data)
	bs1 = true
	md"""
	!!! correct "Looks Good"
	    Your dataframe appears correct. 
	"""
	else
	bs1 = false
	md"""
	!!! danger "Oops!"
	    Your dataframe appears incorrect.  It should have 16 columns (1 = Time plus 15 sample columns) and rougly 900 rows depending on how long your runs went.  Make sure you're using `impotHPLC()` to import your data and that all data files are in the same directory as your notebook file.
	"""
	end
else bs1 = false
			md"""
	!!! hint 
	    Import your data using the custom function `impotHPLC()` to import your data and that all data files are in the same directory as your notebook file.  The function does not require any arguments.
	"""
end

# ╔═╡ 286e4388-7a36-11eb-1c43-4fbc4d760198
if !ismissing(calcurve)
	if ck(fitdat, calcurve)
	bs2 = true
	md"""
	!!! correct 
	    Your fit coefficients are correct. 
	"""
	else
	bs2 = false
	md"""
	!!! danger "Oops!"
	    Your fit appears incorrect.  Make sure your columns are named correctly in your data frame and that you've selected the correct rows.
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
	if any(occursin.("QC", peaks[1].Sample))
		adat = peaks[1][occursin.("QC", peaks[1].Sample), :trap_Area]
		stp = false
	elseif any(occursin.("qc", hplc_data.Sample))
		adat = peaks[1][occursin.("qc", peaks[1].Sample), :trap_Area]
		stp = false
	else
		bs3 = false
		md"""
	    !!! danger 
	        Make sure you have a sample with "QC" in the name.  
		"""
		stp = true
	end

	if stp != true
		if ccc(cc(adat, b, k), qc_measured_conc)
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

# ╔═╡ 71434b8a-7a38-11eb-146c-197c97541c2d
if !ismissing(qc_percent_diff)
	if any(abs.(pd(qc_measured_conc, qc_expected_conc)[2]) .> 5)
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
	 bs5 = false
			md"""
	!!! hint 
	    Determine your QC percent difference based on your measured and known concentrations.  See Lab 2 for an example.
	"""

end

# ╔═╡ 4333cafc-7a37-11eb-0fa5-a5f811e0a16e
if !ismissing(LOQ)
	
	t = q(std(hplc_data[!, findall(occursin.("lank", lowercase.(names(hplc_data))))[1]]), k)
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
	    Determine your LOD and LOQ based on the standard deviation of your blank sample.  See Lab 2 for an example.
	"""
end

# ╔═╡ 480c57da-7a3a-11eb-06ec-798002fe689e
if !ismissing(sample_area)
	if sample_concs == cc.(sample_area, b, k)
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
	    Determine your pre- and post-vape concentrations based your standard curve.  See Lab 2 for an example.  You should create a 6 row by 1 column array.
	"""
end

# ╔═╡ 6a7b5e78-7a3b-11eb-00c4-5f3c3020e8d2
# do not modify or delete this!!!

begin
bs = [bs1 bs2 bs3 bs4 bs5 bs6 bs7]
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
# ╠═c1a3cf0c-84e3-11eb-1a46-5fc456ba40b5
# ╟─b63201ce-7cab-11eb-33ff-8587745784f2
# ╟─bc0242e4-7cab-11eb-0fb0-810ce7d3f0eb
# ╟─ee21d98a-7cab-11eb-3186-2bcbfc2393e5
# ╠═c05fe2d0-7a1f-11eb-30fc-85a392f0cc6c
# ╟─0ffa9644-7cac-11eb-2922-cb2e9c0df2f6
# ╠═2db2f670-7bc3-11eb-3ae7-29c1243fd2ff
# ╟─d684aa1c-7a30-11eb-1eec-f7d30b0eb462
# ╟─09c013d2-84e5-11eb-1f70-4192220bf6d6
# ╠═f97920d4-84e4-11eb-375d-d912c0e6c297
# ╠═d6190c2c-8533-11eb-3ebb-43222aa25a69
# ╟─06e6fe26-84e5-11eb-17aa-5fad52228f3d
# ╠═2548b486-84e5-11eb-2486-0b04bdd469e9
# ╟─2c0d0fe2-84e5-11eb-0917-d9663cfec7b3
# ╠═5152fa28-84e5-11eb-3676-416ff92b6cc7
# ╟─58674fc4-84e5-11eb-2cd4-777f6ddb6b19
# ╠═03128dc2-7ca4-11eb-3207-c7fc203faefc
# ╟─76eb8b9a-7ca4-11eb-35c8-d1aee5341df6
# ╠═32c68a72-7a20-11eb-0125-85c8890c97b3
# ╟─286e4388-7a36-11eb-1c43-4fbc4d760198
# ╠═cd8e499c-7a24-11eb-084d-7d4d7e15bab6
# ╠═dbdce38c-7a24-11eb-19e0-ad127a66b14a
# ╠═e28e60fe-7a24-11eb-3594-85a37e1c6c65
# ╠═f2ef2da0-7a24-11eb-1b10-a5b2acefa3cf
# ╟─2ff3fa5e-7a26-11eb-214b-0179162be49f
# ╠═a3ca5b58-7a26-11eb-1232-09f8f9d92667
# ╠═595ed8c8-7a26-11eb-34f0-61369b347eb3
# ╟─8f00af82-7a36-11eb-2e05-83e75532c360
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
# ╟─5d7442e4-821a-11eb-2cf8-6f8ff0da7cce
# ╟─82c459f2-7cad-11eb-1b01-0db08c3a874e
# ╠═183a4ee0-7a2b-11eb-098e-873fcc0d0cc9
# ╠═7ffb39a6-7a27-11eb-2c0a-5d34c20ed936
# ╟─7b1473be-821a-11eb-3960-cff604a22a30
# ╠═acb54dd0-7a27-11eb-1b75-57a339a5498d
# ╟─dd412844-7a30-11eb-3ee5-4f59c2dea04b
# ╠═fbe65454-7a30-11eb-1d7b-c580d4d9fb63
# ╟─047b8ff8-7a31-11eb-1edb-2b8b880ffdc3
# ╟─f99c6cbc-7cab-11eb-1b70-89d56f43dcf8
# ╟─fbf33cd2-7cab-11eb-2183-81fbff3524d5
# ╟─475e5f76-7a27-11eb-1f94-494d0972f77f
# ╟─ee0f0bd8-84e3-11eb-3131-b79ab23c42af
# ╟─edd8bb1e-84e3-11eb-3160-4f6553381710
# ╟─edb01f92-84e3-11eb-14f4-dbf19bccf779
# ╟─ed740034-84e3-11eb-2814-fd35bed8a0d5
# ╟─f076d636-7a33-11eb-3373-11f986c1594a
# ╟─6a7b5e78-7a3b-11eb-00c4-5f3c3020e8d2
