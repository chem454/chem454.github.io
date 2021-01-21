### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ f113f1aa-381b-11eb-2431-a1123a795700
using DataFrames

# ╔═╡ 1b414ac6-37dc-11eb-0f6b-6fe51b8e3553
md"""
# Working with Data Frames in Julia

This tutorial will show you how to work with a *data frame* in Julia.  A data frame is an object used to store data in Julia, and it is similar in structure to a spreadsheet.  However, the data are accessed and manipulated using functions in Julia instead of by pointing and clicking in a graphic user interface (GUI).  A data frame differs from an array in that it can contain multiple data types (e.g. numbers and words together) whereas an array can only contain one type (e.g. *only* numbers or *only words*).

You will learn:

- How to create a data frame.
- Different ways of subsetting/filtering data in a data frame.
- How to use data frames in calculations.
- How to add and remove values from a data frame.

Throughout this exercise I will work with Anscombe's quartet.  This consists of 4 sets of similar $X$ and $Y$ data (here named 1, 2, 3, and 4).
"""

# ╔═╡ c9672b7a-381b-11eb-10d1-ed451d2f6b82
md"""
# Creating a Data Frame

"""

# ╔═╡ dc1ae04c-381b-11eb-3415-7765d4ae0f72
md"""
## Step 1: Load `DataFrames` package

Anytime you work with a data frame you will need to load the DataFrames package.
"""

# ╔═╡ 04b6525c-381c-11eb-2e70-cb78c95b9b9c
md"""
## Step 2: Create a data frame

Create the data frame by entering arrays of values into the `DataFrame()` function.  Each array is a separate column in the data frame.  The general syntax is:

	DataFrame(colname1 = [val1, val2, ...], colname2 = [val1, val2, ...], ...)

I will store the data frame in an *object* called `anscombe`.
"""

# ╔═╡ 256bba28-381c-11eb-27be-63dc09ab522e
anscombe = DataFrame(
	X_1 = [10.0, 8.0, 13.0, 9.0, 11.0, 14.0, 6.0, 4.0, 12.0, 7.0, 5.0], 
		# X_1 will be the name of column 1
	Y_1 = [8.04, 6.95, 7.58, 8.81, 8.33, 9.96, 7.24, 4.26, 10.84, 4.82, 5.68],
		# Y_1 will be the name of column 2
	X_2 = [10.0, 8.0, 13.0, 9.0, 11.0, 14.0, 6.0, 4.0, 12.0, 7.0, 5.0],
	Y_2 = [9.14, 8.14, 8.74, 8.77, 9.26, 8.10, 6.13, 3.10, 9.13, 8.26, 4.74],
	X_3 = [10.0, 8.0, 13.0, 9.0, 11.0, 14.0, 6.0, 4.0, 12.0, 7.0, 5.0], 
	Y_3 = [7.46, 6.77, 12.74, 7.11, 7.81, 8.84, 6.08, 5.39, 8.15, 6.42, 5.73],
	X_4 = [8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 8.0, 11.0, 8.0, 8.0, 8.0],
	Y_4 = [6.58, 5.76, 7.71, 8.84, 8.47, 7.04, 5.25, 12.50, 5.56, 7.91, 6.89]
	)

# Values were obtained from the Wikipedia article on Anscombe's quartet: https://en.wikipedia.org/wiki/Anscombe%27s_quartet

# ╔═╡ e019f5f0-39ad-11eb-3b65-c3486c306b0f
md"""
# Working with Data Frames
"""

# ╔═╡ f23ffbee-39ad-11eb-38b6-212967b54acd
md"""

## Subsetting Data

- It is possible to access the individual values (cells) in a data frame by their (row, column) *index*.  For example, `df[1, 2]` would call the value in row 1, column 2 of the data frame `df`.  
- It is possible to access an entire row by it's index.  For example, `df[1, :]` would acces the entire first row of the data frame `df`.
- It is similarly possible to access an entire column.  For example, `df[!, 2]` would access column 2 in `df`. Columns can also be accessed by name, as you'll see below.

"""

# ╔═╡ b2b7b72c-39ae-11eb-2bda-6109580126fc
md"""

Remember that `anscombe` is composed of four datasets: 1, 2, 3, and 4.  Suppose we only want to use the second one (i.e. columns 3 and 4).  We could subset `anscombe` accordingly.

"""

# ╔═╡ 82b58c1e-39b0-11eb-2035-535137e37697
md"""
**Subsetting Columns**
"""

# ╔═╡ 0f47cbd0-39af-11eb-305e-91eb025969a5
anscombe[!, 3]

# ╔═╡ 28cc7bdc-39af-11eb-2471-eb70f0cececc
md"""
Notice that column 3 (`X_3`) has been printed out.  Here, `3` is the column number and the exclamation point indicates that we'd like all rows used.  We could achieve the same effect by using the column's *name* instead of *index*.  (In this case the column name is `X_3`.)  I prefer to use column names when possible because it makes the code easier for humans to read.
"""

# ╔═╡ 5b4135ee-39af-11eb-242c-cdb87df57dd7
anscombe[!, :X_3]

# ╔═╡ 78a35fcc-39af-11eb-2559-9396c3d9ed0e
md"""
or, equivalently:
"""

# ╔═╡ 7ed00e0e-39af-11eb-385b-05380cc181ad
anscombe[!, "X_3"]

# ╔═╡ a591bdf2-39b0-11eb-1f26-e34106b8602b
md"""
Multiple columns can be selected by giving multiple column indices.
"""

# ╔═╡ bb07c4c4-39b0-11eb-2cf9-3bf266ec0035
anscombe[!, [3,4]]

# ╔═╡ ec943b76-39b0-11eb-10f2-5958b7ae14c3
md"""
Or, eqivalently:
"""

