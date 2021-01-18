---
layout: default
title: Lab 0 - Intro to Julia
nav_order: 2
permalink: /lab-0/
last_modified_date: 2020-12-25
---

# Lab 0: Introduction to Julia & Pluto
{: .no_toc  }

----

You will keep an electronic lab notebook this semester using the programming language Julia and a notebook extension for it called Pluto.  This exercise will help you get those tools running and learn the basics of using them so that your work goes more smoothly during Lab 1.

**Objective:** Become familiar with Markdown, Julia, and Pluto

**Turn in:** Your completed Pluto notebook with no errors (submit a .jl and a .html file).

**Student Learning Outcomes**: 

  - Become familiar with Markdown syntax.
  - Become familiar with Pluto and Julia.
  - Understand how to access lab notebook templates in Pluto.

<details open markdown="block">
  <summary>
  <b>Table of Contents</b>
  </summary>

  {: .text-delta }
1. TOC
{:toc}
</details>

## Install Julia and Pluto

You'll probably find it's most convenient to install Julia and Pluto on your personal computer.  The software is free and open-source.  You may alternatively use it via STEM VCAT; this does not require you to install Julia, but your may need to install other software to use VCAT on your computer (ask IT for help).

Use the video below to install Julia and Pluto on your personal computer.

[ Installing Julia Video ]

<!-- <iframe width="560" height="315" src="https://www.youtube.com/embed/OOjKEgbt8AI" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->

## Launch Julia & Pluto

[ Launching Julia & Pluto Video ]

1. The way you launch Julia will depend on your operating system.  You will see a window like the image below, which is called the REPL (read-evaluate-print loop).

   - **Windows:** Search for Julia using Windows search.
   - **Mac OSX:** Look for Julia in your Applications folder or search for  Julia using Spotlight (`Cmd + Space` on Mac brings up Spotlight).
   
      <div class = "tip">If this is the first time you've run Julia on your Mac you may have to right click (or CTRL + click) on Julia in your Applications folder, choose Open, and give Julia permission to run on your machine.</div>
      
   - **Ubuntu Linux:** Open the terminal and type `julia`.

   ![A screenshot showing the Julia REPL window]({{site.url}}/assets/images/lab-0/julia-repl.png)
   
1. Open Pluto by typing the following commands into the Julia prompt and then hitting the Enter key.

      ```julia
       import Pluto; Pluto.run()
      ```    
     ![A screenshot showing the Julia REPL window with the command to open Pluto entered, import Pluto; Pluto.run()]({{site.url}}/assets/images/lab-0/starting-pluto.png)

1. Pluto should open in your default web browser (it requires Firefox, Chrome, or another Chromium-based browser to run properly).

      <div class = "tip">If Pluto doesn't open automatically or you would like to use a different browser other than your default copy and past the link from the Julia REPL into your browser URL bar.  The link will look like 'localhost:1234/?secret=...'.</div>

     ![A screenshot showing the Pluto welcome page in the Firefox web browser]({{site.url}}/assets/images/lab-0/pluto-window.png)

## Homework

There are two exercises you need to complete, 0A and 0B.

1. For each exercise, copy the link below by using **Right Click > Copy Link [Address/Location]**.

   - Exercise 0A: [https://raw.githubusercontent.com/dr-fischer/chem370/master/docs/lab-0/lab0A-template.jl](https://raw.githubusercontent.com/dr-fischer/chem370/master/docs/lab-0/lab0A-template.jl)
   - Exercise 0B: [https://raw.githubusercontent.com/dr-fischer/chem370/master/docs/lab-0/lab0B-template.jl](https://raw.githubusercontent.com/dr-fischer/chem370/master/docs/lab-0/lab0B-template.jl)

1. Paste the link into the '**Open from file:**' box in Pluto and click **Open**.

1. Complete the steps/follow the instructions in the Pluto template.

1. Turn in your work on MS Teams.
