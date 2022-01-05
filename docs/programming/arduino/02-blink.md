---
layout: default
title: Blink
nav_order: 32
permalink: /programming/arduino/blink
grand_parent: Programming
parent: Arduino Assignments
last_modified_date: 2022-01-05
---

# Blink an LED

**Objective:** Use Arduino to turn an LED on and off.    
**To turn in:** Your working Arduino code and the Blink Worksheet (handed out in class).
**Filename Example:** `name1-name2_blink.ino`

## Introduction

This exercise will explore two concepts: (1) connecting devices to the Arduino and (2) the structure of the Arduino program used to *control* those devices.  As a first example, we'll connect an LED (light-emitting diode) to the Teensy and write a program to turn it on and off.

### How are things connected to a Teensy?

The Teensy can control all sorts of devices, including lights, motors, and various sensors.  The device to be controlled must be connected to one of the Teensy's *pins*. You can think of a pin as a unique port or connection on the Teensy.  Pins can send and receive information, so communication between the pin and the sensor goes both ways.  One pin might be used to control a heater, while another might be used to read data from a temperature sensor.  The pins that are available on the Teensy are shown in the figure below.  Some pins provide power (3.3 V), some pins provide a connection to the circuit ground (GND), and some function to send and receive data.  A lot of pins have several functions, each represented by a different color rectangle on the diagram.    Note, though, that each pin can only have one function at any given time.  For now, we'll just focus on the pin numbers.  Those labeled 0-33 (shown in grey) are called *digital pins*; they function as both inputs (to receive data, or sense) and outputs (send data, or control), but we'll use just the output functionality in this exercise.

