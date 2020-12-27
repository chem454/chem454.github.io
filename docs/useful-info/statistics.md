---
layout: default
title: Statistics
nav_order: 2
permalink: useful-info/statistics
has_toc: true
parent: Useful Information
last_modified_date: 2020-12-26
---


# Statistical Data Analysis
{: .no_toc }

<details open markdown="block">
  <summary>
  Table of Contents
  </summary>

  {: .text-delta }
1. TOC
{:toc}
</details>

## Introduction

Throughout this course, you should use statistical measures when analyzing your data and drawing conclusions.  You are expected to:

- Record and report the correct number of significant digits.
- Track uncertainties and propagate them in calculations.
- Identify and report sources of error.
- Analyze samples in triplicate and report the mean and standard deviation of your measurements.
- Perform *t*-tests to compare means when necessary.
- Perform Grubbs' tests to detect outliers when necessary.
- Determine and report the limit of detection and/or limit of quantitation for each technique when conducting quantitative work.

Please read Chapter 22 in your textbook for a refresher on statistical data analysis.

## Types of Error  

You will make many mistakes when analyzing your samples, and that's OK!  The important thing is that you can recognize when you've made a mistake and figure out how to correct it.

## Gross Error

Gross error occurs when the analyst makes a mistake.  For example, you may make your standards too concentrated, dilute a sample incorrectly, or record a value incorrectly in your lab notebook.  If only one sample is affected, you can use a Grubb's test to identify the sample as an outlier and exclude it.  If the error affects all your samples, you may need to start over.

See Section 22.2 in your textbook for more information.

### Systematic Error  

Systematic error occurs when a measurement is systematically high or low, usually the result of instrument drift, improper calibration, or habitual misuse of laboratory glassware (for example, filling to the top of the meniscus instead of the bottom).  If your systematic error is big enough you may need to redo your analysis.

See Section 22.2 in your textbook for more information.

### Random Error  

Random error occurs due to unpredictable (statistically random) fluctuations in instrument response, pipette delivery volumes, balance fluctations, etc.  A key factor of random error is that it averages out as the sample size increases.  Generally, there is little that can be done to eliminate random error other than increasing the averaging time and/or number of samples.

See Section 22.2 in your textbook for more information.

## Replicate Measurements  

Most unknown samples should be analyzed in triplicate.  You should measure the sample three separate times and report the mean, standard deviation, and relative standard deviation of each measurement.  See section 22.4 in your textbook for more information.  An example results table is shown below.

**Table 1: Sulfate concentration in multivitamin pills**  

| Sample ID | [Sulfate] (ppm) | SD (ppm) | RSD (%) |
| --------- | --------------- | -------- | ------- |
| 254-9846  | 50.13           | 4.63     | 9.2     |
| 254-9849  | 78.55           | 5.78     | 7.36    |

In Julia, the mean is:

```julia
using Statistics
x = [1 2 3];
avg = mean(x)
```

The standard deviation is:

```julia
x = [1, 2, 3]
sd = std(x)
```

The relative standard deviation (RSD, in percent) is:

```julia
rsd = sd/avg * 100
```

## Limits of Detection and Quantitation  

For this course, the *Limit of Detection* ($LOD_y$) is defined as 3 times the standard deviation of a blank measurement, $y_blank$, plus the mean value of the blank ($\bar{y}_{blank}$).  This is the 3$\sigma$ detection limit and is represented as:

$$
LOD_y = \bar{y}_{blank} + 3\sigma_{blank}
$$

When a calibration plot (standard curve) is used, this becomes:

$$
LOD_x = \frac{3\sigma_{blank}}{m}
$$

\noindent where $m$ is the slope of the calibration curve and $LOD_x$ is the LOD in the concentration units of the calibration curve.

The *Limit of Quantitation* ($LOQ_y$) is defined as 10 times the standard deviation of the blank:

$$
LOQ_y = \bar{y}_{blank} + 10\sigma_{blank}
$$

When a calibration plot (standard curve) is used, this becomes:

$$
LOQ_x = \frac{10\sigma_{blank}}{m}
$$

## Comparing Means  

If you are comparing two means or comparing a mean to an expected value (e.g. comparing the concentration of a compound to the concentration listed on the manufacturer's label), you should use the 95% confidence interval to draw conclusions about *significance*.  If the confidence intervals overlap, there is no *significant* difference; if they do not overlap the difference is *significant*.

## Outlier Detection  

You should never throw away data unless you have a good reason to do.  Generally, this means that you've identified the data point as an outlier using a Grubbs' test.  See section 22.4 in your textbook for more information.
