---
layout: default
title: Lab 1 Data Processing
nav_order: 6
permalink: /gc-tcd/data-processing
has_toc: false
parent: Lab 1 - GC-TCD
last_modified_date: 2020-12-17
---

# GC-TCD Data Processing 
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

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=69790db3-01a1-4dc7-9f63-ac2900f490b5&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: auto;" allowfullscreen allow="autoplay"></iframe>


## Step-by-Step Instructions

1. Create a new R project for this lab and use it for all your data processing. Make sure your data files are also in this folder. Use the path: `lab-notebooks/Lab 2: GC-TCD`.  (You should have done this in Exercise 1.4.)
1. Load the CSV files into R/RStudio.  You may also want to plot the data to inspect it.

    ```{R, eval = FALSE}
    chromatogram <- read.csv('filename.csv');  # replace 'filename' with your filename
    ```

1. Remove the baseline offset (DC offset) from the data.

    ```{R, eval = FALSE}
    ## Define the "baseline" as 4 minutes to end of chromatogram where there are no peaks
    baseline = mean(chromatogram[481:end, 2]);

    ## subtract the mean baseline value and store in second column of data set
    chromatogram[:, 2] <- chromatogram[:, 2] - baseline;  
    ```

1. Plot the chromatogram with Time on the $x$ axis and signal level on the $y$ axis.
  
    ```{R, eval = FALSE}
    plot(time, signal, xlab = 'Time (min)', ylab = 'Signal (arbitrary)');
    ```

1. Use the function `peakArea()` to calculate the area of each peak in your chromatograms.

    ```{octave, eval = FALSE}
    ### You must first run the code shown in the peak area function for this to work!
    ### Copy and paste it into your notebook and run the cell.

    peak1_area = peakArea([chromatogram(:, 1), chromatogram(:, 2)], x1, x2, true);
    ### substitute the lower limit of integration for x1 and the upper limit for x2 (in minutes)
    ### if the last argument is true, a plot will be created

    ### Repeat the function as many times as necessary to integrate each peak.  You will need to change the time for each peak.

    ### ... and so on
    ```

1. Find the percent composition for each *unknown* peak.  The percent composition for peak $n$ is:

    \[
    C_n(\%)=\frac{A_n}{A_1 + A_2 + ... A_n} \times 100\%
    \]

    where $A_n$ represents the peak area of peak $n$.  Devise a way program this in Octave.

1. Estimate the signal to noise (S/N) ratio for each peak.  S/N is defined as:

    $$
    \frac{S}{N} = \frac{2H}{h} = \frac{\text{Peak Height}}{\text{min-to-max baseline noise}}
    $$

    where $H$ is the peak height at maximum and $h$ is the min-to-max noise in the baseline.  Use the maximum peak height as signal.  The example below shows how to subset the data and find the min and max values.  You will need to calculate $S/N$ from those values according to the formula above.

    ```{R, eval = FALSE}
    ## find range of baseline, near end where there are no peaks
    h <- 2 * (max(chromatogram[481:end, 2]) - min(chromatogram[81:end, 2]))

    H1 <- max(chromatogram[chromatogram[:, 1] < x, 2]) # x represents dividing line between the two peaks in minutes.
    H2 <- max(chromatogram[chromatogram[:, 1] > x, 2]) # x represents dividing line between the two peaks in minutes.
    ```

    <!-- See Section 5.3/Example 5.4 in your textbook for more information. -->

6. Include a discussion of (1) how many constituents are in your sample, (2) the percent composition for each, and (3) the relative polarity of each component.
7. Before turning in your notebook, run `rm(list = ls())` to clear your workspace and then run your entire notebook again.  Fix any errors before turning in your notebook.
8. After completing the assessment questions at the end of the template, knit your notebook to an HTML.
9. Compress your notebook (Rmd and HTML files) and data file(s) into ZIP folder and upload it to [Dropbox](https://alphonse.github.io/chem370/assignments/submissions.html).