![<small>*A Teensy Board, with the pin (connection) numbers and functionalities shown (reprinted from [PJRC.com](https://www.pjrc.com/teensy/pinout.html)).*</small>](images/card8a_rev2.png)

There are several ways to connect something to the pins of the Teensy.  One way is to directly solder wires to them, in which a soft metal alloy is melted onto two the wire and the Teensy pins as they are connected to make a permanent, metal connection.  This is best saved for a final, fully vetted design that won't ever need to be changed.  We'll use another method for this exercise called a solderless breadboard.

### The solderless breadboard

A breadboard is shown in the figure below.  The holes in the breadboard are spaced in such a way that a Teensy can be plugged directly into the board.  Columns, labelled A, B, C, ..., are connected across the board electrically, such that A1 and B1 are connected; rows are insulated from each other, such that A1 and A2 are not connected.  The connections labeled with red and blue lines on each edge are connected together and are sometimes called rails; they provide an easy way to distribute power (e.g. the red rail) and ground (e.g. the blue rail) connections around the board.  If that seems confusing, try watching this video [this video](https://www.youtube.com/watch?v=mLOxoK1zj9A).

![<small>*A solderless breadboard with purple lines indicating connected holes; the pattern continues down the board.  Holes with the same number are connected electrically, except across the gap in the middle, while holes with different numbers are electrically insulated.*</small>](images/breadboard.png)

### What is a program?

A *program*, or *sketch* in Arduino jargon, is a set of commands stored on the Teensy that tell it what to do.  Although a Teensy can do most anything a computer would do, it can only run a single program over and over.  For example, this exercise involves programming the Teensy to turn an LED on and off so that it blinks.  Other options would be to collect data from a temperature sensor, or turn a motor on a off to move a robot (or to do all of those things at once).

An Arduino program always consists of two parts: (1) a `setup()` function and (2) a `loop()` function (more details about what a function is will come in future exercises).  The `setup()` function runs once every time the Teensy is powered on.  After that, the Teensy runs the `loop()` function over and over until it's turned off.  Usually, some initial lines of code are included above the `setup()` function provide definitions used throughout the program.  A "bare minimum" program with the `setup()` and `loop()` functions is shown below.  Note that this program does nothing other than run.

```cpp
    void setup() {
      // anything written here will execute exactly once on startup
    }
    
    void loop() {
      // anything written here will execute over and over indefinitely until the power is turned off
    }
```

Arduino sketches (programs) are written with the Arduino IDE (see Chapter 1).  To begin, you open the IDE and write your code in the text area of the program.  When your're done writing your code, you compile it and upload it to the board to run it.  If it compiles and uploads correctly, you will see a "Success" message in the message are of the IDE; if not, you'll see an error message and will need to troubleshoot your code.

You should use comments when writing your program to clairfy what each part does.  Comments are not read by the compiler/board, and do not execute.  In other words, they are only to help humans reading the code understand it more easily.  To add a comment, just use the ``\\`` symbol; anything after that symbol won't be read by the program.  For example, you can make an entire line a comment, like the first line below.

```cpp
    // Pin 13 has the LED on Teensy 3.0
    int led = 13;
```

You could also make a portion of a line a comment, like the second half of the line below.

```cpp
    int led = 13; // Pin 13 has the LED on Teensy 3.0
```

Finally, note that every line in the program *must* end with a semi-colon, `;`.

In the exercise, we'll connect an 3-color LED to a Teensy and write a sketch to control it.

## Connecting the LED

1. Push your Teensy into the breadboard provided and connect the USB cable.  Try not to bend the pins as you push it in.  Refer to the diagram below if necessary.

   <div class = "warning">
   Be extremely careful with the USB connection on the Teensy. They break off very easily and cannot be repaired!
   </div>

2. Push the LED into the breadboard such that none of the leads (wires) are connected to anything else (each one is in it's own row).  Make sure you note which row the longer lead goes into.

    > *Always work with the Teensy unplugged from the computer.  This will help ensure no "magic smoke" escapes.*

3. Use a jumper wire to connect the **longer lead** on the LED to the **GND** pin on the Teensy.
1. Use 3 more jumper wires to connect the remaining three leads to pins **13, 14, and 15**.

![<small>*Your final setup should look something like this picture.*</small>](images/teensy_LED.png)

## Program the Teensy

### One Color

1. Open the Arduino IDE and copy the Arduino code you created in Tinkercad when completing the extra credit exercise.  If you did not complete the exercise, instead go to **File > Examples > Basics > Blink**.  
1. Go to `File > Save As` to save the example under a new name in the default location (`Documents/Arduino`).  Call it **groupname_blink.ino**.

    > *Remember, files that don't follow the naming convention **exactly** will incur point deductions.*

3. You should see the `setup()` function at the top of the sketch.  In this case, the only setup necessary is to set the mode of the LED pin (pin 13) as an output.  If your `setup()` code is slightly different from what's shown below, change it to match.  Remember that anything after a `//` is a comment and isn't compiled.

```cpp
  / / the setup routine runs once when you press reset:
  void setup() {                
    // initialize the digital pin as an output.
    pinMode(13, OUTPUT);     
  }
```


4. Below that you should see the `loop()` function, which runs over and over again.
```cpp
  digitalWrite(13, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);              // wait for a second
  digitalWrite(13, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);              // wait for a second
```

5. After checking to make sure those sections look good, press the **Upload** to button (right arrow in top left) to save, compile, and upload your sketch.

### Three Colors

You should have seen a single color blinking on and off.  Now, make some modifications so that all three colors blink on and off.

1. Set each of the LED pins to outputs in the `setup()` function.  You will have to fill in the blanks for the red and green pins below.
```cpp
  // the setup routine runs once when you press reset:
  void setup() {                
    pinMode(13, OUTPUT);       // initialize pin 13 as an output.
    pinMode(____, OUTPUT);     // initialize pin 12 as an output.
    ______________________     // initialize pin 11 as an output.
  }
```

   <div class = "warning">
   Be extremely careful with the USB connection on the Teensy. They break off very easily and cannot be repaired!
   </div>

2. Finally, add the extra colors to the `loop()` function.

```cpp
  // blue
  digitalWrite(13, HIGH);     // turn the LED on (HIGH is the voltage level)
  delay(1000);                // wait for a second
  digitalWrite(13, LOW);      // turn the LED off by making the voltage LOW
  delay(1000);                // wait for a second
  
  // green
  digitalWrite(12, HIGH);      // turn the LED on (HIGH is the voltage level)
  delay(1000);                 // wait for a second
  digitalWrite(12, LOW);       // turn the LED off by making the voltage LOW
  delay(1000);                 // wait for a second
  
  // red
  digitalWrite(___, HIGH);     // turn the LED on (HIGH is the voltage level)
  delay(1000);                 // wait for a second
  digitalWrite(___, LOW);      // turn the LED off by making the voltage LOW
  delay(1000);                 // wait for a second
```

4. Make sure you show your code and blinking LED to your instructor before you move on.

### Make Your Own Changes

1. Before you leave, modify your code to change the blink pattern.  You can change the sequence of the colors, the time between blinks, the number of blinks, or the amount of time each color is on.

### Turn in
1. A hardcopy of your completed Blink Worksheet.
1. An electronic copy of your final Blink code (submit to Dropbox).

   > *Remember, files that don't follow the naming convention **exactly** will incur point deductions.*
