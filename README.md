# analytical-engineer-challenge
🚀 The Pleo Analytical Engineer Challenge


## Stewards: @team-data-platform

## Welcome!
This repository houses the Pleo Analytical Engineer challenge. It contains a mix of detective work, ops-like work, programming and big-picture perspective. Your answer to the challenge will help us get to know you, and provide a fun context for subsequent discussion in our interviews :)

We hope you enjoy it!

## Introduction
We have created an imaginary scenario which we hope will allow you to show off your analytical engineering skills while also having some fun:

You've been tasked with taking over a small prototype for an ETL (Extract - Transform - Load) pipeline, meant to collate some data from several sources into a Data Product. The original author never finished the prototype, and they unfortunately also left very little documentation on how the prototype works! Part of this challenge is detective work, and so we've been intentionally vague in terms of describing how it works.

Luckily you're available to help investigate this, determine what needs doing, and fix it so that it becomes a functional prototype! 

## How to submit a solution

When you are done with the below challenge, you have 2 choices:

1. You can set it up as a private GitHub repository and invite the reviewers to the repository.
1. You can zip the solution up and send it by e-mail to the reviewers.

Please *do not* submit your challenge by creating it as a fork of the repository :)

## The Task

The ETL service (found in the `etl/` folder) is not yet implemented at all. This is your main task: create code which will fetch the data (as described below), assemble it into a table in the Postgres database, and display the results.


- Remember that you are implementing the remaining parts of a _prototype_ -- you do not have to build something that is fully viable as a production-grade ETL system.

- The project contains a docker-compose based setup (see `docker-compose.yml`), which runs a service that is _not currently implemented_ and is meant to create the desired data set. It also spawns a PostgreSQL database that will act as our 'Data Warehouse' in this challenge, called `dwh` in the compose file.

- It should be clear how to run the project from this README. If you change things that would alter what is needed to run the project, remember to update this README file to ensure that the steps required to do so are up-to-date. If you leave the README unchanged, we will expect to be able to see your solution by simply running `./setup.sh`.

- You may improve and modify *any* part of the project, as long as the ETL service functions to acquire and assemble the desired data into the Data Warehouse.

- Please record your progress and thoughts on this task in the `PROGRESS.md` file, in whatever way you feel is appropriate, as you work on the task. We suggest a format similar to 'thinking aloud'. If you discover things that you think are poorly implemented in the existing code, and you don't want to fix them as part of the challenge, feel free to write there what you'd suggest doing / changing.

- We value well-written git commits at Pleo! Commits are our history that persists through both changing issue tracking systems and source code locations, and they help us understand _why_ something was done if we need to roll things back. If you have set up a private GitHub repository that you share with us, this is a good opportunity to show how you'd ideally write and size your commits.

### Hints:

1. The `etl` Dockerfile and `src` files shows signs that the original developer was not sure what tools to use
2. The `pgsql` command in the `etl` container appers to be already configured to connect to the Postgres database

*Note*: The rest of this `README.md` provides a standard 'project setup guide' in terms of running the pipeline.

# Requirements

- You must have Docker installed
- You must have Docker Compose installed
- You are running in a Unix or Unix-like environment (c.f. MacOS, Linux, Windows Subsystem for Linux)

## Project layout

The project is meant to be run as a docker-compose project, configured by `docker-compose.yml`. It runs one service: `etl` and a 'Data Warehouse' represented by a PostgreSQL database.

Each service is built as a Docker image. 

The project also contains some basic convenience scripts (`setup.sh`, `teardown.sh`) for iterative development. 

```
analytical-engineer-challenge
├── Dockerfile
├── setup.sh
├── teardown.sh
├── database.env
├── docker-compose.yml
├── etl
│   ├── Dockerfile
│   ├── src
│
```

### ETL Service (TODO)
The `etl` service is meant to acquire the data needed and write it into the Data Warehouse. It is not yet implemented!

Amazon are hosting a [Covid-19 DataLake](https://aws.amazon.com/blogs/big-data/a-public-data-lake-for-analysis-of-covid-19-data/) as a public service for researchers. There are two data sets which are of interest that show the number of vaccine doses allocated for US states, in each week since they started allocating them:

 - https://covid19-lake.s3.us-east-2.amazonaws.com/cdc-moderna-vaccine-distribution/csv/cdc-moderna-covid-19-vaccine-distribution-by-state.csv
 - https://covid19-lake.s3.us-east-2.amazonaws.com/cdc-pfizer-vaccine-distribution/csv/cdc-pfizer-covid-19-vaccine-distribution-by-state.csv

There is also a static resource file containing estimated populations in counties in the US:

 - https://covid19-lake.s3.us-east-2.amazonaws.com/static-datasets/csv/CountyPopulation/County_Population.csv

We want a Data Product, represented as a single table in the Data Warehouse, which shows the ratio of people to doses, in each US state. To put it another way, the (approximate) number of people per dose, per state.

If a state has been allocated 100 doses in total, and the state has 500 people in it, then we would expect the ratio to be 5:1, or 5 people per available dose.

Feel free to create a solution using whatever programming languages you are most comfortable with, and can do the job. Data Engineering at Pleo prefers to use the following, but you won't be penalised for using something else as long as the solution is clear and understandable:

 - dbt
 - Python
 - Kotlin
 - Go

## Running the project

You are recommended to run the project via Docker Compose. To do so, from the root folder you can run `./setup.sh` which will run a sequence of commands to:

1. build the containers
2. remove any hanging folders/volumes from the last run
3. run the containers

The companion script `./teardown.sh` will cleanly shut down the project.
