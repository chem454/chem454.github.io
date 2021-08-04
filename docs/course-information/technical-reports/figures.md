---
title:  Figures
permalink: /technical-reports/figures
layout: default
nav_order: 2
has_toc: false
parent: Technical Reports
grand_parent: Course Information
last_modified_date: 2020-12-05
---

# Publication-quality Figures
{: .no_toc  }


All figures in lab reports and lab notebooks should follow these guidelines.  Captions may be omitted in lab notebooks if the figure is otherwise clearly labeled and/or explained.


----

<details open markdown="block">
  <summary>
  Table of Contents
  </summary>

  {: .text-delta }
1. TOC
{:toc}
</details>


## Axes

1. All axes should be clearly labeled, with units.
1. Axes should be scaled to show the data clearly; where practical, set the axes to cross at major scale divisions.  
1. Label axes with comprehensible numbers, in the range of 0.01 - 1000.  There are several ways to handle this:
     * 10,000,000 is hard to grasp and the large numbers clutter the axis; try dividing the axis by 10<sup>6</sup> and use the M (mega) prefix before the units in the axis.
     * 2.5e-7 is hard to grasp and the exponents clutter the axis; label the axis as 2.5, and list an exponent of 10<sup>7</sup> in the label.
     * Convert to another unit, such as percent abundance rather than raw abundance.


## Data series

1. All data points and lines should be clearly legible (use thicker lines and bigger points if necessary).
1. If multiple series are plotted on the same plot, provide a clear legend explaining each.
1. Use color effectively, to differentiate data sets and provide symbolism where prudent, but don't rely on color to convey the point.
<!-- 1. If printing in black and white, all data series and legends should be clearly distinguishable *in black and white*.  Use different line types (dashed, dotted, solid, etc.) and shapes if necessary. -->

## Plot types

1. Use scatter plots (or line plots, a subset of scatter plots) for data with two continuous variables.  
1.  Use bar charts or box plots for data with one continuous and one categorical variable. (Bar charts are typically used for mass spectra.)
1. Use 3-D plots with extreme caution, and only when absolutely necessary.

## Saving plots

1. When possible, save plots as a vector graphic (PDF or SVG); this provides infinite resolution.  If using a vector graphic isn't an option, save raster graphics (jpeg, PNG, TIFF) at a resolution of at least 300 dpi for printing in a paper, higher for a poster or presentation.

<!-- 1. Very often, you may need to make final edits to your plot in a vector or image editing program (e.g. Adobe Illustrator, Gravit Designer, Inkscape, Adobe Photoshop, GNU Gimp, etc.).  You can use this to, e.g., increase the font size on axes, add chemical structures to images, or combine subfigures into a single, multi-pane figure.  If you don't want to use any of the above programs, Microsoft PowerPoint works almost as well. -->

## Displaying plots

1. Plots (figures) should be displayed in a manuscript in the order in which they are discussed.    
1. Correspondingly, each figure should be specifically referenced in the text.
1. Chart titles should be avoided; instead, each figure should have a caption below the figure that reads:

     > Figure *n*: A brief title. A brief description of figure *n*.

## Examples

### A Publication-quality infrared spectrum (for color prints)

The **following** figure is an example of a publication-quality infrared spectrum. The data series are clearly distinguishable with contrasting colors, the lines are clearly visible, and axes are clearly and intuitively labeled (with units), and there is an appropriate caption.  Moreover, the figure is clear, undistorted, and unpixellated. Note that the caption for this image includes a summary of the key message of the figure.

![A good plot if printed in color.]({{site.url}}/assets/images/good.png)

**Figure 1:** Example normalized ATR FT-IR spectra of *Usnea* lichens.    The two species have clearly distinguishable spectra.  Notably, *U. strigosa* has a less intense -OH stretch peak but more intense bands in the fingerprint region.

### A Publication-quality infrared spectrum (for black and white prints)

Sometimes it's not possible to print in color, and some journals require figures be legible in black and white.  If your figure must be printed in black and white, you should use easily distinguishable shades of grey for data series (colors that look different in color may turn into the same shade of grey in black and white).  You should also distinguish data with different line types or marker shapes.  The following figure shows this.  In this case, the caption only provides a title; this practice is acceptable.

![A good plot for black and white printing.]({{site.url}}/assets/images/goodBW.png)

**Figure 1:** Example normalized ATR FT-IR spectra of *Usnea* lichens.

### What Not to Do

The ***following*** figure is an example of what ***not to do***!  Key problems:
- The axes are either unlabelled or labelled poorly; although there is a legend, the names are incomprehensible.
- There are far too many ticks labeled on both axes.
- The scale on the *y*-axis needs to be tightened to more clearly show the data.
- The gridlines are overpowering compared to the data.
- The lines representing the data are too thin and the colors to not contrast enough.
- The chart is pixellated and distorted.
- The caption is terse and unnumbered.

![A plot showing what not to do.  This is a bad example of a plot!]({{site.url}}/assets/images/bad.png)

Spectra of Sample
