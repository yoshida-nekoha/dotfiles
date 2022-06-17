#!/bin/bash
currentDir=$(cd $(dirname $0);pwd)

ln -s $currentDir/home/.bash_profile ~/
ln -s $currentDir/home/.gitconfig ~/