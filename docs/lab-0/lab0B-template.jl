### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 9a7a31cc-46ff-11eb-38f5-bfd272f170a8
try 
	using Plots;
	using DataFrames;
	plotly();
catch e
	using Pkg; Pkg.add("Plots");
	using Pkg; Pkg.add("DataFrames");
end

# ╔═╡ cf00b6e2-46fe-11eb-13e4-29d71149129e
md"""
# Lab 0B: Understanding Julia
CHEM 370: Instrumental Analysis I (Lab)
"""

# ╔═╡ 4dcc73fc-470a-11eb-23f6-5542c5a42a8d
md"""
**Instructions:** Read this exercise and make sure all the red boxes have turned green before turning in your work.  You can mouse over the blue hints if you get stuck!
"""

# ╔═╡ 0ae8ab60-4718-11eb-1a3c-23b0f0c3164a
md"""
**Enter your name in the cell below:**
"""

# ╔═╡ fbaa31e6-4717-11eb-1d07-7fc2b65abf5b
# Replace Paws' name with yours:

student = "Paws Catamount"

# press the ▶ button in the bottom right of this cell to run your edits
# or use Shift+Enter

# you might need to wait until all other cells in this notebook have completed running. 
# scroll down the page to see what's up

# ╔═╡ 2341507a-46ff-11eb-1b20-1df79073c814
md"""
# Introduction

In this tutorial you’ll continue to explore the Pluto notebook interface and try out basic Julia functions used for calulations in your notebook. These tools will be necessary to complete Lab 1.

Put very simply, you will use Julia cells to write code in the form of text commands that Julia will interpret and run. Once finished, Julia gives you the output (answers) you’ve asked for. For example, to compute the sum of two and five you could type:
"""


# ╔═╡ ba026d20-46ff-11eb-2369-4f08a47549cb
2+5

# ╔═╡ 582dcf7a-4701-11eb-39d4-f30aa5d88b89
md"""
Notice the output is shown *above* the code cell.

You'll use Julia in your lab notebook this semester to complete all your data processing *reproducibly* and prepare plots *reproducibly* for your technical report.
"""

# ╔═╡ aecf5432-4703-11eb-2c9a-cbad7d393b3b
md"""
# Julia is a Caluclator

In a simple sense, Julia is just a very powerful calculator. For example, you can use it to add, subtract, multiply, divide, and so on.  In general, anything you could type into a calculator you could also type into Julia.  Here's how you do some basic operations:

Operation | Type This
:------------ | :-------------:
add | +
subtract | -
multiply | *
divide | /
power | ^

"""

# ╔═╡ 866092ee-4704-11eb-2a45-1783d0c0ff31
md"""**Try it out: Write code to add 2 and 3 together in the empty cell (area with the tan-colored background) below.**"""

# ╔═╡ 411c0970-4704-11eb-245a-51b9f29ae0e3
html"""<p>To edit any code, just click on it. When you're done programming, press the <img src="https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.0.0/src/svg/caret-forward-circle-outline.svg" style="width: 1em; height: 1em; margin-bottom: -.2em;"> in the lower-right corner of a cell to run the code. You can also use `Shift+Enter` if you are in a hurry.</p>"""

# ╔═╡ 1445cce6-4705-11eb-3b08-791ce76f4379


# ╔═╡ 48929da6-4707-11eb-3a8f-3d56aac620bf
md"""
Julia also knows `sin()`, `cos()`, `tan()`, `log10()`, `sqrt()`, etc., along with some common variables like $\pi$ (`pi` or `π`) and $e$ (exp(1)).  For example:
"""

# ╔═╡ 73f1b176-4707-11eb-2d87-ad220e1a5d6d
cos(pi)

# ╔═╡ ee4aa4fa-4718-11eb-3340-bbd42fcf57fa
md"""
or
"""

# ╔═╡ f84be958-4718-11eb-12e3-95b11eb39813
cos(π)

