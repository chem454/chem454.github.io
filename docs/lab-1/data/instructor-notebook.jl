### A Pluto.jl notebook ###
# v0.12.17

using Markdown
using InteractiveUtils

# ╔═╡ 83a9777c-407a-11eb-1cae-9d8bd9dc7972
using DataFrames, CSV, Plots, Statistics, LsqFit, StatPlots, Distributions

# ╔═╡ 42659a02-407a-11eb-110b-2d7ba20565b0
md"""
# Analysis of an unknown mixture via GC-TCD

**Al Fischer**

December 17, 2020
"""

# ╔═╡ bdf0cefc-407b-11eb-3753-33c939d390a5
md"""
# Results and Data Processing
"""

# ╔═╡ cb364e72-407b-11eb-1d77-47a479029545
md"""
## Import the Data
"""

# ╔═╡ 9f7ecc72-407a-11eb-3aaf-13282b12e22f
gc_data = CSV.read("SampleC.csv", DataFrame)

# ╔═╡ d8d35532-407b-11eb-3123-e352addc03a9
md"""
## Plot the Raw Data
"""

# ╔═╡ e91cf14a-407a-11eb-249b-37f505bbdf9a
begin
	plotly();
	plot(gc_data[!, "Latest: Time (min)"], gc_data[!, "Latest: Potential (mV)"], legend = false);
	xlabel!("Time (min)"); ylabel!("Signal (mV)");
end

# ╔═╡ 08d2c768-407c-11eb-0045-159cea7f2d4b
md"""
## Baseline Correct the Data
"""

# ╔═╡ 14a6a7d0-407c-11eb-1508-d76d5cab7603
gc_data[!, "Baseline Corrected (mV)"] = gc_data[!, "Latest: Potential (mV)"] .- mean(gc_data[1:15, "Latest: Potential (mV)"]);

# ╔═╡ 5a2e546a-407c-11eb-35d7-cf7dc75e5b8f
gc_data

# ╔═╡ 95f59878-407c-11eb-3e89-15fa665ad162
md"""
## Plot the Corrected Data
"""

# ╔═╡ 6accface-407c-11eb-09f8-09f4b75eb533
begin
	plotly();
	plot(gc_data[!, "Latest: Time (min)"], gc_data[!, "Baseline Corrected (mV)"], legend = false);
	xlabel!("Time (min)"); ylabel!("Signal (mV)");
end

# ╔═╡ b055418c-407c-11eb-2d8c-a797d87a68f3
md"""
## Fit Each Peak
"""

# ╔═╡ c3bd2a56-4080-11eb-167d-f7f6b6ae5dd9
md"""
$$f(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{-\frac{1}{2} \left( \frac{x-\mu}{\sigma} \right)^2}$$
"""

# ╔═╡ db9e3436-4089-11eb-0cf0-358efa3eb0c9
@. gaussianFit(x, p) = p[3] * (1/(p[2]*sqrt(2π))) * exp(-(1/2)*((x - p[1])/p[2])^2)

# ╔═╡ 061cec04-4092-11eb-344c-6f15f10d3db8
guessValues = [0.6, 0.02, 3.3]

# ╔═╡ b4d405c8-407d-11eb-36da-75159b3e35d6
peak_1 = curve_fit(gaussianFit, gc_data[61:85, "Latest: Time (min)"], gc_data[61:85, "Baseline Corrected (mV)"], guessValues)

# ╔═╡ 780b4732-4094-11eb-2c27-09e1021ffccb
guessValues_2 = [1.1, 0.025, 6.0]

# ╔═╡ 9367ff16-4094-11eb-0122-771c0b1aafd4
peak_2 = curve_fit(gaussianFit, gc_data[121:163, "Latest: Time (min)"], gc_data[121:163, "Baseline Corrected (mV)"], guessValues_2)

# ╔═╡ f0490d38-4094-11eb-1aad-e3d25f941405
guessValues_3 = [1.76, 0.03, 10];

# ╔═╡ e71ec0ae-4094-11eb-36b0-0b17404cbeb3
peak_3 = curve_fit(gaussianFit, gc_data[200:270, "Latest: Time (min)"], gc_data[200:270, "Baseline Corrected (mV)"], guessValues_3)

