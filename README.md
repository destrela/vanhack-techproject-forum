# Accelerator Program's Tech Project

This document describes the infrastructure used to run the DEMO app ctreated by Cristiano Pimentel.

## Docker containers

The entire insfrastructure is based in docker containers. This kind of aproach facilitates the solution's implemantation, that can be ran on cloud, on premises, in one or multiple machines.

Below, a schematic diagram of the containers iis shown.

        .---------.  .--------.  ..........  .........
        |         |  |        |  .        .  .       .
        |         |  | Tomcat |  . Tomcat .  .       .
        | Jenkins |  |  Prod  |  .  Dev   .  . Maven .
        |         |  |        |  .        .  .       .
        '---------'  '--------'  ..........  .........
        .--------------------------------------------.
        |                Docker Engine               |
        '--------------------------------------------'
                               ^
                               |               _.-----._  
                               |             .-         -.
                               |             |-_       _-|
                               |          .--|  ~-----~  |
                           _.-----._     /   |  Git Hub  |
                         .-         -.  /    `._       _.'
                         |-_  Git  _-| /        "-----"   
                         |  ~-----~  |'
                         |   Local   |
                         `._       _.'
                            "-----"   


The contaianers has their functions as follows:

* Jenkins

  Server responsible to do the development cycle orchestration.
  
  Start command:
  
      $ docker run --rm -u root -p 8080:8080 -v jenkins-data:/var/jenkins_home -v /var/run/dockersock:/var/run/docker.sock -v "$HOME":/home jenkinsci/blueocean
  
* Tomcat - production
 
  The production web server.
  
  Start command:
  
      $ docker run --rm -v "$HOME/sandbox/vanhack-techproject-forum/target":/build --name vanhack-forum -p 80:8080 tomcat:alpine
  
* Tomcat - development

  The development web server. It is destroyed every time the developer finishes the application tests.
  
  Start command (inside Jenkins):
  
      docker {
        image 'tomacat:alpine'
        args '-p 8081:8080'
      }
  
* Maven

  Temporary container, used to build the application.
  
  Start command (inside Jenkins):
  
      docker {
        image 'maven:alpine'
        args '-v /root/.m2:/root/.m2 -v "$HOME":/home'
      }

All the containers run with /home directory of the host binded with /home directory inside them. They use this area as a transfer area, to copy the app from development environment to production.

## Git repository

The repository was forked from the original Cristiano's demo project. A Jenkins file was added at the project root, with the pipeline that the Jenkins server should need run.

Also there is two branchs, one for development (development branch) and other with the production code (master branch).

## Jenkins
To implement the develop / test / deploy cycle, Jenkins was used.

Jenkins take advantage of the fact that the repository has two branches. So when the development branch is the selected branch to run the workflow, the process executed follows the sequence:

1. Start Maven container
1. Change workdir to the project directory
1. Run the command 'mvn package'
1. Start Tomcat Dev container
1. Copy the 'war' file to webapps directory
1. Start Tomcat daemon
1. Waits for developer confirmation for continue with the workflow

Otherwise, if the master branch is selected:

1. Start Maven container
1. Change workdir to the project directory
1. Run the command 'mvn package'
1. Run the docker exec command in thr production Tomcat with the following copy command
1. Cpoy the 'war' file from /build directory to webapps directory

Note that Jenkins container is started with 'docker.sock' named pipe mapped to the host 'docker.sock', so when Jenkins runs some docker command inside Jenkins container, it uses the host's docker daemon to execute those commands.

## Maven

The Maven container is used to build the application. 

One advantage of the command 'mvn package', in this specific case of a very simple application, is that if this command is executed with success, we could consider application already tested. This is why none 'Test' stage is presented in Jenkins pipeline.

## Tomcat

Once again, because the application is so simple and don't have any disk persistence layer, only a Tomcat server is sufficient to run the application. We don't need any database or front-end server.

A drawback of this model is the lack of redundancy and consequently, lack of high avaiability.

## Basic development workflow


It is just a DEMO and should not forked nor used as a baseline for any other projects.
