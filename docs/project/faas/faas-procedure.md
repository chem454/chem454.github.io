---
layout: default
title: Procedure
nav_order: 2
permalink: /project/faas/procedure
has_toc: true
parent: FAAS
grand_parent: Project (e-Cigarettes)
last_modified_date: 2020-12-26
---

# FAAS Procedure
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

## Standard Preparation

1. Prepare blanks from a mix of 90% ultrapure water/5% propylene glycol/5% glycerin (solution provided for you).
1. Prepare 5 zinc standards spanning the range of 0.1--1 ppm using the stock solution provided.  Dilute with 90% ultrapure water/5% propylene glycol/5% glycerin (solution provided for you) using volumetric glassware.
1. Prepare a QC from a different stock solution.  The concentration should fall somewhere near the middle of your standard curve.
1. Place your standards in 50 mL plastic centrifuge tubes for analysis.

## Sample Preparation

***Note: you only need to do this procedure with ONE of your samples!***

### Pre-vape Sample

1. Place approximately 1 mL of e-liquid in a tared 15-mL centrifuge tube.
1. Obtain the mass of the liquid in the tube.
1. Fill the tube to 10 g with ultrapure water.
1. Filter the sample into a clean centrifuge tube using a 0.45 $\mu$m syringe filter.

### Post-vape Sample

1. Fill an e-cigarette about half full with your e-liquid.
1. Use the laboratory vaping apparatus (peristaltic pump and collection tube) to vape the sample into a tared 15-mL centrifuge tube.  Vape the sample in 5-second bursts followed by 30-second pauses to mimic an actual user.  Do this step in the fume hood!
1. Obtain the mass of the liquid in the tube.
1. Fill the tube to 10 g with ultrapure water.
1. Filter the sample into a clean centrifuge tube using a 0.45 $\mu$m syringe filter.


## Instrument Procedure

1. Use the Flame AA SOP to prepare a flame AA *method* file containing your blanks and standards.  Use the `CHEM370_Vape` method as a template, but don't save over the template!
1. Prepare a *Sample Information File* containing your QC.
1. Run the blanks, standards, and QC.

    <div class = "tip">
    <ul>
    <li> A passing blank will show no signs of contamination. </li> 
    <li>  A passing standard curve will have $R^2 \ge 0.9990$. </li> 
    <li>  A passing QC will be within $\pm$ 5% of the known concentration.</li>  
    </ul>
    <b>If any of these is not passing you must repeat the analysis and/or remake your standards until they pass!</b>
    </div>

1. If everything passes, add your samples to your Sample Information File.
1. Run your newly-added samples.
1. Export your data to a CSV file using the **Data Manager** software package (shortcut on Desktop).  Use the `C370_template` design when prompted.

*If you have extra sample, try screening it for other metals! (Ask how.)*


## Waste Disposal and Cleanup

1. Collect all wastes in the Flame AA waste container.
1. Place used (empty) centrifuge tubes in the trash.
1. Wipe up any spilled e-cigarette liquid with a paper towel (including liquid that's leaked onto the e-cigarette).
1. Remove the vaping machine tubing and rinse it out with ultrapure water.
