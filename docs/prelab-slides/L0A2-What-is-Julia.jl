### A Pluto.jl notebook ###
# v0.12.18

using Markdown
using InteractiveUtils

# ╔═╡ 3f353a9e-5dae-11eb-13a7-11c8f46c92f5
# This cell computes, plots, etc.
begin
	using Plots
	plotly()
	y = rand(1000);
	x = 1:length(y);
	plot(x, y, xlab = "x", ylab = "y", legend = false)
end;

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


# ╔═╡ fdd84442-5dad-11eb-2b6f-9d4b28e9ecf2
md"""
# Julia + Pluto

We will use Julia with the Pluto notebook interface.

This allows us to mix text and Julia code in a single formatted notebook file.
"""

# ╔═╡ 416ac108-5dae-11eb-2f6e-bb6fc33c8bcd
md"""
This cell creates text with [Markdown](https://www.markdowntutorial.com/).
""";

# ╔═╡ 451a4fac-5daf-11eb-248a-956d16c86cd3
md"""
# Installing Julia + Pluto

Julia and Pluto are both 100% free (and open source)!

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
1. Turn in your notebooks by next Wednesday at midnight.
   - This is the **deadline** to turn in this assignment.  *No late work is accepted after the deadline!*
   - Extra credit is awarded for submit *dearly due date*.  You will get 5% extra credit if you turn an assignment in more than 24 hours before the deadline!.
   - This is described in the [latework policy](https://chem370.github.io/course-information/syllabus#late-work).
1. I will be available on live Q & A in Piazza and Chat in MS Teams for questions until the end of lab today.
"""

# ╔═╡ Cell order:
# ╟─f0dec1c8-5dab-11eb-3e47-55e15cceed16
# ╟─8a38df9c-5dab-11eb-25db-f1bfc8fe144c
# ╟─87139942-5dad-11eb-2ae1-d5ed261b3492
# ╠═c092d838-5dae-11eb-018d-1dda10cadc56
# ╟─fdd84442-5dad-11eb-2b6f-9d4b28e9ecf2
# ╟─416ac108-5dae-11eb-2f6e-bb6fc33c8bcd
# ╟─3f353a9e-5dae-11eb-13a7-11c8f46c92f5
# ╟─451a4fac-5daf-11eb-248a-956d16c86cd3
# ╟─2dcdc5a2-5db1-11eb-2e55-6d7d1184757c
