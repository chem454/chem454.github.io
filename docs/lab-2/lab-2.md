---
layout: default
title: Lab 2 - GC-TCD
nav_order: 3
permalink: /gc-tcd/
has_toc: false
has_children: true
last_modified_date: 2020-12-05
---

# Gas Chromatography with Thermal Conductivity Detection
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

## Summary

**Objective:** 
- Determine which instrument is best for determining the percent composition of an unknown mixture.

**Prelab:**

- Prepare you lab notebook (see the next section, Lab 2 Prelab)
- Watch the introductory videos below

**Turn in:** 
- Your complete lab notebook as an .jl file, functioning with no errors, and a static .html file.
- Your data files.

**Student Learning Outcomes:**
- Recognize that [gas] chromatography separates a mixture of compounds.
- Explain how chromatographic peak area relates to composition of a mixture.
- Calculate figures of merit for a chromatogram: retention time, retention factor, resolution, and signal-to-noise ratio (S/N).
- Relate concepts about polarity from general and organic chemistry to instrumental analysis.
- Utilize Julia and Pluto as an electronic lab notebook.

## Introduction

You will be given mixture of unknown composition for this lab. It will contain several organic compounds with similar boiling points diluted in acetone. You need to (1) determine how many components there are in the mixture, (2) determine the percent composition for each compound, and (3) determine the relative polarities of the compounds.

There are two gas chromatographs available for this task, and your goal is to determine which works best. You will run the sample on both instruments and compare their performance. Specifically, one lab partner will use a Gow-Mac 150-series isothermal gas chromatography and the other will use a Gow-Mac 400-series. Both use thermal conductivity detectors (GC-TCD) and work on the same principles. They separate compounds by both boiling point and polarity, and produce a peak for each component wherein the peak area is proportional to the amount of that component present.

Watch the following video to refresh you memory about how chromatography works:

<iframe width="560" height="315" src="https://www.youtube.com/embed/SnbXQTTHGs4" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

And watch this video explaining the specifics of gas chromatography:

<iframe width="560" height="315" src="https://www.youtube.com/embed/4Xaa9WdXVTM" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Finally, the following video provides an overview of the specific instrument you will use in lab:

<iframe width="560" height="315" src="https://www.youtube.com/embed/0fxH9WRKigw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Safety

- You will use organic solvents in this lab.  Keep all solvents in the hood and tightly capped when not in use.  Wear goggles and gloves!
- The gas chromatographs operate at high temperatures.  Do not touch the top of the instrument.
- The microliter syringes using to inject samples are very sharp.  Be careful not to poke yourself and keep the protective cover on the needle when not in use.
