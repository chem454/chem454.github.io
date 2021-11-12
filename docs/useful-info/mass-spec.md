---
layout: default
title: Mass Spec Guide
nav_order: 2
permalink: useful-info/mass-spec
has_toc: true
parent: Useful Information
last_modified_date: 2020-12-26
---

# Guide to Interpreting Mass Spectra
<!-- {: .no_toc }
-----

<details open markdown="block">
  <summary>
  Table of Contents
  </summary>

  {: .text-delta }
1. TOC
{:toc}
</details> -->

This guide is based on McLafferty and Turecek, *Interpretation of Mass Spectra*, which is available in the WCU library.  Please consult it for more detail.  Additional resoures are listed at the bottom of this page.

Before you begin, convert your spectrum from raw abundance (counts) into relative abundance (% of base peak).  

## Look for the M$^{.+}$ (molecular ion) peak.

The molecular ion, sometimes called the *parent peak*, is the highest mass peak of significance in the spectrum (except for the M$^{.+}$ + 1, ..., etc. peaks).  It represents the unfragmented molecule, and can therefore tell you the *monoisotopic* mass of the analyte.  Not all compounds yield an M$^{.+}$ peak; some are too unstable.  Some compounds yield very abundant M$^{.+}$ peaks; this stability can be a clue to the structure.

## Use M$^{.+}$ + 1 peak to figure out C count.

Zoom in on the M$^{.+}$ peak and look for a very small, but real, peak 1 *m/z* unit above your molecular ion peak.  This peak is usually present for small, organic molecules and represents the fraction of the molecules containing one $^{13}$C atom.  Take the ratio of these two abundances and divide by the natural abundance of $^{13}$C to find the approximate number (+/- 1) of carbon atoms in the molecule.  (Or, remember, a ratio of 1.1 = 1C, 2.2 = 2 C, 3.3 = 3 C, ...)

The  M$^{.+}$ + 1 peak must be the highest mass in the spectrum, an odd-electron ion, and give logical, neutral losses (see 4 and 6 below). If you don't see an obvious M$^{.+}$ + 1 peak or see multiple peaks in distinct patterns, you may have halogens or other non-C,H,O,N atoms in your molecule.  

## Apply the nitrogen rule.

Is M$^{.+}$ odd or even? For small, organic molecules an even M$^{.+}$ strongly suggests an even number of nitrogen atoms (0 is even), and an odd molecular weight (M$^{.+}$) suggests an odd number of nitrogen atoms.

## Calculate rings and double bonds.

C$_{x}$H$_{y}$N$_{z}$O$_{n}$ will have *x* - 0.5*y* + 0.5*z* + 1 rings and/or double bonds.  Integers represent odd-electron ions; results ending in 0.5 represent even-electron ions.

## Look for the base peak.

The base peak is the largest peak in the spectrum (relative abundance = 100%).  It represents the most stable fragment (keeping in mind that some "fragments" are actually rearrangements).

## Calculate the identity of each peak using steps 2-4.

Attempt to identify any peaks possible.  Look for logical losses (e.g. -OH or -CH$_{3}$) and series of logical losses (e.g. -CH$_{3}$, -CH$_{2}$).  Look for isotopic abundances of fragments and assign compositions.  The nitrogen rule still applies to fragments, but keep in mind any odd-mass element could cause the same result.  When you've identified as many peaks as you can, attempt to deduce a structure.

## Additional Resources
<!-- {: .no_toc } -->

- McLafferty and Turecek, *Interpretation of Mass Spectra*.
- Athabasca Univsity CHEM 350 (Organic Chemistry) course materials on [Chem LibreTexts](https://chem.libretexts.org/Courses/Athabasca_University/Chemistry_350%3A_Organic_Chemistry_I/Chapter_12%3A_Structure_Determination%3A_Mass_Spectrometry_and_Infrared_Spectroscopy/12.02_Interpreting_Mass_Spectra) (mass spec section, with practice problems)

[![Compound Chem MS Cheatsheet](https://i0.wp.com/www.compoundchem.com/wp-content/uploads/2015/05/Mass-Spectrometry-Common-Mass-Spectra-Fragments.png?w=1654&ssl=1)](https://www.compoundchem.com/2015/05/07/mass-spectrometry/)
