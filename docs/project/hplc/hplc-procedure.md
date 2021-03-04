---
layout: default
title: Procedure
nav_order: 2
permalink: /project/hplc/procedure
has_toc: true
parent: HPLC
grand_parent: Project (e-Cigarettes)
last_modified_date: 2020-12-26
---

# HPLC Procedure
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

1. Prepare blanks from ultrapure water.
1. Prepare nicotine standards ranging from 1--100 ppm using the stock solution provided.  Use ultrapure water as your solvent.
1. Use a separate stock solution to prepare a QC.  The nicotine concentration should fall toward the middle of your standard curve.
1. Place your standards in 2 mL HPLC autosampler vials for analysis (the ultrapure water is already filtered, so as long as you use fresh water you do not need to filter again!).

## Running Standards

1. Warm up the HPLC according to the HPLC SOP.  Use the `CHEM370_Vape.M` method.
1. Place your standards in the HPLC autosampler.
1. Prepare a sequence based on the autosampler locations of your samples (refer to HPLC SOP for more info).  Prepare your sequence in this order:
    1. Zero Standard/Rinse Blank (water)
    1. Low Standard
    1. Medium-low Standard
    1. Medium Standard
    1. Medium High Standard
    1. High Standard
    1. Rinse Blank
    1. QC Sample
1. After the instrument has warmed up (stable baseline), run your sequence.
1. Analyze your standard curve, blanks, and QC.

    <div class = "tip">
    <ul>
    <li> A passing blank will show no signs of contamination. </li> 
    <li>  A passing standard curve will have $R^2 \ge 0.9900$. </li> 
    <li>  A passing QC will be within $\pm$ 5% of the known concentration.</li>  
    </ul>
    <b>If any of these is not passing you must repeat the analysis and/or remake your standards until they pass!</b>
    </div>

## Sample Preparation

Repeat the following for each sample:

1. Tare an HPLC sample vial.
1. Place 2 drops of e-cigarette liquid in the vial and record the mass of liquid added.
1. Fill to top with approximately 2 mL ultrapure water.
1. Record the mass of the solvent you added.  You will need the masses to back calculate the undiluted nicotine concentration during data analysis.
1. Prepare enough samples to analyze all samples in triplicate.

    <div class = "tip">
    Note that the ultrapure water and e-cigarette liquid are already filtered, so you do not need to filter them again during sample prep!
    </div>

## Running Samples

1. Warm up the HPLC according the the HPLC SOP (skip if already warm).
1. Place your standards in the HPLC autosampler.
1. Prepare a sequence based on the autosampler locations of your samples (refer to HPLC SOP for more info).  Prepare your sequence in this order:
    1. Standards & QC (see [Standard Preparation]({{site.url}}//project/hplc/procedure#standard-preparation) section)
    1. Up to 10 samples
    1. QC Sample (same as previous QC; always finish with QC)
1. After the instrument has warmed up, run your sequence.
1. Analyze your standards and samples (you may skip the standards again if you've run them in the past hour -- just start with a QC instead).
1. Use a *t*-test or confidence intervals to determine if the mass of nicotine is *significantly* different from the expected mass. (See [Comparing Means](https://chem370.github.io/useful-info/statistics#comparing-means) for more information on comparing means.)
