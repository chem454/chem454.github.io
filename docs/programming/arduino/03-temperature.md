---
layout: default
title: Temperature
nav_order: 33
permalink: /programming/arduino/temperature
grand_parent: Programming
parent: Arduino Assignments
last_modified_date: 2022-01-05
---

# Measuring Temperature with Teensy (analog signals)

**Objective:** Measure a temperature with Teensy and display the result to the computer screen using serial communication.  
**To turn in:** Turn in your individual worksheet and submit a copy your group code to Dropbox by the end of class.

## Introduction

In the last exercise you used a Teensy to turn a light on and off, although we did not discuss what was happening electrically. This exercise will explore the electrical workings of the Teensy and walk you through how to write code to *sense* signals from a device.  More specifically, you'll investigate (1) the concept of **voltage** while sensing temperature and (2) using the Serial port to communicate between the Teensy and your computer.

### Electricity

When first learning about electricity, it may help to think of it in analogous terms to water.  **Current** is the flow of electricity through a circuit, and is analogous to the current in a river.  Just like water molecules move through the river, charge carriers (electrons) move through the wires of the circuit.  **Voltage** is a *potential energy difference* between two points in a circuit.  This is analogous to the potential energy difference in water stored behind a dam and water at the bottom of the dam.   Current will not flow without a voltage difference, just as water will not flow without a difference in height or pressure.

Recall that in the last exercise you turned an LED on and off using a pin on the Teensy.  You did this by alternately setting the pin to `HIGH` and `LOW`, as in:

```cpp
digitalWrite(13, HIGH);
delay(1000);
digitalWrite(13, LOW);
delay(1000);
```

But what did this do internally in the Teensy?  When the Teensy gets the command `digitalWrite(13, HIGH);` it sets the voltage of pin 13 to 3.3 volts (3.3 V is a standard voltage for microcontrollers).  Alternatively, when it gets the command `digitalWrite(13, LOW);`, it sets the voltage to 0 V.  Thus, when the voltage is 3.3 V, there is a potential difference across the LED from 3.3 V on the controlling pin (anode) to 0V on the ground pin (cathode).  This causes current to flow through the LED, which in turn causes the LED to light up.  When the voltage is set back to 0, there is no longer a potential difference across the LED, current does not flow, and the LED does not light up.

You may have gotten the idea that voltage and current are inextricably linked, and that's true.  In fact, **Ohm's Law** provides a mathematical relation between the two:

$$
\text{Voltage (volts)} = \text{Current (amps)} \times \text{Resistance (ohms, }\Omega\text{)}  \\
V = iR
$$

This introduces a new concept, resistance.  **Resistance** is simply the opposition to flow of electrical current.  Resistance can be introduced to a circuit purposely with a device called a **resistor**.  Usually these are a defined, fixed resistance introduced for a specific purpose.  However, many sensors have a resistance that changes proportionally to some stimulus.  Thus, the voltage across the device will change in response to that stimulus, and the stimulus can be measured simply by measuring the voltage.  As an example of how useful this is, consider a temperature sensor.  A computer or microcontroller cannot sense the temperature directly -- it only understands voltages.  A device that converts changes in temperature to changes in voltage allows the computer to infer changes in temperature.

Although the voltage output from the Teensy pin was either HIGH or LOW, the voltage output from the temperature sensor can be any value.  A signal that can be only HIGH or LOW (i.e. on or off, 1 or 0), is called a **digital signal**.  Digital signals are often used to communicate between computers and to control many devices because they are relatively immune to outside noise.  Many sensors, on the other hand, produce signals that vary *continuously*, and such signals are called **analog signals**.  

The Teensy can read *digital* signals on any of its digital I/O (input/output) pins (grey labels on the pinout diagram).  The Teensy can read *analog* signals on any of the analog input pin, which are shown with orange labels in the pinout diagram and numbered A0 through A22 (the A stands for analog).

### Bits and Volts

Even though Teensy can "read" analog signals, it only understands digital signals.  So every analog signal read by the Teensy gets sent through an *analog to digital converter* (ADC).  This converts the analog signal from a sensor into a digital signal with discrete steps that the Teensy understands.  The size of these steps is determined by the number of **bits** the ADC has.  More bits equals more steps, and more steps equals a digital signal that more closely approximates the real analog signal.  

### Communicating via the serial port

In the previous exercise, you used digital signals to control an LED, but there was no communication between the Teensy and computer after the sketch was uploaded.  It's often useful to display data on the computer screen to have real-time feedback from the program.  To do this, the data collected on the Teensy board must be sent to the computer, the computer must read the data, and the computer must display it on the screen.  The communication protocol used to do this is called **serial communication**.  This is a very widely used protocol, and pretty much all computers have serial capabilities.  In our case, we'll conduct serial communication over the USB port.

Using serial communication on the Teensy is relatively simple.  The first step is to open the serial port and tell it what data transfer speed to use (basically how quickly the Teensy and the computer talk to each other).

```cpp
    Serial.begin(9600);
```

