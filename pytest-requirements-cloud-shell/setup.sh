export P_PYTEST_REQUIREMENTS_SHELL_GIT_SOURCE=https://github.com/Edg209/photomosaic.git
export P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER=photomosaic

################################################################
################################################################
################################################################

pip install -U pytest
git clone $P_PYTEST_REQUIREMENTS_SHELL_GIT_SOURCE $P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER
pip install -r $P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER/requirements.txt
python -m pytest $P_PYTEST_REQUIREMENTS_SHELL_GIT_FOLDER