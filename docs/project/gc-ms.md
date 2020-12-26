---
layout: default
title: GC-MS
nav_order: 2
permalink: /project/gc-ms
has_toc: true
parent: Project (e-Cigarettes)
last_modified_date: 2020-12-26
---

# Project: GC-MS
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

Gas chromatography is a technique used to separate mixtures of gases.  The gases are injected into a column, which (in our case) is a long, hollow tube with a non-polar liquid coating on the inside.  They are pushed through the column with a carrier gas, He in our instrument.  The column is initially held at low temperature (a little above room temperature) and ramped at a defined rate up to 250 degrees C.  The combination of the temperature ramp and the non-polar column allows compounds to be separated based on boiling point and polarity.  GC can be paired with many different techniques, and is often used with electron-ionization mass spectrometry.  This type of mass spectrometer breaks molecules apart into fragments, sorts the fragments by mass, and counts the number of fragments of each mass.  The specific spectrum (or distribution of fragments) is unique for every chemical compound and is based on the stability of each bond in the molecule.  In this way, the identity of a compound can usually be deduced from a mass spectrum alone, although techniques such as nuclear magnetic resonance spectroscopy and Fourier-transform infrared spectroscopy can greatly aid in identification.

You will conduct liquid phase microextraction to analyze the volatile constituents of e-cigarette liquid.  You should identify the major flavor constituents and comment on whether or not they may be harmful at the approximate levels present.

The general order for GC-MS sampling is: (1) run solvent blanks on the GC-MS until the instrument is clean,  (2) prepare a single sample using liquid-phase microextraction, (3) run the sample, and (4) repeat 2-4 as necessary.  You should obtain a clean blank before preparing your samples.  For GC-MS, a passing blank will have a baseline less than 50,000 counts that is stable and peak-free.  You may see an increase in the baseline at temperature above 250$^{\circ}$C; this is normal and still considered passing.  If the blank is dirty you will not be able to tell what is from your sample and what is contamination!  

This is a qualitative analysis.

### Safety 

- This lab uses small amounts of methanol ([SDS](http://www.sciencelab.com/msds.php?msdsId=9927227)).  Methanol can cause blindness and absorbs through the skin.  Wear gloves and goggles when working with methanol, and use it in a hood.  
- Microliter syringes are very sharp -- avoid poking yourself!
- Although samples are over-the-counter products, you should avoid ingesting and/or contacting them with your skin.

## Instrumentation 

1. Run a solvent blank on the GC-MS using the `CHEM370_Vape.M` method.  Use a microliter syringe to inject your sample and consult the GC-MS SOP.

    <div class="tip">
      A solvent blank in this case is 1 $\mu$L methanol and nothing else.

    Your blank should have a baseline less than 50,000 counts that is stable and free of peaks.  If you see peaks, run another blank until you don't!
    </div>

2. If your blank is clean, prepare a sample as per below and run on the GC-MS using the `CHEM370_Vape.M` method.  Consult the GC-MS SOP for more information.

## Sample Preparation

1. Place 5 drops of the e-cigarette liquid in a 2-mL GC autosampler vial.
1. Clean a microliter syringe with the syringe cleaning apparatus.
1. Load the syringe with 2 $\mu$L of methanol.
1. Place the syringe in an arm clamp/ring stand and push the GC autosampler vial onto the tip of the syringe.  You want the tip of the syringe to be about 1.5 mm from the top of the sample.

    <div class="warning">
    Do NOT let the tip touch the sample or the vial!
    </div>

1. *Gently* push the plunger of the syringe down all the way so that you have a small drop of methanol on the end of the syringe.  Do not let the drop touch anything!

    <div class="warning">
    The syringe plunger does not go all the way down to the glass body!  Do not force it or you will ruin the syringe!
    </div>

1. Expose the drop of solvent for 30 seconds and then pull the plunger back up to pull the methanol back into the syringe.  Do not bump the syringe, sample, or lab bench during this time.
1. Inject the sample into the GC immediately.
1. Clean the syringe and repeat as-needed for each sample.

## Data Processing

The following videos walk you through the data processing portion of this lab.

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=7d2b5841-5888-453d-9173-ac6300e32d05&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: 15px;" allowfullscreen allow="autoplay"></iframe>


<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=d8e961a2-7075-437e-815e-ac6300e32d6d&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: 15px;" allowfullscreen allow="autoplay"></iframe>


<div class = "tip">
You should turn a ZIP folder containing:  (1) your complete lab notebook as an .html and .jl file functioning with no errors, (2) your data files, (3) your completed assessment.
</div>

*An example notebook is available [here](https://alphonse.github.io/chem370/notebooks/good-example/)*.

### Organize & Import Your Data

1. Move the data folder for each sample (ending in .D) to NEON. 
1. Transfer the data to your lab notebook folder.

### Identify Your Peaks Using a Library

1. Use the GC-MS library (in ChemStation in lab or OpenChrom on your computer) to get an initial idea of what compounds are present.
1. Export the relevant mass spectra as CSV files in your data folder.

### Confirm the Library Identification in Julia

1. Import your chromatograms and mass spectra to Julia with `CSV.read()`.
1. Plot your chromatogram as *Relative Abundance (%)* vs. *Time (minutes)*.
1. Plot your mass spectra as *Relative Abundance (%)* vs. *m/z*.
1. Clearly identify the base peak, the molecular ion, and any important isotope peaks.  Also state how many rings and double bonds your molecule has, and whether it has an odd or even number of nitrogen atoms.  Provide a formula, common name, and molecular weight for each compound.  You must show your calculations for all of these items.  See the [mass spec guide](/chem370/guides/mass-spec) for help with interpretation.  Does your interpretation match the library?
