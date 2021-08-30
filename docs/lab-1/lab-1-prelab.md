---
layout: default
title: Lab 1 Prelab
nav_order: 5
permalink: /uv-vis/prelab
has_toc: true
parent: Lab 1 - UV-vis
---

# UV-visible Spectroscopy: Prelab
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

## Create a Lab Notebook

*Note: In addition to the steps below, you are expected to write your intro, conclusions, etc., and fill in all portions of the template.  You should also provide notes throughout that provide context as to what your calculations are doing.

1. Create a new directory (folder) for your project.

   Suggested path: `/Documents/lab-notebooks/lab-2/`
  
3.  Open Julia:

    - Windows: Search for Julia in the Start Menu
    - Mac: Search for Julia in Spotlight (Cmd + Space, then type in Julia)
    - Linux: Open a terminal and type `julia`.
   
4. Start Pluto by typing `import Pluto; Pluto.run()` into the Julia prompt.
 
5. Open the template notebook by pasting the following link into the **Open from file** box in Pluto where it says "Enter path or URL..." and clicking **Open**.

   - [https://github.com/chem370/chem370.github.io/blob/master/docs/lab-2/lab-2-notebook-template.jl](https://github.com/chem370/chem370.github.io/blob/master/docs/lab-2/lab-2-notebook-template.jl)

6. Save the notebooks by clicking **Save notebook...** at the top of the page and typing in (or copy/pasting) the file path from step 1 above.  The final portion of the path should be the name of your Julia (.jl) file.

   Suggested path and file name: `/Documents/lab-notebooks/lab-2/lab-2.jl`

## Calculate Standard Concentrations

1. In your notebook, find the section for Standard and QC preparation.

1. Calculate the *approximate* concentrations of the standards you will make in lab.  You goal is to create 5 standards ranging from 5-100 mg/L, as shown below, using 25 mL volumetric flasks and the pipettes available in lab.  (You will update your calculations in lab, but having them laid out ahead of time will help things more more quickly.)
      
      - Assume a stock concentration of 100 ppm. (1 ppm = 1 mg/L)
      - Assume you will have 1, 2, 3, 4, 5, 10, 15, 20, and 25 mL pipettes available to use in lab.
      - You may use the method of multiple dilutions or the method of serial dilutions to make your standards (see image below).
      - It does not matter that you make the exact concentrations shown; what matters is that you *know* the exact concentrations you end up with.  You may only use the pipettes listed above (you may not combine them!).
      - You may find it helpful to do this calculation on paper and transfer it to your notebook, although this is not required.
      
   ![A diagram showing the difference between serial dilution and multiple dilutions]({{site.url}}/assets/images/lab-2/serial-dilutions.png)

1. Use the provided code chunks to insert the stock concentration, pipette volumes, and flask volumes into your notebook, and then enter an appropriate formula into the standard concentrations chunk to calculate your concentrations directly in the notebook. 

<!-- ## Prelab Video: How does a SpectroVis work?

<iframe src="https://wcu.hosted.panopto.com/Panopto/Pages/Embed.aspx?id=50136d4d-483b-4065-9fa2-ac2a00df6b01&autoplay=false&offerviewer=true&showtitle=true&showbrand=false&start=0&interactivity=all" height="405" width="720" frameBorder = "0" style="border: 0px solid #464646; display: block; margin: auto;" allowfullscreen allow="autoplay"></iframe> -->
