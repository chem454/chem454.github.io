### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 37677ca8-470d-11eb-1456-e532c016191e
try 
	using Plots;
	plotly();
catch
	using Pkg; Pkg.add("Plots");
end

# ╔═╡ 154adf1c-470c-11eb-17d7-372c82203ac7
md"""
# Lab 0A: Getting Started in Pluto

Chem 370: Instrumental Analysis I (Lab)
"""

# ╔═╡ a2ea7b10-470d-11eb-22fb-536f9ae32369
md"""
**Instructions:** Read this exercise and make sure all the blue hint boxes and red error boxes have disappeared before moving on.  You can mouse over the blue hints if you get stuck!

You may want to take notes so you can refer back to them later, especially on the Markdown Tutorial.
"""

# ╔═╡ 9ff0f9a0-59fc-11eb-1724-81ba2cb6eecd
md"""
**Enter your name in the cell below next to student (inside the quotes):**
"""

# ╔═╡ e02c6234-59fa-11eb-38b5-c1c2c16d1dc8
# Replace Paws' name with yours:

student = "Paws Catamount"

# press the ▶ button in the bottom right of this cell to run your edits
# or use Shift+Enter

# you might need to wait until all other cells in this notebook have completed running. 

# scroll down the page to see what's up

# ╔═╡ 3adecf4a-470c-11eb-0b4b-0f6a72d9d05b
md"""
# Introduction

You'll use two tools to write your lab notebooks this semester: (1) the Julia programming language, which allows you to perform calculations, and (2) the Pluto notebook extension for Julia. Pluto is an add-on for Julia that makes it easy to combine text and code into an electronic notebook format.  

Put very simply, you will write code in the form of text commands and ask Julia to run the code. Once it’s finished running, Julia gives you the output (answers) you’ve asked for. For example, to create an x-y scatter plot of 1, 2, 3 and 6, 5, 4 you would type `scatter([1, 2, 3], [6, 5, 4])`, which produces the plot below.


"""

# ╔═╡ 311e68c0-470d-11eb-0260-fb108bccfdc0
scatter([1, 2, 3], [6, 5, 4], label = "Very Interesting Data")

# ╔═╡ 10c0e912-5a00-11eb-18d8-372d91ee2465
md"""
In this tutorial you’ll explore the Pluto notebook interface and learn Markdown.  Learning these tools will help you prepare for Lab 1, so it's essential you're beginning to understand them before you come to lab next.
"""

# ╔═╡ 60210718-470d-11eb-3132-5b4961163cba
md"""
# Understanding Pluto

Pluto notebooks are composed of *cells*, which are represented as tan boxes in the notebook.  

The rules for Pluto cells are:
- A cell can contain text *or* calculations (but not both)
- A cell can only contain one line of code

All text must be written in [Markdown](https://en.wikipedia.org/wiki/Markdown), which you can think of as a very simple word processing utility.  All code must be written in the Julia language.

The methods of working with Pluto cells are:
- To add a new cell, click the plus (+) icon on the left top or bottom of an existing cell.
- To execute the code contained in a cell press the play button on the bottom right of the cell.
- To delete a cell press the x on the right side of the cell.
- To move a cell hover the mouse outside the left side of the cell and drag it to a new location.
- To hide or show the code in a cell click the grey eyeball in the top left corner.

To get practice with this, complete the following excerpt about cats from the Getting Started example notebook included with Pluto and written by Fons van der Plas & Nicholas Bochenski.  

"""

# ╔═╡ 09c1a1ac-4712-11eb-3bec-47379bf18ee9
md"## Cats

In this introduction, we will go through the basics of using Pluto. To make it interesting, this notebook does something special: it **changes while you work on it**. Computer magic ✨

Let's say you're like my grandma, and you have a lot of cats. Our story will be about them."

# ╔═╡ 76a63134-4712-11eb-103a-f772d40f8b01
cat = "Ks*;lj"

# ╔═╡ 842adb48-4712-11eb-0a7c-651cef12ce92
if cat == "Ks*;lj"
	md"Oh no! Someone messed with my pretty introduction. Change the code above to give our cat a proper name!"
else
	HTML("""<p><b>Well done, your cat is called $cat now.</b> This text gets updated every time you change the name.</p>""")
end

