### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 8d5fbb56-bdbf-11eb-0d28-23d880160655
using Plots, DataFrames, GLM, PlutoUI

# ╔═╡ c5365fb6-ea82-45f4-99b7-dca882144756
md"""
# Finding the Upper Limit of Quantitation (ULOQ)
"""

# ╔═╡ fccd9bd1-46d5-425f-92f9-33a7dd7d547a
# png("uloq.png")

# ╔═╡ d02a3d2f-f475-4708-84fd-be8d1894bc9a
x = [2.202, 3.708, 4.575, 6.755, 8.945, 10.34, 12.6, 15.57, 22.82, 25.34];

# ╔═╡ bc0905ac-3a12-4036-8e9c-b504c60b2edd
y = x[1:6] .* rand(1.95:0.025:2.05, 6);

# ╔═╡ 69bfe993-c6e8-4b88-a414-61e629835113
y2 = vcat(y, x[7:10] .* [1.8, 1.6, 1.2, 1.1]);

# ╔═╡ 2881145f-d6e8-48db-87ea-b4d307eb433f
standard_data = DataFrame(Concentration = x, Signal = y2)

# ╔═╡ 0ec513a2-7f7a-441d-a7e1-8603237bbcbc
@bind lastpt Slider(2:nrow(standard_data))

# ╔═╡ 861aa39b-63df-45eb-add3-2bc8647310a6
md"""
Number of Points = $(lastpt)
"""

# *R*² = $(round(r2(standard_curve), sigdigits = 5))

# ╔═╡ 52bae92a-aa7c-4735-8f9b-9e279d33e6c7
standard_curve = lm(@formula(Signal ~ Concentration), standard_data[1:lastpt, :]);

# ╔═╡ 92b847f5-cd82-4e7b-818c-407e628881bd
if lastpt < nrow(standard_data) - 1
	curve_2 = lm(@formula(Signal ~ Concentration), standard_data[lastpt+1:nrow(standard_data), :])
else
	curve_2 = missing
end;

# ╔═╡ 98bbb3c0-e08c-4fd9-84f9-0d9e1440e088
if !ismissing(curve_2)
	xpt = (coef(curve_2)[1] - coef(standard_curve)[1]) / (coef(standard_curve)[2] - coef(curve_2)[2])
end;

# ╔═╡ 133573cb-e69e-4478-831d-b2c3e54e4e87
if !ismissing(curve_2)
	ypt = coef(standard_curve)[2] * xpt + coef(standard_curve)[1] 
end;

# ╔═╡ dea85dea-69d0-47a3-a95b-eb2b71403bd3
begin
	scatter(x, y2, grid = false, border = :box, markersize = 6, color = :red, legend = :bottomright, label = "Excluded Data")
	scatter!(x[1:lastpt], y2[1:lastpt], color = :blue, markersize = 6, label = "Fitted Data")
	xlabel!("Concentration (ppm)"); ylabel!("Signal (a.u.)")
	xlims!(0, 30); ylims!(0, 30)
	if lastpt < nrow(standard_data) - 1
		scatter!([xpt], [ypt], color = :purple, markersize = 6, label = "Intersection: ($(round(xpt, sigdigits = 4)), $(round(ypt, sigdigits = 4)))", markershape = :diamond)
		Plots.abline!(coef(curve_2)[2], coef(curve_2)[1], color = :red, label = "y₂ = $(round(coef(curve_2)[1], sigdigits = 4)) + $(round(coef(curve_2)[2], sigdigits = 4))x, R² = $(round(r2(curve_2), sigdigits = 4))")
	end
	Plots.abline!(coef(standard_curve)[2], coef(standard_curve)[1], color = :blue, label = "y = $(round(coef(standard_curve)[1], sigdigits = 4)) + $(round(coef(standard_curve)[2], sigdigits = 4))x, R² = $(round(r2(standard_curve), sigdigits = 4))")
end

# ╔═╡ Cell order:
# ╟─c5365fb6-ea82-45f4-99b7-dca882144756
# ╟─2881145f-d6e8-48db-87ea-b4d307eb433f
# ╟─861aa39b-63df-45eb-add3-2bc8647310a6
# ╟─0ec513a2-7f7a-441d-a7e1-8603237bbcbc
# ╟─dea85dea-69d0-47a3-a95b-eb2b71403bd3
# ╟─fccd9bd1-46d5-425f-92f9-33a7dd7d547a
# ╟─8d5fbb56-bdbf-11eb-0d28-23d880160655
# ╟─d02a3d2f-f475-4708-84fd-be8d1894bc9a
# ╟─bc0905ac-3a12-4036-8e9c-b504c60b2edd
# ╟─69bfe993-c6e8-4b88-a414-61e629835113
# ╟─52bae92a-aa7c-4735-8f9b-9e279d33e6c7
# ╟─92b847f5-cd82-4e7b-818c-407e628881bd
# ╟─98bbb3c0-e08c-4fd9-84f9-0d9e1440e088
# ╟─133573cb-e69e-4478-831d-b2c3e54e4e87