# ╔═╡ cd3066ba-39b0-11eb-2f6e-372e4b15c7ce
anscombe[!, [:X_2, :Y_2]]

# ╔═╡ aae26026-39af-11eb-0bfb-217193a04f51
md"""
**Subsetting Rows**

Row subsetting works similarly, but a colon is used instead of an exclamation point.  For example, to select row 4 from `anscombe`:
"""

# ╔═╡ b7acf458-39af-11eb-283d-e3d254afa49a
anscombe[3,:]

# ╔═╡ 608eee3c-39b0-11eb-26e9-3db2825acdc2
md"""
## Calcualtions with Data Frames
"""

# ╔═╡ 73bb47bc-39b0-11eb-1d13-dde949ca7191
md"""
Subsetting can be useful when executing functions (addition, subtraction, plotting, fitting data, ..., etc.) to only a portion of the data.  For example, to add 5 to every value in column 2:
"""

# ╔═╡ 3615faf0-39b1-11eb-2e72-27bd6c70c6d5
anscombe[!, 2] .+ 5

# ╔═╡ a9362cf8-39b1-11eb-183e-a92ac7908bef
md"""
## Manipulating Data Frames
"""

# ╔═╡ 6de67eb4-39b1-11eb-213b-bd0cd94febfb
md"""
**Adding to an Existing Data Frame**

New columns can be added to a data simply by providing a new column name.  Here I'll create a column `Y_1_plus5` that is equal to column `Y_1` plus 5 added to each row.
"""

# ╔═╡ 837e58fa-39b1-11eb-1412-1d45f00b0e64
anscombe[!, :Y_1_plus5] = anscombe[!, 2] .+ 5

# ╔═╡ 9b5a975e-39b1-11eb-35e5-39f6c263cec4
anscombe

# ╔═╡ 1d0e64ce-39b2-11eb-1e46-f9962df310f6
md"""
**Removing Data from a Data Frame**

But what if I don't want that column I just added?  I can select only the columns I want with `select!()` and leave out the rest.  The exclamation point here indicates that the function will modify an pre-exisiting object (in this case the data frame `anscombe`).
"""

# ╔═╡ 588f0484-39b2-11eb-3c34-e3680a9fff9d
select!(anscombe, Not(:Y_1_plus5))

# ╔═╡ 681fc9d4-39b3-11eb-380b-cd2e6b153fb9
md"""
Since I want to select every column but *not* `Y_1_plus5` I can use `Not(Y_1_plus5)`.  An alternative way to do this would be `select!(anscombe, [1:7])` to select columns 1 through 7 but not 8.
"""

# ╔═╡ f7ed81be-39b3-11eb-2627-e3687e463a89
md"""
# Saving Data Frames to File
"""

# ╔═╡ 035e000c-39b4-11eb-34af-79bcaa7a1dae
md"""
Sometimes you may want to write the data frame to a file.  Typically tabular data such as this are stored in plain text files with the extension CSV for *comma-separated values*.  See the [CSV tutorial](https://chem370.github.io/julia/#loading-csv-files) for more information on how to save a data frame to a CSV file.
"""

# ╔═╡ Cell order:
# ╟─1b414ac6-37dc-11eb-0f6b-6fe51b8e3553
# ╟─c9672b7a-381b-11eb-10d1-ed451d2f6b82
# ╟─dc1ae04c-381b-11eb-3415-7765d4ae0f72
# ╠═f113f1aa-381b-11eb-2431-a1123a795700
# ╟─04b6525c-381c-11eb-2e70-cb78c95b9b9c
# ╠═256bba28-381c-11eb-27be-63dc09ab522e
# ╟─e019f5f0-39ad-11eb-3b65-c3486c306b0f
# ╟─f23ffbee-39ad-11eb-38b6-212967b54acd
# ╟─b2b7b72c-39ae-11eb-2bda-6109580126fc
# ╟─82b58c1e-39b0-11eb-2035-535137e37697
# ╠═0f47cbd0-39af-11eb-305e-91eb025969a5
# ╟─28cc7bdc-39af-11eb-2471-eb70f0cececc
# ╠═5b4135ee-39af-11eb-242c-cdb87df57dd7
# ╟─78a35fcc-39af-11eb-2559-9396c3d9ed0e
# ╠═7ed00e0e-39af-11eb-385b-05380cc181ad
# ╟─a591bdf2-39b0-11eb-1f26-e34106b8602b
# ╠═bb07c4c4-39b0-11eb-2cf9-3bf266ec0035
# ╟─ec943b76-39b0-11eb-10f2-5958b7ae14c3
# ╠═cd3066ba-39b0-11eb-2f6e-372e4b15c7ce
# ╟─aae26026-39af-11eb-0bfb-217193a04f51
# ╠═b7acf458-39af-11eb-283d-e3d254afa49a
# ╟─608eee3c-39b0-11eb-26e9-3db2825acdc2
# ╟─73bb47bc-39b0-11eb-1d13-dde949ca7191
# ╠═3615faf0-39b1-11eb-2e72-27bd6c70c6d5
# ╟─a9362cf8-39b1-11eb-183e-a92ac7908bef
# ╟─6de67eb4-39b1-11eb-213b-bd0cd94febfb
# ╠═837e58fa-39b1-11eb-1412-1d45f00b0e64
# ╠═9b5a975e-39b1-11eb-35e5-39f6c263cec4
# ╟─1d0e64ce-39b2-11eb-1e46-f9962df310f6
# ╠═588f0484-39b2-11eb-3c34-e3680a9fff9d
# ╟─681fc9d4-39b3-11eb-380b-cd2e6b153fb9
# ╟─f7ed81be-39b3-11eb-2627-e3687e463a89
# ╟─035e000c-39b4-11eb-34af-79bcaa7a1dae
