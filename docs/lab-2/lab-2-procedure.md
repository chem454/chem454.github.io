---
layout: default
title: Lab 2 Procedure
nav_order: 5
permalink: /gc-tcd/procedure
has_toc: false
parent: Lab 2 - GC-TCD
last_modified_date: 2020-12-17
---

# GC-TCD Procedure
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

## Prepare Samples

1. Obtain a vial containing your unknown mixture from your instructor.  Make sure to record the ID/name in your notebook!  

    <div class="warning">
    If you don't record the ID you cannot get credit for getting the right answer!
    </div>

    Your run list for this experiment is, on each instrument:

    1. Blank
    1. Sample

## Setup the Instrument

~~*You will need [Vernier Logger Lite](https://www.vernier.com/products/software/logger-lite/#section5) (free) installed on your computer for these steps.*~~

*Due to increased time constraints with COVID19, these steps will be completed for you. A computer and the software will be provided.*  

1. Connect the Instrumentation Amplifier/GoLink! to your computer via USB and open Logger Lite.  

1. Go to **Experiment > Set up sensors > GoLink:1**.  

1. Select **Choose Sensor** and select **Instrumentation Amplifier from the dropdown menu**.  

1. Open the **dropdown menu** again and choose the **0-20 mV** range for the amplifier.

1. Use the **Zero** knob (on the GC) to adjust the signal until the readout is between 1 and 2 mV.

    <div class="warning">
    Do not touch any other knobs -- they are very sensitive and moving them even a small amount may lead to several additional hours of stabilization time.
    </div>
    
1. Let the instrument run for a minute or two until you're cetain the baseline is stable.

    <div class="tip">
    The instrument is "stable" when the baseline fluctuates by no more than a few percent of full-scale (20 mV in this case).
    </div>

## Load the Syringe

1. Obtain a microliter syringe and clean it with acetone in the syringe cleaning apparatus:   
    1. Place the syringe in the funnel on top of the apparatus.  
    2. Turn on the vacuum pump with the **black on/off switch**.  
    3. Squirt solvent through the syringe.  
    4. Clean the plunger and the needle with a Kimwipe moistened with your solvent.  
    
1. For a solvent blank:  Pull about 4 $\mu$L acetone into the syringe.  Record how much you end up loading into the syringe.

1. For samples:
    1. Pull 4 $\mu$L of your sample into the syringe.  Make sure inject *exactly* the same amount into each instrument.
    1. Pull air into the syringe until you can clearly see how much sample you loaded.  Record this value in your lab notebook.

## Inject the Sample

1. Make sure the software is running and the instrument is ready to run. (It should be if you completed the steps above and the baseline is stable.)

1. Push the syringe through the septum of the **side B** injection port and then depress the plunger.  Do this step as smoothly and quickly as possible, and be consistent.  

    <div class="warning">
    The syringe plunger does not go all the way down to the glass body!  Do not force it or you will ruin the syringe!
    </div>
    
3. Press the start button in the software.  Again, the key is to be consistent with when you press the start button relative to sample injection!

1. Allow the instrument to run for at least 5 minutes for all peaks to elute.

1. Immediately clean the syringe in the syringe cleaning apparatus, and then repeat the loading and injection steps as needed for all blanks/samples.  Make sure you clean the syringe after the last sample.

## Save the Data

1. When your run is finished, click the **Store** button and then give the run a name in the data viewer on the left side of the screen. 

1. When all of your runs have finished go to **File > Export As > CSV** to save your data as a CSV file for processing.
