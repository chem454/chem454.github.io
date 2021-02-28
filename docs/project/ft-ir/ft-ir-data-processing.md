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




<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=683a0991-3eb6-4e62-8bda-ac4600e1a364&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: 15px;" allowfullscreen allow="autoplay"></iframe>

## Organize and Import Your Data

1. Create a folder for this lab on your computer.
1. Copy your data files from NEON into your lab notebook folder for this lab.
1. Import the data using `CSV.read()` from `CSV.jl`.

## Baseline Correct the Spectra 

1. Baseline correct your spectra by subtracting the minimum value from each data point.  *This should make the minimum value on your plot 0.*

$$
y_{i,corrected} = y_{i} - y_{min}
$$

## Normalize the Spectra

1. Normalize your spectra by converting from absorbance units to relative absorbance.  You do this by dividing the whole spectrum by the maximum absorbance value.  ***After this step your data should range from 0 to 1.***

$$
y_{i,normalized} = y_{i,corrected} \div y_{max}
$$

## Calculate the HQI  

1. Calculate the Hit Quality Index according to Eq. 2 in [Rodriguez et al (2011)](https://www.researchgate.net/publication/51602215_Standardization_of_Raman_spectra_for_transfer_of_spectral_libraries_across_different_instruments):

    $$
    \text{HQI} = \frac{(\text{Reference} \cdot \text{Sample})}{(\text{Sample} \cdot \text{Sample}) \times (\text{Reference} \cdot \text{Reference})}
    $$

    Be mindful of the difference between "x" (multiplication) and "·" (dot product). 

    For any two vectors, $\mathbf{a} = [a_1, a_2, ..., a_n]$ and $\mathbf{b} = [b_1, b_2, ..., b_n]$, the dot product is:

    $$
    \mathbf{a} \cdot \mathbf{b} = \sum^{i=n}_{i=1} a_ib_i = a_1b_1 + a_2b_2 + ... + a_nb_n
    $$

    When $\mathbf{a}$ and $\mathbf{b}$ are **row vectors** the calculation is simply:

    $$
    \mathbf{a} \cdot \mathbf{b} = \mathbf{a} \times \mathbf{b}^\text{T}
    $$

    where $\mathbf{b}^\text{T}$ represents the *transpose* of $\mathbf{b}$, as in:

    $$
    \mathbf{a} \cdot \mathbf{b} = [a_1, a_2, ..., a_n] \times \begin{bmatrix}
               b_{1} \\
               b_{2} \\
               \vdots \\
               b_{m}
             \end{bmatrix}
    $$

    Julia does matrix multiplication by default, so this is easily calculated in Julia.  Assuming `a` and `b` are row vectors, then $\mathbf{a} \cdot \mathbf{b}$ is simply `a*b'` in Julia (or, equivalently, `a*transpose(b)`) where the `'` operator is identical to calling `transpose(b)`.  
    
    An alternative (more cumbersome!) approach is to use the `dot()` function from `LinearAlgebra.jl`, as in `using LinearAlgebra; dot(a, b)`.

     ***The dot product of two vectors is a scalar (single value)***; it is sometimes called the *scalar product* for this reason.

## Save & Turn In Your Work

1. Save your work as a .jl (Julia) file and .html (static HTML).
1. Attach your .jl, .html, and .csv files to the MS Teams assignment for this lab when turning it in.

<div class="tip">
You should turn a your complete lab notebook as an .html and .jl file functioning with no errors and (2) your 9 data files in CSV format.
</div>
