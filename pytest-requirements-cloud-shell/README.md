# pytest-readme-cloud-shell

This project aims to run pytest on a python repository using the cloud shell.
It is very similar to `pytest-cloud-shell`, but it does not require the python repository to be a simple repository without any requirements.

### Setting up parameters

We have two parameters that we will use for this project:

```shell
export P_PYTEST_REQUIREMENTS_SHELL_GIT_SOURCE=https://github.com/Edg209/photomosaic.git
export P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER=photomosaic
```

The first parameter, `P_PYTEST_REQUIREMENTS_SHELL_GIT_SOURCE` is the python repository that we will be testing.
The second parameter, `P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER` is the folder that we will check out the repository into.

### Installing pytest

Pytest is not available in cloudshell by default. We will therefore need to install it with this command:

`pip install -U pytest`

`pip install` is the command that we use to install python packages. `pytest` is the name of the package that we want to install. The option `-U` is equivalent to `--upgrade` and will upgrade the package `pytest` to the latest version if an older version has already been installed.

### Cloning the repository

We will clone the repository into the specified folder using this command:

`git clone $P_PYTEST_REQUIREMENTS_SHELL_GIT_SOURCE $P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER`

This will create a folder `$P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER` which we will clean up during the teardown.

### Installing the requirements

Once the repository is cloned, we can install the requirements with this command:

`pip install -r $P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER/requirements.txt`

The option `-r` with `pip install` is the option to use a file of requirements. The convention is to name the file `requirements.txt` and locate it in the base directory of the version control of the project. This can be identified with `$P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER/requirements.txt`. If the project does not use a conventional requirements file, this will fail to install the requirements.

If successful, an output will be generated similar to the following:

```commandline
Requirement already satisfied: pytest~=7.2.0 in ./.local/lib/python3.9/site-packages (from -r photomosaic/requirements.txt (line 1)) (7.2.0)
Requirement already satisfied: numpy==1.23.4 in /usr/local/lib/python3.9/dist-packages (from -r photomosaic/requirements.txt (line 2)) (1.23.4)
Requirement already satisfied: setuptools==65.5.1 in /usr/local/lib/python3.9/dist-packages (from -r photomosaic/requirements.txt (line 3)) (65.5.1)
Collecting scikit-image~=0.19.3
  Downloading scikit_image-0.19.3-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (14.0 MB)
     |████████████████████████████████| 14.0 MB 9.4 MB/s
Requirement already satisfied: iniconfig in ./.local/lib/python3.9/site-packages (from pytest~=7.2.0->-r photomosaic/requirements.txt (line 1)) (1.1.1)
Requirement already satisfied: attrs>=19.2.0 in /usr/local/lib/python3.9/dist-packages (from pytest~=7.2.0->-r photomosaic/requirements.txt (line 1)) (22.1.0)
Requirement already satisfied: exceptiongroup>=1.0.0rc8 in ./.local/lib/python3.9/site-packages (from pytest~=7.2.0->-r photomosaic/requirements.txt (line 1)) (1.0.0)
Requirement already satisfied: pluggy<2.0,>=0.12 in /usr/local/lib/python3.9/dist-packages (from pytest~=7.2.0->-r photomosaic/requirements.txt (line 1)) (1.0.0)
Requirement already satisfied: packaging in /usr/local/lib/python3.9/dist-packages (from pytest~=7.2.0->-r photomosaic/requirements.txt (line 1)) (21.3)
Requirement already satisfied: tomli>=1.0.0 in /usr/local/lib/python3.9/dist-packages (from pytest~=7.2.0->-r photomosaic/requirements.txt (line 1)) (2.0.1)
Collecting scipy>=1.4.1
  Downloading scipy-1.9.3-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (33.8 MB)
     |████████████████████████████████| 33.8 MB 30.8 MB/s
Collecting PyWavelets>=1.1.1
  Downloading PyWavelets-1.4.1-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (6.9 MB)
     |████████████████████████████████| 6.9 MB 35.7 MB/s
Collecting imageio>=2.4.1
  Downloading imageio-2.22.4-py3-none-any.whl (3.4 MB)
     |████████████████████████████████| 3.4 MB 52.6 MB/s
Collecting tifffile>=2019.7.26
  Downloading tifffile-2022.10.10-py3-none-any.whl (210 kB)
     |████████████████████████████████| 210 kB 72.4 MB/s
Collecting pillow!=7.1.0,!=7.1.1,!=8.3.0,>=6.1.0
  Downloading Pillow-9.3.0-cp39-cp39-manylinux_2_28_x86_64.whl (3.3 MB)
     |████████████████████████████████| 3.3 MB 29.7 MB/s
Collecting networkx>=2.2
  Downloading networkx-2.8.8-py3-none-any.whl (2.0 MB)
     |████████████████████████████████| 2.0 MB 53.5 MB/s
Requirement already satisfied: pyparsing!=3.0.5,>=2.0.2 in /usr/local/lib/python3.9/dist-packages (from packaging->pytest~=7.2.0->-r photomosaic/requirements.txt (line 1)) (3.0.9)
Installing collected packages: pillow, tifffile, scipy, PyWavelets, networkx, imageio, scikit-image
Successfully installed PyWavelets-1.4.1 imageio-2.22.4 networkx-2.8.8 pillow-9.3.0 scikit-image-0.19.3 scipy-1.9.3 tifffile-2022.10.10
```

### Calling pytest

We are all ready to start running pytest on our repository. We can do so with this command:

`python -m pytest $P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER`

Calling `python -m` means that we want to call the main entry point of a python package. `pytest` is the name of the python package that we want to call. `$P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER` is the name of the folder we want to call pytest in. Since we have checked out our repository to this folder, it means that we will run pytest on this repository.

We should see an output like this:

```commandline
===================================================== test session starts ======================================================
platform linux -- Python 3.9.2, pytest-7.2.0, pluggy-1.0.0
rootdir: /home/edgrant209/photomosaic
collected 21 items                                                                                                             

photomosaic/test/test_image_distance.py ...........                                                                      [ 52%]
photomosaic/test/test_output_image.py .                                                                                  [ 57%]
photomosaic/test/test_output_layout.py ..                                                                                [ 66%]
photomosaic/test/test_parse.py .......                                                                                   [100%]

====================================================== 21 passed in 0.74s ======================================================
```