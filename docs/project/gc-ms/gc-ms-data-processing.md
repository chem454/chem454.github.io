---
layout: default
title: Data Processing
nav_order: 3
permalink: /project/gc-ms/data-processing
has_toc: true
parent: GC-MS
grand_parent: Project (e-Cigarettes)
last_modified_date: 2020-12-26
---

# GC-MS Data Processing
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

The following videos walk you through the data processing portion of this lab.

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=7d2b5841-5888-453d-9173-ac6300e32d05&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: 15px;" allowfullscreen allow="autoplay"></iframe>


<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=d8e961a2-7075-437e-815e-ac6300e32d6d&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: 15px;" allowfullscreen allow="autoplay"></iframe>


<div class = "tip">
You should turn a ZIP folder containing:  (1) your complete lab notebook as an .html and .jl file functioning with no errors, (2) your data files, (3) your completed assessment.
</div>

*An example notebook is available [here](https://alphonse.github.io/chem370/notebooks/good-example/)*.

## Organize & Import Your Data

1. Move the data folder for each sample (ending in .D) to NEON. 
1. Transfer the data to your lab notebook folder.

## Identify Your Peaks Using a Library

1. Use the GC-MS library (in ChemStation in lab or OpenChrom on your computer) to get an initial idea of what compounds are present.
1. Export the relevant mass spectra as CSV files in your data folder.

## Confirm the Library Identification in Julia

1. Import your chromatograms and mass spectra to Julia with `CSV.read()`.
1. Plot your chromatogram as *Relative Abundance (%)* vs. *Time (minutes)*.
1. Plot your mass spectra as *Relative Abundance (%)* vs. *m/z*.
1. Clearly identify the base peak, the molecular ion, and any important isotope peaks.  Also state how many rings and double bonds your molecule has, and whether it has an odd or even number of nitrogen atoms.  Provide a formula, common name, and molecular weight for each compound.  You must show your calculations for all of these items.  See the [mass spec guide](/chem370/guides/mass-spec) for help with interpretation.  Does your interpretation match the library?

## Save & Turn In Your Work

1. Save your work as a .jl (Julia) file and .html (static HTML).
1. Compress your entire lab notebook including the .jl, .html, and .csv files into a ZIP file.
1. Attach the ZIP file to the MS Teams assignment for this lab when turning it in.
