#!/bin/bash

if [ "$1" == "--debug" ]
then
  set -x
  trap read debug
fi

bold=`tput bold`
normal=`tput sgr0`
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

cd $HOME

echo "${green}${bold}Information about system disk usage:${reset}${normal}"
df

printf "\n"


echo "${red}${bold}Jump to Study folder!${reset}${normal}"
cd Study

printf "\n"

echo "${green}${bold}Information about dirs (human-readable, Study folder):${reset}${normal}"
du -h -d 1

printf "\n"


echo "${green}${bold}Information current dir:${reset}${normal}"
du -h -s

printf "\n"

echo "${green}${bold}File sizes:${reset}${normal}"
du -a | head -50

printf "\n"

echo "${green}${bold}Show all mount points, including those that were mounted with the MNT_IGNORE flag:${reset}${normal}"
df -a | head -50

printf "\n"
