### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 70755ea6-5de8-11eb-31dd-9764b13d25d1
using Plots, GLM, DataFrames, StatsPlots, Distributed

# ╔═╡ 2baf8a10-5dea-11eb-263a-f331b5f83191
@everywhere using StatsModels

# ╔═╡ f0dec1c8-5dab-11eb-3e47-55e15cceed16
html"<button onclick=present()>Toggle Presentation Mode 📺 </button>"

# ╔═╡ 8a38df9c-5dab-11eb-25db-f1bfc8fe144c
md"""
# What is Julia?

![The Julia Programming Language Logo with julia written in lowercase black letters, the j dotted with a blue dot and the i dotted with a triangle of red, green, and purple dots.](https://upload.wikimedia.org/wikipedia/commons/1/1f/Julia_Programming_Language_Logo.svg)

### Al Fischer



CHEM 370: Instrumental Analysis I (Lab) / Western Carolina University
"""

# ╔═╡ 87139942-5dad-11eb-2ae1-d5ed261b3492
md"""

# Julia

> **Julia is a high-level, high-performance, dynamic programming language.** While it is a general-purpose language and can be used to write any application, many of its features are **well suited for numerical analysis and computational science.** 
> 
> (via [Wikipedia](https://en.wikipedia.org/wiki/Julia_(programming_language)))

"""

# ╔═╡ c092d838-5dae-11eb-018d-1dda10cadc56
2+2

# ╔═╡ 660a29f0-5dee-11eb-3cca-2b7b5b080747
md"""
# Who uses Julia?

Julia is a very new language!  It's still growing in popularity.  Some notable users include:

- Many universities/academics (esp. math, physics, chemistry, data science, AI)
- Federal Reserve Bank of New York (Julia is 10X faster than their old software!)
- Climate Modeling Alliance
- NASA
- FAA
- Pfizer
- AstraZeneca
- Boston school bus garage
- Dairy farms
- Brazilian National Development Bank, Brazilian National Institute for Space Research
- BlackRock, Inc.
- ... see [Case Studies](https://juliacomputing.com/case-studies/) for more examples

"""

# ╔═╡ fdd84442-5dad-11eb-2b6f-9d4b28e9ecf2
md"""
# Julia + Pluto

We will use Julia with the Pluto notebook interface.

This allows us to mix text and Julia code in a single formatted notebook file.

-----
"""

# ╔═╡ ebeffeca-5de2-11eb-14e1-e3d16fad8d88
md"""
Five standards were made by diluting a stock solution of ZnCl.
"""

# ╔═╡ 34342c9c-5de3-11eb-3375-6fc5e0d667b8
stock_Zn_conc = 100.5; # ppm

# ╔═╡ 6511ef7a-5de3-11eb-196e-e94efc464910
pipette_volumes = [15.0, 10.0, 5.0, 2.5, 1.0]; # ml

# ╔═╡ 7b194db8-5de3-11eb-1978-57f4d0bfb0c7
volflask_volume = [50.0, 50.0, 50.0, 50.0, 50.0]; # ml

# ╔═╡ 9356e124-5de3-11eb-3f66-c1e7cd965fbe
md"""
The concentration of each standard can be calculated with $C_1V_1 = C_2V_2$:
"""

# ╔═╡ 3af6744a-5de3-11eb-39f0-fd3d2732a62b
std_concs = stock_Zn_conc .* pipette_volumes ./ volflask_volume # gives conc. in ppm

# ╔═╡ 41a6309e-610a-11eb-2381-6d5b19603d33
md"""
# Using Julia

Actions in Julia are controlled with **functions**.

```julia
function_name(argument_1, argument_2, ...);
```
"""

# ╔═╡ 2659073a-61a5-11eb-2651-1db5c4bc26a8
f(x) = 2x+3

# ╔═╡ 4f6692ec-61a9-11eb-3246-87eed2692122
maximum([3, 6, 5, 2, 9, 7])

# ╔═╡ 6b903e26-610b-11eb-0ff2-2ff125ab9da2
md"""
# Using Julia

We will usually think in terms of **arrays** in Julia.

- A **scalar** (single value) is a 1x1 array, for example:
  $5$
- A **vector** is a 1x*m* (1-row) or *n*x1 (1-column) array, for example:
  $\begin{bmatrix} 1 \\ 2 \\ 3 \\ 4 \end{bmatrix}$
- A **matrix** is an *n*x*m* array, for example: 
  $\begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{bmatrix}$
"""

# ╔═╡ 0e78efb8-610c-11eb-3370-c16124be66f0
x = [7 8 3 9] * 7