# ╔═╡ 8ec15b5e-4712-11eb-06f8-1dc9d28d42b9
html"""<p>To edit any code, just click on it. When you're done programming, press the <img src="https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.0.0/src/svg/caret-forward-circle-outline.svg" style="width: 1em; height: 1em; margin-bottom: -.2em;"> in the lower-right corner of a cell to run the code. You can also use `Shift+Enter` if you are in a hurry.</p>"""

# ╔═╡ 82cebea0-4716-11eb-258f-278d5a6386f9

if cat == "Ks*;lj"
md"""
!!! hint
    Replace `Ks*;lj` with your favorite cat name.
"""
else
	
end

# ╔═╡ 987108ae-4712-11eb-02c9-ef55d0a24035
md"I feel like our cat needs a friend. Let's call them $(friend)."

# ╔═╡ 96d2e434-4712-11eb-360a-39da622b5d8a
if !@isdefined friend
	md"Uh oh, that's an error message 😦...I forgot to add a cell defining $(cat)'s friend. Can you do it for me?  You should never leave an unresolved error in your notebook!"
else
	md"**Well done!** $cat and $friend are both happy with your performance."
end

# ╔═╡ 6e649206-4713-11eb-0db2-c9ce65669303
html"""<p>A cell is a container for code & output. To add one, click on the <img src="https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.0.0/src/svg/add-outline.svg" style="width: 1em; height: 1em; margin-bottom: -.2em;"> above or below another cell. You can do it wherever you like. After you're done writing code in your cell, remember to run it!</p>"""

# ╔═╡ a17d0928-4715-11eb-0bbd-19ac53fda5c6

if !@isdefined friend
	md"""
!!! hint
    Click the plus button above this hint and type `friend = "Any Name You Want"` into the cell. Then press `Shift + Enter` to run the cell.
"""
else
	
end


# ╔═╡ 86db1226-4713-11eb-0732-7d4235896654
md"## Saving cats and notebooks
Alright, we have a neighborhood full of cats. But oh no, here comes..."

# ╔═╡ 71bf7530-472c-11eb-2c8b-f555fbe97cb1
scary_dog = "Odie"

# ╔═╡ 94e69392-4713-11eb-0c1e-8b0c72b11c1f
if @isdefined scary_dog
	md" $scary_dog is terrorizing the neighborhood! 🙀 We must do something about it!"
else
	md"You saved the neighborhood!"
end

# ╔═╡ a3acf358-4713-11eb-3e48-1b454f8e79fe
HTML("""<p>To delete a cell like the one defining the scarry dog, click on the <img src="https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.0.0/src/svg/close-circle-outline.svg" style="width: 1em; height: 1em; margin-bottom: -.2em;"> on the right of its code.</p>""")

# ╔═╡ ace605ca-4713-11eb-0316-65692aef2fbd
md"""
Speaking of saving, this notebook is autosaved whenever you change something. The default location for new notebooks is $(joinpath(first(DEPOT_PATH), "pluto_notebooks")), you can find it using your file explorer. To change the name or the directory of a notebook, scroll to the top - you enter the notebook's path next to the Pluto logo.
"""

# ╔═╡ 3c0066e6-4710-11eb-16d8-a7ecc5fa9414
md"""
# Formatting Text with Markdown

You should have noticed that Pluto makes it possible to place formatted text between code cells.  This is done with Markdown, and you'll use this feature a lot in your notebooks.  Using it only requires you know a few basic rules. Complete the tutorial linked below to learn those rules.

[**COMPLETE THE MARKDOWN TUTORIAL**](https://www.markdowntutorial.com/).  

There's also a [cheatsheet](https://www.markdownguide.org/cheat-sheet/)!
"""

# ╔═╡ 66651b66-4710-11eb-02de-49e2a200a0e9
md"""
# Markdown in Pluto

Pluto will assume each cell contains Julia code.  If you want to use Markdown you have to tell it so.  This is done using the syntax in the cell below.
"""

# ╔═╡ ad28d8ca-4711-11eb-2105-d17ff393e508
md"""
This is a **Markdown** cell.  All the Markdown syntax you just learned works!
"""

# ╔═╡ b28c4efa-4711-11eb-1f51-c38e7657f7ae
md"""
Anything placed inside the quote symbols gets rendered as formatted text when you press play.  You can hide the original Markdown code by pressing the grey eyeball icon in the top left of the cell.  Try it out!

When you're done typing the Markdown, you can hide the raw text by clicking the grey eyeball in the top left of the cell to make your notebook look nice!
"""

