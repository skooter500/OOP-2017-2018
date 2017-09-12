# DT228/DT282 Object Oriented Programming 2016-2017

Resources
---------
* [Webcourses](http://dit.ie/webcourses) - Course code: CMPU2016
* [Processing](http://processing.org)
* [The Processing language reference](http://processing.org/reference/)
* [Learning Processing: A Beginner's Guide to Programming Images, Animation, and Interaction (Morgan Kaufmann Series in Computer Graphics)](http://http://www.learningprocessing.com/)
* [The Nature of Code](http://natureofcode.com/)
* [Eclipse](http://eclipse.org)
* [The git manual - read the first three chapters](http://git-scm.com/documentation)
* [A video tutorial all about git/github](https://www.youtube.com/watch?v=p_PGUltnB6w)
* [The Java Tutorial from Oracle](http://docs.oracle.com/javase/tutorial/)
* [Games Fleadh](http://www.gamesfleadh.ie/)
* [The Imagine Cup](https://www.imaginecup.com/)

## Contact the lecturer
* Email: bryan.duggan@dit.ie
* Twitter: [@skooter500](http://twitter.com/skooter500)

Some assignments from previous years:

[![YouTube](http://img.youtube.com/vi/IJ4TzwCRns8/0.jpg)](https://www.youtube.com/watch?v=IJ4TzwCRns8)

[![YouTube](http://img.youtube.com/vi/tqGtfsXNPng/0.jpg)](https://www.youtube.com/watch?v=tqGtfsXNPng)

[![YouTube](http://img.youtube.com/vi/uykz5mCjV0w/0.jpg)](https://www.youtube.com/watch?v=uykz5mCjV0w)

# Assessments

- [Assignments](assignments.md)

- 14 November 2017 Lab Test 10%
- 12 December 2017 Assignment 1 submission 15%
- 30 January 2018  Lab Test 2 - 10%
- Assignment 3 - 15%
- End of Year MCQ - 50%

# Week 1

## Lecture
* [Introduction slides](https://1drv.ms/p/s!Ak7y2552PWCrhONjAgskv4PATGqdpw)
* [The contract for this course](https://1drv.ms/w/s!Ak7y2552PWCrjPYXt8HlWl1T1cg5Og)

## Lab

### Learning Outcomes
- Enroll on Webcourses
- Become familiar with the syntax of Processing
- Become familiar with writing and running sketches in Processing
- Clone a git repository!
- Install Processing libraries

### Part 1 - Drawing
- Log onto Webcourses and enroll on the module CMPU2016.
- Check out [the Processing reference](https://processing.org/reference/)
- Check out [Daniel Shiffman's awesome YouTube channel](https://www.youtube.com/user/shiffman)
- Check out [these Sci-Fi user interfaces made by last years OOP students](https://www.youtube.com/playlist?list=PL1n0B6z4e_E5RZYrubD2pcxq0qzGy-3vr)
- Check out [these music visualisers made in Processing by last years game programming students](https://www.youtube.com/watch?v=cW8s5i9dmqA&list=PL1n0B6z4e_E6jErrS0ScSCaVrN7KV729x)
- If you are curious, check out [some of my creature videos](https://www.youtube.com/watch?v=cW8s5i9dmqA&list=PL1n0B6z4e_E6jErrS0ScSCaVrN7KV729x)

- Look up the following methods in the [Processing language reference](http://processing.org/reference/ ) to make sure you are clear about the syntax and parameters:

    * noStroke
    * noFill
    * line
    * ellipse
    * rect
    * background
    * stroke
    * fill
    * size
    * arc
    * triangle

Write a processing sketch to draw the following shapes:

![Sketch](images/p1.png)

![Sketch](images/p1.1.png)

![Sketch](images/p1.2.png)

I prefer to draw the shapes on paper first before I try and work out the coordinates. Try experimenting with different colours!

### Part 1 - Cloning git repositories

Clone the course website

- [Install git](https://www.atlassian.com/git/tutorials/install-git) if you need to. It should be installed on the lab computers already
- Start git bash
- Type ```pwd``` to print the current working directory
- Type ```cd ˜``` to cd to your home directory
- Type ```cd Documents``` Also you can start typing the path and then press TAB and bash will autocomplete the command
- You can use the command mkdir to make a directory if you want to make a subdirectory
- Type ```git clone https://github.com/skooter500/OOP-2017-2018``` to clone the course website
- Now navigate to the OOP-2017-2018 folder in windows explorer and have a look at the files that were cloned

Clone NILL, a game I programmed in Processing and get it running:

- Type ```git clone https://github.com/skooter500/NILL``` This will clone the repository
- Find the NILL folder that was created and double click on the file NILL.pde. It should open in Processing
- You need to install the Minim library and the Game control libraries to make NILL work. Go to Sketch | IMport Library | Add library to do this
- See if you can collect all the pods
- Have a look down through the source code for NILL
