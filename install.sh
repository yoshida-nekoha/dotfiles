#!/bin/bash
currentDir=$(cd $(dirname $0);pwd)

if [ -e ~/.bash_profile ];then
    echo '.bash_profile exists.'
else
    ln -s $currentDir/home/.bash_profile ~/
    if [ -e ~/.bash_aliases ];then
        rm ~/.bash_aliases
    fi
    ln -s $currentDir/home/.bash_profile ~/.bash_aliases
    source ~/.bash_profile
fi

if [ "$REMOTE_CONTAINERS" == "true" ]; then
    echo 'REMOTE_CONTAINERS, skip copy .gitconfig'
elif [ -e ~/.gitconfig ]; then
    echo 'exists, skip copy .gitconfig'
else
    ln -s $currentDir/home/.gitconfig ~/ ;
fi


