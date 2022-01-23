---
layout: default
title: Blink
nav_order: 32
permalink: /programming/arduino/blink
grand_parent: Programming
parent: Arduino Assignments
last_modified_date: 2022-01-11
---

# Blink an LED

**Objective:** Use Arduino to turn an LED on and off.    
**To turn in (on Canvas):** Your working Arduino code.

## Introduction

This exercise will explore two concepts: (1) connecting devices to the Arduino and (2) the structure of the Arduino program used to *control* those devices.  As a first example, we'll connect an LED (light-emitting diode) to the Teensy and write a program to turn it on and off.

### How are things connected to a Teensy?

The Teensy can control all sorts of devices, including lights, motors, and various sensors.  The device to be controlled must be connected to one of the Teensy's *pins*. You can think of a pin as a unique port or connection on the Teensy.  Pins can send and receive information, so communication between the pin and the sensor goes both ways.  One pin might be used to control a heater, while another might be used to read data from a temperature sensor.  The pins that are available on the Teensy are shown in the figure below.  Some pins provide power (3.3 V), some pins provide a connection to the circuit ground (GND), and some function to send and receive data.  A lot of pins have several functions, each represented by a different color rectangle on the diagram.    Note, though, that each pin can only have one function at any given time.  For now, we'll just focus on the pin numbers.  Those labeled 0-23 (shown in gray) are called *digital pins*; they function as both inputs (to receive data, or sense) and outputs (send data, or control), but we'll use just the output functionality in this exercise.

