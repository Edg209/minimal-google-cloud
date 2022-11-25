# Minimal-Google-Cloud

This repository is a collection of minimal constructions of projects within Google Cloud Platform.
These are intended to provide minimal working examples of each project, which can then be used as blueprints for further projects.

Each folder contains a single project, and will contain the same file structure.

## Before using this repository

In order to create these projects, it is necessary to set up a project and a billing account.

It is highly recommended to set up a budget before creating any of these projects.
It is also recommended to use the teardown scripts of each project after verifying that the setup has worked correctly.

These projects are intended to be minimal, and cause minimal billing impact. A budget of a few dollars a month should be sufficient for most purposes.

## Using this repository

First, clone this repository by executing the following in cloud shell:

`git clone https://github.com/Edg209/minimal-google-cloud.git`

Second, choose which project you want to build. If you want to build project `XXX`, then execute the following:

`sh minimal-google-cloud/XXX/setup.sh`

Once you are happy with the build of the project, tear it down by executing the following:

`sh minimal-google-cloud/XXX/teardown.sh`

It is also possible to remove the clone of the repository to completely remove any traces of this project:

`rm -rf minimal-google-cloud/`

## The project file structure

Each folder will contain three files:

* `setup.sh`
* `teardown.sh`
* `README.md`

There may be more files in addition to this, but these three will always be present.

### The `setup.sh` file

This file contains a series of cloud shell commands that are used in the setup of the project.

At the start of the file will be a series of `export` commands that set the environment variables that will be used later on. Each of these parameters will be created with the `P_` prefix. There may be more environment variables that are determined later on, these will be created with the `D_` prefix.

### The `teardown.sh` file

This file contains a series of cloud shell commands that are used to teardown the project. Running this file after running `setup.sh` will return the project to the same state it was in before `setup.sh` was run. It may require the `setup.sh` file to have already been run to create the appropriate environment variables.

### The `README.md` file

This file contains a detailed breakdown of each of the parameters and commands in `setup.sh`. It will explain what each command does, and why each parameter is chosen.
If there are any steps that are executed outside the cloud shell, they will also be detailed in this file.
