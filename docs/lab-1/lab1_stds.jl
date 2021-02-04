### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 68efb8fc-6673-11eb-33ab-019676ec1fea
using CSV, DataFrames, Plots, SpecialFunctions, LsqFit, StatsPlots, Statistics

# ╔═╡ 77e55772-668f-11eb-38fb-73924c03af70
plotly()

# ╔═╡ b14e34a4-668d-11eb-30c6-87cc1dd2aa0e
acetone = CSV.read("stds/std_acetone.csv", DataFrame);

# ╔═╡ d7592b56-668d-11eb-2d40-1536008d7859
iso_octane = CSV.read("stds/std_iso-octane.csv", DataFrame);

# ╔═╡ e3111964-668d-11eb-2d05-b3a37ed02873
ethanol = CSV.read("stds/std_ethanol.csv", DataFrame);

# ╔═╡ ecd65466-668d-11eb-1185-5ba4cc259895
n_heptane = CSV.read("stds/std_n-heptane.csv", DataFrame);

# ╔═╡ f4571074-668d-11eb-0547-7d9706b6d5a9
butanol = CSV.read("stds/std_2-butanol.csv", DataFrame);

# ╔═╡ 02837d34-668e-11eb-1cf7-4785441cc6eb
propanol = CSV.read("stds/std_1-propanol.csv", DataFrame);

# ╔═╡ 27e2c1f6-668f-11eb-0dc3-854c0a08a4f0
df = propanol

# ╔═╡ 480c85d4-668f-11eb-2be1-ff349786dfdd
df[!, 2] = df[!, 2] .- mean(df[1:20, 2]);

# ╔═╡ 434ef8c0-668e-11eb-23a3-d973bc65d5ca
plot(df[!, 1], df[!, 2])

# ╔═╡ 05f87646-6690-11eb-0320-73238667b7df
md"""
| Compound | Rf |
| :----- | :-----: |
| Acetone | 0.7668 |
| iso-octane | 3.229 | 
| Ethanol | 0.5300 | 
| n-heptane | 3.224 |
| 2-butanol | 1.612 |
| 1-propanol | 1.201


"""

# ╔═╡ 5e2f49c4-668e-11eb-3616-3d59ce9bf3d1
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

# ╔═╡ a8fa6c4a-668e-11eb-09e7-5d828d039f59
fit = fitPeak(df[!, 1:2], tmin = 0.6, tmax = 3, t_r = 0.7);

# ╔═╡ ad803fa0-668f-11eb-26b5-c1ebba684624
methodfit = fitPeak(df[!, 1:2], tmin = 0.3, tmax = 0.6, t_r = 0.44);

# ╔═╡ a2b84de2-668f-11eb-1a16-f9ecf3e11345
rf = (fit[1][1, 1] - methodfit[1][1, 1]) / methodfit[1][1, 1]

# ╔═╡ 62b042d2-668e-11eb-2567-f3fdad748a7d
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

# ╔═╡ 1a9b9728-668f-11eb-0e49-6fadfc6c79ab
plotPeak(fit)

# ╔═╡ d0c7e51c-668f-11eb-1e23-114f929981d5
plotPeak(methodfit)

# ╔═╡ Cell order:
# ╠═68efb8fc-6673-11eb-33ab-019676ec1fea
# ╠═77e55772-668f-11eb-38fb-73924c03af70
# ╠═b14e34a4-668d-11eb-30c6-87cc1dd2aa0e
# ╠═d7592b56-668d-11eb-2d40-1536008d7859
# ╠═e3111964-668d-11eb-2d05-b3a37ed02873
# ╠═ecd65466-668d-11eb-1185-5ba4cc259895
# ╠═f4571074-668d-11eb-0547-7d9706b6d5a9
# ╠═02837d34-668e-11eb-1cf7-4785441cc6eb
# ╠═27e2c1f6-668f-11eb-0dc3-854c0a08a4f0
# ╠═480c85d4-668f-11eb-2be1-ff349786dfdd
# ╠═434ef8c0-668e-11eb-23a3-d973bc65d5ca
# ╠═a8fa6c4a-668e-11eb-09e7-5d828d039f59
# ╠═ad803fa0-668f-11eb-26b5-c1ebba684624
# ╠═1a9b9728-668f-11eb-0e49-6fadfc6c79ab
# ╠═d0c7e51c-668f-11eb-1e23-114f929981d5
# ╠═a2b84de2-668f-11eb-1a16-f9ecf3e11345
# ╠═05f87646-6690-11eb-0320-73238667b7df
# ╟─5e2f49c4-668e-11eb-3616-3d59ce9bf3d1
# ╟─62b042d2-668e-11eb-2567-f3fdad748a7d
