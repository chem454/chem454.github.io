---
layout: default
title: Lab 1 Procedure
nav_order: 5
permalink: /uv-vis/procedure
has_toc: true
parent: Lab 1 - UV-vis
---

# UV-visible Spectroscopy: Lab Procedure
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

## Prepare Your Standards

1. Create your standards by diluting one of the 100-ppm quinine stock solutions to concentrations of approximately 100, 75, 40, 20, and 10 mg/L using the technique of serial dilution.  Use 25 mL volumetric flasks for these dilutions.

   <div class = "tip">It doesn't matter if you make these concentrations exactly.  What matters is that you're in the right ballpark and know your concentrations exactly.</div>

1. Create a quality control sample from a separate stock solution.  Make it a concentration that falls near the middle of your standard concentrations.  Use a 25 mL volumetric flask.

    <div class = "tip">When creating your QC, make sure you use stock solution from a different lot and preferably a different manufacturer.  This helps check for contamination in the chemicals received from the supplier.  You should also do your QC calculations entirely from scratch so that you check your math with the QC.</div>

## Prepare Your Samples

1. There is no sample preparation -- place samples in your cuvette undiluted.

## Acquire Data

*You will need [Vernier Spectral Analysis](https://www.vernier.com/product/spectral-analysis/) (free) installed on your computer for these steps.*

1. Connect the spectrophotometer to your computer via USB and open Vernier Spectral Analysis.  

1. When the software opens, expand **Fluorescence** and then select **vs. Wavelength (Full Spectrum)**.

    ![A screenshot showing the welcome screen of the Vernier Spectral Analysis software]({{site.url}}/assets/images/lab-2/spectral-analysis-welcome.png)

1. Select an **Excitation Wavelength** of **405nm** from the dropdown menu (if no menu appears automatically click the gear icon in the top right).  

1. Enter an **Integration Time** of **250 ms**.
    
    ![A screenshot showing the settings screen of the Vernier Spectral Analysis software]({{site.url}}/assets/images/lab-2/spectral-analysis-settings.png)

1. Fill a cuvette with your blank solution and click **Calibrate**.

   <div class = "tip">Your blank should be a cuvette filled with solvent and nothing else.</div>
   
1. Once the calibration has finished, fill your cuvette with the high standard (100 mg/L) and press **COLLECT**.
        
    1. Find $\lambda_{max}$ and record the value in your lab notebook.  You will make all measurements at this wavelength.  A typical value is 465 nm, but yours may vary slightly.
    1. If Fluoresence at $\lambda_{max}$ is <0.5 intensity units increase the integration time.  You may increase it up to 500 ms.
    1. If you see a flat line at the top of your peak lower the integration time until the maximum value is roughly 0.8.
    
    ![A screenshot showing the proper way to set the integration time to achieve a signal of 0.8]({{site.url}}/assets/images/lab-2/integration-settings.png)
    
1. Run your blank (in triplicate), standards (low to high), sample (in triplicate), and QC.  Rinse the cuvette with DI between each sample.  For each measurement:

    1. Click **Collect**.
    1. Use the cursor to find the fluorescence intensity at your $\lambda_{max}$ and record the sample name, concentration, and intensity (signal) value in your lab notebook.  For samples of unknown concentration you can enter `missing` as the concentration.
    1. Press **Stop**.
    1. Repeat for each measurement.
    1. When you are finished you should have spectra that look like the image below and should have a data table in your notebook that looks like the one below.

   <div class = "tip">When running your standards, always work from low concentration to high concentration to avoid carryover.</div>

   **What you should have in Spectral Analysis**
   
   ![A screenshot showing what the final data set should look like in Spectral Analysis]({{site.url}}/assets/images/lab-2/final-spectra.png)
   
   **What you should have in Pluto**
      
   ![A screenshot showing what the final data set should look like in Pluto]({{site.url}}/assets/images/lab-2/data-table-format.png)
   
1. When you are done, click the **Untitled** box in the top left corner and choose **Export > .CSV**.  Repeat the process but choose **Save As** to the raw data as a .smbl file that you can open in Spectral Analysis later.

## Cleanup and Properly Dispose Wastes

1. All acid waste should be placed in the waste container provided in the fume hood.
1. Make sure you wash all glassware with Alconox and warm water, followed by a triple DI rinse.
1. Shake out the glassware and put it back where you found it (with the caps on).  A little residual DI water in the glassware is OK.  