Once the connection is open, you can print most anything to the serial port you wish.  For example, a simple [hello world](https://en.wikipedia.org/wiki/%22Hello,_World!%22_program) program would look something like:

```cpp
    Serial.begin(9600);
    Serial.print("Hello, World!");
```

The above pseudocode would print "Hello, World!" to the computer's serial port.  The result could be displayed on the computer screen by opening the serial monitor in the Arduino IDE.  There are a few more details you'll learn as you go.

In this exercise, you'll measure ambient temperatures using a temperature sensor and display the result to the computer screen via the serial port.

## Connect the Temperature Sensor

1. Push your Teensy into the breadboard provided and connect the USB cable.  Try not to bend the pins as you push it in.  Refer to the diagram below if necessary.

	<div class="warning">
	Remember to be careful not to break the USB conenctor!
	</div>

2. Push the sensor into the breadboard such that neither of the leads (wires) are connected to anything else (each one is in it's own row).  The orientation does not matter; both legs are the same.

3. Use a jumper wire to connect one side of the sensor to Vin/5V on the Teensy (side 1).

4. Connect the other side (side 2) of the sensor to a 10 kilo-ohm (k$\Omega$) resistor, and then connect the other side of the resistor to ground (GND on the Teensy).  You may need to use a jumper wire to connect the resistor to GND.

5. Use a jumper wire to connect side 2 of the sensor to an analog input on the Teensy.  In the example below, pin A0 is used.

![<small>*Your final setup should look something like this picture.  Red = 5V, black = GND, and blue = signal.  *</small>](../../assets/images/03-temperature/teensy_thermistor.png)

<small>*Your final setup should look something like this picture.  Red = 5V, black = GND, and blue = signal.*</small>

## Program the Teensy

### Bare Minimum

1. Open the Arduino IDE and load a new file (if one doesn't open automatically).
1. Go to `File > Save As` to save the example under a new name in the default location (`Documents/Arduino`).  Call it **groupName_voltage.ino**.

    > *Remember, files that don't follow the naming convention **exactly** may incur point deductions.*

3. Create a `setup()` function and start serial communication within it:
	```cpp
	    void setup() {
		Serial.begin(9600);  // start serial communication at a rate of 9600 bits per second (the standard)
	    }
	```

4. Create a `loop()` function, read the sensor data, and print it to the serial port:
	```cpp
	    void loop() {
		value = analogRead(0); // read sensor
		Serial.println(value); // print result to serial port
		delay(1000);           // wait for 1 second
	    }
	```

5. Press the **Upload** button to send your sketch to the Teensy.  Once you get it loaded, click the **Serial Monitor** button to see if the communication is working. You should see a number between 400 and 500 if you sensor is working correctly.

### Converting to Temperature

The Teensy reports values in bits, which isn't very meaningful to humans.  What we really care about is the temperature.  The sensor comes with a [datasheet](https://www.digikey.com/en/datasheets/vishay-bc-components/vishay-bc-components-ntcle100) the provides the values necessary to conver the value in resistance to temperature in Kelvin using the [Steinhart-Hart equation](https://en.wikipedia.org/wiki/Steinhart%E2%80%93Hart_equation):


   $$\frac{1}{T} = \frac{1}{T_0} + \frac{1}{B} \times \ln \left( \frac{R}{R_0} \right)$$

Where $T$ is temperature, $T_0$ is room temperature (in K), $B$ is an empiracal value unique to each type of thermistor (3977 in for the NTCLE100E3103B0 thermistor we're using, as given on the datasheet), $R$ is the resistance of the thermistor at temperature $T$, and $R_0$ is the resistance of the thermistor at room temperature, $T_0$ (10 k$\Omega$ for this thermistor, as specified by the datasheet).

1. The first step toward printing a temperature is to convert from bits (`sensorValue`)  Note that the trailing zeroes (after the decimal points) ARE important in this case!  They differentiate between the data types `float` and `int`, and leaving them off can lead to round off errors.
	```cpp
	    void loop() {
		int value = analogRead(14); // read sensor
		float resistance = 8192.0 / value - 1.0;
	    }
	```

	<div class="tip">
	Note that the trailing zeroes (after the decimal points) ARE important in this case!  They differentiate between the data types `float` and `int`, and leaving them off can lead to round off errors.
	</div>

2. Now, you can use the value for $R$ calculated above to get to temperature, $T$:
	```cpp
	    void loop() {
		int value = analogRead(14); // read sensor
		float resistance = 8192.0 / value - 1.0;
		float temp  = 1.0 / (1.0/298.15 + 1.0/3977.0 * log(resistance/10.0)); // convert to temperature with Steinhart-Hart
		______________________; // print the temperature to the serial port.
		delay(1000);            // wait for 1 second
	    }
	```

3. Upload your code and see if it works.

### Cleaning up the Output

You can also print text to the serial port.  When you use `Serial.print()` or `Serial.println()` to print text, it should always be in quote marks (this is technically called a *string*).  For example, `Serial.println(Hello, world!)` would NOT work, but `Serial.println("Hello, world!")` would.  To clean up you data output, try printing "\*C" after the temperature to indicate the units.

1. Change `Serial.println(temp)` to `Serial.print(temp)`.  These two functions are very similar, with one difference: `println` creates a new line when it's finished (like pressing enter on the keyboard) whereas `print` does not.
1. Add a line just below `Serial.print(temp)` to print the units next to the temperature:
```cpp
    Serial.print(temp);
    Serial.println(" K");
```

### Make Your Own Changes

1. Before you leave, add a line in your code to convert from K to degrees C and to degrees F.
1. Once you've converted to C and F, print the results for both degrees C and degrees F to the computer.  Your values should:
    - Be printed to the serial port *on the same line*.
    - Include the units "K", "\*C", and "\*F" where needed.
    - Be separated from each other with a space (either " " or `\s`).
1. Finally compare your results to the temperature displayed on the thermometer in the room.  Does it agree?
1. If you have time, use a multimeter to measure the resistance of the blue resistor you used.  Substitute this value for the `10.0` in the temperature calculation and see what happens to your percent error.

### Turn in
1. A hardcopy of your completed Exercise 3 Worksheet.
1. An electronic copy of your final Voltage code (submit to Dropbox).

