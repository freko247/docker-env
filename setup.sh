#!/bin/sh

# Get options
while getopts "f" flag;
do
    case "${flag}" in
        f) force=true ;;
        h) echo """
Usage: ./setup [OPTIONS]

  -h              Print this help file
  -f              Force update
"""
           exit 1;;
    esac
done
# Copy required files
if [[ -n $(find $HOME/.docker-env) ]]
then
   echo "Seems like docker-env is already setup, doing nothing."
   if [[ $force = true ]]
   then
       echo "Forcing update"
   else
       exit 1
   fi
else
    echo "Setting up docker-env"
    mkdir $HOME/.docker-env
fi
# wget -O $HOME/.docker-env/.docker-envrc https://github.com/freko/docker-env/.docker-envrc
# wget -O $HOME/.docker-env/.docker-env-python-requirements.txt https://github.com/freko/docker-env/docker-env-python-requirements.txt
cp -r $HOME/projects/docker-env/ $HOME/.docker-env


## Add source to shell profile
shell_profile=".zshrc"
if [[ -n $(find $HOME/.zshrc) ]]
then
    shell_profile=".zshrc"
elif [[ -n $(find $HOME/.bashrc) ]]
then
    shell_profile=".bashrc"
fi

echo "Adding .docker-envrc source to $shell_profile"
# Only add source to profile if it doesn't exist already
grep -qF 'source $HOME/.docker-env/.docker-envrc' $HOME/$shell_profile || echo 'source $HOME/.docker-env/.docker-envrc' >> $HOME/$shell_profile
