### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 68c7fe5c-5a05-11eb-3868-21985181d56e
using CSV, DataFrames

# ╔═╡ cb3bef7c-5a04-11eb-391c-1fe136b7dfd9
md"""
# Working with CSV Files

This tutorial will show you how to work with CSV (comma-separated values) files in Julia.  CSV files are a common, text-based file format that most instrument export data to.  All of your lab data will be saved into CSV files.  The interface for working with CSV files is part of the CSV package.

You will specifically learn:
- How to import a CSV file
- How to save a CSV file

Throughout this exercise we'll work with Anscombe's quartet.  This consists of 4 sets of similar $X$ and $Y$ data (here named 1, 2, 3, and 4).  These data are available for download from the course website as a CSV file.
"""

# ╔═╡ 3bf81e20-5a05-11eb-2c71-e5a52d18c005
md"""

# Importing CSV Files

CSV files can be read by Julia and stored in a data frame for further processing.
"""

# ╔═╡ 58b0ddfe-5a05-11eb-203f-7baf675519c5
md"""
## Step 1: Load `CSV` package

You will need the `CSV` package and the `DataFrames` package to load a CSV file.
"""

# ╔═╡ 6c5b6d3a-5a05-11eb-08eb-515d7dff45eb
md"""
## Step 2: Load the CSV File

Use `CSV.read("filename.csv", DataFrame)` to load the CSV file.

Here, `DataFrame` is the sink we wish to store the data in and we are choosing a data frame by typing that.
"""

# ╔═╡ a8ef1c22-5a05-11eb-2359-fd2d51e7e90a
anscombe = CSV.read("anscombe.csv", DataFrame)

# ╔═╡ 42f1f2ca-5a06-11eb-22ce-0fb3ffec605e
md"""
The CSV file is now stored as a data frame title `anscombe` in our Julia workspace.  For more on how to work with data frames see the data frames tutorial.
"""

# ╔═╡ 69c53d28-5a06-11eb-0e9c-d7421c63b0c6
md"""
# Exporting (saving) CSV Files

The syntax for writing a CSV file is `CSV.write(file, object; ...)`.  The file will be saved in your current working directory unless you specify a different filepath.  Existing files will be overwritten without warning!
"""

# ╔═╡ 95fab4a4-5a06-11eb-0de3-ab85b1898f6d
CSV.write("anscombes_data.csv", anscombe);

# ╔═╡ Cell order:
# ╟─cb3bef7c-5a04-11eb-391c-1fe136b7dfd9
# ╟─3bf81e20-5a05-11eb-2c71-e5a52d18c005
# ╟─58b0ddfe-5a05-11eb-203f-7baf675519c5
# ╠═68c7fe5c-5a05-11eb-3868-21985181d56e
# ╟─6c5b6d3a-5a05-11eb-08eb-515d7dff45eb
# ╠═a8ef1c22-5a05-11eb-2359-fd2d51e7e90a
# ╟─42f1f2ca-5a06-11eb-22ce-0fb3ffec605e
# ╟─69c53d28-5a06-11eb-0e9c-d7421c63b0c6
# ╠═95fab4a4-5a06-11eb-0de3-ab85b1898f6d
