---
layout: default
title: Data Processing
nav_order: 3
permalink: /project/hplc/data-processing
has_toc: true
parent: HPLC
grand_parent: Project (e-Cigarettes)
last_modified_date: 2021-03-17
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

Use the following link to download the notebook template for this lab:

[https://raw.githubusercontent.com/chem370/chem370.github.io/master/docs/project/hplc/hplc-notebook-template.jl](https://raw.githubusercontent.com/chem370/chem370.github.io/master/docs/project/hplc/hplc-notebook-template.jl)


<div class = "tip">
Install the <code>StringEncodings</code> package before you open this template.
</div>

The following video walks you through the data processing portion of this lab.

<!-- *Having trouble viewing this video?  Click [here](https://wcu.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=aedc7087-71e6-4069-b131-ace6011333a6) to view it on Panopto instead.*

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=bb4bb7a4-7260-4f97-9ec6-ac6300e32d3d&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: 15px;" allowfullscreen allow="autoplay"></iframe> -->

<div class = "tip">
You should turn a your complete lab notebook as an .html and .jl file functioning with no errors and your CSV file.
</div>

## Export & Organize Your Data

1. Manually export your chromatograms as CSV files using Agilent ChemStation on the HPLC Computer:

    1. Navigate to the data processing pane (lower left side of the window).
    1. Find your run in the data broswer on the left side of the screen and double click to open it.
    1. Double click the line for your first chromatogram in the sequence (top middle section of software) so that the text turns blue.
    1. Right click on that same chromatogram and choose **Export > CSV** then make sure **Signal** is selected in the resulting window.  Follow the prompts to export your data, making sure to give each sample an appropriate name.
    1. Repeat these steps for every sample you ran.
    
1. Place all your CSV files in the same folder as your lab notebook.

<div class = "tip">
Make sure you don't have any extra CSV files in this folder.  Every CSV in this folder will get imported into Julia when you read the data.
</div>

<!-- 1. Move all your .D data folders onto NEON and then into your lab notebooks folder. 
1. Use ChemStation or OpenChrom to export CSVs of your chromatograms. -->

## Import Your Data

1. Use the custom `hplcImport()` function to import all of your data at once.  This function takes no arguments (just make sure your notebook and CSV files are in the same folder.)
1. You may wish to plot the chromatograms for inspection before moving further.  One way to quickly do this is:

    ```julia
    @df hplc_data plot(:Time, cols(2:ncol(hplc_data)))
    ```

## Integrate the Peaks

1. Use your standards to determine the retention time for nicotine.
1. Use the `fitPeak()` function to to integrate the peaks at the desired retention time.  
1. Use the `plotPeak()` function to visualize the results of the peak integrations.

## Create a Standard Curve

1. Use Julia to fit and plot a standard curve.  (See Lab 2 if you need a review.)

## Validate Your Results

1. Determine the concentration of the QC.
1. Determine the percent difference from the expected value.
1. Determine your LOD and LOQ.  For the standard deviation of your blank, use the standard deviation of the entire blank chromatogram.

## Determine the Concentration of Your Samples

1. Determine the concentration of your samples.  Remember to factor in all dilutions.  (See Lab 2 if you need a review.)
1. Use the confidence intervals or a *t*-test (whichever you prefer) to determine whether the metal concentration is *significantly* different before and after vaping. (See [Useful Information > Comparing Means]({{site.url}}/useful-info/statistics#comparing-means) for more information.)

## Save & Turn In Your Work

1. Save your work as a .jl (Julia) file and .html (static HTML).
1. Attach your .jl, .html, and .csv files to the MS Teams assignment for this lab when turning it in.
