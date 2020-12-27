---
layout: default
title: Data Processing
nav_order: 3
permalink: /project/hplc/data-processing
has_toc: true
parent: HPLC
grand_parent: Project (e-Cigarettes)
last_modified_date: 2020-12-26
---

# HPLC Data Processing 
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


The following video walks you through the data processing portion of this lab.

<div class = "tip">
You should turn a ZIP folder containing:  (1) your complete lab notebook as an .html and .jl file functioning with no errors, (2) your data files, (3) your completed assessment.
</div>

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=bb4bb7a4-7260-4f97-9ec6-ac6300e32d3d&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: 15px;" allowfullscreen allow="autoplay"></iframe>

## Exporting & Plotting Representative Chromatograms

1. Move all your .D data folders onto NEON and then into your lab notebooks folder. 
1. Use ChemStation or OpenChrom to export CSVs of your chromatograms.

## Standard Curve and Concentrations

1. Use your standards to determine the retention time for nicotine.
1. Use the HPLC software (or R if you prefer) to integrate the nicotine peak for each sample.
1. Manually record the integration results in your lab notebook.
1. Calculate a standard curve using a linear model with a floating intercept.   Use units of ppm for your standard curve.
1. Calculate the concentration (in mg/L) of nicotine in the QCs using your standard curve.
1. Calculate the concentration (in mg/L) of nicotine in the samples using your standard curve.
1. Calculate the original concentration of nicotine in the undiluted product (in the same units specified on the bottle).
1. Use the confidence intervals or a *t*-test (whichever you prefer) to determine whether the concentrations are *significantly* different. (See [Useful Information > Comparing Means]({{site.url}}/useful-info/statistics#comparing-means) for more information.)

## Limits of Detection and Quantitation

1. Calculate limits of detection and quantitation as you did in Lab 1.  Use the standard deviation of the entire blank as your standard deviation for the calculation. Report these in your technical report.

## Save & Turn In Your Work

1. Save your work as a .jl (Julia) file and .html (static HTML).
1. Compress your entire lab notebook including the .jl, .html, and .csv files into a ZIP file.
1. Attach the ZIP file to the MS Teams assignment for this lab when turning it in.