# ╔═╡ 451a4fac-5daf-11eb-248a-956d16c86cd3
md"""
# Installing Julia + Pluto

Julia and Pluto are both free (and open source)!

- You can install them on your personal computer
- Or, you can install them on [VCAT](https://vcat.wcu.edu).  Note that VCAT will delete your installation everytime you logout, so you will have to do a new install every day (at least until IT finishes installing it as a default program).
- To install:
  - Go to [julialang.org](https://julialang.org) and download the version of Julia for your operating system.
  - Once installed, open Julia and type `Using Pkg; Pkg.add("Pluto")` and then press enter.

"""

# ╔═╡ 2dcdc5a2-5db1-11eb-2e55-6d7d1184757c
md"""
# This Week's Lab
1. Install Julia + Pluto
1. Complete Lab 0 (two notebooks, 0A and 0B) and the Markdown tutorial linked in Exercise 0A.
1. Turn in your notebooks by next **Wednesday at midnight.**
   - This is the **deadline** to turn in this assignment.  *No late work is accepted after the deadline!*
   - Extra credit is awarded for submit *dearly due date*.  You will get 5% extra credit if you turn an assignment in more than 24 hours before the deadline!
   - This is described in the [latework policy](https://chem370.github.io/course-information/syllabus#late-work).
1. I will be available on live Q & A in Piazza and Chat in MS Teams for questions until the end of lab today.
"""

# ╔═╡ 30e7c250-610e-11eb-1a73-952c4d24790c
md"""
# Next Two Weeks
- We will meet remotely again next week.
- I will do a demonstration of the GC-TCD and send the data to the class.  You will have two weeks to process the data.
- The week after will be primarily for data processing.
- I will also post a lab safety video you need to watch before our first in-person lab.
"""

# ╔═╡ a0695832-5de4-11eb-3847-0713a4aff06c
y = std_concs .* rand(9:0.01:11, 5);

# ╔═╡ 2966523e-5de5-11eb-0dc9-7fa11c4f2b5a
# This cell computes, plots, etc.
begin
	df = DataFrame(X = std_concs, Y = y);
	mod = lm(@formula(Y ~ X), df)
	plotly()
	scatter(std_concs, y, legend = false, grid = false, border = :box)
	xlabel!("[Zn] (ppm)"); ylabel!("Signal (arbitrary units)");
	Plots.abline!(coef(mod)[2] , coef(mod)[1], color = 1, linestyle = :dot)
end

# ╔═╡ 0c8048e0-5deb-11eb-1184-43b34ab7b107
md"""
*y* = $(round(coef(mod)[1], sigdigits = 4)) + $(round(coef(mod)[2], sigdigits = 4)) *x*, R² = $(round(r2(mod), digits = 4))
"""

# ╔═╡ Cell order:
# ╟─f0dec1c8-5dab-11eb-3e47-55e15cceed16
# ╟─8a38df9c-5dab-11eb-25db-f1bfc8fe144c
# ╟─87139942-5dad-11eb-2ae1-d5ed261b3492
# ╠═c092d838-5dae-11eb-018d-1dda10cadc56
# ╟─660a29f0-5dee-11eb-3cca-2b7b5b080747
# ╟─fdd84442-5dad-11eb-2b6f-9d4b28e9ecf2
# ╟─ebeffeca-5de2-11eb-14e1-e3d16fad8d88
# ╠═34342c9c-5de3-11eb-3375-6fc5e0d667b8
# ╠═6511ef7a-5de3-11eb-196e-e94efc464910
# ╠═7b194db8-5de3-11eb-1978-57f4d0bfb0c7
# ╟─9356e124-5de3-11eb-3f66-c1e7cd965fbe
# ╠═3af6744a-5de3-11eb-39f0-fd3d2732a62b
# ╟─2966523e-5de5-11eb-0dc9-7fa11c4f2b5a
# ╟─0c8048e0-5deb-11eb-1184-43b34ab7b107
# ╟─41a6309e-610a-11eb-2381-6d5b19603d33
# ╠═2659073a-61a5-11eb-2651-1db5c4bc26a8
# ╠═4f6692ec-61a9-11eb-3246-87eed2692122
# ╟─6b903e26-610b-11eb-0ff2-2ff125ab9da2
# ╠═0e78efb8-610c-11eb-3370-c16124be66f0
# ╟─451a4fac-5daf-11eb-248a-956d16c86cd3
# ╟─2dcdc5a2-5db1-11eb-2e55-6d7d1184757c
# ╟─30e7c250-610e-11eb-1a73-952c4d24790c
# ╟─a0695832-5de4-11eb-3847-0713a4aff06c
# ╟─70755ea6-5de8-11eb-31dd-9764b13d25d1
# ╟─2baf8a10-5dea-11eb-263a-f331b5f83191