![<small>*A Teensy Board, with the pin (connection) numbers and functionalities shown (reprinted from [PJRC.com](https://www.pjrc.com/teensy/pinout.html)).*</small>](https://www.pjrc.com/store/teensy40_card10a_rev2.png)

<small>*A Teensy Board, with the pin (connection) numbers and functionalities shown (reprinted from [PJRC.com](https://www.pjrc.com/teensy/pinout.html)).*</small>

There are several ways to connect something to the pins of the Teensy.  One way is to directly solder wires to them, in which a soft metal alloy is melted onto two the wire and the Teensy pins as they are connected to make a permanent, metal connection.  This is best saved for a final, fully vetted design that won't ever need to be changed.  We'll use another method for this exercise called a solderless breadboard.

### The solderless breadboard

A breadboard is shown in the figure below.  The holes in the breadboard are spaced in such a way that a Teensy can be plugged directly into the board.  Columns, labeled A, B, C, ..., are connected across the board electrically, such that A1 and B1 are connected; rows are insulated from each other, such that A1 and A2 are not connected.  The connections labeled with red and blue lines on each edge are connected together and are sometimes called rails; they provide an easy way to distribute power (e.g. the red rail) and ground (e.g. the blue rail) connections around the board.  If that seems confusing, try watching this video [this video](https://www.youtube.com/watch?v=mLOxoK1zj9A).

![<small>*A solderless breadboard with purple lines indicating connected holes; the pattern continues down the board.  Holes with the same number are connected electrically, except across the gap in the middle, while holes with different numbers are electrically insulated.*</small>](../../assets/images/02-blink/breadboard.png)

<small>*A solderless breadboard with purple lines indicating connected holes; the pattern continues down the board.  Holes with the same number are connected electrically, except across the gap in the middle, while holes with different numbers are electrically insulated.*</small>

### What is a program?

A *program*, or *sketch* in Arduino jargon, is a set of commands stored on the Teensy that tell it what to do.  Although a Teensy can do most anything a computer would do, it can only run a single program over and over.  For example, this exercise involves programming the Teensy to turn an LED on and off so that it blinks.  Other options would be to collect data from a temperature sensor, or turn a motor on a off to move a robot (or to do all of those things at once).

An Arduino program always consists of two parts: (1) a `setup()` function and (2) a `loop()` function (more details about what a function is will come in future exercises).  The `setup()` function runs *once* every time the Teensy is powered on.  After that, the Teensy runs the `loop()` function over and over until it's turned off.  Usually, some initial lines of code are included above the `setup()` function that provide definitions used throughout the program.  A "bare minimum" program with the `setup()` and `loop()` functions is shown below.  Note that this program does nothing other than run.  Every Arduino program will start like this, and you will write all your code within one of these blocks.

```cpp
    void setup() {
      // anything written here will execute exactly once on startup
    }
    
    void loop() {
      // anything written here will execute over and over indefinitely until the power is turned off
    }
```

Arduino sketches are written with the Arduino IDE (see [Getting Started](https:/{{site.url}}/programming/arduino/getting-started#getting-started-with-arduino)).  To begin, you open the IDE and write your code in the text area of the program.  When you're done writing your code, you compile it and upload it to the board to run it.  If it compiles and uploads correctly, you will see a "Success" message in the message are of the IDE; if not, you'll see an error message and will need to troubleshoot your code.

You should use comments when writing your program to clarify what each part does.  Comments are not read by the compiler/board, and do not execute.  In other words, they are only to help humans reading the code understand it more easily.  To add a comment, just use the ``\\`` symbol; anything after that symbol won't be read by the program.  For example, you can make an entire line a comment, like the first line below.

```cpp
    // Pin 13 has the LED on Teensy 3.0
    int led = 13;
```

You could also make a portion of a line a comment, like the second half of the line below.

```cpp
    int led = 13; // Pin 13 has the LED on Teensy 3.0
```

Finally, note that every line in the program *must* end with a semi-colon, `;`.

In the exercise, we'll add to our code from last week to control 3-color LED with the Teensy.

## Connecting the LED

1. Push your Teensy into the breadboard provided and connect the USB cable.  Try not to bend the pins as you push it in.  Refer to the diagram below if necessary.

   <div class = "warning">
   Remember to be careful with the USB connection on the Teensy so as not to break it off!
   </div>

2. Push the LED into the breadboard such that none of the leads (wires) are connected to anything else (each one is in it's own row).  Make sure you note which row the longer lead goes into.


   <div class = "warning">
   It's best-practice to work with the Teensy unplugged from the computer.  This will help ensure no "magic smoke" escapes.
   </div>

3. Use a jumper wire to connect the **longer lead** on the LED to the **GND** pin on the Teensy.
1. Use 3 more jumper wires to connect the remaining three leads to pins **13, 14, and 15**.

![<small>*Your final setup should look something like this picture (keep in mind that you may be using a different version Teensy board).*</small>](../../assets/images/02-blink/teensy_LED.png)

<small>*Your final setup should look something like this picture.*</small>

## Program the Teensy

### Open the Sketch

1. Open the Arduino IDE and go to **File > Examples > Basics > Blink**.  
1. Go to `File > Save As` to save the example under a new name in the default location (this will make it show up in your Sketchbook menu).

### Define Constants
1. At the top of the code are constant definitions.  A *constant* is something that doesn't change when the program runs.  In this case, the value of a variable called `led` has been set to equal 13:

   ```cpp
   int led = 13;
   ```
   
   There are several important pieces here.  (1) the `int` tells Arduino that this value is an integer data type. (2) `led` is the name we choose for the variable (on the left of the `=`).  And (3) the value 13 (on the right of the `=` is what we want `led` to equal, in this case the number of the pin the LED is connected to.  Anytime we type `led` Arduino will substitute 13 instead.
  
1. In our case, there will be 3 colors, so we should choose a more helpful name for our pins, for example red, green, and blue. Remember that anything after a `//` is a comment and isn't compiled.

   ```cpp
   int blue = 13;  // the blue diode is connected to pin 13
   int red = 12;   // use whatever pin number you connect the red diode to.
   // and so on...
   ```

  <div class = "tip">
   Remember to save your work often -- the Arduino IDE doesn't autosave!

   It's also a good idea to create a backup file occasionally in case you lose the one you're working from. 
   </div>

### Complete the `setup()` function

1. You should see the `setup()` function at the top of the sketch.  In this case, the only setup necessary is to set the mode of the LED pins as outputs.  The blue pin is shown as an example; make sure to fill in red and green too.

	```cpp
	  // the setup routine runs once when you press reset:
	  void setup() {
	     // initialize the digital pin as an output.
	     pinMode(blue, OUTPUT);
	  }
	```

### Complete the `loop()` function

1. Below that you should see the `loop()` function, which runs over and over again.
	```cpp
	  digitalWrite(blue, HIGH); // turn the LED on (HIGH is the voltage level)
	  delay(1000);              // wait for a second
	  digitalWrite(blue, LOW);  // turn the LED off by making the voltage LOW
	  delay(1000);              // wait for a second
	```

5. I suggest checking your code to make sure it runs before going any farther.  After checking to make sure those sections look good, press the **Upload** to button (right arrow in top left) to save, compile, and upload your sketch.

    <div class="tip">
	It's a good habit to code is small sections and check your code frequently to make troubleshooting easier.  For example, if you write 500 lines of code without checking it, you'll very likely have an error when you start, for example a missing semi-colon; finding that missing semi-colon could be nearly impossible in that size program. But if you check it 5 lines at a time you'll catch your errors more quickly and have an easier time pinpointing them.
	</div>

2. Finally, add the extra colors to the `loop()` function.
	```cpp
	  // blue
	  digitalWrite(13, HIGH);     // turn the LED on (HIGH is the voltage level)
	  delay(1000);                // wait for a second
	  digitalWrite(13, LOW);      // turn the LED off by making the voltage LOW
	  delay(1000);                // wait for a second
	  
	  // green
	  
	  // red

	```

### Make Your Own Changes

1. Before you leave, modify your code to change the blink pattern:
   - Make the lights blink in the order green, blue, red
   - Make the green light stay on for 2 seconds and off for 1
   - Make the blue light stay on for half a second and off for one
   - Make the red light stay on for a second and off for a second, and make it repeat the red blink twice.

## Turn in your work

1. Save your final in the default Arduino format (.ino).  This is for your future reference.

    <div class="warning">
    Remember that VCAT does not save your work in between sessions!  You must save it to your Vault storage or Xenon or it will be gone when you log back in.
    </div>

1. In Arduino, go to Edit > Copy as HTML.  This copies the code in a format you  can input into Canvas.  **Make sure you submit your final code, with all the modifications listed above.**
1. Start the assignment on Canvas and click the </> symbol at the bottom right of the text box to open the HTML editor.
1. Press <kbd>CTRL</kbd> + <KBD>V</KBD> (<kbd>CMD</kbd> +  <kbd>V </kbd> on Mac) to paste your code into the HTML editor and submit your assignment. 
1. Open your submission on Canvas to double check that everything worked -- you should see something that looks just like your Arduino code displayed in Canvas.
