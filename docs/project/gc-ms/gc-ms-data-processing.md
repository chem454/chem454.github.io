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

## Introduction
{:toc}

For this exercise, you will analyze only **one** of your samples (your lab partner will analyze the other).  Choose two peaks in your sample to analyze.

Use the following link to download the notebook template for this lab:

- [https://github.com/chem370/chem370.github.io/raw/master/docs/project/gc-ms/gcms-notebook-template.jl](https://github.com/chem370/chem370.github.io/raw/master/docs/project/gc-ms/gcms-notebook-template.jl)

*An example notebook is available [here](https://alphonse.github.io/chem370/notebooks/good-example/)*.

The following videos provide an overview of mass spectrometry and mass spectrum interpretation:

<!-- <iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=21813c10-83d2-4dad-8bac-ad030117a360&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: 15px;" allowfullscreen allow="autoplay"></iframe>
 -->

[ Coming Soon ]

<div class = "tip">
You should turn in (1) your complete lab notebook as an .html and .jl file functioning with no errors and (2) your data files.
</div>

## Search the NIST Library & Export Your Data

*You may alternatively install OpenChrom on your computer and do the searching and exporting on your own computer. See [below]({{site.url}}/project/gc-ms/data-processing#alternative-use-openchrom-for-the-library-search-on-your-own-computer) for details.*

### Search the NIST Library

1. Open each data file in the GC-MS data processing software on the GC-MS computer.
1. Select the peak(s) you are interested in, right click, and choose **Select** to open the mass spectrum.
1. Right click on the mass spectrum and choose **Search** to use the NIST library to determine a potential identity of the compound.  Record the top results in your lab notebook as starting points.

### Export the Data

1. Export 3 CSV files: (1) the chromatogram, (2) a mass spectrum for the first peak of interest, and (3) a mass spectrum of the second peak of interest.
1. Move the data folder for each sample (ending in .D) and CSV files to NEON. 

## Organize & Import Your Data

1. Transfer your data folder(s) to your lab notebook folder.

## Confirm the Library Identification in Julia

1. Import your chromatograms and mass spectra to Julia with `CSV.read()`.
1. Plot your chromatogram as *Relative Abundance* vs. *Time (minutes)*.
1. Plot your mass spectra as *Relative Abundance* vs. *m/z*.
1. Clearly identify the base peak, the molecular ion, and any important isotope peaks.  Also state how many rings and double bonds your molecule has, and whether it has an odd or even number of nitrogen atoms.  Provide a formula, common name, and molecular weight for each compound.  You must show your calculations for all of these items.  See the [mass spec guide](/chem370/guides/mass-spec) and [mass spec practice problems](/useful-info/mass-spec-practice) for help with interpretation.  Does your interpretation match the library?  Provide a discussion of your results.

## Save & Turn In Your Work

1. Save your work as a .jl (Julia) file and .html (static HTML).
1. Attach the .jl, .html, and .csv files to the MS Teams assignment for this lab when turning it in.

## Alternative: Use OpenChrom for the Library Search (on your own computer)

1. Move the data folder for each sample (ending in .D) to NEON. 

1. Follow the steps in the video to install OpenChrom, add a library, search the library, and export CSV files.

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=7d2b5841-5888-453d-9173-ac6300e32d05&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: 15px;" allowfullscreen allow="autoplay"></iframe>
