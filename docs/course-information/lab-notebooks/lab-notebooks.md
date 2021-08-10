---
layout: default
title: Lab Notebooks
nav_order: 3
permalink: lab-notebooks/
has_toc: false
parent: Course Information
---

# Lab Notebook Guidelines 
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

## Overview

Your lab notebook is the single ***exact, permanent, legally defensible, archival record*** of what you did in lab.  In an academic setting, notebooks are often used by the person who wrote the notebook or a lab colleague when trying to repeat an experiment, process data, or publish results.  In a professional setting, they may be used to communicate work to new employees, defend against patent lawsuits, or support forensic or toxicological conclusions in a court of law.  A good test of your lab notebook is to imagine handing it to a peer who has never completed the lab.  Then, try to determine if there would enough information for them to (1) complete the lab with no other resources, (2) ***exactly*** repeat your data analysis and calculations and arrive at the ***exact*** same answer (including all significant digits), and (3) understand your conclusions and how you arrived at those conclusions.  When in doubt, it's better to include too much than too little!

Instrumental analysis presents unique challenges when it comes to keeping lab notebooks.  Often, the final data collected is a spectrum or chromatogram with thousands of data points.  Instruments save this directly in an electronic format, and archiving it in a paper lab notebook is often unfeasible.  To deal with that, this lab uses electronic lab notebooks.  You should use your electronic lab notebook exactly as you've used paper notebooks in the past -- record ***exactly*** what you did in lab *as you do it* (not afterwards!).  Include direct observations as necessary.  In addition, you will be required to link all data files to your notebook so that your analysis can be exactly repeated and checked for accuracy.

