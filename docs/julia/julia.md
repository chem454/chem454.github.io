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

- View the video tutorial for this example
- [View this example as a web page]({{site.url}}/docs/julia/anscombe_CSV.html)
- Download the Pluto Notebook for this Example: [https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_CSV.jl](https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_CSV.jl)

## Working with Data Frames

- View the video tutorial for this example
- [View this example as a web page]({{site.url}}/docs/julia/anscombe_dataframe.html)
- Download the Pluto Notebook for this Example: [https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_dataframe.jl](https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_dataframe.jl)

## Plotting Data

- View the video tutorial for this example
- [View this example as a web page]({{site.url}}/docs/julia/anscombe_plot.html)
- Download the Pluto Notebook for this Example:[https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_plot.jl](https://github.com/chem370/chem370.github.io/raw/master/docs/julia/anscombe_plot.jl)
- The official documentation for plotting in Julia: [http://docs.juliaplots.org/latest/](http://docs.juliaplots.org/latest/)

## Fitting a Linear Model

- View the video tutorial for this example
- View this example as a web page
- Download the Pluto Notebook for this Example

## Making Julia Load Faster

The "time to first plot" problem in Julia describes how it can take a relatively long time to start Julia and start working with data and/or get a plot displayed.   This is because all the packages you load must precompile each time Julia is started, and this process can take a long time.  The problem can be circumvented or alleviated in several ways:

1. Leave Julia running all the time and don't restart it unless necessary.  This is the easiest solution, but is not always possible or desirable.  
2. Use `PackageCompiler` to [create a sysimage](https://julialang.github.io/PackageCompiler.jl/dev/examples/plots/). 

    - To load Julia with the custom sysimage file use `julia --sysimage sys_plots.so`, for example.
