### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 389e73f0-3efd-11eb-1dae-538a2121a045
using DataFrames, CSV, Plots, LsqFit, StatsPlots, Statistics, SpecialFunctions

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

**This section (Sample Prep and Analysis) should be filled in during lab!**

## Sample Preparation

Insert your info about your sample here:
- What sample did you run?
- How much sample did you use?
- Are there any useful physical characteristics (color, state, etc.)?
- etc.

*(Click the grey eyeball icon to the left of Materials and Methods and then type in the tan box that appears to edit!)*

The sample that was analyzed is:

""";

# ╔═╡ c0048288-65bf-11eb-3d4f-7561756a8a97
md"""
**NOTE: This analysis was completed by the instructor due to remote instruction so no Matierals and Methods Section is necessary.**
"""

# ╔═╡ a321a7e8-3f0b-11eb-2055-4d2b08d9fe6b
sample_name = "missing"

# ╔═╡ 7a755bc8-414a-11eb-2671-e9b2e8e3cddc
if !(@isdefined sample_name)
	md"""Do not change the name of the variable - write you answer as `sample_name = "Sample D"` (make sure to include the quotes!).)"""

elseif sample_name == "missing"
	
elseif ((@isdefined sample_name) && (sample_name == "Sample A"))
		md"""
	!!! correct
	Looks great!
	"""
elseif ((@isdefined sample_name) && (sample_name === "Sample E"))
		md"""
	!!! correct
	Looks great!
	"""
elseif ((@isdefined sample_name) && (sample_name === "Sample M"))
	md"""
!!! correct
Looks great!
"""
else
	md"""
!!! danger "Oops!"
    That wasn't one of the samples used this year!
	"""
end

# ╔═╡ b629f6e8-3f0a-11eb-10e6-072baf22db8e
md"""
## Analysis

Insert info about your analysis here.  Fill in the values in the table, as well.

**Table 1: Instrument Parameters**

| Parameter							|   Value 	|
| :-----         					|  :-----:	|
| Manufacturer      				|   		|
| Model 							|   		|
| Column Type 						|  			|
| Mobile Phase 						|			|
| Oven Temperature (°C)				|			|
| Injector Temperature (°C)			|			|
| Detector Type 					|			|
| Detector Temperature (°C)			|			|
| Detector Current 					|			|
| Data Acquisition Module (DAQ)		| 			|
| Data Acquisition Software  		| 			|
| Sampling Rate (Hz)	 			| 		  	|

"""

# ╔═╡ 65d329e8-3f0b-11eb-174e-3d82834dd797
md"""
# Results and Data Analysis
"""

# ╔═╡ d5e06754-3f0c-11eb-3692-996bcf0d63a7
md"""

The package DataFrames will be used to keep data organized into a data frame.

The package CSV will be used to import the CSV files from the instrument.

The package Plots will be used for plotting.

The package LsqFit will be used to fit chromatographic peaks.

The package StatsPlots will be used to create filled are plots of peak area.

The package Statistics will be used to average data.

"""

# ╔═╡ 989ff84a-3f0d-11eb-0b52-23313d318245
md"""
## Import the Data

Import the complete dataset with Time in minutes and Signal in millivolts:

"""

# ╔═╡ 468090fa-414a-11eb-0770-69ac5be501c2
gc_data = missing

# use CSV.read("filename", DataFrame) to import the CSV file you collected in lab.
# to do this replace 'missing' with your file name.

# ╔═╡ 3b9eeba0-3f40-11eb-1aa1-ad7a459bec4b
if gc_data !== missing
	if (nrow(gc_data) == 361) && (ncol(gc_data) == 2)
	
				md"""
!!! correct 
    Your data frame has the right dimensions (361 x 2).
				"""
		
	else
	md"""
