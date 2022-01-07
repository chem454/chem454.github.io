---
layout: default
title: Syllabus
nav_order: 1
permalink: /syllabus
has_toc: false
parent: Course Information
---



# CHEM 454 Lab Syllabus
{: .no_toc  }

**Instructor:** Al Fischer, PhD   
**Office Hours:** By appointment; see my availability and schedule an appointment on [Calendly](https://calendly.com/drfischer/office-hours). You will be able to choose to meet on Zoom or at my office during scheduling.  (No need to email or ask - just schedule!)  
**Asking Questions:** Ask general questions on [Piazza](https://piazza.com/wcu/spring2022/chem454/home)  
**Email:** [dfischer@wcu.edu](mailto:dfischer@wcu.edu)  
**Availability:** Email, Piazza, and office hours are the best ways to find me; my devices turn on Do Not Disturb at 9 PM.  

<a href="https://github.com/chem370/chem370.github.io/raw/master/assets/pdf/syllabus.pdf" target="blank">Download Syllabus as  PDF</a> 

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


## Overview 

Computers, and more recently sensors and microcontrollers, have become an integral part of the experimental chemistry and physics laboratories.  This course provides an introduction to the development of custom instruments and data acquisition (DAQ) systems using basic electronic components.  Topics covered may include basic analog electronics (RC circuits and op-amps), communication protocols, microcontroller usage and programming, component selection, graphic user interface (GUI) creation, and test and validation methods. 

Although this course covers topics from the field of electronics, it is designed to help you be a better experimental scientist; it is not designed to help you become an electrical engineer. Hopefully it will help you develop a practical understanding of electronics and programming so that you will be better able to setup, troubleshoot, construct, and utilize scientific equipment.  The course assumes no previous experience in electronics or programming, just a willingness to learn and experiment.

The preface of the course textbook provides a nice summary of our goals for this semester:

> Inventors in the field of electronics are individuals who possess the knowledge, intuition, creativity, and technical know-how to turn their ideas into real-life electrical gadgets.  We hope this [course] will provide you with an intuitive understanding of the theoretical and practical aspects of electronics in a way that fuels your creativity...This [course] is designed to help [scientists] invent.  It assumes little to no prior knowledge of electronics.

This course is cross-listed with PHYS 454 and CHEM 554.

## Student Learning Outcomes 

To achieve a satisfactory grade, students will:

1. Demonstrate proficiency in computing, including basic programming and scripting tasks.
1. Recognize basic electical components and circuits, including key differences between analog and digital circuits.
1. Utilize microcontrollers to interface a computer with lab equipment.
1. Construct a working instrument, including a grpahic user interface (GUI), suitable for use in an experimental laboratory or field application.
1. Describe instrument performance using common formats, including figures of merit, bills of materials, schematics, and technical data sheets.
1. *Graduate Students:* Modify an instrument to achieve new functionality and fully describe it's performance.



## Course Materials

**Text Book:** Scherz, P. and Simon Monk. (2016) *Practical Electronics for Inventors* (Fourth Edition) McGraw Hill Education. (WCU rental book available at the bookstore)

[*Programming Arduino: Getting started with sketches* by Simon Monk](https://www.amazon.com/Programming-Arduino-Getting-Started-Sketches/dp/1259641635#:~:text=Program%20Arduino%20with%20ease!&text=Programming%20Arduino%3A%20Getting%20Started%20with%20Sketches%2C%20Second%20Edition%2C%20features,and%20interface%20with%20the%20Web.) is another inexpensive, helpful text.  Although it is not required, you may find it helpful to have a copy for your own reference (although most of the information in it can also be found online with some searching).

**Lab Manual:** Class assignments will typically be posed on the [course website]({{site.baseurl}}). (Due dates will appear on Canvas so that they link to your calendar.)

**Calculator:** Students will need a scientific calculator that is not on a phone for exams (eg. TI-XX, or something as simple as a $10 Casio *fx*-300).

**Miscelaneous Suggested Materials:** A notebook or binder for taking notes during lecture, a separate notebook for taking notes during lab.

**Technology:** Students will need a laptop computer meeting [Chemistry and Physics’ minimum computer requirements](https://www.wcu.edu/learn/academic-services/it/computer-guidelines/index.aspx). In addition, the computer must have a standard [USB-A receptacle](https://en.wikipedia.org/wiki/USB_hardware#/media/File:USB_2.0_and_3.0_connectors.svg), or students must supply an appropriate USB-A adapter for their computer. 

Students will be required to use [Julia](https://julialang.org/) + [Pluto](https://github.com/fonsp/Pluto.jl) and may wish to install these on their computer; both are freely available for all operating systems. Alternatively, students may use Julia + Pluto via WCU’s STEM VCAT (officially supported option for the course). A web browser and internet connection capable of streaming video will be necessary for submitting homework assignments and accessing course materials.

Students will also use [Arduino](https://www.arduino.cc/en/software) and [Teensyduino](https://www.pjrc.com/teensy/td_download.html).  These have also been requested for STEM VCAT, but students may likewise find is easiest to install them on their personal computers free of charge.

Students will need the VMWare Horizon Clinet, available through WCU IT, to use STEM VCAT on their personal computers.  The web interface to STEM VCAT will not work for this application!  Students should contact the IT Helpdesk for assistance installing VMWare Horizon.

Some class work will be completed on [Tinkercad](https://www.tinkercad.com/dashboard).  Though not strictly necessary, a free Tinkercad account will likely make assignments go more smoothly.

## Grading 

Your grade is determined from several categories of work, listed under [Contributions to Your Grade]({{site.baseurl}}/syllabus#contributions-to-your-grade), below.  At the end of the semester, the total points you've earned in each category will be summed and divided by the total points available for that category, to calculate the fraction of points you earned in each category.  Then, your final grade will be computed as the weighted average of each category score.  The weights for each category are also listed below.

### Contributions to Your Grade

1. Homework and class assignments (Individual, includes grad project for graduate students) [25%]
2. Midterm (Group Presentation + Project Proposal) [15%]
3. Design Review Meetings (Group) [15%]
4. Submit working instrument with GUI by end of semester [15%]
4. Technical Datasheet / Instrument Description (Group) [15%]
4. Final Exam (Individual) [5%]
5. Discretionary (10%)

Discretionary points are determined at the end of the semester based on participation, effort, attendance, and overall respect for your peers/classmates, your instructor, and their time, both inside and outside the classroom.  For example, if you do not contribute your fair share to the group project you will not receive credit for the discretionary category; this is just one example -- other things such as not coming to class, being exceptionally rude to or monopolizing the time of others, etc., can also cause you to lose credit.

<!-- \pagebreak -->

### Grading Scale

| Number Range | Letter Grade |
|:------------:|:------------:|
|    97-100    |      A+      |
|   93-96.9    |      A       |
|   90-92.9    |      A-      |
|   87-89.9    |      B+      |
|   83-86.9    |      B       |
|   80-82.9    |      B-      |
|   77-79.9    |      C+      |
|   73-76.9    |      C       |
|   70-72.9    |      C-      |
|   67-69.9    |      D+      |
|   63-66.9    |      D       |
|   60-62.9    |      D-      |
|     <60      |      F       |

These grades indicate levels in quality from excellent to unsatisfactory.  Students are responsible for knowing class attendance, withdrawal, and drop-add policies and procedures.

## Turning Things In

Most assignments will be submitted electronically on Canvas.  Unless otherwise specified, assignments are due at 23:59:59 on the due date and late work is not accepted.  A list of anticipated assignments is available in the Canvas site for the course, but is subject to change as needed.

### Submitting Assignments

When turning in assignments:

 - Files should be uploaded to each assignment page on Canvas.
 - Files should be of the types and quantity specified in the assignment.
 - Files should be given a clear, logical filename that reflects the assignment name.
 - Files may be sorted automatically by a computer.  Therefore, any files not named appropriately, not in the specified format, or submitted elsewhere (e.g. email) may not be graded.
 - Any electronic assignments turned in via hardcopy will not be graded.

Submissions that do not follow these guidelines may incur point deductions.

### Late Work

Late work is not accepted in this course.  Due dates are automatically enforced by Canvas.  However:  

- Assignments are accepted *early* and students are encouraged to submit assignments before the deadline.  Extra credit of 5% per assignment is granted for assignments submitted more than 24 hours early!
- Each student is granted one exception to the late policy.  You must fill out a [late work exception form](https://forms.office.com/Pages/ResponsePage.aspx?id=WluzxdUWFESO4XvecFQ_GwFnoMNxJhxDhln9pQs53sVUOEMxSk9IWThGUExPNEEzTTlONTJXR1dSNS4u) to use your exception.  You may use this exception for any reason, but bear in mind future exceptions aren't guaranteed.  All work, regardless of whether an exception has been used, must be turned in no later than the last day of classes prior to finals week.
- If you experience *extenuating circumstances* (e.g. a medical emergency, professionally diagnosed illness, or death in the family) or a [*university-sponsored absence*](https://www.wcu.edu/experience/health-and-wellness/student-concern-response-team/absence-notification-protocol.aspx) you may ask to be considered for an extension on a case-by-base basis.  Communication of the issue to your instructor and identification of when you plan to turn in the assignment are important in such circumstances.  For university-sponsored absences, exceptions should be arranged *before* your absence or will not be granted.

## Course Policies 

**COVID-19:** At the time of this writing, it is expected that all class activities will occur in person.  During all in-person meetings, students *must*:

  - Wear a face mask at all times.  See [WCU's mask policy](https://www.wcu.edu/coronavirus/academic-affairs-faq.aspx) for more information.
  - Practice good hygiene practices and follow [CDC guidelines](https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/prevention.html) to minimize spread of COVID19.
  - Avoid coming to class if you experience and cold, flu, or [COVID19 symptoms](https://www.cdc.gov/coronavirus/2019-ncov/symptoms-testing/symptoms.html), have been diagnosed with COVID19, or have been in contact with someone who's tested positive for COVID19 for a time period consistent with current CDC guidelines or the advice of a medical professional.
  
Note that these policies are subject to changes as the COVID19 pandemic continues to develop.

*If you will miss more than four consecutive days, please use WCU's official [Absence Notification Protocol](https://www.wcu.edu/experience/health-and-wellness/student-concern-response-team/absence-notification-protocol.aspx).*

**Classroom Behavior:** Students are expected to attend each class period and participate fully in that day's activity.  Students should respect the rights of others and minimize avoidable distractions.

This course meets in a chemical laboratory.  Never bring food or drink into the laboratory.  This includes sealed bottles and items inside backpacks – leave them outside the lab!  Do not chew gum, use tobacco products, or apply cosmetics in the lab.  Do not place personal items inside fume hoods or where they may come into contact with chemicals.  Although we will not be working with chemicals, students should still wear closed-toe shoes when attending class to protect themselves from existing hazards in the room.

The sparing use of cell phones during class is permitted but discouraged. If you must, please use your cell phone outside the laboratory, and never leave your work unattended to do so!

In an effort to maintain a productive work environment for all students, please refrain from playing music, videos, etc., in the classroom/laboratory.

**Attendance:** Please email your instructor *ahead of time* if you encounter circumstances that absolutely prevent you from making it to lab on time.  Attendance to all class periods is mandatory. Absences from group work sessions may incur a loss of points up to a zero for the assignment and deductions in the student's participation grade.  

***If you experience any symptoms of COVID-19, cold, flu, or other contagious sickness please do NOT come to class!  Likewise, do not attend if you have been in contact with someone who has tested positive for COVID-19 or is suspected to have COVID-19.  Please maintain diligent communication with your instructor during these situations and appropriate accommodations will be made.***

*If you will miss more than four consecutive days, please use WCU's official [Absence Notification Protocol](https://www.wcu.edu/experience/health-and-wellness/student-concern-response-team/absence-notification-protocol.aspx).*

**Inclement Weather:** Please check the University website for campus closings during times of bad weather.  Your safety is a priority when traveling. Use common sense when attempting to get to campus and notify your instructor if you are unable to safely make it.  Announcements will be made via e-mail if class must be canceled when the University has not officially closed.



## Institutional Policies 

All WCU policies apply to this course, and those statements can be read either on Canvas or the [WCU website](https://www.wcu.edu/learn/faculty/coulter-faculty-commons/teaching-and-learning/syllabus-additional.aspx).  Students are expected to understand these policies and recognize that the statements are considered part of the syllabus for this course.  Highlights are given below.

**Accommodations for Students with Disabilities:** Western Carolina University is committed to providing equal educational opportunities for students with documented disabilities and/or medical conditions. Students who require accommodations must identify themselves as having a disability and/or medical condition and provide current diagnostic documentation to the Office of Accessibility Resources. Please contact the Office of Accessibility Resources, 135 Killian Annex, (828) 227-3886 or by [email](mailto:accessibility@wcu.edu).  Visit the OAR website at [http://accessibility.wcu.edu/](https://www.wcu.edu/learn/academic-services/disability-services/index.aspx) for more information.

**Academic Integrity Policy and Reporting Process:** This course follows the guidelines set forth in WCU's [Academic Integrity Policy](https://www.wcu.edu/experience/dean-of-students/academic-integrity.aspx).  Refer to the policy for specific rules and sanctions!

Written work may be checked for plagiarism either manually by our instructor or by computer software.  Plagiarism will NOT be tolerated and will by handled according to WCU's academic honesty policy.

## Resources  

### Getting Help

WCU provides many resources to help students succeed.  *All* students are encouraged to take advantage of these resources, regardless of their academic standing -- there is no harm in asking for help!  A few key resources are listed below.

- **Office Hours and Piazza** - don't hesitate to ask your instructor and classmates for help!  See the top of this document for more information.
- **Writing and Learning Commons (WaLC)** for help and feedback on writing.  Visit [tutoring.wcu.edu](https://tutoring.wcu.edu) or call 828-227-2274.
- **Math Tutoring Center** for help with calculations and math. For more information, visit [mtc.wcu.edu](http://mtc.wcu.edu/) or call 828–227–3830.
- **CAPS** for help with non-academic concerns such as anxiety, depression, grief, relationships, identity, and addiction.  For more information, visit [caps.wcu.edu](https://www.wcu.edu/experience/health-and-wellness/caps/index.aspx).  Additionally, you may call the Western NC 24-hour crisis line at 888-315-2880 or the Suicide Prevention Lifeline at 800-273-8255.

### University Dates 

- **Academic Calendar** The University academic calendar can be found at [here](http://www.wcu.edu/learn/academic-calendar.aspx). It includes dates for all breaks, University closures, final exams, etc.
- **Final Exam:** The University final exam schedule can be found on the [Registrar's webpage](http://www.wcu.edu/learn/academic-services/registrars-office/).  Note there is no final exam for the lab portion of Chem 370 (but there may be for the lecture portion).

*This syllabus and the course schedule are subject to revision as needed. Students will be notified of changes and are responsible for adhering to the modifications.*
