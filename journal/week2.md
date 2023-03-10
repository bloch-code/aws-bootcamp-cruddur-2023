# Week 2 — Distributed Tracing

**Late sugmision for week 2 due to medical reasons**

## Honeycomb: monitoring tool

**Below is a summary what I took from a lesson**

As a start I created a Honeycomb account. I have research about honeycomb to check how exactly this monitoring tool works and collects the data.
I found Interesting view from Jessica on live stream about programs and systems. Good point made about tracing and well explanation of what tracing is
Distributed tracing. I deal with that at work using DataDog. I didn’t know what the span is as I never dug into this dip enough.  Quick search and I find out what is a span and trace. Funny that SPLUNK definition comes up first 

![Definiton of traces](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/traces_def.png)

Instrumentation – good to know that this is a code that compose a trace by sending data. Lesson learned.

Amazon X-ray does similar job to what honeycomb do. 

**I decided to do some extra work along as I go alonf with a course and whenever I have time. I will complete extra challenges for each week. That have to happen!**

Good to know why we use export on our variables. If we don’t do that by setting up our variables they will be used only in current shell. If we export variables they will be used in sub shells too.

**Tips learned**

Good practice to follow. When we set up a project like app we want give our service their own service names such as different ones for backend and frontend.

OTEL – short for open Telemetry.

What is Telemetry exactly -> What is Telemetry? Telemetry automatically collects, transmits and measures data from remote sources, using sensors and other devices to collect data. In cloud and IT it is a standard used by all cloud providers.

Remember a good practice when working on projects is to use python virtual environments.

**What I have achieved**

I have set Honeycomb by adding instructions to requirements file and app.py. Following Andrew provided instruction to follow. 
I'm going to check more about what the code does.  

Honeycomb account has been linked successfully and sends data from our app!
![Proof of data in Honeycombe](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/data%20in%20honey.PNG)

![Another proof of data in Honeycombe](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/data%20in%20honey2.PNG)


**Custom span was created**

![Custom span](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/createdSpan.PNG)

**Setting up X-ray**

AWS X-ray was instrumented correclty based on Andrew instructions.

![Proof of Xray trace](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/xray.png)

Our app sends data to AWS X-ray

![Proof of Xray trace 2](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/xray.png)

**Adding subsegments**

![Proof of working subsegment](https://github.com/bloch-code/aws-bootcamp-cruddur-2023/blob/main/_docs/assets/subsegment.png)

*side note: thanks to checking other repos I discovered **gitmoji** which is a nice addition while doing commit*


## Watchtower adn implementing Cloudwatch!

CLoudWatch Logs were implemented succesfully and data was send to AWS. Code later was commented out just in case if we get charge for it.

![CloudWatch]()


**What I might start to do**

Think of using vim to practice as it is a good editor for programmers.
I need to learn more about Docker. To understand exactly commands and what volumes does!

Remember to use in real life we use rocker-compose different versions in dev to prod.

## Issues on the way to complete week 2

I have run into CORS error again as I was working now not on local ```env```
This got me thinking and I have created another docker-composer file to distinguish between environments.
