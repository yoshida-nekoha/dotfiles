#!/bin/bash
currentDir=$(cd $(dirname $0);pwd)

if [ -e $currentDir/home/.bash_profile ];then
    echo '.bash_profile exists.'
else
    ln -s $currentDir/home/.bash_profile ~/
fi

if [ "$REMOTE_CONTAINERS" == "true" ]; then
    echo 'REMOTE_CONTAINERS, skip copy .gitconfig'
elif [ -e $currentDir/home/.gitconfig ]; then
    echo 'exists, skip copy .gitconfig'
else
    ln -s $currentDir/home/.gitconfig ~/ ;
fi