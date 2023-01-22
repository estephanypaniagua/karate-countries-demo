# <img src="https://karatelabs.github.io/resources/logo.svg" width="100" height="100"> API Automation using Karate Framework

## Introduction

This is a project that call the free layer to APICountryLayer for make some tests using karate framework. It also has a pipeline for running the tests using [Github Actions](https://github.com/estephanypaniagua/karate-countries-demo/actions) and [Github Pages](https://estephanypaniagua.github.io/karate-countries-demo/karate-summary.html) 

You can see the test results here: https://github.com/estephanypaniagua/karate-countries-demo/actions

## Coverage
This project covers the following scenarios and practices:

### Automation
1. Get information of the countries (US, DE and GB)
2. Get information of inexistent countries
3. Add a country

## Tech Stack
- Karate
- Java
- Github Actions + Github Pages

## Project Structure
```
└── .github
│      └── workflows
│           └── tests.yml
└── src
│      └── main
│      │    └── java
│      │    └── resources
│      └── test
│          └── java
│              └── exercises
│                  └── countries
│                  │    ├── countries.feature
│                  │    └── CountriesRunner.java
│                  └── ExercisesTest.java   
└── target
└── .gitignore
└── pom.xml
└── README.md
```

## Pre-requisites

1. [Java >= 8](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html).
2. [Maven](https://maven.apache.org/download.cgi).
3. [Karate DSL](https://github.com/karatelabs/karate#maven) .


## Project Setup

1. Clone this repository.
2. Navigate to the project folder using the terminal.
3. Set up API_KEY environment variable (from https://countrylayer.com/)
4. Run the `mvn --batch-mode --update-snapshots verify` command.
5. See the result in `target/karate-reports/karate-summary.html`