# ╔═╡ c5a481f6-4095-11eb-3724-b12081282ce2
guessValues_4 = [2.3, 0.4, 5.5];

# ╔═╡ ae7c9902-4095-11eb-331e-0fec1f79f66c
peak_4 = curve_fit(gaussianFit, gc_data[280:330, "Latest: Time (min)"], gc_data[280:330, "Baseline Corrected (mV)"], guessValues_4)

# ╔═╡ 11cc5506-40a8-11eb-01f9-0122aafa21c2
    # egh <- function(t, H, tr, sigmag, tau) {  
    #   result <- rep(0, length(t))  
    #   index <- which(2*sigmag^2 + tau*(t-tr)>0)  
    #   result[index] <- H*exp(-(t[index]-tr)^2/(2*sigmag^2+tau*(t[index]-tr)))  
    #   return(result)  
    # }  
# https://pisquare.osisoft.com/blogs/holgeramort/2016/10/12/curve-fitting-using-r-peak-asymmetry

# ╔═╡ 3417545a-4095-11eb-006b-f340329d0d22
fitted_chromatogram = gaussianFit(range(0, stop = 3, length = 1000), [peak_1.param[1], peak_1.param[2], peak_1.param[3]]) .+ gaussianFit(range(0, stop = 3, length = 1000), [peak_2.param[1], peak_2.param[2], peak_2.param[3]]) .+ gaussianFit(range(0, stop = 3, length = 1000), [peak_3.param[1], peak_3.param[2], peak_3.param[3]]) .+ gaussianFit(range(0, stop = 3, length = 1000), [peak_4.param[1], peak_4.param[2], peak_4.param[3]]);

# ╔═╡ a0fbdd66-4094-11eb-1577-23e74b44f851
plot!(range(0, stop = 3, length = 1000), fitted_chromatogram, fillrange=0, fillalpha=0.25 , fillcolor=:blue)

# ╔═╡ 30cb6312-40a7-11eb-2466-33898e8771bd


# ╔═╡ Cell order:
# ╟─42659a02-407a-11eb-110b-2d7ba20565b0
# ╠═83a9777c-407a-11eb-1cae-9d8bd9dc7972
# ╟─bdf0cefc-407b-11eb-3753-33c939d390a5
# ╟─cb364e72-407b-11eb-1d77-47a479029545
# ╠═9f7ecc72-407a-11eb-3aaf-13282b12e22f
# ╟─d8d35532-407b-11eb-3123-e352addc03a9
# ╠═e91cf14a-407a-11eb-249b-37f505bbdf9a
# ╟─08d2c768-407c-11eb-0045-159cea7f2d4b
# ╠═14a6a7d0-407c-11eb-1508-d76d5cab7603
# ╠═5a2e546a-407c-11eb-35d7-cf7dc75e5b8f
# ╟─95f59878-407c-11eb-3e89-15fa665ad162
# ╠═6accface-407c-11eb-09f8-09f4b75eb533
# ╟─b055418c-407c-11eb-2d8c-a797d87a68f3
# ╟─c3bd2a56-4080-11eb-167d-f7f6b6ae5dd9
# ╠═db9e3436-4089-11eb-0cf0-358efa3eb0c9
# ╠═061cec04-4092-11eb-344c-6f15f10d3db8
# ╠═b4d405c8-407d-11eb-36da-75159b3e35d6
# ╠═780b4732-4094-11eb-2c27-09e1021ffccb
# ╠═9367ff16-4094-11eb-0122-771c0b1aafd4
# ╠═f0490d38-4094-11eb-1aad-e3d25f941405
# ╠═e71ec0ae-4094-11eb-36b0-0b17404cbeb3
# ╠═c5a481f6-4095-11eb-3724-b12081282ce2
# ╠═ae7c9902-4095-11eb-331e-0fec1f79f66c
# ╠═11cc5506-40a8-11eb-01f9-0122aafa21c2
# ╠═3417545a-4095-11eb-006b-f340329d0d22
# ╠═a0fbdd66-4094-11eb-1577-23e74b44f851
# ╠═30cb6312-40a7-11eb-2466-33898e8771bd
