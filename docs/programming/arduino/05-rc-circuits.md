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

RC filters are a type of electronic filter that are passive (i.e. require no power source) and can be used to remove unwanted interference from the signal, provided that the interference occurs at a different frequency than the signal.  For example, an RC filter could be used to remove 60-Hz hum from an audio signal, or could be used to remove 90 MHz high-frequency interference from a local FM radio station.

There are two general types of RC filters: (1) a high-pass filter and (2) a low-pass filter.  As the names imply, high-pass filters allow high-frequency signals to pass through the circuit but block low-frequency signals; the opposite is the case for a low-pass filter.

![A simple low-pass filter schematic.](https://upload.wikimedia.org/wikipedia/commons/e/e0/1st_Order_Lowpass_Filter_RC.svg)

<small>*A basic low-pass filter schematic.*</small>

![A simple low-pass filter schematic.]()

<small>*A basic high-pass filter schematic.*</small>

In this activity, you will use the digital output pins on a Teensy to generate square waves of a desired frequency, and then use the analog input pins on the Teensy to acquire the waveform.

Once acquired, the waveform can be plotted to show how signal varies with time.  However, it may also be useful to look at the *Fourier transform* of the data, which converts the time domain to a frequency domain; this is typically done using the so-called fast-Fourier transform (FFT) algorithm.  The Teensy program provided for this activity provides both the raw waveform and the FFT of the waveform.


# Set up the Teensy

1. Download the code at the following GitHub repo: [link to chem 454 lab 6 github repo](https://github.com/chem454/rc-circuits).  Click on the green Code button and choose "Download as Zip."
1. After downloading ths ZIP file, and extract it to a location on your computer.
1. Copy the `arduinoFFT` folder to your `arduino/libraries` folder on your computer.
1. Open the "454-rc-circuits-code.ino" file and upload the code to your Teensy.  
    
	This code contains two key functionalities:
    
	1. It outputs a square wave on pin 1.  The frequency of the waveform can be set using the serial command `f.X`, where X stands for the numeric frequency in hertz.  For example, to set the frequency to 500 Hz, you would type <kbd>f.500</kbd> into the Arduino serial monitor and then press <kbd>Enter</kbd>.
	1. It reads an analog signal on A0 (pin 14) and prints the raw waveform and FFT to the serial monitor.  The serial command to acquire an FFT is `fft`.

# Test the code

1. Set the frequency to a number of your choice below 4000 Hz.  You should see the confirmation text "Frequency set to XXXX Hz" echoed to the serial monitor.

1. Press the **Clear Output** button in the serial monitor to start with a fresh buffer.

1. Type <kbd>fft</kbd> and press <kbd>Enter</kbd> to acquire both the waveform and FFT.

1. Copy and paste the results into Excel or a similar program for plotting (<kbd> CTRL + A</kbd> may be helpful!).  Create scatter plots of the waveform and FFT and verify they are correct.

	- Your waveform plot should have time (seconds/milliseconds/microseconds, etc.) on the *x*-axis and voltage on the *y*-axis.
	- Your FFT plot should have frequency in hertz on the *x*-axis and magnitude on the *y*-axis.

# Build a high-pass filter

1. Build a high-pass filter that with a cutoff frequency of ~$f_c=$500 Hz using your breadboard and available components in the lab.
1. Apply 10, 50, 100, 500, 1000, and 2000 HZ waveforms to the input and record the peak-to-peak output.
1. Create a log-log plot of your results as gain (in dB) vs frequency.

# Build a low-pass filter

1. Build a low-pass filter that with a cutoff frequency of ~$f_c=$800 Hz using your breadboard and available components in the lab.
1. Apply 10, 50, 100, 500, 1000, and 2000 HZ waveforms to the input and record the peak-to-peak output.
1. Create a log-log plot of your results as gain (in dB) vs frequency.

### Turn in

1. PDF copies of your Bode plots. (Turn in on Canvas.)
1. Schematics of your high and low pass filters, showing the values for each component. (Turn in before you leave lab, and don't forget your names!)

