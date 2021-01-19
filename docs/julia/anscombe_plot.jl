### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ aef5e7ea-37dc-11eb-36bf-ade1963bae89
begin
	using CSV, DataFrames
	anscombe = CSV.read("anscombe.csv", DataFrame)
end

# ╔═╡ 316ed000-3720-11eb-06f3-ed5030efc042
 using Plots

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
1. The first step in plotting is to tell Julia to load the `Plots` package and then tell Julia you'd like to use the Plotly utility within that.  (There are several plotting utilties, called "backends", available in Julia.  Plotly has a few nice features so I suggest that one for class.)
"""

# ╔═╡ 08a71e10-5a08-11eb-3765-9ffda370b6fe
plotly()

# ╔═╡ 351d0300-3722-11eb-09ec-45e2025bb3f7
md"""
2. (Option A) The next step is to use the `plot(x, y, ...)` function to create the plot.  This works for a line plot.  Here, I'll use the variant `scatter(x, y, ...)` to make a scatter plot instead of a line plot.

   I'll start by putting all datasets on the same plot.
"""

# ╔═╡ 4d48df12-3722-11eb-0c56-a524cfde192b
begin
	scatter(anscombe[!, :X_1], anscombe[!, :Y_1], grid = false, label = "I", border = :box, legend = (0.11, 0.91))
	xlabel!("X"); ylabel!("Y");
	xlims!(0, 20); ylims!(0, 20);
	scatter!(anscombe[!, :X_2], anscombe[!, :Y_2], label = "II");
	scatter!(anscombe[!, :X_3], anscombe[!, :Y_3], label = "III");
	scatter!(anscombe[!, :X_4], anscombe[!, :Y_4], label = "IV");

end

# ╔═╡ dcc0f50e-37da-11eb-29bf-8969695ae7bd
md"""
2. (Option B) Another way to plot the data would be to make subplots.  This is relatively straightforward in Julia using the `layout` agrument to the `plot()` command.  This method does take a bit of extra formatting to make the plot look nice.  

   With this method, just save each plot it it's own object and then pass all objects to `plot(obj1, obj2, obj3, ...)` and add `layout = n` to the plot command.  Here, `n` is the number of plots in the grid.
"""

# ╔═╡ 4dd95ddc-37d9-11eb-27cf-b79c8010fafd
begin
	# using Measures
	I = scatter(anscombe[!, :X_1], anscombe[!, :Y_1], grid = false, label = "I", color = 1)
	xlabel!("X (I)"); ylabel!("Y (I)");
	II = scatter(anscombe[!, :X_2], anscombe[!, :Y_2], grid = false, label = "II", color = 2);
	xlabel!("X (II)"); ylabel!("Y (II)");
	III = scatter(anscombe[!, :X_3], anscombe[!, :Y_3], grid = false, label = "III", color = 3);
	xlabel!("X (III)"); ylabel!("Y (III)");
	IV = scatter(anscombe[!, :X_4], anscombe[!, :Y_4], grid = false, label = "IV", color = 4);
	xlabel!("X (IV)"); ylabel!("Y (IV)");
	plot(I, II, III, IV, layout = 4, legend = false, minorticks = 5)
	xlims!(0, 20); ylims!(0, 20);
end

# ╔═╡ Cell order:
# ╟─80aa8f16-371a-11eb-264e-0d65efbede2f
# ╟─3329432a-371c-11eb-0ff5-29c5b3e4a644
# ╟─39f6755a-371d-11eb-23b4-2fe8c678680e
# ╟─aef5e7ea-37dc-11eb-36bf-ade1963bae89
# ╟─6feff1b4-3771-11eb-3ded-31d9d54cc976
# ╟─f4950d0c-371f-11eb-14cf-c18657623e9a
# ╟─ff5545fe-371f-11eb-1782-3def37ff5680
# ╠═316ed000-3720-11eb-06f3-ed5030efc042
# ╠═08a71e10-5a08-11eb-3765-9ffda370b6fe
# ╟─351d0300-3722-11eb-09ec-45e2025bb3f7
# ╠═4d48df12-3722-11eb-0c56-a524cfde192b
# ╟─dcc0f50e-37da-11eb-29bf-8969695ae7bd
# ╠═4dd95ddc-37d9-11eb-27cf-b79c8010fafd
