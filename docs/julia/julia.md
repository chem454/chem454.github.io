---
layout: default
title: Julia Tutorials
nav_order: 7
permalink: julia/
has_toc: true
has_children: false
---

# Julia Tutorials
{: .no_toc  }

----

<details open markdown="block">
  <summary>
  Table of Contents
  </summary>

  {: .text-delta }
1. TOC
{:toc}
</details>

## Other Julia Resources

- The book [*Think Julia*](https://www.oreilly.com/library/view/think-julia/9781492045021/?ar) is available as an e-book through the library.

## Installing/Opening Julia & Pluto

- View the video on Installing and Opening Julia in [Lab 0]({{site.url}}/lab-0/#install-julia-and-pluto).

## Creating a New Lab Notebook

## Loading CSV Files

- [View this example as a web page]({{site.url}}/docs/julia/anscombe_CSV.html)
- Download the Pluto Notebook for this Example: [https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_CSV.jl](https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_CSV.jl)

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=379ee23d-3b2c-4fc5-a54c-acc50107ad25&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all"  height="405" width="720" frameBorder="0" style="border: 0px solid #464646; display: block; margin: auto;" allowfullscreen allow="autoplay"></iframe>

## Working with Data Frames

- [View this example as a web page]({{site.url}}/docs/julia/anscombe_dataframe.html)
- Download the Pluto Notebook for this Example: [https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_dataframe.jl](https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_dataframe.jl)

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=9b2ed057-f0f5-4d3f-8fcf-acc50107acd9&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder="0" style="border: 0px solid #464646; display: block; margin: auto;" allowfullscreen allow="autoplay"></iframe>

## Plotting Data

- View the video tutorial for this example
- [View this example as a web page]({{site.url}}/docs/julia/anscombe_plot.html)
- Download the Pluto Notebook for this Example:[https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_plot.jl](https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_plot.jl)
- The official documentation for plotting in Julia: [http://docs.juliaplots.org/latest/](http://docs.juliaplots.org/latest/)

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=c4700bdf-f0e4-4222-b3eb-acc50107acaa&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder="0" style="border: 0px solid #464646; display: block; margin: auto;" allowfullscreen allow="autoplay"></iframe>

## Fitting a Linear Model

- View the video tutorial for this example
- View this example as a web page
- Download the Pluto Notebook for this Example

## Making Julia Load Faster

The "time to first plot" problem in Julia describes how it can take a relatively long time to start Julia and start working with data and/or get a plot displayed.   This is because all the packages you load must precompile each time Julia is started, and this process can take a long time.  The problem can be circumvented or alleviated in several ways:

1. Leave Julia running all the time and don't restart it unless necessary.  This is the easiest solution, but is not always possible or desirable.  
2. Use `PackageCompiler` to [create a sysimage](https://julialang.github.io/PackageCompiler.jl/dev/examples/plots/). 

    - To load Julia with the custom sysimage file use `julia --sysimage sys_plots.so`, for example.

## How to Make a Portable Installation of Juno

The Julia IDE Juno is built on Atom.  This can be problematic when trying to use both Atom and Juno.  One solution is to create a portable installation of Atom that is used as the Juno installation, and maintain a normal installation of Atom for routine Atom work.  The steps below describe how to create the portable installation of Atom.

1. Download the [Atom ZIP file](https://github.com/atom/atom/releases/latest) and extract to the desired location.
1. Create a folder next to the extracted Atom app called `.atom`.
1. If desired, change the name to Juno and the icon to the Juno icon.
1. Install Juno through the Atom package manager.
