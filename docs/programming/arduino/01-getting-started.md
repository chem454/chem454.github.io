---
layout: default
title: Getting Started
nav_order: 4
permalink: /programming/arduino/getting-started
grand_parent: Programming
parent: Arduino Assignments
last_modified_date: 2022-01-05
---

# Getting Started with Arduino

**Objective:** Install Arduino and Teensyduino  
**To turn in:** Nothing! Make sure your software is installed and working so you're ready for the next class period.

## Introduction  

**Arduino** is an [open-source](http://www.wikipedia.com/wiki/Open-source) platform for developing interactive electronic devices.  More specifically, Arduinos are [*microcontrollers*](https://en.wikipedia.org/wiki/Microcontroller), which are essentially small computers that can be programmed to perform a specific task over and over again.  Microcontrollers are ubiquitous in the modern world and are embedded in scientific equipment, cars, cell phones, and nearly every other electronic device.  Arduino provides a simple, standardized interface for microcontrollers, which has led it to become a very popular tool for hobby projects, citizen science tools, and even art installations.  Arduino began in 2005 as a student project at the Interaction Design Institute Ivrea in Ivrea, Italy. 

![<small>*An Arduino Uno. This class will use a variant of the Arduino, called the Teensy, as described below. (image credit: [Spark Fun, CC BY 2.0](https://commons.wikimedia.org/wiki/File:Arduino_Uno_-_R3.jpg))*</small>](https://upload.wikimedia.org/wikipedia/commons/3/38/Arduino_Uno_-_R3.jpg)

<small>*An Arduino Uno. This class will use a variant of the Arduino, called the Teensy, as described below. (image credit: [Spark Fun, CC BY 2.0](https://commons.wikimedia.org/wiki/File:Arduino_Uno_-_R3.jpg))*</small>

Using an Arduino requires a *program*, or a set of commands that are uploaded to the Arduino to have it perform the desired task. In the Arduino community, the term *sketch* is used synonymously with program.  Examples of possible programs include having the Arduino **measure** things like temperature, light, or humidity, or **control** things like lights or motors.  You could even have it measure the temperature and turn on a heater when it gets too cold.  Although an Arduino can run as a stand-alone device once setup, it must first be programmed by a computer. 

To program the Arduino, we'll use the a piece of software called an *integrated development environment* (IDE) that's available for free on the [Arduino website](http://www.arduino.cc).  The IDE is shown in the figure below.  At the top of the IDE is the menu bar, just like any other program.  The middle part of the IDE is the "text area", and looks like a text editor or simple word processing program.  The text area is where you write the code.  Finally, the black bottom region of the editor is the message area; this is the area where important messages detailing errors and successes will be displayed.  Arduino code is written in the programming language *C* -- probably the most commonly used language in the world -- but the IDE handles some of the programming behind the scenes to make it easier for the user. 

![<small>*Arduino IDE showing an example program (image credit: [Cedar101 [CC0], wikimedia.org](https://commons.wikimedia.org/wiki/File:Arduino_IDE_-_Blink.png))*</small>](https://upload.wikimedia.org/wikipedia/commons/a/a1/Arduino_IDE_-_Blink.png)

<small>*Arduino IDE showing an example program (image credit: [Cedar101 [CC0], wikimedia.org](https://commons.wikimedia.org/wiki/File:Arduino_IDE_-_Blink.png))*</small>

The popularity of Arduino is due in part to its open-source nature.  Many spin-offs and flavors of Arduino exist due to it's open-source nature, each with its own unique benefits.  In this class, we'll use a variant of Arduino called the ***Teensy*** (specifically Teensy 4.0).  The Teensy is programmed in the same way as an Arduino, but has a smaller form-factor and more capabilities than a standard Arduino.  The picture below shows a Teensy 4.0 and the functions of each connection on the Teensy.  Seeing all the functions laid out like that can be overwhelming, but we'll walk through the ones we need to use step-by-step in future exercises.

![<small>*A Teensy Board, with the pin (connection) numbers and functionalities shown (reprinted from [PJRC.com](https://www.pjrc.com/teensy/pinout.html)).*</small>](https://www.pjrc.com/store/teensy40_card10a_rev2.png)

<small>*A Teensy Board, with the pin (connection) numbers and functionalities shown (reprinted from [PJRC.com](https://www.pjrc.com/teensy/pinout.html)).*</small>

This exercise will walk you through installation of the Arduino IDE, the software for the Teensy (Teensyduino), and an initial check of the board.

## Install the Arduino IDE

> *You MUST follow the order of the instructions here or Teensyduino will not work!*

1. Use a web browser to navigate to [https://www.arduino.cc/en/Main/OldSoftwareReleases#previous](https://www.arduino.cc/en/Main/OldSoftwareReleases#previous).
1. Download the installer for version **1.8.6**.  You must choose the installer appropriate for your operating system.
1. Choose **Just Download** to download the software, or make a donation if you're feeling generous!
1. Open the file that downloads and run the installer.
1. Open the Arduino program to make sure it runs and to prepare for the next steps.

## Install Teensyduino

1. Use a web browser to navigate to [https://www.pjrc.com/teensy/td_download.html](https://www.pjrc.com/teensy/td_download.html).
1. Download the correct installer for your operatring system.  Note that steps 1 and 2 on the Teensy page should have been completed when you installed the Arduino IDE, above.
1. Run the installer.  When prompted:
  1. Select the `Arduino/` folder for the install location.  If **Next** is greyed out you probably downloaded the wrong version of the Arduino IDE.
  1. Select **All** when asked which additional libraries to install.
  
## Test the Teensy!

### Check the board
1. Plug your Teensy into the computer via the USB connection.

   <div class = "warning">
   Be extremely careful with the USB connection on the Teensy. They break off very easily and cannot be repaired!
   </div>

1. You should see the orange light blinking on the Teensy.  If you do not, something is wrong with your Teensy and you should notify your instructor.

### Check the software
1. Open the Arduino IDE.
1. Click `Tools > Board > Teensy 3.5`
1. Click `File > Examples > 01.Basics > Blink`.
1. Find the part in the program that says `delay(1000)` and change it to `delay(500)`.
1. Click **Verify** in the software (checkmark button in upper left corner).
1. Press the white button on the top of the Teensy.
1. Press upload in the software (right arrow button, next to checkmark).
1. You should see the orange light blink more quickly.  If you encountered any errors, something could be wrong with your software installation or you may have made a typo in the code.  Notify your instructor of any problems.


