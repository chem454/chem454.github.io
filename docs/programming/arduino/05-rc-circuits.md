---
layout: default
title: RC Circuits
nav_order: 34
permalink: /programming/arduino/rc-circuits
grand_parent: Programming
parent: Arduino Assignments
last_modified_date: 2022-02-02
---

# RC Circuits: Passive high and low pass filters
{: .no_toc  }

**Objective:** Build RC filters and use the Teensy to examine the input and output waveforms.

----

<details open markdown="block">
  <summary>
  Table of Contents
  </summary>

  {: .text-delta }
1. TOC
{:toc}
</details>

# Introduction

# Set up the Teensy

1. Download the following ZIP file, and extract it to a location on your computer.
1. Open the "454-rc-circuits-code.ino" file and upload the code to your Teensy.  
    
	This code contains two key functionalities:
    
	1. It outputs a square wave on pin 1.  The frequency of the waveform can be set using the serial command `f.X`, where X stands for the numeric frequency in hertz.  For example, to set the frequency to 500 Hz, you would type <kbd>f.500</kbd> into the Arduino serial monitor and then press <kbd>Enter</kbd>.
	1. It reads an analog signal on A0 (pin 14) and prints the raw waveform and FFT to the serial monitor.  The serial command to acquire an FFT is `fft`.

# Test the code

1. Set the frequency to a number of your choice below 4000 Hz.  You should see the confirmation text "Frequency set to XXXX Hz" echoed to the serial monitor.

1. Press the **Clear Output** button in the serial monitor to start with a fresh buffer.

1. Type <kbd>fft</kbd> and press <kbd>Enter</kbd> to acquire both the waveform and FFT.

1. Copy and paste the results into Excel or a similar program for plotting (<kbd> CTRL + A</kbd> may be helpful!).

# Build a high-pass filter

1. Build a high-pass filter that with a cutoff frequency of ~$\tau=$500 Hz using your breadboard and available components in the lab.
1. Apply 10, 50, 100, 500, 100, and 2000 HZ waveforms to the input and record the peak-to-peak output.
1. Create a log-log plot of your results as gain (in dB) vs frequency.

# Build a low-pass filter

1. Build a low-pass filter that with a cutoff frequency of ~$\tau=$800 Hz using your breadboard and available components in the lab.
1. Apply 10, 50, 100, 500, 100, and 2000 HZ waveforms to the input and record the peak-to-peak output.
1. Create a log-log plot of your results as gain (in dB) vs frequency.

### Turn in

1. PDF copies of your Bode plots. (Turn in on Canvas.)
1. Schematics of your high and low pass filters, showing the values for each component. (Turn in before you leave lab, and don't forget your names!)

