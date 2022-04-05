---
layout: default
title: Julia Assignments
nav_order: 35
permalink: /programming/julia/
parent: Programming
last_modified_date: 2022-04-04
---


# Julia GUI Information
{: .no_toc  }

<details open markdown="block">
  <summary>
  Table of Contents
  </summary>

  {: .text-delta }
1. TOC
{:toc}
</details>

----

# Introduction

A *graphic user interface (GUI)* is a piece of software that provides a way to interact with an instrument in a "point-and-click" style.  The GUI is what most users interact with when they use a computer program or "app".  While there are many tools for developing a GUI, we will use Julia and Pluto in tandem because they provide a quick and easy way to get a very basic interface together.

## Tools for creating a GUI

In scientific labs and engineering development environments, LabVIEW is probably the most common software used to create a user interface.  LabVIEW is a proprietary software that provides a means of writing code graphically.  This is often called "G code" due to it's **g**raphical nature (not to be confused the G code used in machining!).  LabVIEW is especially good for scientists and engineers because it provides a set of pre-made interface items (numeric inputs, graphs, text inputs, gauges, etc.) and allows the user to easily arrange them on the "front panel" (GUI) for the instrument.  The function of each item can be controlled on the "block diagram" using graphical functions called "VIs" (virtual instruments).  These function blocks are connected using wires to indicate the flow of information from one function to another, which gives rise to the other colloquial name for LabVIEW programs: spaghetti code.  MATLAB, another proprietary software popular with scientists and engineers, provides some similar functionality and is also often encountered in a laboratory environment.  Both of these tools come with calculation and plotting abilities that are geared specifically toward scientific applications (e.g. Fourier transforms, data smoothing / averaging / filtering, curve fitting, statistical analysis, etc).

***Image of LabVIEW Code***

While LabVIEW and MATLAB are useful tools for GUI development, they are costly, often requiring subscriptions that cost hundreds or even thousands of dollars per year.  This makes them unattainable for many users.  There are a number of free and/or open-source tools for GUI development as well.  For those that often use Arduino boards, the **Processing** development environment is often used (processing is a dialect of Java).  **Python** is also becoming a popular language for GUI development.  While these tools (and the many others that can be used for GUI generation) can be very useful once the programmer is over the learning curve, they are based fully on textual code and lack some the graphical / modular features of LabVIEW.  Some of these languages (excluding Python) also lack simple plotting and calculation capabilities of LabVIEW and MATLAB.

**Pluto** is a recently-released notebook environment for the language Julia.  Pluto is unique in that it is *reactive* -- that is the notebooks update in realtime, such that if one input to the code changes, all the code updates automatically.  In addition, Pluto has an add-on package called **PlutoUI** that provides modular inputs in the form of HTML widgets.  These features make Pluto + Julia useful for creating a "quick-and-dirty" LabVIEW-style GUI.  Further, because Julia is geared toward scientific data processing, plotting and calculation functionalities are built-in out of the box.  In a Pluto notebook, the programmer can write code to display the user interface items that would commonly be found on LabVIEW's front panel, and the code can be hidden, much like the block diagram is hidden in a LabVIEW program.  For these reasons, we will use Julia + Pluto to create a GUI for the instruments built in this course.

## GUI Features

A good instrument GUI should typically perform the following functions:

1. *Control* the instrument by sending commands (often through the serial port).  These commands are typically issued via buttons, sliders, or other widgets that the user interacts with, but may also be issued automatically based on a feedback loop between the instrument and control software.  For example, there may be a button to turn a light on and off or acquire a spectrum.
1. *Acquire data* from the instrument and store it in memory (RAM). Again, this may be based on user input or autonomous data collection routines.
2. *Process data* that is acquired.  Often the instrument will report only raw data, and that data must be processed accordingly by performing calculations, smoothing, fitting curves, etc.  Most of this typically happens without user input.  For example, the spectrometer developed in this class report raw *intensity* values only but the user is interested in getting *absorbance*; the software will automatically calculate absorbance each time a spectrum is acquired.  Often, there will be options to control how many averages are completed, or what type of function is used to fit the data, etc.
4. *Save data* that is acquired and processed (i.e. both raw data and processed data).  Again, this may happen automatically or continuously while the isntrument is running (to avoid data loss) or based on user input (if only the "final" data is desired).  Often, a text box or dialogue is used to allow the user to choose a filepath/filename.

# Creating a GUI in Julia

It is nearly impossible to provide step-by-step instructions to create a functional GUI for a custom instrument.  Instead, this tutorial is broken up in logical sections so that you can navigate via the section headings and complete the section you need at the moment; this is not necessarily a linear document!

## Getting Julia, Pluto, and PlutoUI