# ╔═╡ fd26fa44-4718-11eb-0011-e3c4423eee40
md"""
(To use special symbols and emoji type (e.g.) `\pi + tab`.  When you press tab `\pi` will be magically converted to π!)
"""

# ╔═╡ ebb9810a-4704-11eb-2651-d79bb280f755
md"""
# Julia has a Memory
"""

# ╔═╡ 17816204-4704-11eb-0930-dfeca9fba41c
a = 5

# ╔═╡ 1a9c2abe-4704-11eb-22d0-d5f44267612e
b = 3

# ╔═╡ b91d753c-4704-11eb-15bf-8b8cb3e6fe28
md"""
You’ve just seen that Julia has the same functionality as a scientific calculator. But if that was all it could do there’d be no reason to use it. Let’s dig a little deeper into it’s capabilities.

One of the most basic features of Julia, or any programming language, is the ability to store items in memory. We typically say we *assign them to a variable*, sometimes called an *object*, when we do this. This allows the variable to act as a placeholder for the calculated value in your code later on.

Let's do some simple math by setting **a = $a**, **b = $b** and **c = a * b**.  

**What will `c` equal?  Calculate your result below.**
"""

# ╔═╡ 2be12536-4704-11eb-3ad4-b183794ad8ff
md"**Fix the value of `c` below to make it `c = a * b`**"

# ╔═╡ 1cbad30e-4704-11eb-361d-3d172cb57f3e
c = a * 2

# ╔═╡ 54b1aaec-4706-11eb-1421-dde8f96701ba
people = 10

# ╔═╡ 559225ae-4706-11eb-32cd-2fe83b9af92a
avg = 2.5

# ╔═╡ 560b8cda-4706-11eb-19a3-8534c9d83a70
slices = 8

# ╔═╡ 2feccd04-4706-11eb-0670-2bea4e667021
md"""
## Pizza Slices

Let's try this out on a problem (taken from the Basic Mathmatics example notebook).  Let's say you want to order pizzas for $people people (**people = $people**) and each person wants $avg slices on average (**avg = $avg**).  A pizza has $slices slices per pizza (**slices = $slices**).  How many pizzas should you order (**pizzas = ?**)?  Here's a summary of all that:

Meaning | Variable
:------ | :--------:
Number of people | people
Average number of slices each person eats | avg
Number of slices on a piece of pizza | slices
"""

# ╔═╡ 822796f6-4706-11eb-080b-c12e201f4ba4
md"Edit the equation below to calculate the number of pizzas to order using the variables above for **people**, **avg**, and **slices**:"

# ╔═╡ 8c869590-4706-11eb-2285-bbd41ee7e246
pizzas = 1

# ╔═╡ c889a87e-4707-11eb-32f8-79c0ce2cb661
md"""## Functions

When you write Julia code, you use Julia *functions* that are built into the language. The function tells Julia what to do, and Julia won’t do anything without one. Actually, you've used several already, such as `ceil(...)` in the last problem!  

Typically, functions are represented as `function_name(function_arguments)`. The arguments are options you specify that tell the function what to work on and/or how work. This is similar to the concept of an algebraic function, e.g. $f(x)=2x$. Here, $f$ is the function name and $x$ is the argument. When we write $f(4)$, we’re saying we wish to substitute $4$ for $x$, as in $f(4)=2×4=8$. The same is true of functions in Julia. We might create a function `timesTwo(x)` that multiplies any x by 2, such that `timesTwo(4)` yields the result 8.

**Try it out: Use the function `log10()` to calculate the base-10 logarithm of 10 000.**

"""


# ╔═╡ 5f1edfde-4708-11eb-2622-250cddf38d5b
my_log_value = 1

