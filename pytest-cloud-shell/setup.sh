export P_PYTEST_SHELL_GIT_SOURCE=https://github.com/Edg209/photomosaic.git
export P_PYTEST_SHELL_GIT_FOLDER=photomosaic

################################################################
################################################################
################################################################

pip install -U pytest
git clone $P_PYTEST_SHELL_GIT_SOURCE $P_PYTEST_SHELL_GIT_FOLDER
python -m pytest $P_PYTEST_SHELL_GIT_FOLDER