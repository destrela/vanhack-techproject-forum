# Accelerator Program's Tech Project

This document describes the infrastructure used to run the DEMO app ctreated by Cristiano Pimentel.

## Docker containers

The entire insfrastructure is based in docker containers. This kind of aproach facilitates the solution's implemantation, that can be ran on cloud, on premises, in one or multiple machines.

Below, a schematic diagram of the containers interconnections is shown.




The contaianers has their functions as follows:

* Jenkins

  Server responsible to do the development cycle orchestration.
  
* Tomcat - production
 
  The production web server.
  
* Tomcat - development

  The development web server. It is destroyed every time the developer finishes the application tests.
  
* Maven

  Temporary container, used to build the application.
  
## Git repository

The repository was forked from the original Cristiano's demo project. A Jenkins file was added at the project root, with the pipeline that the Jenkins server should need run.

Also there is two branchs, one for development and other with the production code. Thi
To implement the develop / test / deploy cycle, Jenkins was used.
The basic workflow choosed for this project was:

1. 

It is just a DEMO and should not forked nor used as a baseline for any other projects.