# ╔═╡ 3dd584ee-4709-11eb-194a-f5986066f6ad
md"""

### Getting Help with Functions

This `log10()` example raises a question: Why can’t we use `log()`? To find out, type `log(10000)` into the box below and see what it calculates. If you're still not sure,  or if you ever need help, click on 📚 **Live docs** in the lower right, and then place your cursor on the code you need help with.  If you don't see it, then your screen is too small! Maybe you need to zoom out?
"""

# ╔═╡ 5306b14e-4709-11eb-1346-c503c7fc90d5
log(10000)

# ╔═╡ abbfa252-4719-11eb-0f80-efb85d4c628f
md"""
# Vectors Scalars, and Matrices

Up to this point we've stored single numbers, or *scalars*, in a variable, but in lab we'll often have many numbers to work with.  One way of dealing with multiple numbers is to store them in a *vector* (a 1-dimensional array) or a *matrix* (an *m*-column by *n*-row array of numbers.

For example,

"""

# ╔═╡ 6202f656-471a-11eb-2186-8bfe6d6cde86
x = [4, 7, 8, 13]

# ╔═╡ 68591080-471a-11eb-04db-fd2d2cbf4c28
md"""
produces a 1-column by 4-row vector.

and
"""

# ╔═╡ 816eeab0-471a-11eb-3009-a9d14186dafd
X = [[4, 7, 8, 13] [23, 45, 67, 92]]

# ╔═╡ b6435daa-471a-11eb-1f6b-775773ef3219
md"""
produces a 2-column by 4-row matrix.

Julia defaults to the rules of linear algebra when conducting arithmetic.  We'll come back to this idea later.

**Try it out: Create a vector called `y` that contains the numbers 4, 8, 3, 10, 12, and 2 in that order, then store it as x and display the result on the screen.**
"""

# ╔═╡ e713a534-471a-11eb-3ed2-b107c9f099e9
y = [1]

# ╔═╡ 672e6e90-472d-11eb-1cd4-47a4bb603977
md"""
# Data Frames

Julia has a very powerful data format called a data frame. A data frame is an object used to store data in Julia, and it is similar in structure to a spreadsheet.  However, the data are accessed and manipulated using functions in Julia instead of by pointing and clicking in a graphic user interface (GUI).  A data frame differs from an array in that it can contain multiple data types (e.g. numbers and words together) whereas an array can only contain one type (e.g. *only* numbers or *only words*).

Most often, you’ll use data frames to work with the data you generate in lab. Data frames can be created with the `DataFrame()` function from the `DataFrames` package.
"""

# ╔═╡ aeb966ca-472d-11eb-2644-6df07b4f9291
md"""
## Creating a Data Frame

Let's create a data frame with some survey results on favorite colors, shown in the table below.
"""

# ╔═╡ 88b2a490-472e-11eb-0337-1b0cefcd8495
md"""
Name | Age (years) | Height (cm) | Favorite Color 
------- | ------- | ------- | ------- 
 George | 37 | 161 | Green 
 Amy    | 22 | 157 | Blue
 Austen | 25 | 159 | Blue
 Sarena | 49 | 161 | Purple 
"""

# ╔═╡ 29350ada-472e-11eb-0309-f7cfc0136744
md"""
### Step 1: Load `DataFrames` package

Anytime you work with a data frame you will need to load the DataFrames package.
"""

# ╔═╡ 2fbf6742-472e-11eb-37e5-edb395bd4432
import DataFrames

# ╔═╡ 3377b5c4-472e-11eb-2a62-1b3548189ac4
md"""
### Step 2: Create a data frame

Create the data frame by entering arrays of values into the `DataFrame()` function.  Each array is a separate column in the data frame.  The general syntax is:

	DataFrame(colname1 = [val1, val2, ...], colname2 = [val1, val2, ...], ...)

Add the rest of the data from the table above to the data frame below.
"""

# ╔═╡ 78b48702-472e-11eb-3cc1-eb6454ae9770
fav_colors = DataFrame(Name = ["George", "Amy", "Austen", "Sarena"], Age_years = [37, 22, 25, 49])

