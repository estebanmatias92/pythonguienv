## Python Docker Dev Environment

An isolated Docker Development Environment for building Python GUI Apps.

## Use

### 0 - Pre-requisites

You need:

-   Windows host, Docker Desktop installed and WSL enabled on windows
-   XLaunch installed and running in your windows host to serve the graphics
-   A constantly updated ENVIRONMENT variable, named $DISPLAY, that has a string with WSL IPv4 address plus ":0.0" at the end. [See photo](https://drive.google.com/file/d/1wYxwWjLGt4bjH2ePOrIQtyYQcrBKYmoj/view?usp=sharing)

### 1 - Create Docker Dev Environment

Use this github url to create the Docker Dev Environment in Docker Desktop.

### 2 - Open with VS Code

Once created the Environment, open it with VS Code

### 3 - Create a new Python project

Now from the terminal you can run the Python CLI commands and create with a new environment

_`python -m venv venv && . venv/bin/activate`_

Proceed to install the first dependencies

_`pip install -r requirements.txt`_

#### (The way to go)

You can save time and effort and use Make to create the project and install the dependencies, and activate the environment immediately afterwards

_`make build && . venv/bin/activate`_

To run the app, use Make Run

_`make run`_

Auto-install imported packages and upgrade all packages

_`make update`_

Use help for more commands

_`make help`_

## Clarifications

### Git

To use git like you normally do in your host machine, you have to have:

-   Docker Desktop **_"WSL 2 based engine"_** option enabled
-   Your **_github credentials_** configured in your default WSL2 distro
