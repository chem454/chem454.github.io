---
layout: default
title: Preparing Datasheets
nav_order: 3
permalink: /datasheets
has_toc: true
parent: Instrument Project Info
is_child: true
last_modified_date: 2022-01-03
---



# Preparing Datasheets
{: .no_toc  }


<details open markdown="block">
  <summary>
  Table of Contents
  </summary>

  {: .text-delta }
1. TOC
{:toc}
</details>

# Introduction

Datasheets (also called spec sheets and cut sheets) are the way manufacturers typically communicate the technical specifications and performance characteristics of their products to consumers.  They are a dense, succinct way to convey this information.  Each group is expected to turn in a datasheet detailing the functioning of their spectrometer.  Your datasheet should be styled similarly to the datasheets you've looked up this semester.  You may use any software you wish to create it, but your final document must be a PDF.

# What to Include 

Your data sheet should include the following information.

## UV-vis Spectrometer (Undergraduates)

+ A clear picture or rendering of the spectrometer that is your *original* work.
+ ~~3-$\sigma$ limit of detection (units of intensity @ 1-second integration time)~~
+ ~~3-$\sigma$ limit of detection (units of intensity @ maximum integration time)~~
  > Remember the LOD is specified as three times the standard deviation (3-$\sigma$) of a blank measurement.
+ Wavelength calibration equation and values for each parameter
+ Example spectra of a test sample, including:
  + Your spectrum vs. literature spectrum of sample (or spectrum of sample taken with a commerical instrument, like the SpectroVis) 
  + Solution info (composition, concentration, etc)
+ Optical description (check the Smoky Mountain Scientific Website for a lot of this info):
  + Legible optical diagram to approximate scale
  + Grating information (blazes per mm and blaze angle)
  + Radius of curvature for mirrors
  + Slit width
  + Light source information
	+ Type of light source (LED, halogen, Hg-Xe, etc.)
	+ Diagram of light source
+ Microprocessor Type
+ GUI
  + Show screenshot of GUI
  + Turn in Code
+ Bill of materials: include every item that goes into the spectrometer with description, part number, quanity, individual cost, total cost

## UV-vis Spectrofluorometer (Graduate Students)
Graduate students should include the same information as undergraduates (listed above), *plus*:
+ Fluorescence light source information (type, wavelength, etc)
+ Fluorescence spectrum of test compound vs. literature
+ List of serial commands used to control the fluorometer + Code

## PAS Project

+ A clear picture or rendering of the spectrometer that is your *original* work.
+ ~~2-$\sigma$ limit of detection (units of intensity @ 1-second averaging time)~~
+ ~~2-$\sigma$ limit of detection (units of intensity @ 2-minute averaging time)~~
+ ~~Plot of frequency response of cell. (Signal vs. Frequency), with resonant frequency indicated.~~  Fourier transform plot of signal
+ ~~Calibration Curve or sensitivity calculation~~
+ Optical description:
 + Legible optical diagram to approximate scale
  + Radius of curvature for mirrors
  + Light source information
	+ Type of light source (LED, halogen, Hg-Xe, etc.)
	+ Diagram of light source
+ Microprocessor Type
+ GUI
  + Show screenshot of GUI
  + Turn in Code
+ Bill of materials: include every item that goes into the spectrometer with description, part number, quanity, individual cost, total cost
Each group will prepare a datasheet on their instrument.  More information forthcoming.


<!-- --- -->

<!-- ## How to Write a Technical Report -->

<!-- Students often struggle to see the difference between lab notebooks and technical reports.  The lab notebook is an *exact* record of what you did in lab and should include everything you do; the technical report is the polished story summarizing your study and should be curated accordingly (curated for clarity, not to sweep findings under the rug!). -->

<!-- Follow the guidelines below when writing your report.  Your report should be formatted according to the [ACS Style Guide](https://pubs.acs.org/isbn/9780841239999#) (template below). -->

<!-- - Dr. Fischer's [Writing Tips]({{site.url}}/technical-reports/writing-guide) (based on common mistakes) -->
<!-- - Dr. Fischer's [Publication-quality Figures Guide]({{site.url}}/technical-reports/figures) -->
<!-- - You report should contain the following sections (click each link for info on that section): -->
<!--     - [Title and Abstract]({{site.url}}/technical-reports/title-abstract) -->
<!--     - [Introduction]({{site.url}}/technical-reports/introduction) -->
<!--     - [Materials and Methods]({{site.url}}/technical-reports/materials-methods) -->
<!--     - [Results and Discussion]({{site.url}}/technical-reports/results-discussion) -->
<!--     - [Conclusions]({{site.url}}/technical-reports/conclusion) -->
<!--     - [References]({{site.url}}/technical-reports/references) -->

<!-- ## How you'll be graded -->

<!-- - Each group will turn in one comprehensive technical report at the end of the semester, written as a team.   -->
<!-- - The writing of this report will be completed in stages.   -->
<!--   - You will submit sections throughout the semester and will be given *qualitative* feedback on that section.   -->
<!--   - You will then be expected to integrate this feedback into your report before submitting it at the end of the semester.   -->
<!--   - Peer review will also be used as a tool for providing feedback.   -->
  
<!--   *The more polished your draft is the more I am able to give you meaningful feedback and the higher your final grade will be!* -->

<!-- - Your final submission will be graded *quantitatively* according to the lab ***[report rubric](https://github.com/alphonse/alphonse.github.io/raw/master/chem370/pdf/lab-report-rubric.pdf)*** (PDF). -->

<!-- ## Examples & Templates -->


<!-- - [Microsoft Word Template](https://catamountwcu-my.sharepoint.com/:w:/g/personal/dfischer_wcu_edu/ESJSHEwCANhNuKW_bapC2ucB8LdVraBrW5pvEMGiCz6pFQ?e=YLd2of) -->
<!-- <\!-- - [Microsoft Word Template](https://catamountwcu-my.sharepoint.com/:w:/g/personal/dfischer_wcu_edu/ESJSHEwCANhNuKW_bapC2ucBCdRurIpvfxZ2FHRRTc7s9w?e=ILpNgr) -\-> -->

<!-- <\!-- - [Google Doc ACS-style Report Template](https://docs.google.com/document/d/1XhNYeBbJk1YYdBPF9YDNg7n3DBvBJ3z26qHK0V4ae70/view?usp=sharing) -\-> -->

<!-- <\!-- - [Example Report](https://github.com/dr-fischer/chem370/raw/master/assets/pdf/chem370_technical_report_example.pdf): This report, written by previous students, is an example of a "A" level report. -\-> -->

<!-- <\!-- - [Example technical report 1](https://github.com/alphonse/alphonse.github.io/raw/master/course-information/technical-reportsexamples/example-report-1.pdf) -->
<!-- - [Example technical report 2](https://github.com/alphonse/alphonse.github.io/raw/master/course-information/technical-reportsexamples/example-report-2.pdf) -\-> -->

<!-- <\!-- - Claim assignment [template](https://github.com/alphonse/alphonse.github.io/raw/master/CHEM191/assignments/claim-report-template.docx) and [guidelines](https://github.com/alphonse/alphonse.github.io/raw/master/chem370/pdf/lab-report-rubric.pdf). -\-> -->