1. [Install Julia and Pluto](https://chem370.github.io/lab-0/).
1. Load the [PlutoUI](https://github.com/JuliaPluto/PlutoUI.jl) package.
1. Click the **Open a sample notebook** link to get familiar with Julia and Pluto.  (I suggest the Interactivity and PlutoUI example notebooks.)

## Rules for Pluto

1. All code goes in "cells".
1. Only one line of code may be used in a cell; this may be circumvented by using `begin ... end` blocks, but this is discouraged except where necessary!
1. Cells may contain Julia code (the default), Markdown text (specified with `md""" ... """`), or HTML (specified with `html""" ... """`).  You may look up Markdown cheatsheets online, and we will use HTML only sparingly (if at all) in this course.

## Getting Started with PlutoUI

1. To use PlutoUI, first load it into your Julia workspace.  In an empty Pluto cell, type:

	```julia
	using PlutoUI
	```

1. A list of available widgets can be seen [here](https://github.com/JuliaPluto/PlutoUI.jl/blob/main/docs/src/index.md).

## Reactivity in Pluto

In most programming languages, code is executed top to bottom and does not update automatically.  For example, in normal Julia (or Python, R, C, MATLAB, FORTRAN, ...), typing

```julia
julia> a = 5
julia> b = 6
julia> c = a+b
julia> print(c)
```

would return `11`.  But if the programmer then runs `a = 6`, the value of c does *not* change!  The programmer must specifically re-run `c = a+b` to update the value of c.

In Pluto, Julia code becomes *reactive*, such that the value of c *does* change automatically when the value of either a or b changes!  This feature allows the notebook to respond to user input.

### Try it out!

1. In an empty Pluto cell, type `a = 5`.  This links the variable name "a" to the value of 5 in Julia's memory.
1. In another empty cell, type `b = 3`.This links the variable name "b" to the value of 3 in Julia's memory. 
1. In a third cell, type `c = a+b`.  This finds the saved variables, a and b, and then adds their values (5 + 3), giving c a value of 8.
1. Change either a or b and see what happens to the value of c!

## Binding Variables

Pluto uses the `@bind` macro to link Julia variables to HTML objects such as sliders, text boxes, etc.  You must bind the output of each input widget to a variable to have a functional interface.  More examples are available in each section below.



## Numeric Inputs

The most useful are:

```
Slider
NumberField
```

The function of these should be intuitive: a slider provides a slider bar to select a number in a range, while a number field is just an empty box the user can type a number into.

### Try it out!

1. In an empty Julia cell, type `@bind some_important_number Slider(1:10)`.  This allows the user to choose a value ranging from 1 to 10, and stores it in memory under the name "some_important_number".
1. In another empty cell, type `some_important_number`.
1. Move the slider and see what happens.
1. Note that you can only choose whole numbers by default, with each slider click increasing by a value of 1.  If you want to specify the resolution, you can do that by creating a sequence of numbers with the desired resolution.  For example, for a resolution of 0.5, you could type `Slider(1:0.5:10)`.
1. If you want to provide a default value, you can type something like `Slider(1:0.5:10, default = 2.5).

The same rules hold true for `NumberField()`.

## Buttons

1. In an empty Julia cell, type `@bind generate_random_number Button("Choose a Random Number")`.  This displays a clickable button with the label "Choose a Random Number", bound to the variable "generate_random_number".
1. In another empty cell, type
   ```julia
   begin
	   generate_random_number
	   rand()
   end
   ```
   
   Because Julia is reactive, a new random number will be generated everytime the button is pressed.  Note that the variable bound to the button must be placed in the cell you wish to update in order for this to work.

## Text Inputs

## Debouncing

One problem with this approach to a GUI is that the values update immediately. For example, if you enter the number "1000" into a numeric input, the code will execute 4 times, once each time a new digit is entered, even though we probably only want it to act on the final value 1000.  One way around this is known as *debouncing*, or adding a delay period that causes the program to wait to execute a command until the input is complete.  [fonsp](https://github.com/JuliaPluto/PlutoUI.jl/issues/69), the maintainer of Pluto, provides the following debouncing code.  To use it, simply add it in a new cell at the bottom of your notebook.  Any widget you want debounced can then be written as `debounced(Slider(...))`, in this example for a debounced Slider input.

```julia
begin
	struct Debounced
		x::Any
		wait::Real
	end
	debounced(x, wait=1000) = Debounced(x, wait)
	
	function Base.show(io::IO, m::MIME"text/html", d::Debounced)
		id = String(rand('a':'z',10))
		
		print(io, "<span id=$(id)></span>")
		show(io, m, d.x)
		
		print(io, """
			<script>
			const span = document.querySelector('#$(id)')
			const el = span.nextElementSibling
			
			const _ = window._
			
			el.addEventListener("input", (e) => {
				e.stopPropagation()
			})
			
			var value = null
			
			const debounced_setter = _.debounce(() => {
				span.value = value
				span.dispatchEvent(new CustomEvent("input", {}))
			}, $(d.wait))
			
			const dothing = async () => {
				for(const value_promise of Generators.input(el)) {
					value = await value_promise
					debounced_setter()
				}
			}
			dothing()

			
			</script>
			""")
	end
	
	Base.get(d::Debounced) = try
		Base.get(d.x)
	catch
		missing
	end
end
```