# ╔═╡ ccadc17a-4730-11eb-2ebe-e546e7ab9b68
md"""
Notice how the data frame looks a lot like the table above.  The difference is that the data frame is actually saved in the Julia environment so you can access it to do calculations.  For example, to divide each person's age by 2:
"""

# ╔═╡ f56b0a9e-4730-11eb-24d9-476cdc76638c
fav_colors[!, "Age_years"] ./ 2

# ╔═╡ 0740e0ae-4731-11eb-1831-8d9b61c72b5b
md"""
You'll get practice with this in Lab 1.
"""

# ╔═╡ 0f7c906e-470a-11eb-33fd-cf95fffc270a
md"""
# Conclusion

Much like learning to speak a new language, learning a programming language like Julia takes time and practice. What you’ve seen here is the first layer of getting comfortable using Julia. 

You'll use Pluto for your lab notebooks this semester, and this exercise covered the basics of the Pluto interface and how to format text using Markdown.  You'll use Markdown anytime you need to add text to your lab notebook and Julia anytime you want to do calculations.

You will use all of this information many times over the course of the semester, beginning next week in lab.  Make sure you are beginning to understand it before moving on!



"""

# ╔═╡ 52d1b3e4-592a-11eb-122f-bd950b7f12b9
md"""
# Turn in Your Work
"""

# ╔═╡ e8b60f0c-4731-11eb-01ee-cf31edc0a70b
html"""
Before you leave, save your notebook as a .jl file AND a .html file, and turn both in on MS Teams:

<ul>
   <li> Go to the top of the page</li>

   <li> Type in/select your desired file path and file name in the box and click <b>Move</b>.  </li>

   <li> Click on the <img src="https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.0.0/src/svg/shapes-outline.svg" style="width: 1em; height: 1em; margin-bottom: -.2em;"> icon and choose <b>Static HTML</b></li>

	<li>Place both in the same folder, compress it to a ZIP file, and submit on MS Teams.</li>
</ul>
"""

# ╔═╡ f83e6a92-4729-11eb-18a1-bd4c78a5b6a4
if student === "Paws Catamount"
	md"""
!!! danger "Oops!"
    **Before you save**, remember to fill in your name at the top of this notebook!
	"""
end

# ╔═╡ 7a4521fc-4741-11eb-18b3-d34c22aa0a3e
md"""
# Exit

When you're ready to exit Julia you can:  
1. Close the browser tab.  
2. Press CTRL + C in the Julia REPL.  
3. Type `exit()` in the Julia REPL.


"""

# ╔═╡ 9cd675ec-4705-11eb-2859-cfc382e9b2b1
hint(text) = Markdown.MD(Markdown.Admonition("hint", "Hint", [text]));

# ╔═╡ eb461446-4708-11eb-07b6-05ba2068e780
	hint(md"Set `pizzas` equal to `people * avg / slices`")

# ╔═╡ 03870338-4709-11eb-0404-6bfb52439206
hint(md"Try setting `my_log_value` equal to `log10(10000)`.")

# ╔═╡ 6f275b36-4730-11eb-3c53-555c63cf1d4d
hint(md"Format the remaining columns the same way the first two are formatted.  It doesn't matter what you name the columns, but make sure the data *exactly* matches how it appears in the table -- including capital letters.  Make sure you put words/names in quotes but do **not** put numbers in quotes.")

# ╔═╡ 94065af4-4705-11eb-16d9-c78a06cd58ed
almost(text) = Markdown.MD(Markdown.Admonition("warning", "Almost there!", [text]));

# ╔═╡ 925f5a20-4705-11eb-09f5-e1f214c8b483
keep_working(text=md"The answer is not quite right.") = Markdown.MD(Markdown.Admonition("danger", "Keep working on it!", [text]));

