# pytest-cloud-shell

This project aims to run pytest on a python repository using the cloud shell.
The python repository must be under git version control. It must also be a simple project with no requirements.

### Setting up parameters

We have two parameters that we will use for this project:

```shell
export P_PYTEST_SHELL_GIT_SOURCE=https://github.com/Edg209/fizzbuzz.git
export P_PYTEST_SHELL_GIT_FOLDER=fizzbuzz
```

The first parameter, `P_PYTEST_SHELL_GIT_SOURCE` is the python repository that we will be testing.
The second parameter, `P_PYTEST_SHELL_GIT_FOLDER` is the folder that we will check out the repository into.

### Installing pytest

Pytest is not available in cloudshell by default. We will therefore need to install it with this command:

`pip install -U pytest`

`pip install` is the command that we use to install python packages. `pytest` is the name of the package that we want to install. The option `-U` is equivalent to `--upgrade` and will upgrade the package `pytest` to the latest version if an older version has already been installed.

### Cloning the repository

We will clone the repository into the specified folder using this command:

`git clone $P_PYTEST_SHELL_GIT_SOURCE $P_PYTEST_SHELL_GIT_FOLDER`

This will create a folder `$P_PYTEST_SHELL_GIT_FOLDER` which we will clean up during the teardown.

### Calling pytest

We are all ready to start running pytest on our repository. We can do so with this command:

`python -m pytest $P_PYTEST_SHELL_GIT_FOLDER`

Calling `python -m` means that we want to call the main entry point of a python package. `pytest` is the name of the python package that we want to call. `$P_PYTEST_SHELL_GIT_FOLDER` is the name of the folder we want to call pytest in. Since we have just checked out our repository to this folder, it means that we will run pytest on this repository.

We should see an output like this:

```commandline
======================================== test session starts ========================================
platform linux -- Python 3.9.2, pytest-7.2.0, pluggy-1.0.0
rootdir: /home/edgrant209
collected 4 items                                                                                   

fizzbuzz/fizzbuzz/test_fizzbuzz.py ....                                                       [100%]

========================================= 4 passed in 0.02s =========================================
```