In an effort to conduct reproducible data analysis, you will use open-source tools for programmatic data analysis.  Your notebook will be kept using [**Pluto**](https://github.com/fonsp/Pluto.jl) (or equivalent data analysis notebook utility) and your data will be analyzed directly in your notebook using [**Julia**](https://julialang.org/) (or equivalent data analysis language).

## Example Lab Notebooks 

- [Good Example]({{site.url}}lab-notebooks/good) *Note: This notebook was created in Jupyter, not Pluto.*   
- [Bad Example]({{site.url}}lab-notebooks/bad-1)  *Note: This notebook was created in Jupyter, not Pluto.*   
    - This notebook contains no explanations of what was done and the data processing is incomplete.
- [Bad Example 2]({{site.url}}lab-notebooks/bad-2)  *Note: This notebook was created in Jupyter, not Pluto.*   
    - This example contains many errors that should have been fixed before it was turned in.

## Keeping an Archival Record 

To maintain an archival record, the lab notebook should:  

- contain an ***exact*** record of what you ***did*** (past tense);
- show ***all*** procedures and calculations, instrument parameters, and pertinent conclusions and background information;
- consist of functional code that can be run by another individual with no errors.

## Writing Your Procedures 

Your procedures in your notebook should state *exactly* what you did.  *Exactly!*  This is your exact record you could use to redo calculations, remember what the sample looked like, remember what special steps you took on the instrument, etc.  This is not the same as the methods in your paper; those are a *summary* of what you did.

- Write all procedures in *past tense*. Do not just copy the handout.  

	- *Good:* I added 1.0162 g of acetaminophen to a 200-mL volumetric flask and brought to volume with ultrapure water.
	- *Bad:* ~~Add 1 g of acetaminophen to 200 mL of water.~~

	- *Explanation:* The lab notebook is a record of what you did, not a cookbook.  If you were telling a friend about your vacation you wouldn't say "Get on a plane. Fly to Europe. Go to hotel.", you would say "I flew from Atlanta to Paris, and then stayed at a hotel in the city center."  Your lab notebook is no different.

		More importantly, the difference in significant digits is drastic. In the first example, the results will be limited to 5 significant digits by the balance (the balance reports 4 decimal places, or 5 SF in this case, and the volumetric flask contains 200 +/- 0.15 mL); in the second, all that precision has been thrown away and we're left with a single significant digit.

		Finally, the second provides no indication as to the purity of the water used, although this is very important for trace instrumental analysis.

- Include direct observations.

	- *Good:* Upon collection, I saw that the e-cigarette liquid had turned from clear-yellow to clear-brown after aerosolization.
	- *Bad:* ~~e-Cigarette liquid was collected.~~

	- *Explanation:* The first example includes pertinent observations of exactly what occurred when the step was performed.  This helps someone who is doing the lab for the first time know what to expect, and helps you remember what happened when you're going back through your notes.  Importantly, the color change probably indicates a chemical change occured in the sample, which may be worth investigating later.

## Significant Figures 

- **Balances:** In general, your significant digits should be limited by the balance. The exact number may depend on which balance you use.  Be sure to record all digits on the balance when mass is important, even if they are zeroes; if the last digit fluctuates do the best you can to estimate it.  Remember you do NOT have to weigh out the masses exactly as they appear on the worksheet -- what matters is that you get close and that you record the actual *exact* mass you used!
- **Volumetric Glassware:** All volumetric pipettes and flasks should be labeled with the volume of water they deliver or contain at room temperature along with the error associated with that volume.  Use this to determine your significant digits.  Flasks should be used *to contain* liquid (marked TC) and pipettes should be used *to deliver* liquid (marked TD); if your pipette has lines for both make sure you use the correct one (TD).
- **Graduated cylinders:** For small volumes, these typically have 3 significant digits.  You should interpolate to at least the nearest 0.5 mL when using a graduated cylinder.  Again, there is a large difference between recording 10 ml and 10.5 ml in your notebook in regards to significant figures (1 vs 3)!  Most work in instrumental analysis should use volumetric glassware and not graduated cylinders.
- **Beakers/Erlenmeyer Flasks:** These should not be used to measure volumes in instrumental analysis..

<!-- ## Plots 

Plots should be completed to a high degree of quality, as defined in the [Publication-quality Figures Guide]({{site.baseurl}}/chem370/writing/figures) -->

## Creating Instrument Tables 

You are expected to provide a table of all relevant instrument information in your lab notebook for each instrument you use.  There is no specific formula for creating these -- the information you need depends on the instrument.  The best way to learn what to include is to look at examples, a few of which are linked below.  You will need to look in the instrument method (in the software) and sometimes on the physical instrument itself to find the information you need.  If you're weary about opening an instrument up to look, please ask for help!

**Example Instrument Table for HPLC:**   
- [OSHA Method 1007](https://www.osha.gov/dts/sltc/methods/mdt/mdt1007/1007.pdf) (see p. 15, under Section 3.5, "Liquid chromatograph conditions")

**Example Instrument Table for Flame AA:**   
- Flame AA: [Perkin Elmer Application Note](https://www.perkinelmer.com/lab-solutions/resources/docs/PinAAcleMineralsinVitaminsbyFAAAppNote.pdf) (See Table 1)

**Example Instrument Table for FT-IR:**

|          Parameter           |        Value        |
| ---------------------------- | ------------------- |
| Make & Model                 | Thermo-Nicolet iS10 |
| Sampling Configuration       | Diamond ATR Cell    |
| Scan Range (cm<sup>-1</sup>) | 4000-600            |
| Resolution (cm<sup>-1</sup>) | 0.5                 |
| No. Scans                    | 64                  |
| Sampling Arrangement         | Diamond ATR         |

**Example Instrument Table for GC-MS:**

*Note: these are* examples *-- the actual parameters you used may be different!*

**Table 1: GC Method**

| Parameter                | Value             |
| ------------------------ | ----------------- |
| Make & Model             | Agilent 5890      |
| Column                   | HP-5ms            |
| Carrier                  | UHP He @ 9 psi    |
| Injection Port Temp (°C) | 250               |
| Initial Oven Temp        | 30°C for 1 min    |
| Oven Ramp Rate           | 30°C per min      |
| Final Oven               | 250°C for 3 min   |
| Detector                 | Mass Spectrometer |

**Table 2: MS Parameters**

| Parameter        | Value               |
| ---------------- | ------------------- |
| Make & Model     | Agilent 5975C       |
| Source           | Electron Ionization |
| Mass Filter      | Quadrupole          |
| Detector         | Electron Multiplier |
| Acquisition Mode | Scan                |
| Scan Range       | 30 - 400 m/z        |
| Scan Speed       | Normal              |
| Source Temp      | 250°C               |

<!-- ## The Block Diagram 

Your block diagram should illustrate the main parts of the instrument and provide clear labels for all parts.  An example of a UV-vis block diagram is shown below.  Notice that the main parts of the instrument are clearly shown with a labels.  Colors, shapes, images, and line thickness are used to convey information as well.  For example, the filter wheel selects green light from the broad-spectrum source so the light path is shown in green after that point.  Likewise, the beam splitter sends a fraction of the beam through the reference cell and the rest to the sample; thus, the line width is varied to show this.  

There is no specific formula for creating a block diagram -- your goal is to clearly, but succinctly, convey the key components and operating principle behind the instrument.  The best way to learn how to make one is to look at examples.  Your textbook has examples for most (if not all) the instruments it covers, and there are innumerable examples online on the websites of instrument manufacturers, in scientific papers, and in online encyclopedias.  Take a look around and get some ideas, and then make your own. (And don't just copy one you found!)

**Need help making the diagram or getting it into your notebook?  Watch these videos:**

1. Working with images in Jupyter and Exporting Images from Octave for your Report: [Panopto Video](https://wcu.hosted.panopto.com/Panopto/Pages/Viewer.aspx?id=57aa8a5b-df1d-4004-927a-ab90001bc595)
1.  Making a block diagram [Editing in Progress] -->

## Notebook Rubric

I will use this rubric to judge the *content* (not accuracy) of your notebook.  For all items: '2' = exceptional, '1' = satisfactory, and '0' = inadequate/not present.

| Item                                                                                                           | 2   | 1   | 0   |
| -------------------------------------------------------------------------------------------------------------- | --- | --- | --- |
| Descriptive title present?                                                                                     |     |     |     |
| Introduction present describing experimental goals?                                                            |     |     |     |
| Materials and Methods: detailed enough to convey *exactly* what was done?                                      |     |     |     |
| Materials and Methods: Instrument table(s) complete?                                                           |     |     |     |
| Results and Data: Calibration curve (if needed) plotted with high quality, including R2, slope, and intercept  |     |     |     |
| Results and Data: all spectra, chromatograms, etc., plotted with high quality                                  |     |     |     |
| Results and Data: Notebook runs without errors                                                                 |     |     |     |
| Conclusion present and clearly states outcome of experiment while discussing errors/future direction as needed |     |     |     |
| References clearly cited and used in the notebooks                                                             |     |     |     |