!!! warning 
    I'm expecting a data frame with 361 rows and 2 columns.  Are you sure you loaded the right thing and that it loaded correctly?
	"""
	end
else
	
end

# ╔═╡ a1757e02-3f0d-11eb-0c67-59100f1c0718
md"""
## Plot the Chromatogram

"""

# ╔═╡ 681345e2-414c-11eb-1cc0-5bc1a894efbf
begin
	# erase this line and insert the plot code here
end

# ╔═╡ ccf3487c-4151-11eb-2297-3f35561be206
md"""
!!! hint
    Plotting takes the form of `plot(x, y)`.  Look at the [video tutorial](https://chem370.github.io/julia/#plotting-data) or Pluto homepage > sample notebooks > Plots.jl for more help.
"""

# ╔═╡ cfdf32b2-414c-11eb-03e5-1194bf9ee099
md"""
## Baseline Correct the Chromatogram

Note that there is a significant *baseline offset* in the data, meaning the baseline level is significantly higher than 0.  In this case, that is a result of how the zero knob was adjusted on the instrument.  We can remove the offset in data processing by subtracting the mean baseline value:

$$S_{corrected} = S_{raw} - (\bar{S}_{raw-baseline})$$

We can determine $\bar{S}_{raw-baseline}$ by averaging a portion of the chromatogram where there are no peaks.
"""

# ╔═╡ 654339a0-414d-11eb-3a14-896d7c37b560
S_raw_baseline = missing;

# ╔═╡ 7e179aa4-414d-11eb-20ea-cd0e92b8bd3c
md"""
It will be best to add the baseline corrected data to the existing data frame as a third column.  The column will be called `S_corrected`.
"""

# ╔═╡ a9070e84-414d-11eb-10b5-0d46d32f539a
# erase this line and insert the correct code here
# df[!, "Column Name"] = df[!, "Original Column"] - value;

# ╔═╡ 4c65408c-414e-11eb-2649-31e02d2ae739
md"""
Plot the corrected data:
"""

# ╔═╡ 589e0232-414e-11eb-25e5-2d4380542093


# ╔═╡ 0d91f9ea-4153-11eb-0c62-53844d3607e2
md"""
## Fit Each Peak

*Ideally, chromatographic peaks are Guassian in nature and can be fit with a Gaussian function, as in:*

$$f(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{-\frac{1}{2} \left( \frac{x-\mu}{\sigma} \right)^2}$$

*In practice they usually are asymmetric, typically with a tailing end.  The [exponentially modified Gaussian](https://en.wikipedia.org/wiki/Exponentially_modified_Gaussian_distribution) (EMG) function provides a good approximation for the shape of tailing peaks in a chromatograph and will be used here to fit the chromatographic peaks. [1]  The mathmatical function is:*

$$f_{EMG}(t) = \frac{M_0}{2 \tau} \exp \left( \frac{\sigma_g^2}{2\tau^2} - \frac{t-t_g}{\tau} \right) \times \text{erfc} \left( \frac{1}{\sqrt{2}} \left( \frac{\sigma_g}{\tau} - \frac{t-t_r}{\sigma_g} \right) \right)$$

*I have provided two Julia functions to help with this: (1) `fitPeak`, which fits an EMG function to the peak and determines the parameters and (2) `plotPeak()`, which takes the output of `fitPeak()` and plots it to help you visualize the process.*

*The functions are used as:*

	yourFit = fitPeak(DataFrame, tmin = start_time, tmax = stop_time, t_r = retention_time_guess);

*You should enter a 2-column data frame as `DataFrame`, a time on the left side of the peak as `tmin`, a time on the right side of the peak as `tmax`, and a best guess at the retention time of the peak as `t_r`.*

*To plot the results do:*

	plotPeak(yourFit)

*where `yourFit` is the output of `fitPeak` saved as a Julia object.*

"""

# ╔═╡ 6ec2b898-4154-11eb-382a-ef0cd8d850fb
md"""
Determine the retention time ($t_r$), standard deviation ($\sigma$), and area ($A$) of each peak by fitting it.
"""

# ╔═╡ d35d5506-4154-11eb-39b6-45ae9906f818
method_peak = missing # insert the peakFit code in place of missing 

# ╔═╡ e55d17c8-4154-11eb-0d95-c94362c0c807
# insert `plotPeak(method_peak)` here

# ╔═╡ 93faf8e6-4154-11eb-12c5-63d0e866d7e5
peak_1 = missing # insert the peakFit code in place of missing

# ╔═╡ 9c48d19e-4154-11eb-3286-c3fe738beaa4
# insert `plotPeak(peak_1)` here

# ╔═╡ c6b5ab6e-4154-11eb-381c-19eb4001c080
# continue in this pattern for all peaks in the chromatogram, calling them peak_1, peak_2, etc.

# ╔═╡ 00eb381c-4155-11eb-2d47-bd4c36151e50
md"""
## Calculate the Retention Factor for Each Peak

The retention factor is determined from:

$$k_r = \frac{t_r - t_m}{t_m}$$
"""

# ╔═╡ 3c9aedf8-4155-11eb-1d39-f1a020a2adfa
kᵣ₁ = missing

# ╔═╡ d3077862-4158-11eb-2149-1f7bad75cf25
if kᵣ₁ !== missing
	if kᵣ₁ === ((peak_1[1][1, 1] - method_peak[1][1, 1]) / method_peak[1][1, 1])
			md"""
!!! correct
		"""
		else
			md"""
!!! warning 
    Something's not right.
			"""
	end
else
	
end

# ╔═╡ 4908f616-4155-11eb-014d-8967622c16c3
kᵣ₂ = missing

# ╔═╡ 53660e82-4155-11eb-22b9-57ce9e731b71
md"""
## Calculate the Resolution for Each Pair of Peaks

The resolution, $R_s$, is determined from:

$$R_s = \frac{t_{r_2} - t_{r_1}}{0.5(W_{b_2} + W_{b_1})}$$

where $t_r$ is the retention time of the peak and $W_b$ is the width at the base of the peak and $W_b = 4\sigma$.
"""

# ╔═╡ 8ddf330e-4155-11eb-169b-97338dc80c05
Rₛ₁ = missing

# ╔═╡ 1b7ce6e0-4159-11eb-259e-b73de5c47871
if Rₛ₁ !== missing
	if Rₛ₁ === ((peak_2[1][1, 1] - peak_1[1][1, 1]) / (0.5*(4*peak_2[1][1, 2] + 4 * peak_1[1][1, 2])))
			md"""
!!! correct
			"""
		else
			md"""
!!! warning 
    Something's not right.
			"""
	end
else
	
end

# ╔═╡ b45102ec-4155-11eb-041e-295b5f20bec6
Rₛ₂ = missing

# ╔═╡ 191ecdf4-6671-11eb-21a8-0b158abf7e09
md"""
## Calculate the Percent Composition of Compound

The percent composition is:

$$C_n(\%)=\frac{A_n}{A_1 + A_2 + ... A_n} \times 100\%$$

where $A_n$ represent the area of peak *n*.
"""

# ╔═╡ 57a81b34-6671-11eb-1b8f-7303b106f779
peak_1_percent = missing

# ╔═╡ 62ff4a0c-6671-11eb-3572-794e5e0d349d
if peak_1_percent !== missing
	if peak_1_percent === (peak_1[1][1, 3] / (peak_1[1][1, 3] + peak_2[1][1, 3]) )
			md"""
!!! correct
			"""
		else
			md"""
!!! warning 
    Something's not right.  You should divide the area for peak 1 by the summed area of all other peaks.  Make sure you include only the peaks due to compounds in your sample and not the system peak.  And don't forget to multiply by 100%!
			"""
	end
else
	
end

# ╔═╡ 5cc48c4c-6671-11eb-0af9-1729f9393952
peak_2_percent = missing

# ╔═╡ bc1db886-3f38-11eb-2d42-1bd1196107dc
md"""
# Conlcusions

Fill in your conclusions here. Aim for 1 paragraph or so.

- Provide a 1-2 sentence summary of the experiment.
- Provide a 1-2 sentence summary of the outcome.
- How do your calculated retention factors compare to those of the standards run on the instrument?  Can you say what compounds are in the sample?

(Click the eyeball icon to the left of "Conclusions" to edit!)

"""

# ╔═╡ c7633808-3f38-11eb-213f-49d634169b1d
md"""
# References

1. Kevin Lan and James W. Jorgenson (2001). A hybrid of exponential and gaussian  functions as a simple model of asymmetric chromatographic peaks. *Journal of Chromatography A* **915**:1–2, p 1-13. doi: [10.1016/S0021-9673(01)00594-5](https://doi-org.proxy195.nclive.org/10.1016/S0021-9673(01)00594-5)
"""

# ╔═╡ 33387066-4153-11eb-0cbe-1fd074c9dabe
# This is the function to fit the peaks ####
# You can leave this chunk as-is

# p[1] = m0, p[2] = t, p[3] = σ, p[4] = t_g (rt)

"""
fitPeak(Chrom::DataFrame; tmin = 0.5, tmax = 1, t_r = 1.0, guesses = [0.5, 0.5, 0.05])

Fits an exponentially modified Gaussian to a chromatographic peak.

   - **Chrom:** A 2-column data frame with Time column 1 and Signal in column 2
   - **tmin:** The time at which to begin looking for a peak
   - **tmax:** The time at which to stop looking for a peak
   - **t_r:** A guess at the retention time of the peak.
   - **guesses:** Guesses for the other fit parameters (area, standard deviation, and exponential decay rate, respectively).

"""
function fitPeak(Chrom::DataFrame; tmin = 0.5, tmax = 1, t_r = 1.0, guesses = [0.5, 0.5, 0.05])
	

	
	guesses = vcat(guesses, t_r);
   	Chrom2 = Chrom[findall(y -> y > tmin, Chrom[!, 1]), :]
	Chrom2 = Chrom2[findall(y -> y < tmax, Chrom2[!, 1]), :]
	
	@. emgFit(x, p) = (p[1]/2*p[2])*exp((p[3]^2 / (2 * p[2]^2)) - ((x-p[4])/p[2])) * erfc((1/sqrt(2))*((p[3]/p[2]) - ((x - p[4])/p[3])));
	
	fitted_peak = curve_fit(emgFit, Chrom2[!, 1], Chrom2[!, 2], guesses)
	
	s = ((fitted_peak.param[3]^2 + fitted_peak.param[2]^2))^0.5
	m = fitted_peak.param[4] + fitted_peak.param[2]
	
	peak_characters =  DataFrame(tᵣ = m, σ = s, Area = fitted_peak.param[1])
	
	fit_data = DataFrame(Time = range(0, stop = 3, length = 1000), Signal = emgFit(range(0, stop = 3, length = 1000), [fitted_peak.param[1], fitted_peak.param[2], fitted_peak.param[3], fitted_peak.param[4]]))
	
	return peak_characters, fit_data, Chrom
end;

# ╔═╡ 7e5b31d6-4154-11eb-1c79-471fd7dfd811
# This is the function to plot the peaks ####
# You can leave this chunk as-is
"""
plotPeak(fitted_peak)

Plots the results of `fitPeak()`.
"""
function plotPeak(fitted_peak)
	plot(fitted_peak[3][!, 1], fitted_peak[3][!, 2], linewidth = 2, label = "Data", legend = :topleft);
	xlabel!("Time"); ylabel!("Signal");
	plot!(fitted_peak[2][!, 1], fitted_peak[2][!, 2], fillrange=0, fillalpha=0.25, label = "Fit: tᵣ=$(round(fitted_peak[1][1, 1], sigdigits = 4)), σ = $(round(fitted_peak[1][1, 2], sigdigits = 4)), Area = $(round(fitted_peak[1][1, 3], sigdigits = 4))")
end;

# ╔═╡ Cell order:
# ╟─1974d4d2-3f08-11eb-3ecd-9d73ed8fbe9c
# ╟─3259ead2-3f08-11eb-0c8b-45d108629844
# ╟─068d4ccc-3f09-11eb-05ed-018d62fca359
# ╟─c0048288-65bf-11eb-3d4f-7561756a8a97
# ╠═a321a7e8-3f0b-11eb-2055-4d2b08d9fe6b
# ╟─7a755bc8-414a-11eb-2671-e9b2e8e3cddc
# ╟─b629f6e8-3f0a-11eb-10e6-072baf22db8e
# ╟─65d329e8-3f0b-11eb-174e-3d82834dd797
# ╟─d5e06754-3f0c-11eb-3692-996bcf0d63a7
# ╠═389e73f0-3efd-11eb-1dae-538a2121a045
# ╟─989ff84a-3f0d-11eb-0b52-23313d318245
# ╠═468090fa-414a-11eb-0770-69ac5be501c2
# ╟─3b9eeba0-3f40-11eb-1aa1-ad7a459bec4b
# ╟─a1757e02-3f0d-11eb-0c67-59100f1c0718
# ╠═681345e2-414c-11eb-1cc0-5bc1a894efbf
# ╟─ccf3487c-4151-11eb-2297-3f35561be206
# ╟─cfdf32b2-414c-11eb-03e5-1194bf9ee099
# ╠═654339a0-414d-11eb-3a14-896d7c37b560
# ╟─7e179aa4-414d-11eb-20ea-cd0e92b8bd3c
# ╠═a9070e84-414d-11eb-10b5-0d46d32f539a
# ╟─4c65408c-414e-11eb-2649-31e02d2ae739
# ╠═589e0232-414e-11eb-25e5-2d4380542093
# ╟─0d91f9ea-4153-11eb-0c62-53844d3607e2
# ╟─6ec2b898-4154-11eb-382a-ef0cd8d850fb
# ╠═d35d5506-4154-11eb-39b6-45ae9906f818
# ╠═e55d17c8-4154-11eb-0d95-c94362c0c807
# ╠═93faf8e6-4154-11eb-12c5-63d0e866d7e5
# ╠═9c48d19e-4154-11eb-3286-c3fe738beaa4
# ╠═c6b5ab6e-4154-11eb-381c-19eb4001c080
# ╟─00eb381c-4155-11eb-2d47-bd4c36151e50
# ╠═3c9aedf8-4155-11eb-1d39-f1a020a2adfa
# ╟─d3077862-4158-11eb-2149-1f7bad75cf25
# ╠═4908f616-4155-11eb-014d-8967622c16c3
# ╟─53660e82-4155-11eb-22b9-57ce9e731b71
# ╠═8ddf330e-4155-11eb-169b-97338dc80c05
# ╟─1b7ce6e0-4159-11eb-259e-b73de5c47871
# ╠═b45102ec-4155-11eb-041e-295b5f20bec6
# ╟─191ecdf4-6671-11eb-21a8-0b158abf7e09
# ╠═57a81b34-6671-11eb-1b8f-7303b106f779
# ╟─62ff4a0c-6671-11eb-3572-794e5e0d349d
# ╠═5cc48c4c-6671-11eb-0af9-1729f9393952
# ╟─bc1db886-3f38-11eb-2d42-1bd1196107dc
# ╟─c7633808-3f38-11eb-213f-49d634169b1d
# ╟─33387066-4153-11eb-0cbe-1fd074c9dabe
# ╟─7e5b31d6-4154-11eb-1c79-471fd7dfd811
