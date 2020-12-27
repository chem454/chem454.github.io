---
layout: default
title: FT-IR - Data Processing
nav_order: 3
permalink: /project/ft-ir/data-processing
has_toc: true
parent: FT-IR
grand_parent: Project (e-Cigarettes)
last_modified_date: 2020-12-26
---

# FT-IR Data Processing
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


<div class="tip">
You should turn a ZIP folder containing: (1) your complete lab notebook as an .html and .jl file functioning with no errors, (2) your data files, and (3) your completed assessment.
</div>


<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=683a0991-3eb6-4e62-8bda-ac4600e1a364&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: 15px;" allowfullscreen allow="autoplay"></iframe>

## Organize and Import Your Data

1. Create a folder for this lab on your computer.
1. Copy your data files from NEON into your lab notebook folder for this lab.
1. Import the data using `CSV.read()`.

## Baseline Correct the Spectra 

1. Baseline correct your spectra by subtracting the minimum value from each data point.  *This should make the minimum value on your plot 0.*

## Normalize the Spectra

1. Normalize your spectra by converting from absorbance units to relative absorbance.  You do this by dividing the whole spectrum by the maximum absorbance value.  *Your final data should range from 0 to 1.*

## Calculate the HQI  

1. Calculate the Hit Quality Index according to Eq. 2 in [Rodriguez et al (2011)](https://www.researchgate.net/publication/51602215_Standardization_of_Raman_spectra_for_transfer_of_spectral_libraries_across_different_instruments).  Be mindful of the difference between "x" (multiplication) and "·" (dot product).

## Save & Turn In Your Work

1. Save your work as a .jl (Julia) file and .html (static HTML).
1. Compress your entire lab notebook including the .jl, .html, and .csv files into a ZIP file.
1. Attach the ZIP file to the MS Teams assignment for this lab when turning it in.