# ╔═╡ c54deb00-4713-11eb-030e-81345064da97
md"""

# Conclusion

You'll use Pluto for your lab notebooks this semester, and this exercise covered the basics of the Pluto interface and how to format text using Markdown.  You'll use Markdown anytime you need to add text to your lab notebook.  In the next exercise you'll learn how to embed calculation and plots using Julia.

You will use all of this information many times over the course of the semester, beginning next week in lab.  Make sure you are beginning to understand it before moving on!
"""

# ╔═╡ bebcdecc-59fb-11eb-0425-49db3c76091b
md"""
# Turn in Your Work
"""

# ╔═╡ bd074220-59fb-11eb-39bc-a330c510648a
html"""

Save your notebook as a .jl file AND a .html file, and turn both in on MS Teams:

<ul>
   <li> Go to the top of the page</li>

   <li> Type in/select your desired file path and file name in the box and click <b>Move</b>.  </li>

   <li> Click on the <img src="https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.0.0/src/svg/shapes-outline.svg" style="width: 1em; height: 1em; margin-bottom: -.2em;"> icon and choose <b>Static HTML</b></li>

	<li>Upload both as attachments to this assignment in Teams.</li>
</ul>
"""

# ╔═╡ f34796d8-59fa-11eb-02ec-9d2147dff6d1
if student === "Paws Catamount"
	md"""
!!! danger "Oops!"
    **Before you save**, remember to fill in your name at the top of this notebook!
	"""
end

# ╔═╡ d5ae92ba-59fb-11eb-11c9-7d83aeb4abb5
md"""
When you're ready to exit Julia you can:  
1. Close the browser tab.  
2. Press CTRL + C in the Julia REPL.  
3. Type `exit()` in the Julia REPL.

(But don't forget to do Exercise 0B!)
"""

# ╔═╡ Cell order:
# ╟─154adf1c-470c-11eb-17d7-372c82203ac7
# ╟─a2ea7b10-470d-11eb-22fb-536f9ae32369
# ╟─9ff0f9a0-59fc-11eb-1724-81ba2cb6eecd
# ╠═e02c6234-59fa-11eb-38b5-c1c2c16d1dc8
# ╟─3adecf4a-470c-11eb-0b4b-0f6a72d9d05b
# ╠═311e68c0-470d-11eb-0260-fb108bccfdc0
# ╟─10c0e912-5a00-11eb-18d8-372d91ee2465
# ╟─60210718-470d-11eb-3132-5b4961163cba
# ╟─09c1a1ac-4712-11eb-3bec-47379bf18ee9
# ╠═76a63134-4712-11eb-103a-f772d40f8b01
# ╟─842adb48-4712-11eb-0a7c-651cef12ce92
# ╟─8ec15b5e-4712-11eb-06f8-1dc9d28d42b9
# ╟─82cebea0-4716-11eb-258f-278d5a6386f9
# ╟─987108ae-4712-11eb-02c9-ef55d0a24035
# ╟─96d2e434-4712-11eb-360a-39da622b5d8a
# ╟─6e649206-4713-11eb-0db2-c9ce65669303
# ╟─a17d0928-4715-11eb-0bbd-19ac53fda5c6
# ╟─86db1226-4713-11eb-0732-7d4235896654
# ╠═71bf7530-472c-11eb-2c8b-f555fbe97cb1
# ╟─94e69392-4713-11eb-0c1e-8b0c72b11c1f
# ╟─a3acf358-4713-11eb-3e48-1b454f8e79fe
# ╟─ace605ca-4713-11eb-0316-65692aef2fbd
# ╟─3c0066e6-4710-11eb-16d8-a7ecc5fa9414
# ╟─66651b66-4710-11eb-02de-49e2a200a0e9
# ╠═ad28d8ca-4711-11eb-2105-d17ff393e508
# ╟─b28c4efa-4711-11eb-1f51-c38e7657f7ae
# ╟─c54deb00-4713-11eb-030e-81345064da97
# ╟─bebcdecc-59fb-11eb-0425-49db3c76091b
# ╟─bd074220-59fb-11eb-39bc-a330c510648a
# ╟─f34796d8-59fa-11eb-02ec-9d2147dff6d1
# ╟─d5ae92ba-59fb-11eb-11c9-7d83aeb4abb5
# ╟─37677ca8-470d-11eb-1456-e532c016191e
