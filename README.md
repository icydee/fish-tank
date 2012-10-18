fish-tank
=========

Simulation of a fish tank

Fish Tank Simulator Introduction
The purpose of this exercise is to design a simulator for a fish tank. The simulator can be run by a human operatorwho can populate the fish tank with various kinds of creatures, add food, and change aspects of the environmentsuch as temperature. The main focus of this exercise is to model the classes and objects that are involved,expressing their properties and relationships; other aspects such as the user interface and the application packagingare not important. 

Description 
The simulator has the following properties:there is only one fish tankthe user can add fish, snails and fish foodliving fish and snails both eat fish foodpiranha fish may also eat other fishclockwork fish do not eat anythingclockwork fish do not breathe; other fish and snails dofish swim at different depths:piranha fish and clockwork fish swim at all depthssun fish swim at the topdiver fish swim at the bottomthe user can vary the temperature of the fish tankwhen the temperature falls below 15 degrees centigrade, piranha fish die and float to the surfaceEvents in the fish tank are time based; every interval:the user may change the state of the fish tank (adding items, changing the temperature etc.)inhabitants that eat doinhabitants may be eaten or otherwise die 

Requirements 
Create a brief design document showing how you would construct your application. Your solution shoulddemonstrate good engineering practices and understanding, and in interview we expect you to explain therationale behind your design. The design document you present should be descriptive but also contain classdiagrams.Using Test-Driven Development, code at least five of the classes. A fully working application is not required,but you are required to demonstrate some interaction with your application which demonstrates eventshappening and the state of the fish tank changing. As mentioned above, the user interface is notimportant; use of the console for simple input and output is perfectly sufficient.There is no need to spend more than a couple of hours on this assessment; you are not required to complete the fullapplication. However, code that you submit should be in a state where it can be run and the output examine

