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

## Step-by-Step Video Tutorial
{: .no_toc  }

This video walks you through the data processing step-by-step.  The goal is to help you get familiar with Julia and Pluto before you try it on your own in the rotation labs!

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=5cec7a03-13fe-4208-9f3e-acc40119e635&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder="0" style="border: 0px solid #464646; display: block; margin: auto;" allowfullscreen allow="autoplay"></iframe>
<!-- 
<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=993fb4bb-535d-409c-96ce-ac3600df98a1&amp;autoplay=false&amp;offerviewer=true&amp;showtitle=true&amp;showbrand=false&amp;start=0&amp;interactivity=all" height="405" width="720" frameBorder="0" style="border: 0px solid #464646; display: block; margin: auto;" allowfullscreen allow="autoplay">
</iframe> -->

## Create a Lab Notebook (Before Lab)

1. Complete the steps under the prelab section if you did not already do so.

## Import and Inspect Your Data

1. Paste your data file into your lab 1 folder.  If you are using the suggested path this folder is at `/Documents/lab-notebooks/lab-2/`.

1. Load the CSV files into Julia.  

    ```julia
    gc_data = CSV.read("filename.csv", DataFrame)
    # make sure you replace "filename" with your file name
    ```
1. Plot the chromatogram with Time on the $x$ axis and signal level on the $y$ axis to inspect it.

    ```julia
    begin
      plotly() # only need to do this line once in each notebook
      plot(x, y, grid = false, legend = false)
      xlabel!("X axis label"); ylabel!("Y axis label");
      xlims!(min, max); ylims!(min, max);
    end
    ```

## Remove the Baseline Offset

Note that there is a significant *baseline offset* (also called a DC offset) in the data, meaning the baseline level is significantly higher than 0.  In this case, that is a result of how the zero knob was adjusted on the instrument.  We can remove the offset in data processing by subtracting the mean baseline value:

$$S_{corrected} = S_{raw} - (\bar{S}_{raw-baseline})$$

We can determine $\bar{S}_{raw-baseline}$ by averaging a portion of the chromatogram where there are no peaks.

1. Determine the baseline signal, $\bar{S}_{raw-baseline}$.

    ```julia
    S_raw_baseline = mean(gc_data[1:2, "Latest: Potential (mV)"])
    # replace 1:2 with the range you've selected as the baseline
    ```

1. Subtract the baseline signal from every other signal value ($S_{raw, i}$).

    ```julia
    gc_data[!, "S_corrected"] = gc_data[!, "Latest: Potential (mV)"] .- S_raw_baseline
    ```

1. Plot the corrected chromatogram.  Use the same code as you did above, but use the corrected column instead of the raw column.

## Fit Chromatographic Peaks

Ideally, chromatographic peaks are Guassian in nature and can be fit with a Gaussian function, as in:

$$f(x) = \frac{1}{\sigma \sqrt{2\pi}} e^{-\frac{1}{2} \left( \frac{x-\mu}{\sigma} \right)^2}$$

In practice they usually are asymmetric, typically with a tailing end.  The [exponentially modified Gaussian](https://en.wikipedia.org/wiki/Exponentially_modified_Gaussian_distribution) (EMG) function provides a good approximation for the shape of tailing peaks in a chromatograph and will be used here to fit the chromatographic peaks. [1]  The mathmatical function is:

$$f_{EMG}(t) = \frac{M_0}{2 \tau} \exp \left( \frac{\sigma_g^2}{2\tau^2} - \frac{t-t_g}{\tau} \right) \times \text{erfc} \left( \frac{1}{\sqrt{2}} \left( \frac{\sigma_g}{\tau} - \frac{t-t_r}{\sigma_g} \right) \right)$$

I have provided two Julia functions to help with this: (1) `fitPeak`, which fits an EMG function to the peak and determines the parameters and (2) `plotPeak()`, which takes the output of `fitPeak()` and plots it to help you visualize the process.

1. Fit each peak in the chromatogram using `fitPeak()`.
  
    ```julia
    yourFit = fitPeak(DataFrame, tmin = start_time, tmax = stop_time, t_r = retention_time_guess);
    ```
  
    You should enter a 2-column data frame as `DataFrame`, a time on the left side of the peak as `tmin`, a time on the right side of the peak as `tmax`, and a best guess at the retention time of the peak as `t_r`.

1. Plot the results.

    ```julia
    plotPeak(yourFit)
    ```

    where `yourFit` is the output of `fitPeak` saved as a Julia object.

## Calculate Figures of Merit for Each Peak

1. Calculate the retention factor, $$k_r = \frac{t_r - t_m}{t_m}$$.
1. Calculate the resolution for each pair of peaks, $$R_s = \frac{t_{r_2} - t_{r_1}}{0.5(W_{b_2} + W_{b_1})}$$.

## Calculate the Percent Composition for Each Compound

1. Calculate the percent composition: $$C\_n(\%)=\frac{A\_n}{A\_1 + A\_2 + ... A\_n} \times 100\%$$.  Here, $A_n$ is the area of peak *n*.

## Finish & Turn In Your Notebook

1. Include a discussion of (1) how many constituents are in your sample and (2) the relative polarity of each component.  Compare the retention factors you calculated to the standards to see if you can determine what's in the mixture.
2. Save your notebook as both a Julia (.jl) file and static HTML (.html) file.
9. Compress your lab 1 directory (.jl, .html, and .csv files) into ZIP folder and upload it to the Lab 1 assignment on MS Teams.

## References
{: .no_toc }

1. Kevin Lan and James W. Jorgenson (2001). A hybrid of exponential and gaussian  functions as a simple model of asymmetric chromatographic peaks. *Journal of Chromatography A* **915**:1–2, p 1-13. doi: [10.1016/S0021-9673(01)00594-5](https://doi-org.proxy195.nclive.org/10.1016/S0021-9673(01)00594-5)