# ╔═╡ b2ee51ec-4705-11eb-2f75-d3bce0238045
correct(text=md"Great! You got the right answer! Let's move on to the next section.") = Markdown.MD(Markdown.Admonition("correct", "Got it!", [text]));

# ╔═╡ 5eb0bd90-4705-11eb-2a1d-b54ad96adf30
if c == a * b
	correct(md"""**Great!** The value is c = $c.  So you now have a simple computer!
	
	Now go back above and change the value of **a = $a** to **a = $(a + 3)** and press **`Shift-Enter`**.
	What is the new value of **c**?  Notice how all the values get updated in this notebook!
	""")
else
	keep_working()
end

# ╔═╡ 8c391b44-4706-11eb-0071-b15bf2232605
if pizzas == people * avg / slices
	almost(md"Yes that is right! But we should round $pizzas up to an integer, otherwise the restaurant will be confused. 

Try `ceil(avg * people / slices)`! (Ceil stands for ceiling or round up.)")
elseif pizzas == ceil(people * avg / slices)
	correct(md"Yes that is right, that's a lot of pizza! Excellent, you figured out we need to round up the number of pizzas!")
else
	keep_working()
end

# ╔═╡ 8772cd1a-4708-11eb-2f38-f1a23b3971e8
if my_log_value != log10(10000)
	keep_working(md"Replace `1` with an expression to calculate the base-10 log of 10 000!")
else
	correct(md"""**Great!**  You figured it out.  Keep going.""")
end

# ╔═╡ 06bad5b0-471b-11eb-24be-1b2a6e23c518
if y != [4, 8, 3, 10, 12, 2]
	keep_working(md"Your vector should look like `[4, 8, 3, 10, 12, 2` and be called `y`.")
else
	correct(md"""**Great!**  You figured it out.  Keep going.""")
end

# ╔═╡ 9a68c9f2-472f-11eb-0e00-b3372d50b13b
let
fc = DataFrame(Name = ["George", "Amy", "Austen", "Sarena"], Age_years = [37, 22, 25, 49], Height_cm = [161, 157, 159, 161], Favorite_color = ["Green", "Blue", "Blue", "Purple"])
	if ncol(fav_colors) == 4
		
		if fav_colors[!, 3] != fc[!, "Height_cm"] && fav_colors[!, 4] != fc[!, "Favorite_color"]
		keep_working(md"One or more of your columns is incorrect.")
		else
		correct(md"""**Great!**  You figured it out.  Keep going.""")
	end
	else
		keep_working(md"""You should have 4 columns in your data frame.""")
end
end

# ╔═╡ Cell order:
# ╟─cf00b6e2-46fe-11eb-13e4-29d71149129e
# ╟─4dcc73fc-470a-11eb-23f6-5542c5a42a8d
# ╟─0ae8ab60-4718-11eb-1a3c-23b0f0c3164a
# ╠═fbaa31e6-4717-11eb-1d07-7fc2b65abf5b
# ╟─2341507a-46ff-11eb-1b20-1df79073c814
# ╠═ba026d20-46ff-11eb-2369-4f08a47549cb
# ╟─582dcf7a-4701-11eb-39d4-f30aa5d88b89
# ╟─aecf5432-4703-11eb-2c9a-cbad7d393b3b
# ╟─866092ee-4704-11eb-2a45-1783d0c0ff31
# ╟─411c0970-4704-11eb-245a-51b9f29ae0e3
# ╠═1445cce6-4705-11eb-3b08-791ce76f4379
# ╟─48929da6-4707-11eb-3a8f-3d56aac620bf
# ╠═73f1b176-4707-11eb-2d87-ad220e1a5d6d
# ╟─ee4aa4fa-4718-11eb-3340-bbd42fcf57fa
# ╠═f84be958-4718-11eb-12e3-95b11eb39813
# ╟─fd26fa44-4718-11eb-0011-e3c4423eee40
# ╟─ebb9810a-4704-11eb-2651-d79bb280f755
# ╟─b91d753c-4704-11eb-15bf-8b8cb3e6fe28
# ╠═17816204-4704-11eb-0930-dfeca9fba41c
# ╠═1a9c2abe-4704-11eb-22d0-d5f44267612e
# ╟─2be12536-4704-11eb-3ad4-b183794ad8ff
# ╠═1cbad30e-4704-11eb-361d-3d172cb57f3e
# ╟─5eb0bd90-4705-11eb-2a1d-b54ad96adf30
# ╟─2feccd04-4706-11eb-0670-2bea4e667021
# ╠═54b1aaec-4706-11eb-1421-dde8f96701ba
# ╠═559225ae-4706-11eb-32cd-2fe83b9af92a
# ╠═560b8cda-4706-11eb-19a3-8534c9d83a70
# ╟─822796f6-4706-11eb-080b-c12e201f4ba4
# ╠═8c869590-4706-11eb-2285-bbd41ee7e246
# ╟─8c391b44-4706-11eb-0071-b15bf2232605
# ╟─eb461446-4708-11eb-07b6-05ba2068e780
# ╟─c889a87e-4707-11eb-32f8-79c0ce2cb661
# ╠═5f1edfde-4708-11eb-2622-250cddf38d5b
# ╟─8772cd1a-4708-11eb-2f38-f1a23b3971e8
# ╟─03870338-4709-11eb-0404-6bfb52439206
# ╟─3dd584ee-4709-11eb-194a-f5986066f6ad
# ╠═5306b14e-4709-11eb-1346-c503c7fc90d5
# ╟─abbfa252-4719-11eb-0f80-efb85d4c628f
# ╠═6202f656-471a-11eb-2186-8bfe6d6cde86
# ╟─68591080-471a-11eb-04db-fd2d2cbf4c28
# ╠═816eeab0-471a-11eb-3009-a9d14186dafd
# ╟─b6435daa-471a-11eb-1f6b-775773ef3219
# ╠═e713a534-471a-11eb-3ed2-b107c9f099e9
# ╟─06bad5b0-471b-11eb-24be-1b2a6e23c518
# ╟─672e6e90-472d-11eb-1cd4-47a4bb603977
# ╟─aeb966ca-472d-11eb-2644-6df07b4f9291
# ╟─88b2a490-472e-11eb-0337-1b0cefcd8495
# ╟─29350ada-472e-11eb-0309-f7cfc0136744
# ╠═2fbf6742-472e-11eb-37e5-edb395bd4432
# ╟─3377b5c4-472e-11eb-2a62-1b3548189ac4
# ╠═78b48702-472e-11eb-3cc1-eb6454ae9770
# ╟─9a68c9f2-472f-11eb-0e00-b3372d50b13b
# ╟─6f275b36-4730-11eb-3c53-555c63cf1d4d
# ╟─ccadc17a-4730-11eb-2ebe-e546e7ab9b68
# ╠═f56b0a9e-4730-11eb-24d9-476cdc76638c
# ╟─0740e0ae-4731-11eb-1831-8d9b61c72b5b
# ╟─0f7c906e-470a-11eb-33fd-cf95fffc270a
# ╟─52d1b3e4-592a-11eb-122f-bd950b7f12b9
# ╟─e8b60f0c-4731-11eb-01ee-cf31edc0a70b
# ╟─f83e6a92-4729-11eb-18a1-bd4c78a5b6a4
# ╟─7a4521fc-4741-11eb-18b3-d34c22aa0a3e
# ╟─9cd675ec-4705-11eb-2859-cfc382e9b2b1
# ╟─94065af4-4705-11eb-16d9-c78a06cd58ed
# ╟─925f5a20-4705-11eb-09f5-e1f214c8b483
# ╟─b2ee51ec-4705-11eb-2f75-d3bce0238045
# ╟─9a7a31cc-46ff-11eb-38f5-bfd272f170a8
