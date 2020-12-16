### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ aef5e7ea-37dc-11eb-36bf-ade1963bae89
begin
	using CSV, DataFrames
	anscombe = CSV.read("anscombe.csv", DataFrame)
end

# ╔═╡ 316ed000-3720-11eb-06f3-ed5030efc042
 using Plots

# ╔═╡ 4dd95ddc-37d9-11eb-27cf-b79c8010fafd
begin
	using Measures
	I = scatter(anscombe[!, :I_X], anscombe[!, :I_Y], grid = false, label = "I", color = 1)
	xlabel!("X (I)"); ylabel!("Y (I)");
	II = scatter(anscombe[!, :II_X], anscombe[!, :II_Y], grid = false, label = "II", color = 2);
	xlabel!("X (II)"); ylabel!("Y (II)");
	III = scatter(anscombe[!, :III_X], anscombe[!, :III_Y], grid = false, label = "III", right_margin = 10mm, top_margin = 10mm, color = 3);
	xlabel!("X (III)"); ylabel!("Y (III)");
	IV = scatter(anscombe[!, :IV_X], anscombe[!, :IV_Y], grid = false, label = "IV", color = 4);
	xlabel!("X (IV)"); ylabel!("Y (IV)");
	plot(I, II, III, IV, layout = 4, legend = false, minorticks = 5)
	xlims!(0, 20); ylims!(0, 20);
end

# ╔═╡ 80aa8f16-371a-11eb-264e-0d65efbede2f
md"""
# How to plot data in Julia

This tutorial will show you how to create a basic scatter (x-y) plot in Julia.  You will learn:

- How to create a scatter plot using the Plotly backend
- How to adjust axes
- How to add labels to the axes
- How to adjust grid lines

Throughout this exercise I will work with Anscombe's quartet.  This is sets of $X$ and $Y$ (named I, II, III, and IV) that are all described by exactly the same linear model but -- as you'll see -- are quite different!

"""

# ╔═╡ 3329432a-371c-11eb-0ff5-29c5b3e4a644
md"""

# The data: Anscombe's quartet

"""

# ╔═╡ 39f6755a-371d-11eb-23b4-2fe8c678680e
md"""
The four data sets will be stored in an object called a *dataframe*.  This functions similarly to a spreadsheet, but is accesed by typing in commands rather than with a mouse.  The name of the dataframe will be `anscombe`.
"""

# ╔═╡ 6feff1b4-3771-11eb-3ded-31d9d54cc976
md"""
For each data set, I, II, III, and IV:  

$y = 3.00 + 0.500x$  

$R^2 = 0.67$  
""" 

# ╔═╡ f4950d0c-371f-11eb-14cf-c18657623e9a
md"""
# Plotting the data
"""

# ╔═╡ ff5545fe-371f-11eb-1782-3def37ff5680
md"""
1. The first steps in plotting is to tell Julia to load the `Plots` package (a collection of plotting utilties) and then tell Julia you'd like to use the Plotly utility within that.  (There are several plotting utilties, called "backends", available in Julia.  Plotly has a few nice features so I suggest that one for class.)
"""

# ╔═╡ 351d0300-3722-11eb-09ec-45e2025bb3f7
md"""
2. (Option A) The next step is to use the `plot(x, y, ...)` function to create the plot!  I'll use the variant `scatter(x, y, ...)` to make a scatter plot instead of a line plot.

   I'll start by putting all datasets on the same plot.
"""

# ╔═╡ 4d48df12-3722-11eb-0c56-a524cfde192b
begin
	scatter(anscombe[!, :I_X], anscombe[!, :I_Y], grid = false, label = "I", border = :box, legend = (0.11, 0.91))
	xlabel!("X"); ylabel!("Y");
	xlims!(0, 20); ylims!(0, 20);
	scatter!(anscombe[!, :II_X], anscombe[!, :II_Y], label = "II");
	scatter!(anscombe[!, :III_X], anscombe[!, :III_Y], label = "III");
	scatter!(anscombe[!, :IV_X], anscombe[!, :IV_Y], label = "IV");

end

# ╔═╡ dcc0f50e-37da-11eb-29bf-8969695ae7bd
md"""
2. (Option B) Another way to plot the data would be to make subplots.  This is relatively straightforward in Julia using the `layout` agrument to the `plot()` command.  This method does take a bit of extra formatting to make the plot look nice.  

   With this method, just save each plot it it's own object and then pass all objects to `plot(obj1, obj2, obj3, ...)` and add `layout = n` to the plot command.  Here, `n` is the number of plots in the grid.
"""

# ╔═╡ 7cf99b46-3724-11eb-279a-2b351c78a9ee
md"""
# Summary

1. Load the `Plots` package and use the `plotly()` backend.
1. Use `scatter(X, Y, ...)` to create a scatter plot, where `...` indicates additional arguments that control the various aspects of the plot.
1. Use the "explanation point notation" (e.g. `scatter!()` or `xlims!()`) to add to an existing plot.
1. To create subplots, save each plot to an object, `p1, p2, ...` and pass them to `plot(p1, p2, p3, ..., layout = n)`, where n is the number of plots in the grid.

"""

# ╔═╡ d1587f3e-37dd-11eb-339d-e37b486df6f5
md"""
# Video
"""

# ╔═╡ Cell order:
# ╟─80aa8f16-371a-11eb-264e-0d65efbede2f
# ╟─3329432a-371c-11eb-0ff5-29c5b3e4a644
# ╟─39f6755a-371d-11eb-23b4-2fe8c678680e
# ╟─aef5e7ea-37dc-11eb-36bf-ade1963bae89
# ╟─6feff1b4-3771-11eb-3ded-31d9d54cc976
# ╟─f4950d0c-371f-11eb-14cf-c18657623e9a
# ╟─ff5545fe-371f-11eb-1782-3def37ff5680
# ╠═316ed000-3720-11eb-06f3-ed5030efc042
# ╟─351d0300-3722-11eb-09ec-45e2025bb3f7
# ╠═4d48df12-3722-11eb-0c56-a524cfde192b
# ╟─dcc0f50e-37da-11eb-29bf-8969695ae7bd
# ╠═4dd95ddc-37d9-11eb-27cf-b79c8010fafd
# ╟─7cf99b46-3724-11eb-279a-2b351c78a9ee
# ╟─d1587f3e-37dd-11eb-339d-e37b486df6f5
