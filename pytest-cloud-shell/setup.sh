export P_PYTEST_SHELL_GIT_SOURCE=https://github.com/Edg209/fizzbuzz.git
export P_PYTEST_SHELL_GIT_FOLDER=fizzbuzz

################################################################
################################################################
################################################################

pip install -U pytest
git clone $P_PYTEST_SHELL_GIT_SOURCE $P_PYTEST_SHELL_GIT_FOLDER
python -m pytest $P_PYTEST_SHELL_GIT_FOLDER